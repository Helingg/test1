
<%@ page import="com.bssi.Bridge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="dialog">
                <table>
                    <tbody>



                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bridge.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: bridgeData, field: "id")}</td>

                        </tr>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="bridge.bridgeName.label" default="Bridge Name" /></td>

                        <td valign="top" class="value">${fieldValue(bean: bridgeData, field: "bridgeName")}</td>

                    </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bridge.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${bridgeData?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bridge.client.label" default="Client" /></td>
                            
                            <td valign="top" class="value"><g:link controller="client" action="show" id="${bridgeData?.client?.id}">${bridgeData?.client?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bridge.recipient.label" default="Recipient" /></td>
                            
                            <td valign="top" class="value"><g:link controller="recipient" action="show" id="${bridgeData?.recipient?.id}">${bridgeData?.recipient?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bridge.ruleGroup.label" default="Rule Group" /></td>
                            
                            <td valign="top" class="value"><g:link controller="ruleGroup" action="show" id="${bridgeData?.ruleGroup?.id}">${bridgeData?.ruleGroup?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bridgeData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
				</g:form>
            </div>
        </div>
    </body>
</html>
