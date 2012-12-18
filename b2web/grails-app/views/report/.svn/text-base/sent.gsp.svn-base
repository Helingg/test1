
<%@ page import="com.bssi.SendLog"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'sendLog.label', default: 'Sent Message')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
<g:javascript library="ui/jquery.ui.tabs" />
<script>$(function() { $("#tabs").tabs();});</script>
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
                                <label for="client"><g:message code="sendLog.client.label" default="Client" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="client" value="${params.client}"></g:textField>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="sentTime"><g:message code="sendLog.sentTime.label" default="Date" />&nbsp;&nbsp; From</label>&nbsp;&nbsp;
                                <g:textField name="lowDate"  readonly="true" precision="day" value="${params.lowDate}"  /> &nbsp;&nbsp;
                                <label for="sentTime">To &nbsp;&nbsp; </label>
                                <g:textField name="highDate"  readonly="true" precision="day" value="${params.highDate}"  />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" >
                                <div class="buttons" style="width:90px">
                                    <span class="button"><g:actionSubmit class="save" action="sent" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </g:form>
                <div class="list">
                    <table>
                        <thead>
                        <tr>
                            <th>Client Name</th>
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
                    <g:paginate action="sent" params="[client:params.client,lowDate:params.lowDate,highDate:params.highDate]" total="${detailTotal}" />
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
			<g:paginate action="sent" total="${total}" />
		</div>
	</div>
	</div>
	</div>
</body>
</html>
