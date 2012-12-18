package com.bssi

/**
 * Bridge Controller
 *
 * author: Wang Gang
 */
class BridgeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if (!params.offset)params.offset=0
        def str = "select b.id,c.name,r.name,ru.name,ru.type,b.dateCreated,b.bridgeName from Bridge b,Client c,Recipient r,RuleGroup ru where b.client=c.id and "+
                " b.recipient=r.id and b.ruleGroup = ru.id order by b.dateCreated desc "
        def  bridgeDataList= Bridge.executeQuery(str,[offset:params.offset,max:params.max])
        def  bridgeDataList1=Bridge.executeQuery(str)

        [bridgeDataList: bridgeDataList, bridgeDataTotal: bridgeDataList1.size()]
    }

    def create = {
        def bridgeData = new Bridge()
        bridgeData.properties = params
        return [bridgeData: bridgeData]
    }

    def save = {
        def bridgeData = new Bridge(params)
        if (bridgeData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'bridge.label', default: 'Bridge'), bridgeData.bridgeName])}"
            redirect(action: "show", id: bridgeData.id)
        }
        else {
            render(view: "create", model: [bridgeData: bridgeData,params:params])
        }
    }

    def show = {
        def bridgeData = Bridge.get(params.id)
        if (!bridgeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bridgeData: bridgeData]
        }
    }

    def edit = {
        def bridgeData = Bridge.get(params.id)
        if (!bridgeData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bridgeData: bridgeData]
        }
    }

    def update = {
        def bridgeData = Bridge.get(params.id)
        if (bridgeData) {
            if (params.version) {
                def version = params.version.toLong()
                if (bridgeData.version > version) {
                    
                    bridgeData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'bridge.label', default: 'Bridge')] as Object[], "Another user has updated this Bridge while you were editing")
                    render(view: "edit", model: [bridgeData: bridgeData])
                    return
                }
            }
            bridgeData.properties = params
            if (!bridgeData.hasErrors() && bridgeData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'bridge.label', default: 'Bridge'), bridgeData.id])}"
                redirect(action: "show", id: bridgeData.id)
            }
            else {
                render(view: "edit", model: [bridgeData: bridgeData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bridgeData = Bridge.get(params.id)
        if (bridgeData) {
            try {
                bridgeData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'bridge.label', default: 'Bridge'), params.id])}"
            redirect(action: "list")
        }
    }
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

        def str = "select b.id,c.name,r.name,ru.name,ru.type,b.dateCreated,b.bridgeName from Bridge b,Client c,Recipient r,RuleGroup ru where b.client=c.id and b.recipient=r.id and b.ruleGroup = ru.id "
        if (params.client){
            str =str +"and c.name like '%${params.client}%'"
        }
        if (params.recipient){
            str = str+ " and r.name like '%${params.recipient}%'"
        }
        if (params.ruleGroup){
            str = str+ " and (ru.name like '%${params.ruleGroup}%' or ru.type like '%${params.ruleGroup}%')"
        }


//        if (params.lowDate){
//            str = str +" and b.dateCreated >='"+lowDateStr+"'"
//        }
//        if (params.highDate){
//            str = str +" and b.dateCreated <='"+highDateStr+"'"
//        }

        str = str + " order by b.dateCreated desc"
        
        def  bridgeDataList= Bridge.executeQuery(str,[offset:params.offset,max:params.max])
        def  bridgeDataList1=Bridge.executeQuery(str)
        flash.message = "${message(code: 'default.bridge.number.message', args: [bridgeDataList1.size()])}"

        render(view: "list",model: [bridgeDataList:bridgeDataList,bridgeDataTotal: bridgeDataList1.size(),params: params])
        
    }
}
