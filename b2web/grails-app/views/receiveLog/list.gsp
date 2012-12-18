
<%@ page import="com.bssi.ReceiveLog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'receiveLog.label', default: 'ReceiveLog')}" />
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
                <g:hiddenField name="id" value="${receiveLogData?.id}" />
                <g:hiddenField name="version" value="${receiveLogData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="remoteIp"><g:message code="receiveLog.remoteIp.label" default="Remote Ip" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="remoteIp" maxlength="128" value="${params.remoteIp}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="receiveTime"><g:message code="receiveLog.receiveTime.label" default="Receive Time" />&nbsp;&nbsp; From&nbsp;&nbsp;</label>
                                <g:textField name="lowDate" precision="day" value="${params.lowDate}" readonly="true" /> &nbsp;&nbsp;
                               <label> To &nbsp;&nbsp;</label>
                                <g:textField name="highDate" precision="day" value="${params.highDate}" readonly="true"  />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top">
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
                        
                            <g:sortableColumn params="[receiveTime:params.receiveTime,remoteIp:params.remoteIp]" property="id" title="${message(code: 'receiveLog.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn params="[receiveTime:params.receiveTime,remoteIp:params.remoteIp]" property="msgCtrlId" title="${message(code: 'receiveLog.msgCtrlId.label', default: 'Msg Ctrl Id')}" />
                        
                            <g:sortableColumn params="[receiveTime:params.receiveTime,remoteIp:params.remoteIp]" property="remoteIp" title="${message(code: 'receiveLog.remoteIp.label', default: 'Remote Ip')}" />
                        
                            <g:sortableColumn params="[receiveTime:params.receiveTime,remoteIp:params.remoteIp]" property="receiveTime" title="${message(code: 'receiveLog.receiveTime.label', default: 'Receive Time')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${receiveLogDataList}" status="i" var="receiveLogData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${receiveLogData.id}">${fieldValue(bean: receiveLogData, field: "id")}</g:link></td>
                        
                            <td><g:link action="show" id="${receiveLogData.id}">${fieldValue(bean: receiveLogData, field: "msgCtrlId")}</g:link></td>
                        
                            <td><g:link action="show" id="${receiveLogData.id}">${fieldValue(bean: receiveLogData, field: "remoteIp")}</g:link></td>
                        
                            <td><g:formatDate date="${receiveLogData.receiveTime}"/></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[receiveTime:params.receiveTime,remoteIp:params.remoteIp]" total="${receiveLogDataTotal}" />
            </div>
			<div class="nav">            
            </div>
        </div>
    </body>
</html>
