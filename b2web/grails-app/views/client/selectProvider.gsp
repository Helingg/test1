<%--
  Created by IntelliJ IDEA.
  User: HLG
  Date: 12-3-23
  Time: 上午11:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Add Facility</title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <meta name="layout" content="" />
    <script type="text/javascript">
        function reFacility(){
           var name = document.getElementById("name").value;
            if(name==""||name==null){
                alert("The Facility Name can not be blank!")
                document.getElementById("name").focus();
                return;
            }
        }
        var providerString="";
        function reProvider(){
            var pid = document.getElementsByName("pid");
            var NPI = document.getElementsByName("NPI");
            var firstName = document.getElementsByName("firstName");
            var lastName = document.getElementsByName("lastName");
            var middleName = document.getElementsByName("middleName");
            var dateCreated = document.getElementsByName("dateCreated");
            var len =pid.length;
            if(len>0) {
                for(var i=0;i<len;i++){
                    if(pid[i].checked) {
                        providerString = providerString + NPI[i].value + ":" + firstName[i].value +":"+ lastName[i].value +":"+middleName[i].value+":"+pid[i].value+ ",";
                    }
                }
            }
            alert(providerString);
            parent.window.opener.setProviderInfo(providerString);
            top.close();
        }
    </script>
</head>
<body>
<div class="list">
    <form>
        <table>
            <tbody>
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="NPI"><g:message code="provider.NPI.label" default="NPI" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td valign="top" >
                    <g:textField name="NPI1" maxlength="32" value="${params?.NPI1}" />
                </td>
                <td valign="top" class="name">
                    <label for="client"><g:message code="provider.client.label" default="Client" /></label>
                </td>
                <td valign="top" >
                    <g:textField name="client1" value="${params?.client1}" />
                </td>
            </tr>
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="firstName"><g:message code="provider.firstName.label" default="First Name" /></label>

                </td>
                <td valign="top">
                    <g:textField name="firstName1" value="${params?.firstName1}" />
                </td>
                <td valign="top" class="name">
                    <label for="lastName"><g:message code="provider.lastName.label" default="Last Name" /></label>
                </td>
                <td valign="top" >
                    <g:textField name="lastName1" value="${params?.lastName1}" />
                </td>
            </tr>
            <tr class="prop">
                <td>
                    <div class="buttons" style="width:90px">
                        <span class="button"><g:actionSubmit class="save" controller="client" action="selectProvider" value="${message(code: 'default.button.search.label', default: 'Search')}"/></span>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="id" title="${message(code: 'provider.id.label', default: 'Choose')}" />

            <g:sortableColumn property="NPI" title="${message(code: 'provider.NPI.label', default: 'NPI')}" />

            <g:sortableColumn property="firstName" title="${message(code: 'provider.firstName.label', default: 'First Name')}" />

            <g:sortableColumn property="lastName" title="${message(code: 'provider.lastName.label', default: 'Last Name')}" />

            <g:sortableColumn property="middleName" title="${message(code: 'provider.middleName.label', default: 'Middle Name')}" />

            <g:sortableColumn property="dateCreated" title="${message(code: 'provider.dateCreated.label', default: 'Date Created')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${providerDataList}" status="i" var="providerData">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td class="conent"><g:checkBox  name="pid" id="pid"  value="${providerData.id}" checked="false"></g:checkBox> </td>

                <td><g:hiddenField name="NPI" id="NPI" value="${providerData.NPI}"/>${providerData.NPI}</td>

                <td><g:hiddenField name="firstName"  value="${providerData.firstName}"/>${providerData.firstName}</td>

                <td><g:hiddenField name="lastName"  value="${providerData.lastName}"/>${providerData.lastName}</td>

                <td><g:hiddenField name="middleName"  value="${providerData.middleName}"/>${providerData.middleName}</td>

                <td><g:hiddenField name="dateCreated" value="${providerData.dateCreated}"/><g:formatDate date="${providerData.dateCreated}" /></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    </form>
</div>
<div class="paginateButtons">
    <g:paginate action="search" params="[NPI:params.NPI,client:params.client,firstName:params.firstName,lastName:params.lastName]" total="${providerDataTotal}" />
</div>
<div class="nav">
    <input align="middle" id="btnSubmit" type="button" onclick="return reProvider();" name="submitButton"  value="Ok"/>
</div>
</div>
</body>
</html>