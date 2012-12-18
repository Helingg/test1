
<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'client.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="alias" title="${message(code: 'client.alias.label', default: 'Alias')}" />
                        
                            <g:sortableColumn property="ip" title="${message(code: 'client.ip.label', default: 'Ip')}" />
                        
                            <g:sortableColumn property="port" title="${message(code: 'client.port.label', default: 'Port')}" />
                        
                            <g:sortableColumn property="facility" title="${message(code: 'client.facility.label', default: 'Facility')}" />
                        
                            <g:sortableColumn property="application" title="${message(code: 'client.application.label', default: 'Application')}" />
                        
                            <g:sortableColumn property="membership" title="${message(code: 'client.membership.label', default: 'Membership')}" />
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'client.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'client.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientDataList}" status="i" var="clientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clientData.id}">${fieldValue(bean: clientData, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clientData, field: "name")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "alias")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "ip")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "port")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "facility")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "application")}</td>
                        
                            <td>${fieldValue(bean: clientData, field: "membership")}</td>
                        
                            <td><g:formatBoolean boolean="${clientData.enabled}" /></td>
                        
                            <td><g:formatDate date="${clientData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clientDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
