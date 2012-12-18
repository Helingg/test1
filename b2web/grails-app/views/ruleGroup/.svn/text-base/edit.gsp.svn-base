

<%@ page import="com.bssi.RuleGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ruleGroup.label', default: 'RuleGroup')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                if(document.getElementById("name").value==""){
                    alert("Name can not be blank");
                    document.getElementById("name").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ruleGroupData}">
            <div class="errors">
                <g:renderErrors bean="${ruleGroupData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ruleGroupData?.id}" />
                <g:hiddenField name="version" value="${ruleGroupData?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="ruleGroup.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleGroupData, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="64" value="${ruleGroupData?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="ruleGroup.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleGroupData, field: 'type', 'errors')}">
                                    <g:select name="type" from="${ruleGroupData.constraints.type.inList}" value="${ruleGroupData?.type}" valueMessagePrefix="ruleGroup.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comments"><g:message code="ruleGroup.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ruleGroupData, field: 'comments', 'errors')}">
                                    <g:textArea name="comments" cols="40" rows="5" value="${ruleGroupData?.comments}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" onclick="return checkForm();" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
           		</div>
            </g:form>
        </div>
    </body>
</html>
