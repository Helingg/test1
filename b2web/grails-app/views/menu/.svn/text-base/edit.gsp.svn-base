<head>
<meta name='layout' content='springSecurityUI' />
<g:set var="entityName"
	value="${message(code: 'menu.label', default: 'Menu')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>

<body>

	 <g:form method="post" >

	<%
	def tabData = []
	tabData << [name: 'menus',    icon: 'icon_menus', messageCode: 'spring.security.ui.role.menus']
	tabData << [name: 'roles',    icon: 'icon_role', messageCode: 'spring.security.ui.user.roles']
	%>
	
            <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${menuInstance}">
            <div class="errors">
                <g:renderErrors bean="${menuInstance}" as="list" />
            </div>
            </g:hasErrors>
           
                <g:hiddenField name="id" value="${menuInstance?.id}" />
                <g:hiddenField name="version" value="${menuInstance?.version}" />
                
                <s2ui:tabs elementId='tabs' height='260' data="${tabData}">

			    <s2ui:tab name='menus' height='260'>
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parent"><g:message code="menu.parent.label" default="Parent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'parent', 'errors')}">
                                    <g:select name="parent.id" from="${com.uit.core.Menu.list()}" optionKey="id" value="${menuInstance?.parent?.id}" noSelection="${['null':'Root Menu']}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="displayName"><g:message code="menu.displayName.label" default="Display Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'displayName', 'errors')}">
                                    <g:textField name="displayName" maxlength="128" value="${menuInstance?.displayName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="menu.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" maxlength="128" value="${menuInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="displayOrder"><g:message code="menu.displayOrder.label" default="Display Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'displayOrder', 'errors')}">
                                    <g:textField name="displayOrder" value="${fieldValue(bean: menuInstance, field: 'displayOrder')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="icon"><g:message code="menu.icon.label" default="Icon File" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'icon', 'errors')}">
                                    <g:textField name="icon" value="${fieldValue(bean: menuInstance, field: 'icon')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="linkController"><g:message code="menu.linkController.label" default="Link Controller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'linkController', 'errors')}">
                                    <g:textField name="linkController" maxlength="196" value="${menuInstance?.linkController}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="linkAction"><g:message code="menu.linkAction.label" default="Link Action" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'linkAction', 'errors')}">
                                    <g:textField name="linkAction" maxlength="196" value="${menuInstance?.linkAction}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enabled"><g:message code="menu.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${menuInstance?.enabled}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="visible"><g:message code="menu.visible.label" default="Visible" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: menuInstance, field: 'visible', 'errors')}">
                                    <g:checkBox name="visible" value="${menuInstance?.visible}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                             
                </s2ui:tab>
                <s2ui:tab name='roles' height='260'>
					<g:each var="entry" in="${roleMap}">
					<div>
						<g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
						<g:link controller='role' action='edit' id='${entry.key.id}'>${entry.key.authority.encodeAsHTML()}</g:link>
					</div>
					</g:each>
				</s2ui:tab>
             </s2ui:tabs>
           <div class="buttons">
               <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
               <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
           </div>
           
           </g:form>
           
    </body>
</html>
