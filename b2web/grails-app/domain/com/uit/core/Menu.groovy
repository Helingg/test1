package com.uit.core


class Menu {
	
	Menu parent 
	
	String displayName	
	int displayOrder
	String description
	String linkController
	String linkAction	
	String icon
	
	boolean enabled = true
	
	boolean visible = true
		
	Date dateCreated
	

    static constraints = {
		parent() 
		displayName(blank:false,nullable:false,size:0..128)
		description(blank:true,nullable:true,size:0..196)
		icon(size:0..196)
		displayOrder(min:0,max:32)
		linkController(size:0..192)
		linkAction(blank:false,nullable:false,size:0..196)
		enabled(blank:false,nullable:false,boolean:true)
		visible(blank:false,nullable:false,boolean:true)
    }
	
	static mapping = {
		
		table 'UIT_SYS_MENU'
		
		cache true
	}
	
	String toString(){
		return displayName
	}
}
