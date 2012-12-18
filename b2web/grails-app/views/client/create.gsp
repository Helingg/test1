

<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                if(document.getElementById("name").value==""){
                    alert("Name can not be blank");
                    document.getElementById("name").focus();
                    return false;
                }
//                if(document.getElementById("alias").value==""){
//                    alert("Alias can not be blank");
//                    document.getElementById("alias").focus();
//                    return false;
//                }
//                if(document.getElementById("facility").value==""){
//                    alert("Facility can not be blank");
//                    document.getElementById("facility").focus();
//                    return false;
//                }
//                if(document.getElementById("application").value==""){
//                    alert("Application can not be blank");
//                    document.getElementById("application").focus();
//                    return false;
//                }
//                if(document.getElementById("provider").value==""){
//                    alert("Provider can not be blank");
//                    document.getElementById("provider").focus();
//                    return false;
//                }
                return true;
            }
            function selectProvider(){
                var paramKQ = " ${request.contextPath}/client/selectProvider";
                open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
            }
            function setProviderInfo(providerString){
                document.getElementById("providerDiv").style.display="";
                if(providerString!=""||providerString!=null) {
                    var temp1 = providerString.split(",");
                    for(var i =0;i<temp1.length-1;i++){
                        var temp2 = temp1[i].split(":");
                        setProviderTable(temp2[0],temp2[1],temp2[2],temp2[3],temp2[4]);
                    }
                }
            }
            var providerTableNum=0;
            function setProviderTable(NPI,firstName,lastName, middleName,provider){  //set provider
                var objTable = document.getElementById("providerTable");
                objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
                providerTableNum++;
                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+providerTableNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(0);
                objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=center>"+NPI+"<input type=hidden name=NPI size=12 value="+NPI+" /> <input type=hidden name=provider size=12 value="+provider+" /><div></TD></TR>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+providerTableNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(1);
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TR><TD><div align=center>"+firstName+"<input type=hidden name=firstName size=12 value="+firstName+" /><div></TD></TR>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+providerTableNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TR><TD><div align=center>"+lastName+"<input type=hidden name=lastName size=12 value="+lastName+" /><div></TD></TR>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+providerTableNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(3);
                objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TR><TD><div align=center>"+middleName+"<input type=hidden name=middleName value="+middleName+" /></div></TD></TR>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+providerTableNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(4);
                objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TR><TD><div align=center><a href=javascript:DeleteProvider("+providerTableNum+");>${message(code: 'EquipmentClean.del.label', default: 'delete')}</a></div></TD></TR>";

                document.getElementById("providerTableNum").value=providerTableNum;
            }

            function DeleteProvider(rowIdx){
                if(!confirm("Are you sure to Delete?")){
                    return;
                }
                var objTable = document.getElementById("providerTable");
                var objRow = document.getElementById("toBeDelRow"+rowIdx);
                objTable.deleteRow(objRow.rowIndex);
                providerTableNum--;
                if(providerTableNum==0){
                    document.getElementById("providerDiv").style.display="none";
                }
                document.getElementById("providerTableNum").value =providerTableNum;
            }

        </script>
    </head>
    <body>

        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${clientData}">
            <div class="errors">
                <g:renderErrors bean="${clientData}" as="list" />
            </div>
            </g:hasErrors>
            <g:hiddenField name="providerTableNum"  id="providerTableNum" value="0"></g:hiddenField>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="client.name.label" default="Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'name', 'errors')}">
                                <g:textField name="name" maxlength="64" value="${clientData?.name}" />
                            </td>
                            <td valign="top" class="name">
                               <label for="alias"><g:message code="client.alias.label" default="Alias" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'alias', 'errors')}">
                               <g:textField name="alias" maxlength="16" value="${clientData?.alias}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="application"><g:message code="client.application.label" default="Application" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'application', 'errors')}">
                                <g:textField name="application" maxlength="64" value="${clientData?.application}" />
                            </td>
                            <td valign="top" class="name">
                                <label for="membership"><g:message code="client.membership.label" default="Membership" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'type', 'errors')}">
                                <g:select name="membership" from="${clientData.constraints.membership.inList}" value="${clientData?.membership}" valueMessagePrefix="client.membership"  />
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="enabled"><g:message code="client.enabled.label" default="Enabled" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: clientData, field: 'enabled', 'errors')}">
                                <g:checkBox name="enabled" value="${clientData?.enabled}" />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <div class="buttons" style="width:90px">
                    <span class="button"><input type="button" value="Add Provider" onclick="return selectProvider();"></span>
                </div>
                <div class="list" style="display: none" id="providerDiv">
                    <table id="providerTable">
                        <thead>
                        <tr>
                            <g:sortableColumn property="NPI" title="${message(code: 'provider.NPI.label', default: 'NPI')}" />

                            <g:sortableColumn property="firstName" title="${message(code: 'provider.firstName.label', default: 'First Name')}" />

                            <g:sortableColumn property="lastName" title="${message(code: 'provider.lastName.label', default: 'Last Name')}" />

                            <g:sortableColumn property="middleName" title="${message(code: 'provider.middleName.label', default: 'Middle Name')}" />

                            <g:sortableColumn property="dateCreated" title="${message(code: 'provider.dateCreated.label', default: 'Date Created')}" />

                        </tr>
                        </thead>
                        <tbody>

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
