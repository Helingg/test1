<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <sec:ifNotLoggedIn>
        <meta HTTP-EQUIV="REFRESH" content="0; url=${request.contextPath}/login/auth">
        </sec:ifNotLoggedIn>
        <link rel="stylesheet" href="${resource(dir:'css',file:'redmond/jquery-ui-1.8.16.custom.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.global.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.menu.css')}"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />        
        <g:javascript library="jquery-1.6.2.min"/>        
        <g:javascript library="ui/jquery.ui.core"/>
        <g:javascript library="ui/jquery.ui.widget"/>
        <g:javascript library="uit.toolkit"/>
        <g:javascript library="uit.menu"/>
        <g:layoutHead />
    </head>
    <body>
        <table width="100%"><tr>
        <td><a href="http://user-it.com">
        <img src="${resource(dir:'images',file:'uit_logo.png')}" alt="User IT" border="0" /></a>
       </td>
       <td width="600">&nbsp;</td>
       <td valign="bottom">
        <sec:ifLoggedIn>
			<g:message code='spring.security.login.as'/>:<sec:username/> [<g:link controller='logout'><g:message code='spring.security.logout'/></g:link>]
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
			<a href='#' id='loginLink'><g:message code='spring.security.login'/></a>
		</sec:ifNotLoggedIn>
		</td></tr></table>
        <g:include controller="menu" action="top" />
		<br>
		
        <g:layoutBody/>
        
    </body>
</html>