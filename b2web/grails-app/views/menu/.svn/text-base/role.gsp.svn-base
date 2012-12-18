
<%@ page import="com.uit.core.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="default.role.label" args="[entityName]" /></title>        
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
          
           <g:each in="${menuInstanceList}" status="i" var="menuInstance">
               <g:if test="${menuInstance.isValid==true && menuInstance.parentId==null}">
               <g:checkBox name="menuId" value="${fieldValue(bean: menuInstance, field: "id")}" checked="false"/>${fieldValue(bean: menuInstance, field: "displayName")}<br/>
               <g:each in="${menuInstanceList}" status="j" var="subMenu">
                  <g:if test="${subMenu.isValid==true && subMenu.parentId==menuInstance.id}">                           
                     &nbsp; &nbsp; &nbsp; <g:checkBox name="menuId" value="${fieldValue(bean: subMenu, field: "id")}" checked="false"/> ${fieldValue(bean: subMenu, field: "displayName")} <br/>
                     <g:each in="${menuInstanceList}" status="K" var="leaf">
                     <g:if test="${leaf.isValid==true && leaf.parentId==subMenu.id}"> 
                     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<g:checkBox name="menuId" value="${fieldValue(bean: leaf, field: "id")}" checked="false"/> ${fieldValue(bean: leaf, field: "displayName")} <br/>
                     </g:if>
                     </g:each>
                 </g:if>
               </g:each> 
               </g:if>   
          </g:each>
        </div>
    </body>
</html>
