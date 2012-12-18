<script type="text/javascript">
$(function(){
  <%// $.getContextPath()%>
  var iconPath = "${request.contextPath}/images/icons/",
  dataProvider = [
	${dataProvider}
	];
    $("#menu").menu({
		menuBar : {
			width : "auto"
		},
		dataProvider : dataProvider,
		onClick : function(data){
			var href = data.href;
			if(href){
				window.location.href = "${request.contextPath}/"+ href;
			}
			else{
				alert("当前尚未指定目标地址！");
			}
		}
	});
});
</script>
<div id="menu"></div>
