

<%@ page import="com.bssi.Provider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                if(document.getElementById("NPI").value==""){
                    alert("NPI can not be blank");
                    document.getElementById("NPI").focus();
                    return false;
                }
                if(document.getElementById("firstName").value==""){
                    alert("First Name can not be blank");
                    document.getElementById("firstName").focus();
                    return false;
                }
                if(document.getElementById("lastName").value==""){
                    alert("Last Name can not be blank");
                    document.getElementById("lastName").focus();
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
            <g:hasErrors bean="${providerData}">
            <div class="errors">
                <g:renderErrors bean="${providerData}" as="list" />
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
                                    <label for="NPI"><g:message code="provider.NPI.label" default="NPI" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: providerData, field: 'NPI', 'errors')}">
                                    <g:textField name="NPI" maxlength="32" value="${providerData?.NPI}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="client"><g:message code="provider.client.label" default="Client" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: providerData, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${com.bssi.Client.list()}" optionKey="id" value="${providerData?.client?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="provider.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: providerData, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${providerData?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="provider.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: providerData, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${providerData?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName"><g:message code="provider.middleName.label" default="Middle Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: providerData, field: 'middleName', 'errors')}">
                                    <g:textField name="middleName" value="${providerData?.middleName}" />
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
