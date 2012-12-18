

<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            </div>
            <g:form action="save" >
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
                                    <label for="ip"><g:message code="client.ip.label" default="Ip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientData, field: 'ip', 'errors')}">
                                    <g:textField name="ip" maxlength="32" value="${clientData?.ip}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="port"><g:message code="client.port.label" default="Port" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientData, field: 'port', 'errors')}">
                                    <g:textField name="port" value="${fieldValue(bean: clientData, field: 'port')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="facility"><g:message code="client.facility.label" default="Facility" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clientData, field: 'facility', 'errors')}">
                                    <g:textField name="facility" maxlength="64" value="${clientData?.facility}" />
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
                                    <label for="membership"><g:message code="client.membership.label" default="Membership" /></label>
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
