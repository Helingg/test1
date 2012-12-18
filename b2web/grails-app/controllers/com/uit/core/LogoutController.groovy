package com.uit.core
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/**
 * Logout Controller
 *
 * author: Wang Gang
 */
class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index = {
		// TODO put any pre-logout code here
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
	}
}
