package com.bssi

/**
 * This domain log all the messages sent out
 *
 * author: Wang Gang
 *
 * change by hlg
 *
 * 3/26/2012
 *
 * static belongsTo=[client:Client,receiveClient:Client]
 */
class SendLog {
	
	String msgCtrlId
	String ack
	String message
	Date sentTime
	
	Date dateCreated
	
	static belongsTo=[client:Client,receiveClient:Client]
	
	static constraints = {
		msgCtrlId(nullable:false,size:0..20)
		ack(size:0..2048)
		message(size:0..128*1024)
		
		sentTime()			
		dateCreated(dispaly:false)
		
//		recipient()
	}
	
	static mapping = {
		version false
	}
	
}
