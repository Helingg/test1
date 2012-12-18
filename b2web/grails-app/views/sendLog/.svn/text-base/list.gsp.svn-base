
<%@ page import="com.bssi.SendLog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sendLog.label', default: 'SendLog')}" />
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
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sendLogData?.id}" />
                <g:hiddenField name="version" value="${sendLogData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="client"><g:message code="sendLog.client.label" default="Client" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="client" value="${params.client}"></g:textField> &nbsp;&nbsp;
                                <label for="recipient"><g:message code="sendLog.recipient.label" default="Recipient" /></label> &nbsp;&nbsp;
                                <g:textField name="recipient" value="${params.recipient}"></g:textField>
                            </td>
                        </tr>

                        <tr class="prop">

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="sentTime"><g:message code="sendLog.sentTime.label" default="Sent Time" /> &nbsp;&nbsp;From</label> &nbsp;&nbsp;
                                <g:textField name="lowDate" readonly="true" precision="day" value="${params.lowDate}"  /> &nbsp;&nbsp;
                                <label for="sentTime"> To </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="highDate" readonly="true" precision="day" value="${params.highDate}"  />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" >
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
                            <g:sortableColumn property="id" params="[lowDate:params.lowDate,highDate:params.highDate,client:params.client,recipient:params.recipient]" title="${message(code: 'sendLog.id.label', default: 'Id')}" />
                            <th><g:message code="sendLog.client.label" default="Client" /></th>
                            <th><g:message code="sendLog.recipient.label" default="Recipient" /></th>
                            <g:sortableColumn params="[lowDate:params.lowDate,highDate:params.highDate,client:params.client,recipient:params.recipient]" property="msgCtrlId" title="${message(code: 'sendLog.msgCtrlId.label', default: 'Msg Ctrl Id')}" />
                            <g:sortableColumn params="[lowDate:params.lowDate,highDate:params.highDate,client:params.client,recipient:params.recipient]" property="ack" title="${message(code: 'sendLog.ack.label', default: 'Ack')}" />
                            <g:sortableColumn params="[lowDate:params.lowDate,highDate:params.highDate,client:params.client,recipient:params.recipient]" property="sentTime" title="${message(code: 'sendLog.sentTime.label', default: 'Sent Time')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sendLogDataList}" status="i" var="sendLogData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sendLogData[0]}">${sendLogData[0]}</g:link></td>
                        
                            <td><g:link action="show" id="${sendLogData[0]}">${sendLogData[1]}</g:link></td>
                            
                            <td><g:link action="show" id="${sendLogData[0]}">${sendLogData[2]}</g:link></td>
                            
                            <td><g:link action="show" id="${sendLogData[0]}">${sendLogData[3]}</g:link></td>
                        
                            <td>${sendLogData[4]}</td>
                        
                            <td><g:formatDate  date="${sendLogData[5]}" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[lowDate:params.lowDate,highDate:params.highDate,client:params.client,recipient:params.recipient]" total="${sendLogDataTotal}" />
            </div>
			<div class="nav">            
            </div>
        </div>
    </body>
</html>
