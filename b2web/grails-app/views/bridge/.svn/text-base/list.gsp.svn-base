
<%@ page import="com.bssi.Bridge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

        <g:javascript library="ui/jquery.ui.datepicker" />
        <script type="text/javascript">
            $(function() {

                $("#lowDate").datepicker();
                $("#highDate").datepicker();
            });
        </script>
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
            <g:form method="post">
                <table class="table">
                    <tr>

                    </tr>
                    <tr>
                        <td valign="top" class="name">
                            <label for="client"><g:message code="bridge.client.label" default="Client" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: bridgeData, field: 'client', 'errors')}">
                            <g:textField name="client" value="${params.client}"></g:textField>
                        </td>
                        <td valign="top" class="name">
                            <label for="recipient"><g:message code="bridge.recipient.label" default="Recipient" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: bridgeData, field: 'recipient', 'errors')}">
                            <g:textField name="recipient" value="${params.recipient}"></g:textField>
                        </td>
                        <td valign="top" class="name">
                            <label for="ruleGroup"><g:message code="bridge.ruleGroup.label" default="Rule Group" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: bridgeData, field: 'ruleGroup', 'errors')}">
                            <g:textField name="ruleGroup" value="${params.ruleGroup}"></g:textField>
                        </td>
                    </tr>

                    <tr>

                    </tr>

                    <tr>
                        <td>
                            <div class="buttons" style="width:90px">
                                <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                            </div>
                        </td>
                    </tr>
                </table>
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn params="[client:params.client,recipient:params.recipient,ruleGroup:params.ruleGroup]" property="id" title="${message(code: 'bridge.id.label', default: 'Id')}" />

                            <th><g:message code="bridge.bridgeName.label" default="Bridge Name" /></th>
                        
                            <th><g:message code="bridge.client.label" default="Client" /></th>
                        
                            <th><g:message code="bridge.recipient.label" default="Recipient" /></th>
                        
                            <th><g:message code="bridge.ruleGroup.label" default="Rule Group" /></th>
                            
                            <g:sortableColumn params="[client:params.client,recipient:params.recipient,ruleGroup:params.ruleGroup]" property="dateCreated" title="${message(code: 'bridge.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bridgeDataList}" status="i" var="bridgeData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bridgeData[0]}">${bridgeData[0]}</g:link></td>

                            <td><g:link action="edit" id="${bridgeData[0]}">${bridgeData[6]}</g:link></td>
                        
                            <td><g:link action="edit" id="${bridgeData[0]}">${bridgeData[1]}</g:link></td>

                            <td><g:link action="edit" id="${bridgeData[0]}">${bridgeData[2]}</g:link></td>

                            <td><g:link action="edit" id="${bridgeData[0]}">${bridgeData[3]}-${bridgeData[4]}</g:link></td>

                            <td><g:formatDate date="${bridgeData[5]}"></g:formatDate></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[client:params.client,recipient:params.recipient,ruleGroup:params.ruleGroup]" total="${bridgeDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
