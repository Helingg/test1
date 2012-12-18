
<%@ page import="com.bssi.Rule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rule.label', default: 'Rule')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /> for ${params.groupName}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            <span class="menuButton">
              <g:link class="create" action="createSet" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.set.label" args="[entityName]" /></g:link>
              <g:link class="create" action="createCopy" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.copy.label" args="[entityName]" /></g:link>
              <g:link class="create" action="createRemove" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.remove.label" args="[entityName]" /></g:link>
              <g:link class="create" action="createCode" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.code.label" default="Code"/></g:link>
            </span>
            </div>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="id" title="${message(code: 'rule.id.label', default: 'Id')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="groupId" title="${message(code: 'rule.groupId.label', default: 'Group Id')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="operator" title="${message(code: 'rule.operator.label', default: 'Operator')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="fromSegment" title="${message(code: 'rule.fromSegment.label', default: 'From Segment')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="fromIndex" title="${message(code: 'rule.fromIndex.label', default: 'From Index')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="fromSubIndex" title="${message(code: 'rule.fromSubIndex.label', default: 'From Sub Index')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="toSegment" title="${message(code: 'rule.toSegment.label', default: 'To Segment')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="toIndex" title="${message(code: 'rule.toIndex.label', default: 'To Index')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="toSubIndex" title="${message(code: 'rule.toSubIndex.label', default: 'To Sub Index')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="value" title="${message(code: 'rule.value.label', default: 'Value')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="other" title="${message(code: 'rule.other.label', default: 'Other')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="comments" title="${message(code: 'rule.comments.label', default: 'Comments')}" />
                            <g:sortableColumn params="[groupId:params.groupId,groupName:params.groupName]" property="dateCreated" title="${message(code: 'rule.dateCreated.label', default: 'Date Created')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ruleDataList}" status="i" var="ruleData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "id")}</g:link></td>
                        
                            <td><g:link action="edit${ruleData.operator}" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "groupId")}</g:link></td>
                        
                            <td><g:link action="edit${ruleData.operator}" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "operator")}</g:link></td>
                        
                            <td><g:link action="edit${ruleData.operator}" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "fromSegment")}</g:link></td>
                        
                            <td><g:link action="edit${ruleData.operator}" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "fromIndex")}</g:link></td>
                        
                            <td><g:link action="edit${ruleData.operator}" id="${ruleData.id}" params="[groupId:params.groupId,groupName:params.groupName]">${fieldValue(bean: ruleData, field: "fromSubIndex")}</g:link></td>
                        
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
              <span class="menuButton">
              <g:link class="create" action="createSet" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.set.label" default="Set"/></g:link>
              <g:link class="create" action="createCopy" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.copy.label" default="Copy"/></g:link>
              <g:link class="create" action="createRemove" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.remove.label" default="Remove"/></g:link>
              <g:link class="create" action="createCode" params="[groupId:params.groupId,groupName:params.groupName]"><g:message code="rule.new.code.label" default="Code"/></g:link>
              <g:link class="back" controller="ruleGroup" action="list"><g:message code="default.paginate.back" /></g:link>
              </span>
            </div>
        </div>
    </body>
</html>
