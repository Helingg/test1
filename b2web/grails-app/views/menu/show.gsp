<head>
  <meta name='layout' content='springSecurityUI' />
  <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  
</head>
    <body>
        
        <div class="body">
            <h3><g:message code="default.show.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.parent.label" default="Parent" /></td>
                            
                            <td valign="top" class="value"><g:link controller="menu" action="show" id="${menuInstance?.parent?.id}">${menuInstance?.parent?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.displayName.label" default="Display Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "displayName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.displayOrder.label" default="Display Order" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "displayOrder")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.icon.label" default="Icon File" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "icon")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.linkController.label" default="Link Controller" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "linkController")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.linkAction.label" default="Link Action" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: menuInstance, field: "linkAction")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${menuInstance?.enabled}" /></td>
                            
                        </tr>
                        
                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.visible.label" default="Visible" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${menuInstance?.visible}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="menu.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${menuInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${menuInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>

