package com.bssi
/**
 * This class connect among client
 *
 * auther: hlg
 *
 * date 3/26/2012
 */
class SendInfo {
    String type
    String ip
    int port
    String user
    String password
    String other
    boolean enabled = false
    Date dateCreated

    static constraints = {
        type(size: 0..8,inList: ["TCP","SFTP"])
        ip(size:0..128,blank: false)
        port(size:0..8,blank:false)
        user(size: 0..64)
        password(size: 0..64)
        other(size:0..128)
        enabled(nullable:false,boolean:true)
        dateCreated(display:false)
    }
    static belongsTo = [client:Client]

    static mapping = {
        version false
    }

}
