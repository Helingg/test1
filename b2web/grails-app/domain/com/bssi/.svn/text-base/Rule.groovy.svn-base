package com.bssi

/**
 * This domain save all the Rules for BEE Engine v2.0
 *
 * author: Wang Gang
 */

class Rule {
	
	long groupId
	
	String operator
	
	String fromSegment
	int fromIndex = 0
	int fromSubIndex = 0
	
	String toSegment
	int toIndex = 0
	int toSubIndex = 0
	
	// value
	String value
	// extension field
	String other
	
	String comments
	
	Date dateCreated
	

    static constraints = {
		
		groupId nullable:false
		operator nullable:false,size:0..16
		
		fromSegment nullable:true,size:0..3
		fromIndex min:0
		fromSubIndex min:0
		
		toSegment nullable:true,size:0..3
		toIndex min:0
		toSubIndex  min:0
		
		value nullable:true,size:0..256		
		other nullable:true,size:0..1024
		comments nullable:true,size:0..256
		
		dateCreated display:false
    }
	
	static mapping = {
		version false
	}
}
