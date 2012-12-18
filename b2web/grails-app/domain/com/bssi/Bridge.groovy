package com.bssi

/**
 * This class connect among client, recipient and rule group
 *
 * auther: Wang Gang
 *
 * change by hlg
 *
 * date 3/26/2012
 *
 * static belongsTo=[client:Client,ruleGroup:RuleGroup] -> static belongsTo=[client:Client,receiveClient:Client,ruleGroup:RuleGroup]
 */
class Bridge {
	
	//long clientId
	//long recipientId
	//long groupId
    String bridgeName

	static belongsTo=[client:Client,receiveClient:Client,ruleGroup:RuleGroup]
	
	Date dateCreated
	
	static constraints = {
		//clientId(nullable:false,size:0..20)
		//recipientId(nullable:false,size:0..20)
		//groupId(nullable:false,size:0..20)
        bridgeName(size: 0..32)
		dateCreated(display:false)
	}
	
	static mapping = {
		version false
	}
}