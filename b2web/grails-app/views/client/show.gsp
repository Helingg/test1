
<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
                            <td valign="top" class="name"><g:message code="client.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientData, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientData, field: "name")}</td>
                            
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.alias.label" default="Alias" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientData, field: "alias")}</td>
                            
                        </tr>
                    

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.membership.label" default="Membership" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: clientData, field: "membership")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${clientData?.enabled}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="client.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${clientData?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${clientData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" controller="provider" action="create">New provider</span> </g:link>
				</g:form>
            </div>
        </div>
    </body>
</html>
