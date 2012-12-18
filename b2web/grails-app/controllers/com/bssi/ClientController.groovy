package com.bssi
/**
 * Client Controller
 *
 * author: Wang Gang
 */
class ClientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clientDataList: Client.list(sort: "dateCreated",order: "desc"), clientDataTotal: Client.count()]
    }

    def create = {
        def clientData = new Client()
        clientData.properties = params
        return [clientData: clientData]
    }

    def save = {
        def clientData = new Client(params)
        if (clientData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'client.label', default: 'Client'), clientData.name])}"
            redirect(action: "show", id: clientData.id)
        }
        else {
            render(view: "create", model: [clientData: clientData])
        }
    }

    def show = {
        def clientData = Client.get(params.id)
        if (!clientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "list")
        }
        else {
            [clientData: clientData]
        }
    }

    def edit = {
        def clientData = Client.get(params.id)
        if (!clientData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "list")
        }
        else {
            return [clientData: clientData,params: params]
        }
    }

    def update = {
        def clientData = Client.get(params.id)
        if (clientData) {
            if (params.version) {
                def version = params.version.toLong()
                if (clientData.version > version) {
                    
                    clientData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'client.label', default: 'Client')] as Object[], "Another user has updated this Client while you were editing")
                    render(view: "edit", model: [clientData: clientData])
                    return
                }
            }
            clientData.properties = params
            if (!clientData.hasErrors() && clientData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'client.label', default: 'Client'), clientData.name])}"
                redirect(action: "show", id: clientData.id)
            }
            else {
                render(view: "edit", model: [clientData: clientData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clientData = Client.get(params.id)
        if (clientData) {
            try {
                clientData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.name])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'client.label', default: 'Client'), params.id])}"
            redirect(action: "list")
        }
    }
    def search = {
        if(!params.max) params.max=10
        if (!params.offset) params.offset=0
        
        def search ={
            if(params.name){
                like("name","%${params.name}%")
            }
            if (params.provider){
                like("provider","%${params.provider}%")
            }
            if (params.membership){
                eq("membership",params.membership)
            }
            if (params.enabled){
                eq("enabled",Boolean.parseBoolean(params.enabled))
            }
            order("dateCreated","desc")
        }
        def clientList = Client.createCriteria().list(params,search)
        flash.message = "${message(code: 'default.client.number.message', args: [clientList.totalCount])}"
        render(view: "list",model:[clientDataList:clientList,clientDataTotal:clientList.totalCount,params: params])
    }
}
