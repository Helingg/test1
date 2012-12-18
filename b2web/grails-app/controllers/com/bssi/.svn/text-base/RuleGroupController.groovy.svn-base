package com.bssi
/**
 * Rule Group Controller
 *
 * author: Wang Gang
 */
class RuleGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ruleGroupDataList: RuleGroup.list(sort:"dateCreated",order: "desc"), ruleGroupDataTotal: RuleGroup.count()]
    }

    def create = {
        def ruleGroupData = new RuleGroup()
        ruleGroupData.properties = params
        return [ruleGroupData: ruleGroupData]
    }

    def save = {
        def ruleGroupData = new RuleGroup(params)
        if (ruleGroupData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), ruleGroupData.name])}"
            redirect(action: "show", id: ruleGroupData.id)
        }
        else {
            render(view: "create", model: [ruleGroupData: ruleGroupData])
        }
    }

    def show = {
        def ruleGroupData = RuleGroup.get(params.id)
        if (!ruleGroupData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
            redirect(action: "list")
        }
        else {
            [ruleGroupData: ruleGroupData]
        }
    }

    def edit = {
        def ruleGroupData = RuleGroup.get(params.id)
        if (!ruleGroupData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
            redirect(action: "list")
        }
        else {
            return [ruleGroupData: ruleGroupData]
        }
    }

    def update = {
        def ruleGroupData = RuleGroup.get(params.id)
        if (ruleGroupData) {
            if (params.version) {
                def version = params.version.toLong()
                if (ruleGroupData.version > version) {
                    
                    ruleGroupData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ruleGroup.label', default: 'RuleGroup')] as Object[], "Another user has updated this RuleGroup while you were editing")
                    render(view: "edit", model: [ruleGroupData: ruleGroupData])
                    return
                }
            }
            ruleGroupData.properties = params
            if (!ruleGroupData.hasErrors() && ruleGroupData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), ruleGroupData.name])}"
                redirect(action: "show", id: ruleGroupData.id)
            }
            else {
                render(view: "edit", model: [ruleGroupData: ruleGroupData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ruleGroupData = RuleGroup.get(params.id)
        if (ruleGroupData) {
            try {
                ruleGroupData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ruleGroup.label', default: 'RuleGroup'), params.name])}"
            redirect(action: "list")
        }
    }
    
    def search = {
        if(!params.max) params.max=10
        if(!params.offset) params.offset=0
        
        def search = {
            if(params.name){
                like("name","%${params.name}%")
            }
            if (params.type){
                eq("type",params.type)
            }
            order("dateCreated", "desc")
        }
        
        def  ruleGroupDataList = RuleGroup.createCriteria().list(params,search)
        flash.message = "${message(code: 'default.rulegroup.number.message', args: [ruleGroupDataList.totalCount])}"
        render(view: "list",model: [ ruleGroupDataList:ruleGroupDataList,ruleGroupDataTotal: ruleGroupDataList.totalCount,params: params ])
    }
}
