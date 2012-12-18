package com.bssi
/**
 * Recipient Controller
 *
 * author: Wang Gang
 */
class RecipientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [recipientDataList: Recipient.list(sort: "dateCreated",order: "desc"), recipientDataTotal: Recipient.count()]
    }

    def create = {
        def recipientData = new Recipient()
        recipientData.properties = params
        return [recipientData: recipientData]
    }

    def save = {
        def recipientData = new Recipient(params)
        if (recipientData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'recipient.label', default: 'Recipient'), recipientData.name])}"
            redirect(action: "show", id: recipientData.id)
        }
        else {
            render(view: "create", model: [recipientData: recipientData])
        }
    }

    def show = {
        def recipientData = Recipient.get(params.id)
        if (!recipientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
            redirect(action: "list")
        }
        else {
            [recipientData: recipientData]
        }
    }

    def edit = {
        def recipientData = Recipient.get(params.id)
        if (!recipientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
            redirect(action: "list")
        }
        else {
            return [recipientData: recipientData]
        }
    }

    def update = {
        def recipientData = Recipient.get(params.id)
        if (recipientData) {
            if (params.version) {
                def version = params.version.toLong()
                if (recipientData.version > version) {
                    
                    recipientData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'recipient.label', default: 'Recipient')] as Object[], "Another user has updated this Recipient while you were editing")
                    render(view: "edit", model: [recipientData: recipientData])
                    return
                }
            }
            recipientData.properties = params
            if (!recipientData.hasErrors() && recipientData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'recipient.label', default: 'Recipient'), recipientData.name])}"
                redirect(action: "show", id: recipientData.id)
            }
            else {
                render(view: "edit", model: [recipientData: recipientData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def recipientData = Recipient.get(params.id)
        if (recipientData) {
            try {
                recipientData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'recipient.label', default: 'Recipient'), params.name])}"
            redirect(action: "list")
        }
    }
    
    def search = {
        if(!params.max) params.max=10
        if(!params.offset) params.offset=0
        
        def search={
            if(params.name){
                like("name","%${params.name}%")
            }
            if(params.ip){
                like("ip","%${params.ip}%")
            }
            if (params.membership){
                eq("membership",params.membership)
            }
            if (params.enabled){
                eq("enabled",Boolean.parseBoolean(params.enabled))
            }
            order("dateCreated","desc")
        }
        
        def recipientList = Recipient.createCriteria().list(params,search)
        flash.message = "${message(code: 'default.recipient.number.message', args: [recipientList.totalCount])}"
        
        render(view: "list",model: [recipientDataList:recipientList,recipientDataTotal:recipientList.totalCount,params: params])
    }
}
