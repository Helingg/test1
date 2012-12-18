package com.bssi

/**
 * Rule Controller
 *
 * author: Wang Gang
 */
class RuleController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 15, 100)
		[ruleDataList: Rule.list(params), ruleDataTotal: Rule.count()]
		
//		def results = Rule.withCriteria {
//			Date begin = Date.parse("yyyy-MM-dd","2012-1-13")
//			Date end = Date.parse("yyyy-MM-dd","2012-1-14")
//			between('dateCreated', begin, end)
//		}
//		[ruleDataList: results, ruleDataTotal: Rule.count()]
	}

	def create = {
		def ruleData = new Rule()
		ruleData.properties = params
		return [ruleData: ruleData]
	}

	def save = {
		def ruleData = new Rule(params)
		if (ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params:[groupId: params.groupId, groupName: params.groupName])
		}
		else {
			render(view: "create", model: [ruleData: ruleData])
		}
	}

	def show = {
		def ruleData = Rule.get(params.id)
		if (!ruleData) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "list")
		}
		else {
			[ruleData: ruleData,params: params]
		}
	}

	def edit = {
		def ruleData = Rule.get(params.id)
		if (!ruleData) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [ruleData: ruleData,params: params]
		}
	}

	def update = {
		def ruleData = Rule.get(params.id)
		if (ruleData) {
			if (params.version) {
				def version = params.version.toLong()
				if (ruleData.version > version) {

					ruleData.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'rule.label', default: 'Rule')]
					as Object[], "Another user has updated this Rule while you were editing")
					render(view: "edit", model: [ruleData: ruleData])
					return
				}
			}
			ruleData.properties = params
			if (!ruleData.hasErrors() && ruleData.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
				redirect(action: "show", id: ruleData.id)
			}
			else {
				render(view: "edit", model: [ruleData: ruleData])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {

		def ruleData = Rule.get(params.id)
		if (ruleData) {
			try {
				ruleData.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
				redirect(action: "listr", params:[groupId:params.groupId,groupName:params.groupName])
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
				redirect(action: "show", id: params.id,params:params)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "listr", params:params)
		}
	}

	// =============================== Business Logic =======================================

	//
	//  list rule for some group
	//
	def listr = {
		if(!params.max) params.max = 15
		if(!params.offset) params.offset = 0

		def closure = {

			if(params.groupId)
				eq('groupId',Long.parseLong(params.groupId))

		}

		def list = Rule.createCriteria().list(params,closure)

		[ruleDataList: list, ruleDataTotal: list.totalCount]
	}

	//
	// Create Set
	//
	def createSet = {
		def ruleData = new Rule()
		ruleData.properties = params
		params.status = '0'
		return [params:params,ruleData: ruleData]
	}

	//
	//  Add set rule
	//
	def saveSet = {

		def ruleData = new Rule(params)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.toSegment?.length()!=3)
			ruleData.errors.rejectValue('toSegment', 'rule.segment.empty')

		if(params.toIndex?.length()<1 || params.toIndex=='0')
			ruleData.errors.rejectValue('toIndex', 'rule.index.invalid')

		if(params.status=='1'){
			if(params.fromSegment?.length()!=3)
				ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')

			if(params.fromIndex?.length()<1 || params.fromIndex=='0')
				ruleData.errors.rejectValue('fromIndex', 'rule.index.invalid')
		}
		//log.debug('---- error size = '+ruleData.errors?.size())
		if(ruleData.hasErrors()){
			render(view: "createSet", model: [params:params,ruleData: ruleData])
			return
		}

		if (ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params: params)
		}
		else {
			render(view: "create", model: [ruleData: ruleData,params: params])
		}
	}

	//
	// Edit Set
	//
	def editSet = {
		def ruleData = Rule.get(params.id)
		if (!ruleData) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "listr" ,params:[groupId:params.groupId,groupName:params.groupName])
		}
		else {

			if(!ruleData.value || ruleData.value?.length()==0)
				params.status = '1'
			else
				params.status = '0'

			return [params:params,ruleData: ruleData]
		}
	}

	//
	// update set
	//
	def updateSet = {

		log.debug('-- params.id = '+params.id)

		def ruleData = Rule.get(params.id)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.toSegment?.length()!=3)
			ruleData.errors.rejectValue('toSegment', 'rule.segment.empty')

		if(params.toIndex?.length()<1 || params.toIndex=='0')
			ruleData.errors.rejectValue('toIndex', 'rule.index.invalid')

		if(params.status=='1'){
			if(params.fromSegment?.length()!=3)
				ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')

			if(params.fromIndex?.length()<1 || params.fromIndex=='0')
				ruleData.errors.rejectValue('fromIndex', 'rule.index.invalid')
			
			params.value=''
		}

		if(ruleData.hasErrors()){
			render(view: "editSet", model: [params:params,ruleData: ruleData])
			return
		}
		
		

		ruleData.properties = params

		if (!ruleData.hasErrors() && ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params:[groupId:params.groupId,groupName:params.groupName])
		}
		else {
			render(view: "edit", model: [params:params, ruleData: ruleData])
		}
	}


	//
	// Create Copy
	//
	def createCopy = {
		def ruleData = new Rule()
		ruleData.properties = params
		return [params:params,ruleData: ruleData]
	}

	//
	//  Add set rule
	//
	def saveCopy = {

		def ruleData = new Rule(params)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.toSegment?.length()!=3)
			ruleData.errors.rejectValue('toSegment', 'rule.segment.empty')

		if(params.toIndex?.length()<1 || params.toIndex=='0')
			ruleData.errors.rejectValue('toIndex', 'rule.index.invalid')

		if(params.fromSegment?.length()!=3)
			ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')

		if(params.fromIndex?.length()<1 || params.fromIndex=='0')
			ruleData.errors.rejectValue('fromIndex', 'rule.index.invalid')

		if(ruleData.hasErrors()){
			render(view: "createCopy", model: [params:params,ruleData: ruleData])
			return
		}

		if (ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id, params:params)
		}
		else {
			render(view: "createCopy", model: [params:params,ruleData: ruleData])
		}
	}

	//
	// Edit Copy
	//
	def editCopy = {

		def ruleData = Rule.get(params.id)

		if (!ruleData) {

			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "listr", params:[groupId:params.groupId,groupName:params.groupName])

		}else {

			return [params:params,ruleData: ruleData]
		}
	}

	//
	// update copy
	//
	def updateCopy = {

		log.debug('-- params.id = '+params.id)

		def ruleData = Rule.get(params.id)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.toSegment?.length()!=3)
			ruleData.errors.rejectValue('toSegment', 'rule.segment.empty')

		if(params.toIndex?.length()<1 || params.toIndex=='0')
			ruleData.errors.rejectValue('toIndex', 'rule.index.invalid')

		if(params.fromSegment?.length()!=3)
			ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')

		if(params.fromIndex?.length()<1 || params.fromIndex=='0')
			ruleData.errors.rejectValue('fromIndex', 'rule.index.invalid')

		if(ruleData.hasErrors()){
			render(view: "editCopy", model: [params:params,ruleData: ruleData])
			return
		}

		ruleData.properties = params

		if (!ruleData.hasErrors() && ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params:[groupId:params.groupId,groupName:params.groupName])
		}
		else {
			render(view: "editCopy", model: [params:params, ruleData: ruleData])
		}
	}


	//
	// Create Remove
	//
	def createRemove = {
		def ruleData = new Rule()
		ruleData.properties = params
		params.other = "FIRST"
		return [params:params,ruleData: ruleData]
	}

	//
	//  Add remove rule
	//
	def saveRemove = {

		def ruleData = new Rule(params)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.fromSegment?.length()!=3)
			ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')

		if(ruleData.hasErrors()){
			render(view: "createRemove", model: [params:params,ruleData: ruleData])
			return
		}

		if (ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id, params:params)
		}
		else {
			render(view: "createRemove", model: [params:params,ruleData: ruleData])
		}
	}

	//
	// Edit Copy
	//
	def editRemove = {

		def ruleData = Rule.get(params.id)

		if (!ruleData) {

			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "listr", params:[groupId:params.groupId,groupName:params.groupName])

		}else {

			return [params:params,ruleData: ruleData]
		}
	}

	//
	// update copy
	//
	def updateRemove = {

		log.debug('-- params.id = '+params.id)

		def ruleData = Rule.get(params.id)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')


		if(params.fromSegment?.length()!=3)
			ruleData.errors.rejectValue('fromSegment', 'rule.segment.empty')


		if(ruleData.hasErrors()){
			render(view: "editRemove", model: [params:params,ruleData: ruleData])
			return
		}

		ruleData.properties = params

		if (!ruleData.hasErrors() && ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params:[groupId:params.groupId,groupName:params.groupName])
		}
		else {
			render(view: "editRemove", model: [params:params, ruleData: ruleData])
		}
	}
	
	//
	// Create code
	//
	def createCode = {
		def ruleData = new Rule()
		ruleData.properties = params
		return [params:params,ruleData: ruleData]
	}

	//
	//  Add code rule
	//
	def saveCode = {

		def ruleData = new Rule(params)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.other?.length()<1)
			ruleData.errors.rejectValue('other', 'rule.other.empty')

		if(ruleData.hasErrors()){
			render(view: "createCode", model: [params:params,ruleData: ruleData])
			return
		}

		if (ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id, params:params)
		}
		else {
			render(view: "createCode", model: [params:params,ruleData: ruleData])
		}
	}

	//
	// Edit Code
	//
	def editCode = {

		def ruleData = Rule.get(params.id)

		if (!ruleData) {

			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rule.label', default: 'Rule'), params.id])}"
			redirect(action: "listr", params:[groupId:params.groupId,groupName:params.groupName])

		}else {

			return [params:params,ruleData: ruleData]
		}
	}

	//
	// update Program
	//
	def updateCode = {

		log.debug('-- params.id = '+params.id)

		def ruleData = Rule.get(params.id)

		if(!params.groupId)
			ruleData.errors.rejectValue('groupId','rule.groupid.error')

		if(params.other?.length()<1)
			ruleData.errors.rejectValue('other', 'rule.other.empty')

		if(ruleData.hasErrors()){
			render(view: "editCode", model: [params:params,ruleData: ruleData])
			return
		}

		ruleData.properties = params

		if (!ruleData.hasErrors() && ruleData.save(flush: true)) {
			flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rule.label', default: 'Rule'), ruleData.id])}"
			redirect(action: "show", id: ruleData.id,params:[groupId:params.groupId,groupName:params.groupName])
		}
		else {
			render(view: "editCode", model: [params:params, ruleData: ruleData])
		}
	}



}
