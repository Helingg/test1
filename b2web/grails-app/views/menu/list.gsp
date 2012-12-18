<head>
  <meta name='layout' content='springSecurityUI' />
  <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

    <body>
        
        <div class="body">
            <h3><g:message code="default.list.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
              <div class="message">${flash.message}</div>
            </g:if>
            <div class="nav">
            <span class="menuButton"><g:link class="create" controller="menu" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'menu.id.label', default: 'Id')}" />
                        
                            <th><g:message code="menu.parent.label" default="Parent" /></th>
                        
                            <g:sortableColumn property="displayName" title="${message(code: 'menu.displayName.label', default: 'Display Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'menu.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="displayOrder" title="${message(code: 'menu.displayOrder.label', default: 'Display Order')}" />
                        
                            <g:sortableColumn property="linkController" title="${message(code: 'menu.linkController.label', default: 'Link Controller')}" />
                        
                            <g:sortableColumn property="linkAction" title="${message(code: 'menu.linkAction.label', default: 'Link Action')}" />
                            
                            <g:sortableColumn property="icon" title="${message(code: 'menu.icon.label', default: 'Icon File')}" />
                            
                            <g:sortableColumn property="visible" title="${message(code: 'menu.visible.label', default: 'Visible')}" />
                            
                            <g:sortableColumn property="enabled" title="${message(code: 'menu.enabled.label', default: 'Enabled')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${menuInstanceList}" status="i" var="menuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "parent")}</td>
                        
                            <td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "displayName")}</g:link></td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "displayOrder")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "linkController")}</td>
                            
                            <td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "linkAction")}</g:link></td>
                            
                            <td>${fieldValue(bean: menuInstance, field: "icon")}</td>
                            
                            <td>${fieldValue(bean: menuInstance, field: "visible")}</td>
                            
                            <td>${fieldValue(bean: menuInstance, field: "enabled")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${menuInstanceTotal}" />
            </div>
        </div>
    </body>

