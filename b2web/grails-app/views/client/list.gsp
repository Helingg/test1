
<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
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
            <g:form method="post" >
                <g:hiddenField name="id" value="${clientData?.id}" />
                <g:hiddenField name="version" value="${clientData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="client.name.label" default="Name" /></label>&nbsp;&nbsp;
                                <g:textField name="name" maxlength="64" value="${params?.name}" />   &nbsp;&nbsp;
                                <label for="provider"><g:message code="client.provider.label" default="Provider" /></label>
                                <g:textField name="provider" maxlength="64" value="${params?.provider}" />
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="membership"><g:message code="client.membership.label" default="Membership" /></label> &nbsp;&nbsp;&nbsp;&nbsp;
                            <g:if test="${params.membership=='trial'}"><g:radio value="trial" name="membership" checked="checked"/>Trial</g:if>
                            <g:else><g:radio value="trial" name="membership" />Trial</g:else>
                            <g:if test="${params.membership=='formal'}"><g:radio value="formal" name="membership" checked="checked"/>Formal</g:if>
                            <g:else><g:radio value="formal" name="membership" />Formal</g:else>

                                &nbsp;&nbsp;
                                <label for="enabled"><g:message code="client.enabled.label" default="Enabled" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:if test="${params.enabled=='true'}"><g:radio value="true" name="enabled" checked="checked"/>True</g:if>
                            <g:else><g:radio value="true" name="enabled"/>True</g:else>
                            <g:if test="${params.enabled=='false'}"><g:radio value="false" name="enabled" checked="checked"/>False</g:if>
                            <g:else><g:radio value="false" name="enabled"/>False</g:else>
                            </td>
                            </td>
                        </tr>

                        <tr class="prop">

                        </tr>
                        <tr>
                            <td>
                                <div class="buttons" style="width:90px">
                                    <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="alias" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.alias.label', default: 'Alias')}" />
                        
                            <g:sortableColumn property="membership" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.membership.label', default: 'Membership')}" />
                        
                            <g:sortableColumn property="enabled" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.enabled.label', default: 'Enabled')}" />

                            <g:sortableColumn property="dateCreated" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" title="${message(code: 'client.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientDataList}" status="i" var="clientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clientData.id}">${fieldValue(bean: clientData, field: "id")}</g:link></td>
                        
                            <td><g:link action="edit" id="${clientData.id}">${fieldValue(bean: clientData, field: "name")}</g:link></td>
                        
                            <td><g:link action="edit" id="${clientData.id}">${fieldValue(bean: clientData, field: "alias")}</g:link></td>
                        
                            <td>${fieldValue(bean: clientData, field: "membership")}</td>
                        
                            <td><g:formatBoolean boolean="${clientData.enabled}" /></td>
                        
                            <td><g:formatDate  date="${clientData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" total="${clientDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
