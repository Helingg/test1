<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Set Rule')}" />
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
            <g:form action="saveSet" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="groupId">Group Name</label>
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
                                    <g:textField name="operator" maxlength="16" value="Set" readonly="true"/>
                                </td>
                            </tr>
                        
                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toSegment">Segment</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toSegment', 'errors')}">
                                    <g:textField name="toSegment" maxlength="3" value="${ruleData?.toSegment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toIndex">Index </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toIndex', 'errors')}">
                                    <g:textField name="toIndex" size="6" value="${fieldValue(bean: ruleData, field: 'toIndex')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toIndex">Sub-Index </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'toSubIndex', 'errors')}">
                                    <g:textField name="toSubIndex" size="6" value="${fieldValue(bean: ruleData, field: 'toSubIndex')}" />
                                </td>
                            </tr>
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value"><input type="radio" name="status" value="0" <%if(params.status=='0'){%>checked<%}%>> &nbsp; <g:message code="rule.value.label" default="Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'value', 'errors')}">
                                    <g:textField name="value" size="35"  value="${ruleData?.value}" />
                                </td>
                            </tr>
                            
                             <tr class="prop">
                                <td valign="top" colspan="2"><input type="radio" name="status" value="1" <%if(params.status=='1'){%>checked<%}%>> &nbsp;  Get value from segment</td>
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
                                    <g:textField name="fromIndex" size="6" value="${fieldValue(bean: ruleData, field: 'fromIndex')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromSubIndex"><g:message code="rule.fromSubIndex.label" default="From Sub-Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromSubIndex', 'errors')}">
                                    <g:textField name="fromSubIndex" size="6" value="${fieldValue(bean: ruleData, field: 'fromSubIndex')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="rule.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'comments', 'errors')}">
                                    <g:textArea name="comments" cols="35" rows="4" value="${ruleData?.comments}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updateSet" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
                <g:hiddenField name="other" value="${ruleData?.other}" />
                <g:hiddenField name="id" value="${params.id}"/>
            </g:form>
        </div>
    </body>
</html>
