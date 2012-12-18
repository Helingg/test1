<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Coding Rule')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ruleData}">
            <div class="errors">
                <g:renderErrors bean="${ruleData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="back" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="saveCode" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="groupId"><g:message code="rule.groupId.label" default="Group Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'groupId', 'errors')}">
                                    <g:textField name="groupName" maxlength="16" value="${params.groupName}" readonly="true"/>
                                    <g:hiddenField name="groupId" value="${fieldValue(bean: ruleData, field: 'groupId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="operator"><g:message code="rule.operator.label" default="Operator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'operator', 'errors')}">
                                    <g:textField name="operator" maxlength="16" value="Code" readonly="true"/>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="rule.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'comments', 'errors')}">
                                    <g:textField name="comments" size="32" value="${ruleData?.comments}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name" colspan="2">
                                    ----------------------- BEE Script Here --------------------------
                                    <br>Message variable name: msg &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank" href="${resource(dir:'doc',file:'index.html')}"><font color="blue">API Guide</font> </a>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" colspan="2" class="code ${hasErrors(bean: ruleData, field: 'other', 'errors')}">
                                    <g:textArea name="other" cols="80" rows="15" value="${ruleData?.other}" />
                                </td>
                            </tr>
                                                
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
