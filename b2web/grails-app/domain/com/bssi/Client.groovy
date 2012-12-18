package com.bssi

/**
 * This domain save all clients for BEE Engine v2.0
 *
 * author: Wang Gang
 *
 * date: 3/23/2012
 */
class Client {
	
	String name
	String alias

//    String type    //FTP SFTP TCP
//    String facility    // sending facility
    String application // sending application
//	String provider    // provider content
	//Attending Doctor  PV1:    ID^Last^First^Middle   ADT / ORU
	//Ordering provider OBR-16: ID^Last^First^Middle   ORU
	
	String membership   // Trial / Formal
	
	boolean enabled = true
	
	Date dateCreated
	
	static constraints = {
		
		name(nullable:false,size:0..64,blank:false)
		alias(size:0..16)
//      type(size: 0..8,inList: ["TCP","FTP","SFTP"])
//		facility(size:0..180)
		application(size:0..180)
//		provider(size:0..64)

        membership(inList:['Trial','Formal'])
			
		enabled(boolean:true)
		
		dateCreated(display:false)
	}

	static hasMany = [provider:Provider]


    static mapping = {
		version false
	}

	String toString(){
		return name
	}
}
