<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Remove Rule')}" />
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
            <g:form action="saveRemove" >
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
                                    <g:textField name="operator" maxlength="16" value="Remove" readonly="true"/>
                                </td>
                            </tr>
                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromSegment"><g:message code="rule.fromSegment.label" default="Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromSegment', 'errors')}">
                                    <g:textField name="fromSegment" maxlength="3" value="${ruleData?.fromSegment}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" colspan="2">
                                 <input type="radio" name="other" value="ALL" <%if(ruleData.other=='ALL'){%>checked<%}%>>   ALL  &nbsp;
                                 <input type="radio" name="other" value="FIRST" <%if(ruleData.other=='FIRST'){%>checked<%}%>>  FIRST  &nbsp;
                                 <input type="radio" name="other" value="LAST" <%if(ruleData.other=='LAST'){%>checked<%}%>>  LAST
                                 </td>
                             </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromIndex"><g:message code="rule.fromIndex.label" default="Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleData, field: 'fromIndex', 'errors')}">
                                    <g:textField name="fromIndex" size="6" value="${fieldValue(bean: ruleData, field: 'fromIndex')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromSubIndex"><g:message code="rule.fromSubIndex.label" default="Sub-Index" /></label>
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="back" action="listr" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
