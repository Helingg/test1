<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Copy Rule')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ruleData}">
            <div class="errors">
                <g:renderErrors bean="${ruleData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="saveCopy" >
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
                                    <g:textField name="operator" maxlength="16" value="Copy" readonly="true"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name" colspan="2">
                                    ----------------------- From Segment --------------------------
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromSegment"><g:message code="rule.fromSegment.label" default="From Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromSegment', 'errors')}">
                                    <g:textField name="fromSegment" maxlength="3" value="${ruleData?.fromSegment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromIndex"><g:message code="rule.fromIndex.label" default="From Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromIndex', 'errors')}">
                                    <g:textField name="fromIndex" value="${fieldValue(bean: ruleData, field: 'fromIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromSubIndex"><g:message code="rule.fromSubIndex.label" default="From Sub Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromSubIndex', 'errors')}">
                                    <g:textField name="fromSubIndex" value="${fieldValue(bean: ruleData, field: 'fromSubIndex')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name" colspan="2">
                                    ----------------------- To Segment --------------------------
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toSegment"><g:message code="rule.toSegment.label" default="To Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toSegment', 'errors')}">
                                    <g:textField name="toSegment" maxlength="3" value="${ruleData?.toSegment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toIndex"><g:message code="rule.toIndex.label" default="To Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toIndex', 'errors')}">
                                    <g:textField name="toIndex" value="${fieldValue(bean: ruleData, field: 'toIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toSubIndex"><g:message code="rule.toSubIndex.label" default="To Sub Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toSubIndex', 'errors')}">
                                    <g:textField name="toSubIndex" value="${fieldValue(bean: ruleData, field: 'toSubIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="rule.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'comments', 'errors')}">
                                    <g:textArea name="comments" cols="40" rows="3" value="${ruleData?.comments}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updateCopy" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
					<span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
                <g:hiddenField name="value" value="${ruleData?.value}" />
                <g:hiddenField name="other" value="${ruleData?.other}" />
                <g:hiddenField name="id" value="${params.id}"/>
            </g:form>
        </div>
    </body>
</html>
