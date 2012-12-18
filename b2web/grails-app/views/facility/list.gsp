
<%@ page import="com.bssi.Facility" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facility.label', default: 'Facility')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'facility.id.label', default: 'Id')}" />
                        
                            <th><g:message code="facility.client.label" default="Client" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'facility.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${facilityDataList}" status="i" var="facilityData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${facilityData.id}">${fieldValue(bean: facilityData, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: facilityData, field: "client")}</td>
                        
                            <td>${fieldValue(bean: facilityData, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${facilityDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
