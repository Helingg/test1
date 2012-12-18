

<%@ page import="com.bssi.Bridge" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                if(document.getElementById("bridgeName").value==""){
                    alert("Bridge Name can not be blank");
                    document.getElementById("bridgeName").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bridgeData}">
            <div class="errors">
                <g:renderErrors bean="${bridgeData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="client"><g:message code="bridge.client.label" default="Client" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="recipient"><g:message code="bridge.recipient.label" default="Recipient" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="ruleGroup"><g:message code="bridge.ruleGroup.label" default="Rule Group" /></label>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean: bridgeData, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${com.bssi.Client.list()}" optionKey="id" value="${bridgeData?.client?.id}" size="25" /> &nbsp;&nbsp;
                                    <g:select name="recipient.id" from="${com.bssi.Recipient.list()}" optionKey="id" value="${bridgeData?.recipient?.id}" size="25" />&nbsp;&nbsp;
                                    <g:select name="ruleGroup.id" from="${com.bssi.RuleGroup.list()}" optionKey="id" value="${bridgeData?.ruleGroup?.id}" size="25"/>
                                </td>
                            </tr>
                        <tr>
                            <td valign="top" class="name">
                                <label for="bridgeName"><g:message code="bridge.bridgeName.label" default="Bridge Name" /></label>&nbsp;&nbsp;
                                <g:textField name="bridgeName" id="bridgeName" value="${params.bridgeName}" />
                            </td>
                        </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
