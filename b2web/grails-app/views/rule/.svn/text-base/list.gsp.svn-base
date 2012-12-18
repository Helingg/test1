
<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Rule')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'rule.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="groupId" title="${message(code: 'rule.groupId.label', default: 'Group Id')}" />
                        
                            <g:sortableColumn property="operator" title="${message(code: 'rule.operator.label', default: 'Operator')}" />
                        
                            <g:sortableColumn property="fromSegment" title="${message(code: 'rule.fromSegment.label', default: 'From Segment')}" />
                        
                            <g:sortableColumn property="fromIndex" title="${message(code: 'rule.fromIndex.label', default: 'From Index')}" />
                        
                            <g:sortableColumn property="fromSubIndex" title="${message(code: 'rule.fromSubIndex.label', default: 'From Sub Index')}" />
                        
                            <g:sortableColumn property="toSegment" title="${message(code: 'rule.toSegment.label', default: 'To Segment')}" />
                        
                            <g:sortableColumn property="toIndex" title="${message(code: 'rule.toIndex.label', default: 'To Index')}" />
                        
                            <g:sortableColumn property="toSubIndex" title="${message(code: 'rule.toSubIndex.label', default: 'To Sub Index')}" />
                        
                            <g:sortableColumn property="value" title="${message(code: 'rule.value.label', default: 'Value')}" />
                        
                            <g:sortableColumn property="other" title="${message(code: 'rule.other.label', default: 'Other')}" />
                        
                            <g:sortableColumn property="comments" title="${message(code: 'rule.comments.label', default: 'Comments')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'rule.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ruleDataList}" status="i" var="ruleData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ruleData.id}">${fieldValue(bean: ruleData, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: ruleData, field: "groupId")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "operator")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "fromSegment")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "fromIndex")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "fromSubIndex")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "toSegment")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "toIndex")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "toSubIndex")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "value")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "other")}</td>
                        
                            <td>${fieldValue(bean: ruleData, field: "comments")}</td>
                        
                            <td><g:formatDate date="${ruleData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ruleDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
