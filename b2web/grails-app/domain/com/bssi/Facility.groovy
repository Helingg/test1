package com.bssi
/**
 * This class connect among client
 *
 * auther:hlg
 *
 * date 3/26/2012
 *
 */

class Facility {

    String name
    String comment

    static constraints = {
        name(size: 0..64,blank: false)
        comment(size: 0..128)
    }
    static belongsTo = [client:Client]
    static mapping = {
        version false
    }

}
