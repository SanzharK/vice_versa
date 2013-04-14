package org.fyp

import java.util.Date;
import java.util.List;

class User {

	transient springSecurityService
	
	static mapWith = "mongo"
//	boolean passwordExpired

	// time stamps: automatically populated by GORM
	Date dateCreated
	Date lastUpdated

	// properties
	
	//company
	String companyName
	String phone
	String addressLine1
	String addressLine2
	String city
	String country
	
	//representative
	String firstName
	String lastName
	String email
	String password
	String confirm
	//String username = email
	List<String> connections
	//String status
	//String areaOfBusiness
	
	static constraints = {
		email blank: false, unique: true
		//areaOfBusiness(inList: ["Information Technology", "Logistics", "PR & Advertising"])
		//password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		UserAuthority.findAllByUser(this).collect { it.authority } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
