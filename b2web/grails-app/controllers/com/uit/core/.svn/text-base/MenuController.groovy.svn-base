package com.uit.core

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

/**
 * Menu Controller
 *
 * author: Wang Gang
 */
class MenuController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def menuService
	
	@Secured(['ROLE_SYSTEM'])
	def index = {
		redirect(action: "list", params: params)
	}

	@Secured(['ROLE_SYSTEM'])
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[menuInstanceList: Menu.list(params), menuInstanceTotal: Menu.count()]
	}

	@Secured(['ROLE_SYSTEM'])
	def create = {
		def menuInstance = new Menu()
		menuInstance.properties = params

		return [menuInstance: menuInstance,  authorityList: sortedRoles()]
	}

	@Secured(['ROLE_SYSTEM'])
	def role = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		render(view: "role", model:[menuInstanceList: Menu.list(params)])
	}

	/**
	 *  @TO-DO need cache to save menu instance
	 */
	def top = {
		//params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//[menuInstanceList: Menu.list(params), menuInstanceTotal: Menu.count()]
		
		
		[dataProvider: menuService.dataProvider()]
	}

	@Secured(['ROLE_SYSTEM'])
	def save = {
		def menuInstance = new Menu(params)
		if (menuInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])}"
			addRoles(menuInstance)
			redirect(action: "show", id: menuInstance.id)
		}
		else {
			render(view: "create", model: [menuInstance: menuInstance])
		}
	}

	@Secured(['ROLE_SYSTEM'])
	def show = {
		def menuInstance = Menu.get(params.id)
		if (!menuInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
			redirect(action: "list")
		}
		else {
			[menuInstance: menuInstance, authorityList: sortedRoles()]
		}
	}

	@Secured(['ROLE_SYSTEM'])
	def edit = {
		def menuInstance = Menu.get(params.id)
		if (!menuInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
			redirect(action: "list")
		}
		//else {
		//	return [menuInstance: menuInstance]
		//}
		
		
		return buildMenuModel(menuInstance)
	}

	@Secured(['ROLE_SYSTEM'])
	def update = {
		def menuInstance = Menu.get(params.id)
		if (menuInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (menuInstance.version > version) {

					menuInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'menu.label', default: 'Menu')]
					as Object[], "Another user has updated this Menu while you were editing")
					render(view: "edit", model: [menuInstance: menuInstance])
					return
				}
			}
			menuInstance.properties = params
            if(params.parent_id)
			   params.parent = Menu.get(params.parent_id)
			else
			   params.parent = new Menu()
			if (!menuInstance.hasErrors() && menuInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])}"
				redirect(action: "show", id: menuInstance.id)
			}
			else {
				render(view: "edit", model: [menuInstance: menuInstance, authorityList: sortedRoles()])
			}
			
			RoleMenu.removeAll menuInstance
			addRoles menuInstance
			//menuCache.removeUserFromCache menu.displayName
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
			redirect(action: "list")
		}
	}

	@Secured(['ROLE_SYSTEM'])
	def delete = {
		def menuInstance = Menu.get(params.id)
		if (menuInstance) {
			try {
				RoleMenu.removeAll menuInstance
				menuInstance.delete(flush: true)				
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
			redirect(action: "list")
		}
	}
	
	@Secured(['ROLE_SYSTEM'])
	def search = {
		[enabled: 1]
	}

	@Secured(['ROLE_SYSTEM'])
	def menuSearch = {
       
		if(!params.max) params.max  = 10
		if(!params.offset) params.offset = 0
		
		// search condition
		def searchClosure =  {
			if(params.displayName){			
				 like('displayName',"%${params.displayName}%")
			}
			if(params.descriptoin){
				like('description',"%${params.description}%")
			}
			if(params.linkController){
				like('linkController',"%${params.linkController}%")
			}
			if(params.linkAction){
				like('linkAction',"%${params.linkAction}%")
			}
			if(params.enabled){
				if(params.enabled == "-1")
				return
				def v = false
				if(params.enabled == "1")
				 v = true
				
				eq('enabled',v)
			}
			
		}
		
		//System.out.println("isValid = ${params.isValid}  boolean = " + new Boolean(params.isValid))
		// search 
		def c = Menu.createCriteria()
		def results = c.list(searchClosure)
		// count
		c = Menu.createCriteria()
		def totalCount = c.count(searchClosure)
		// model
		def model = [results: results, totalCount: totalCount, searched: true]
		render view: 'search', model: model
		
	}
	
	/**
	* Ajax call used by autocomplete textfield.
	*/
	@Secured(['ROLE_SYSTEM'])
   def ajaxMenuSearch = {

	   def jsonData = []

	   if (params.term?.length() > 2) {
		   String menuname = params.term

		   setIfMissing 'max', 10, 100

		   def results = Menu.executeQuery(
				   "SELECT DISTINCT u.displayName " +
				   "FROM Menu u " +
				   "WHERE u.displayName LIKE :name " +
				   "ORDER BY u.displayOrder",
				   [name: "${displayName}%"],
				   [max: params.max])

		   for (result in results) {
			   jsonData << [value: result]
		   }
	   }

	   render text: jsonData as JSON, contentType: 'text/plain'
   }

   @Secured(['ROLE_SYSTEM'])
	protected Map buildMenuModel(menu) {

		List roles = sortedRoles()
		//Menu.authorities*.authority
		Set roleMenuNames = RoleMenu.findAllByMenu(menu).role.authority
		def granted = [:]
		def notGranted = [:]
		for (role in roles) {
			if (roleMenuNames.contains(role.authority)) {
				granted[(role)] = roleMenuNames.contains(role.authority)
			}
			else {
				notGranted[(role)] = roleMenuNames.contains(role.authority)
			}
		}

		return [menuInstance: menu, roleMap: granted + notGranted]
	}

	@Secured(['ROLE_SYSTEM'])
	protected void addRoles(menu) {
		for (String key in params.keySet()) {
			if (key.contains('ROLE') && 'on' == params.get(key)) {
				RoleMenu.create menu, Role.findByAuthority(key), true
			}
		}
	}
	
	@Secured(['ROLE_SYSTEM'])
	protected findById() {
		def menu = Menu.get(params.id)
		if (!menu) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), params.id])}"
			redirect action: search
		}

		menu
	}
	
	@Secured(['ROLE_SYSTEM'])
	protected List sortedRoles() {
		Role.list().sort { it.authority }
	}
	
	@Secured(['ROLE_SYSTEM'])
	protected void setIfMissing(String paramName, long valueIfMissing, Long max = null) {
		long value = (params[paramName] ?: valueIfMissing).toLong()
		if (max) {
			value = Math.min(value, max)
		}
		params[paramName] = value
	}
}
