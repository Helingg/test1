<head>
<meta name='layout' content='springSecurityUI' />
<g:set var="entityName"
	value="${message(code: 'menu.label', default: 'Menu')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>

<body>

	<h3>
		<g:message code="default.create.label" args="[entityName]" />
	</h3>

	<g:form action="save" name='menuCreateForm'>

	<%
	def tabData = []
	tabData << [name: 'menus',    icon: 'icon_menus', messageCode: 'spring.security.ui.role.menus']
	tabData << [name: 'roles',    icon: 'icon_role', messageCode: 'spring.security.ui.user.roles']
	%>

		<s2ui:tabs elementId='tabs' height='300' data="${tabData}">

			<s2ui:tab name='menus' height='300'>
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><label for="parent"><g:message
										code="menu.parent.label" default="Parent" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'parent', 'errors')}">
								<g:select name="parent.id"
									from="${com.uit.core.Menu.list()}" optionKey="id"
									value="${menuInstance?.parent?.id}" noSelection="['':'Root Menu']" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="displayName"><g:message
										code="menu.displayName.label" default="Display Name" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'displayName', 'errors')}">
								<g:textField name="displayName" maxlength="64"
									value="${menuInstance?.displayName}" />
							</td>
						</tr>
						
						<tr class="prop">
							<td valign="top" class="name"><label for="icon"><g:message
										code="menu.icon.label" default="Icon File" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'icon', 'errors')}">
								<g:textField name="icon" maxlength="196"
									value="${menuInstance?.icon}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message
										code="menu.description.label" default="Description" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'description', 'errors')}">
								<g:textField name="description" maxlength="128"
									value="${menuInstance?.description}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="displayOrder"><g:message
										code="menu.displayOrder.label" default="Display Order" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'displayOrder', 'errors')}">
								<g:textField name="displayOrder"
									value="${fieldValue(bean: menuInstance, field: 'displayOrder')}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="linkController"><g:message
										code="menu.linkController.label" default="Link Controller" />
							</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'linkController', 'errors')}">
								<g:textField name="linkController" maxlength="196"
									value="${menuInstance?.linkController}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="linkAction"><g:message
										code="menu.linkAction.label" default="Link Action" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'linkAction', 'errors')}">
								<g:textField name="linkAction" maxlength="196"
									value="${menuInstance?.linkAction}" />
							</td>
						</tr>
						
                        <tr class="prop">
							<td valign="top" class="name"><label for="visible"><g:message
										code="menu.visible.label" default="Visible" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'visible', 'errors')}">
								<g:checkBox name="visible" value="${menuInstance?.visible}" />
							</td>
						</tr>
						
						<tr class="prop">
							<td valign="top" class="name"><label for="enabled"><g:message
										code="menu.enabled.label" default="Enabled" /> </label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: menuInstance, field: 'enabled', 'errors')}">
								<g:checkBox name="enabled" value="${menuInstance?.enabled}" />
							</td>
						</tr>
					</tbody>
				</table>
			</s2ui:tab>

			<s2ui:tab name='roles' height='300'>
				<g:each var="auth" in="${authorityList}">
					<div>
						<g:checkBox name="${auth.authority}" />
						<g:link controller='role' action='edit' id='${auth.id}'>
							${auth.authority.encodeAsHTML()}
						</g:link>
					</div>
				</g:each>
			</s2ui:tab>

		</s2ui:tabs>

		<div style='float: left; margin-top: 10px;'>
			<s2ui:submitButton elementId='create' form='menuCreateForm'
				messageCode='default.button.create.label' />
		</div>

	</g:form>

	<script>
$(document).ready(function() {
	$('#displayName').focus();
});
</script>

</body>