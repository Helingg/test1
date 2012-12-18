<head>
	<meta name='layout' content='springSecurityUI'/>
	<title><g:message code='spring.security.ui.menu.search'/></title>
</head>

<body>

<div>

	<s2ui:form width='100%' height='170' elementId='formContainer'  titleCode='spring.security.ui.menu.search'>

	<g:form action='menuSearch' name='menuSearchForm'>
		<table>
			<tbody>
			<tr>
				<td><g:message code='menu.displayName.label' default='displayName'/>:</td>
				<td colspan='3'><g:textField name='displayName' size='20' maxlength='128' autocomplete='off' value='${displayName}'/></td>
			
				<td><g:message code='menu.description.label' default='description'/>:</td>
				<td colspan='3'><g:textField name='description' size='20' maxlength='128' autocomplete='off' value='${description}'/></td>
			</tr>
			<tr>
				<td><g:message code='menu.linkController.label' default='linkController'/>:</td>
				<td colspan='3'><g:textField name='linkController' size='20' maxlength='128' autocomplete='off' value='${linkController}'/></td>
			
				<td><g:message code='menu.linkAction.label' default='linkAction'/>:</td>
				<td colspan='3'><g:textField name='linkAction' size='20' maxlength='128' autocomplete='off' value='${linkAction}'/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><g:message code='spring.security.ui.search.true'/></td>
				<td><g:message code='spring.security.ui.search.false'/></td>
				<td><g:message code='spring.security.ui.search.either'/></td>
			</tr>
			<tr>
				<td><g:message code='menu.enabled.label' default='Enabled'/>:</td>
				<g:radioGroup name='enabled' labels="['','','']" values="[1,0,-1]" value='${enabled}'>
				<td><%=it.radio%></td>
				</g:radioGroup>
			
				<td colspan='2'><span class="button"><s2ui:submitButton elementId='search' form='menuSearchForm' messageCode='spring.security.ui.search'/></span></td>
			</tr>
			</tbody>
		</table>
	</g:form>

	</s2ui:form>

	<g:if test='${searched}'>

<%
def queryParams = [displayName: displayName, description: description, linkController: linkController, linkAction: linkAction, enabled:enabled, visible:visible]
%>

	<div class="list">
	<table>
		<thead>
		<tr>
			<g:sortableColumn property="displayName" title="${message(code: 'menu.displayName.label', default: 'Display Name')}" params="${queryParams}"/>
			<g:sortableColumn property="description" title="${message(code: 'menu.description.label', default: 'Description')}" params="${queryParams}"/>
			<g:sortableColumn property="linkController" title="${message(code: 'menu.linkController.label', default: 'Link Controller')}" params="${queryParams}"/>
			<g:sortableColumn property="linkAction" title="${message(code: 'menu.linkAction.label', default: 'Link Action')}" params="${queryParams}"/>
			<g:sortableColumn property="enabled" title="${message(code: 'menu.enabled.label', default: 'Enabled')}" params="${queryParams}"/>
			<g:sortableColumn property="visible" title="${message(code: 'menu.visible.label', default: 'Visible')}" params="${queryParams}"/>
		</tr>
		</thead>

		<tbody>
		<g:each in="${results}" status="i" var="menu">
		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			<td><g:link action="edit" id="${menu.id}">${fieldValue(bean: menu, field: "displayName")}</g:link></td>
			<td><g:link action="edit" id="${menu.id}">${fieldValue(bean: menu, field: "description")}</g:link></td>
			<td><g:link action="edit" id="${menu.id}">${fieldValue(bean: menu, field: "linkController")}</g:link></td>
			<td><g:link action="edit" id="${menu.id}">${fieldValue(bean: menu, field: "linkAction")}</g:link></td>
			<td><g:formatBoolean boolean="${menu.enabled}"/></td>
			<td><g:formatBoolean boolean="${menu.visible}"/></td>
		</tr>
		</g:each>
		</tbody>
	</table>
	</div>

	<div class="paginateButtons">
		<g:paginate total="${totalCount}" params="${queryParams}" />
	</div>

	<div style="text-align:center">
		<s2ui:paginationSummary total="${totalCount}"/>
	</div>

	</g:if>

</div>

<script>
$(document).ready(function() {
	$("#username").focus().autocomplete({
		minLength: 3,
		cache: false,
		source: "${createLink(action: 'ajaxUserSearch')}"
	});
});

<s2ui:initCheckboxes/>

</script>

</body>
