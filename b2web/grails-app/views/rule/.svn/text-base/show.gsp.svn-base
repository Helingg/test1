
<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Rule')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "id")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.groupId.label" default="Group Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "groupId")} - ${params.groupName}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.operator.label" default="Operator" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "operator")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.fromSegment.label" default="From Segment" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "fromSegment")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.fromIndex.label" default="From Index" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "fromIndex")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.fromSubIndex.label" default="From Sub Index" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "fromSubIndex")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.toSegment.label" default="To Segment" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "toSegment")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.toIndex.label" default="To Index" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "toIndex")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.toSubIndex.label" default="To Sub Index" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "toSubIndex")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.value.label" default="Value" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "value")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.other.label" default="Other" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "other")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.comments.label" default="Comments" /></td>
                            <td valign="top" class="value">${fieldValue(bean: ruleData, field: "comments")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="rule.dateCreated.label" default="Date Created" /></td>
                            <td valign="top" class="value"><g:formatDate date="${ruleData?.dateCreated}" /></td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ruleData?.id}" />
                    <g:hiddenField name="groupId" value="${params?.groupId}" />
                    <g:hiddenField name="groupName" value="${params?.groupName}" />
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
				</g:form>
            </div>
        </div>
    </body>
</html>
