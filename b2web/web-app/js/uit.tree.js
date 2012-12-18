(function( $, undefined ) {
 
 $.widget("ui.tree", {
	options: {
		id : "id", //结点唯一标识
		title : "title", //结点文本字段
		icon : "icon", //结点样式标识
		children : "children", //孩子结点标识
		leaf : "leaf", //子节点标识
		hideRoot : false, //显示根节点
		rootText : "根节点", //根节点内容
		dataProvider : [], //数据内容
		onClick : null,
		xhr : null
	},
	_create : function(){
		jQuery.extend(this,this.options.xhr && $.ui.tree.xhr || $.ui.tree.local);
		this.nodesbase = {};
		this._render();
		this._funnelEvents();
	},
	//树结点模板
	templateNode : (function(){
		var html = ["<div class='node'>"]; //节点样式
		html.push("<div class='status'></div>"); //节点状态
		html.push("<div class='logic'></div>"); //节点逻辑框
		html.push("<div class='icon'></div>");  //节点图标
		html.push("<div class='caption'></div>"); //节点内容
		html.push("</div>");
		return $(html.join(""))[0];
	})(),
	//树结点的唯一标识
	nodeId : "node-id",
	//构建树结构
	_render : function(){
		var element = this.element,
			options = this.options;
		element.addClass("uit-tree");	
		//构造跟结点数据
		var data = {};
		data[options.id] = ""; 
		data[options.title] = options.rootText;
		data[options.children] = options.dataProvider;
		var root = this._renderNode(data);
		root.addClass("root");
		element.append(root);
		if(options.hideRoot){
			root.hide();
			element.addClass("hideroot");
		}
		//展开根结点
		this.expend(root);
	},
	//渲染树结点
	_renderNode : function(data){
		var options = this.options,
			children = data[options.children],
			element = $(this.templateNode.cloneNode(true)),
			id = data[options.id];
		element.attr(this.nodeId,id);
		if(this.isLeafByData(data)){
			$(">.status",element).addClass("leaf");
			$(">.icon",element).addClass("leaf");
		}
		else{
			$(">.status",element).addClass("collapse"); //对应为expand
			$(">.icon",element).addClass("collapse"); //对应为expand
		}
		//添加用户自定义的样式
		if(data[options.icon]){
			$(">.icon",element).addClass(data[options.icon]);
		}
		$(">.caption",element).html(data[options.title] || "&nbsp;");
		//把树结点数据结构和展现结构存入缓存中
		this.nodesbase[id] = [data,element];
		return element;
	},
	//overwrite
	isLeafByData : function(data){
		//local or xhr 重写该方法的实现
	},
	//展开某一节点
	expend : function(element){
		if(this.isLeaf(element)) return;
		//获取结点的状态和标识元素
		var status = $(">.status",element),
			icon = $(">.icon",element),
			subcontainer = element.next(".subcontainer");
		if(subcontainer.length){
			if(status.hasClass("collapse")){ //如果是关闭的
				status.removeClass("collapse");
				status.addClass("expand");
				icon.removeClass("collapse");
				icon.addClass("expand");
				setTimeout(function(){
					subcontainer.show("normal");
				},0);
			}
			return;
		}
		//子节点容器不存在，则创建
		this.createSubcontainer(element,true);
	},
	//overwrite
	createSubcontainer : function(element,expended){
		//local or xhr 重写该方法的实现
	},
	//关闭某一节点
	collapse : function(element){
		if(this.isLeaf(element)) return;
		//获取结点的状态和标识元素
		var status = $(">.status",element),
			icon = $(">.icon",element),
			subcontainer = element.next(".subcontainer");
		if(subcontainer.length){
			if(status.hasClass("expand")){ //如果是关闭的
				status.removeClass("expand");
				status.addClass("collapse");
				icon.removeClass("expand");
				icon.addClass("collapse");
				subcontainer.hide("normal");
			}
		}
	},
	//展开/关闭某一结点
	toggle : function(element){
		$(">.status",element).hasClass("expand") ? this.collapse(element) : this.expend(element);
	},
	//判断结点是不是叶子结点
	isLeaf : function(element){
		var status = $(">.status",element);
		//如果含有leaf定义返回true
		return status.hasClass("leaf");
	},
	//绑定事件
	_funnelEvents : function(){
		var self = this;
		this.element.click(function(e){
			var element = $(e.target);
			//点击树结点图标
			if(element.hasClass("status") || element.hasClass("icon")){
				self.toggle(element.parent());
			}
			//执行点击文本的处理
			else if(element.hasClass("caption")){
				var cache = self.nodesbase[element.parent().attr(self.nodeId)],
					onClick = self.options.onClick;
				onClick && onClick(cache[0],cache[1]);
			}
		});
	}
});

})(jQuery);

(function($){
	$.ui.tree.xhr = {
			//根据数据判断是不是叶子节点
			isLeafByData : function(data){
				var options = this.options;
				//leaf字段不为空，则此优先级最高
				return true ==data[options.leaf];
			},
			//构造子树的容器
			createSubcontainer : function(element,expended/**是否展开**/){
				var id = element.attr(this.nodeId),
					data = this.nodesbase[id][0],
					options = this.options,
					children = data[options.children],
					status = $(">.status",element),
					subcontainer = $("<div class='subcontainer'></div>"),
					self = this;
				//异步获取子结点
				status.addClass("loading");
				//XHR回调方法，用户自己写ajax方法
				options.xhr(function(children){
					status.removeClass("loading");
					//如果返回的子节点为空
					if(!children || !children.length){
						icon.removeClass("collapse");
						icon.addClass("leaf");
						return;
					}
					data[options.children] = children;
					for(var i=0,child;child = children[i];i++){
						subcontainer.append(self._renderNode(child));
					}
					//插入树结点的后边
					element.after(subcontainer);
					//重新调用展开方法
					expended && self.expend(element);
				});
			}	
	};
})(jQuery);

(function($){
	$.ui.tree.local = {
			//根据数据判断是不是叶子节点
			isLeafByData : function(data){
				var options = this.options,
					children = data[options.children];
				//leaf字段不为空，则此优先级最高
				return null!=data[options.leaf]  ? data[options.leaf] : (!children || !children.length);
			},
			//构造子树的容器
			createSubcontainer : function(element,expended/**是否展开**/){
				var id = element.attr(this.nodeId),
					data = this.nodesbase[id][0],
					options = this.options,
					children = data[options.children],
					subcontainer = $("<div class='subcontainer'></div>");
				//创建子节点
				for(var i=0,child;child = children[i];i++){
					subcontainer.append(this._renderNode(child));
				}
				//插入树结点的后边
				element.after(subcontainer);
				//重新调用展开方法
				expended && this.expend(element);
			}
	};
})(jQuery);