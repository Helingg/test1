package com.bssi

/**
 * This domain save all recipients for BEE Engine v2.0
 *
 * author: Wang Gang
 */
class Recipient {

	String name
	String membership
	String ip
	int port
	String other	
	boolean enabled = true
	Date dateCreated
	
	static constraints = {
		name(nullable:false,size:0..64)
        membership(inList:['Trial','Formal'])
		ip(size:0..32)
		port(size:0..8)
		other(size:0..128)
		enabled(boolean:true)
		dateCreated(display:false)
	}

	static mapping = {
		version false
	}
	
	String toString(){
		return name
	}
}
