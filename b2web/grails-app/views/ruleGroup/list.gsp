
<%@ page import="com.bssi.RuleGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ruleGroup.label', default: 'Rule Group')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
            <g:form method="post" >
                <g:hiddenField name="id" value="${ruleGroupData?.id}" />
                <g:hiddenField name="version" value="${ruleGroupData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="ruleGroup.name.label" default="Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: ruleGroupData, field: 'name', 'errors')}">
                                <g:textField name="name" maxlength="64" value="${params?.name}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="type"><g:message code="ruleGroup.type.label" default="Type" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: ruleGroupData, field: 'type', 'errors')}">
                                <select name="type">
                                    <option value=""></option>
                                    <g:if test="${params.type=='ADT'}"><option value="ADT" selected="selected" >ADT</option></g:if>
                                    <g:else><option value="ADT">ADT</option></g:else>
                                    <g:if test="${params.type=='ORU'}"> <option value="ORU" selected="selected">ORU</option></g:if>
                                    <g:else> <option value="ORU">ORU</option></g:else>
                                    <g:if test="${params.type=='SIU'}"><option value="SIU" selected="selected">SIU</option></g:if>
                                    <g:else> <option value="SIU">SIU</option></g:else>
                                    <g:if test="${params.type=='ORM'}"><option value="ORM" selected="selected">ORM</option></g:if>
                                    <g:else><option value="ORM">ORM</option></g:else>
                                    <g:if test="${params.type=='DFT'}"><option value="DFT" selected="selected">DFT</option></g:if>
                                    <g:else><option value="DFT">DFT</option></g:else>
                                    <g:if test="${params.type=='MDM'}"><option value="MDM" selected="selected">MDM</option></g:if>
                                    <g:else><option value="MDM">MDM</option></g:else>
                                </select>
                            </td>
                        </tr>
                        <tr>

                               <td>
                                   <div class="buttons" style="width:90px">
                                       <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                   </div>
                               </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn action ="search"  params="[name:params.name,type:params.type]" property="id" title="${message(code: 'ruleGroup.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn action ="search"  params="[name:params.name,type:params.type]" property="name" title="${message(code: 'ruleGroup.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn action ="search"  params="[name:params.name,type:params.type]" property="type" title="${message(code: 'ruleGroup.type.label', default: 'type')}" />
                        
                            <g:sortableColumn action ="search"  params="[name:params.name,type:params.type]" property="comments" title="${message(code: 'ruleGroup.comments.label', default: 'Comments')}" />
                        
                            <g:sortableColumn action ="search"  params="[name:params.name,type:params.type]"  property="dateCreated" title="${message(code: 'ruleGroup.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ruleGroupDataList}" status="i" var="ruleGroupData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${ruleGroupData.id}">${fieldValue(bean: ruleGroupData, field: "id")}</g:link></td>
                        
                            <td><g:link controller="rule" action="listr" params="[groupId:ruleGroupData.id,groupName:ruleGroupData.name]">${fieldValue(bean: ruleGroupData, field: "name")}</g:link></td>
                        
                            <td><g:link controller="rule" action="listr" params="[groupId:ruleGroupData.id,groupName:ruleGroupData.name]">${fieldValue(bean: ruleGroupData, field: "type")}</g:link></td>
                        
                            <td><g:link controller="rule" action="listr" params="[groupId:ruleGroupData.id,groupName:ruleGroupData.name]">${fieldValue(bean: ruleGroupData, field: "comments")}</g:link></td>
                        
                            <td><g:formatDate date="${ruleGroupData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action ="search" params="[name:params.name,type:params.type]" total="${ruleGroupDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
