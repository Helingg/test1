
<%@ page import="com.bssi.Provider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
            <form>
                <table class="table">
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="NPI"><g:message code="provider.NPI.label" default="NPI" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:textField name="NPI" maxlength="32" value="${params?.NPI}" />&nbsp;&nbsp;
                            <label for="client"><g:message code="provider.client.label" default="Client" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:textField name="client" value="${params?.client}" />
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="firstName"><g:message code="provider.firstName.label" default="First Name" /></label>&nbsp;&nbsp;
                        <g:textField name="firstName" value="${params?.firstName}" /> &nbsp;&nbsp;
                            <label for="lastName"><g:message code="provider.lastName.label" default="Last Name" /></label> &nbsp;&nbsp;
                        <g:textField name="lastName" value="${params?.lastName}" />
                        </td>
                    </tr>
                    <tr class="prop">
                        <td>
                            <div class="buttons" style="width:90px">
                                <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                            </div>
                        </td>

                    </tr>


                    </tbody>
                </table>
            </form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'provider.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="NPI" title="${message(code: 'provider.NPI.label', default: 'NPI')}" />
                        
                            <th><g:message code="provider.client.label" default="Client" /></th>
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'provider.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'provider.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="middleName" title="${message(code: 'provider.middleName.label', default: 'Middle Name')}" />

                            <g:sortableColumn property="dateCreated" title="${message(code: 'provider.dateCreated.label', default: 'Date Created')}" />

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${providerDataList}" status="i" var="providerData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${providerData[0]}">${providerData[0]}</g:link></td>
                        
                            <td><g:link action="edit" id="${providerData[0]}">${providerData[1]}</g:link></td>
                        
                            <td><g:link action="edit" id="${providerData[0]}">${providerData[2]}</g:link></td>
                        
                            <td><g:link action="edit" id="${providerData[0]}">${providerData[3]}</g:link></td>
                        
                            <td>${providerData[4]}</td>
                        
                            <td>${providerData[5]}</td>

                            <td><g:formatDate date="${providerData[6]}" /></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[NPI:params.NPI,client:params.client,firstName:params.firstName,lastName:params.lastName]" total="${providerDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
