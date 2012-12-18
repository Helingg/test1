
<%@ page import="com.bssi.SendLog"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'sendLog.label', default: 'Received Message')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:javascript library="ui/jquery.ui.tabs" />
<g:javascript library="ui/jquery.ui.datepicker" />
    <script type="text/javascript">
        $(function() {

            $("#lowDate").datepicker();
            $("#highDate").datepicker();
        });
    </script>
<script>$(function() { $("#tabs").tabs();});</script>
</head>
<body>

	<div class="body">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Daily Details</a></li>
				<li><a href="#tabs-2">Summary</a></li>
			</ul>
            <div id="tabs-1">
                <g:form>
                    <table class="table">
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="Recipient"><g:message code="sendLog.Recipient.label" default="Recipient" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'client', 'errors')}">
                                <g:textField name="recipient" value="${params.recipient}"></g:textField>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="sentTime"><g:message code="sendLog.sentTime.label" default="Time" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'sentTime', 'errors')}">
                                <g:textField name="lowDate" readonly="true" precision="day" value="${params.lowDate}"  /> &nbsp;&nbsp;
                                To &nbsp;&nbsp;
                                <g:textField name="highDate"  readonly="true"  precision="day" value="${params.highDate}"  />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" >
                                <div class="buttons" style="width: 90px">
                                    <span class="button"><g:actionSubmit class="save" action="receive" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </g:form>
                <div class="list">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Recipient Name</th>
                            <th>Date</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${detailList}" status="i" var="data">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td>
                                    ${data[0]}
                                </td>
                                <td>
                                    ${data[2]}/${data[3]}/${data[1]}
                                </td>
                                <td>
                                    ${data[4]}
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="paginateButtons">
                    <g:paginate action="receive" params="[client:params.client,lowDate:params.lowDate,highDate:params.highDate]" total="${detailTotal}" />
                </div>
            </div>
			<div id="tabs-2">
		    <div class="list">
			<table>
				<thead>
					<tr>
						<th>Client Name</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${list}" status="i" var="data">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td>
								${data[0]}
							</td>
							<td>
								${data[1]}
							</td>
						</tr>
					</g:each>
				</tbody>
            </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="receive" total="${total}" />
            </div>
	</div>


	</div>
	</div>
</body>
</html>
