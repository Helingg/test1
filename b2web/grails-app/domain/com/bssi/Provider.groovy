package com.bssi

class Provider {
    String NPI
    String FirstName
    String LastName
    String MiddleName
    Date dateCreated


    static belongsTo = [Client]
    static hasMany = [client:Client]

    static constraints = {
        NPI(size: 0..32,blank: false)
        FirstName(size: 0..64,blank: false)
        LastName(size: 0..64,blank: false)
        MiddleName(size: 0..32)
        dateCreated(dispaly:false)
    }
    static mapping = {
        version false
    }

    String toString(){
        return FirstName+" "+LastName
    }
}
