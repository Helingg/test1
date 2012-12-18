package com.bssi

/**
 * This domain save all groups for rule
 *
 * author: Wang Gang
 */
class RuleGroup {

	String name
	String type
	String comments

    Date dateCreated 

    static constraints = {

		name(size:0..64)
		type(size:0..3,inList:['ADT','ORU','SIU','ORM', 'DFT', 'MDM'])
		comments(size:0..255)
		
		dateCreated(display:false)
    }
	
	static mapping = {
		version false
	}
	
	
	String toString(){
		return name + ' - ' + type
	}
}
