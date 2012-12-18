

<%@ page import="com.bssi.Facility" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facility.label', default: 'Facility')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${facilityData}">
            <div class="errors">
                <g:renderErrors bean="${facilityData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${facilityData?.id}" />
                <g:hiddenField name="version" value="${facilityData?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="client"><g:message code="facility.client.label" default="Client" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: facilityData, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${com.bssi.Client.list()}" optionKey="id" value="${facilityData?.client?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="facility.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: facilityData, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${facilityData?.name}" />
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
