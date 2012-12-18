

<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${clientData}">
            <div class="errors">
                <g:renderErrors bean="${clientData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${clientData?.id}" />
                <g:hiddenField name="version" value="${clientData?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="client.name.label" default="Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'name', 'errors')}">
                                <g:textField name="name" maxlength="64" value="${clientData?.name}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="alias"><g:message code="client.alias.label" default="Alias" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'alias', 'errors')}">
                                <g:textField name="alias" maxlength="16" value="${clientData?.alias}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="application"><g:message code="client.application.label" default="Application" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'application', 'errors')}">
                                <g:textField name="application" maxlength="64" value="${clientData?.application}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="membership"><g:message code="client.membership.label" default="Membership" /></label >
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'membership', 'errors')}">
                                <g:select name="membership" from="${clientData.constraints.membership.inList}" value="${clientData?.membership}" valueMessagePrefix="client.membership"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="enabled"><g:message code="client.enabled.label" default="Enabled" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'enabled', 'errors')}">
                                <g:checkBox name="enabled" value="${clientData?.enabled}" />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
           		</div>
            </g:form>
        </div>
    </body>
</html>
