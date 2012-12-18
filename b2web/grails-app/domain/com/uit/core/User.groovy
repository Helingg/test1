package com.uit.core

class User {

	String username
	String password
	String email
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank:false, nullable:true, email:true
	}

	static mapping = {
		table 'UIT_SYS_USER'
		password column: '`password`'
// ===== SANYO COST SYSTEM VIEW SUPPORT ==========
//		table 'VW_CST_LOGIN'  //database view
//		version false
//	    id generator:'assigned', name:'username'
//		//id composite:['firstName', 'lastName']
//	    cache usage:'read-only'
//		username column: 'USERID'
//		password column: 'PASSWORD'
//		email column: 'MAIL'
//		enabled column: 'ENABLED'
//		accountExpired column: 'EXPIRED'
//		accountLocked column: 'LOCKED'
//		passwordExpired column: 'PWDEXPIRED'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}
}
