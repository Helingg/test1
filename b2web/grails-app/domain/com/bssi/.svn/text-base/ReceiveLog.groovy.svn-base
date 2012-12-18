package com.bssi

/**
 * This domain will log all incoming messages include msg id and time.
 *
 * author: Wang Gang
 */
class ReceiveLog {
	
	String msgCtrlId
	String remoteIp
	
	Date receiveTime
	
	Date dateCreated
	
	
	static constraints = {
		msgCtrlId(size:0..20)
		remoteIp(size:0..128)
		receiveTime()
		
		dateCreated(display:false)
	}
	
	static mapping = {
		version false
	}
}

