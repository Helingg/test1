package com.bssi

class ProviderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        if(!params.offset)params.offset=0
        def str ="select p.id,p.NPI,c.name,p.firstName,p.lastName,p.middleName,p.dateCreated from Provider p,Client c where p.client=c.id  order by p.dateCreated desc "
        def providerDataList = Provider.executeQuery(str,[max: params.max,offset: params.offset])
        def providerDataList1 = Provider.executeQuery(str)
        [providerDataList: providerDataList, providerDataTotal: providerDataList1.size()]
    }

    def create = {
        def providerData = new Provider()
        providerData.properties = params
        return [providerData: providerData]
    }

    def save = {
        def providerData = new Provider(params)
        if (providerData.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'provider.label', default: 'Provider'), providerData.id])}"
            redirect(action: "show", id: providerData.id)
        }
        else {
            render(view: "create", model: [providerData: providerData])
        }
    }

    def show = {
        def providerData = Provider.get(params.id)
        if (!providerData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "list")
        }
        else {
            [providerData: providerData]
        }
    }

    def edit = {
        def providerData = Provider.get(params.id)
        if (!providerData) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [providerData: providerData]
        }
    }

    def update = {
        def providerData = Provider.get(params.id)
        if (providerData) {
            if (params.version) {
                def version = params.version.toLong()
                if (providerData.version > version) {

                    providerData.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'provider.label', default: 'Provider')] as Object[], "Another user has updated this Provider while you were editing")
                    render(view: "edit", model: [providerData: providerData])
                    return
                }
            }
            providerData.properties = params
            if (!providerData.hasErrors() && providerData.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'provider.label', default: 'Provider'), providerData.id])}"
                redirect(action: "show", id: providerData.id)
            }
            else {
                render(view: "edit", model: [providerData: providerData])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def providerData = Provider.get(params.id)
        if (providerData) {
            try {
                providerData.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'provider.label', default: 'Provider'), params.id])}"
            redirect(action: "list")
        }
    }
    def search = {
        if(!params.max)params.max=10
        if(!params.offset)params.offset=0

        def str ="select p.id,p.NPI,c.name,p.firstName,p.lastName,p.middleName,p.dateCreated from Provider p,Client c where p.client=c.id "
        if (params.NPI){
            str = str + " and p.NPI like '%${params.NPI}%'"
        }
        if (params.client){
            str = str + " and c.name like '%${params.client}%'"
        }
        if (params.firstName){
            str = str + " and p.firstName like '%${params.firstName}%'"
        }
        if (params.lastName){
            str = str + " and p.lastName like '%${params.lastName}%'"
        }
        str =str+ " order by p.dateCreated desc "
        def providerDataList = Provider.executeQuery(str,[max:params.max,offset:params.offset])
        def providerDataList1 = Provider.executeQuery(str)

        flash.message = "${message(code: 'default.provider.number.message', args: [providerDataList1.size()])}"

        render(view: "list",model: [providerDataList:providerDataList,providerDataTotal:providerDataList1.size(),params: params])

    }
}
