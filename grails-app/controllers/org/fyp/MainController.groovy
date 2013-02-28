package org.fyp

import grails.plugins.springsecurity.SpringSecurityService

class MainController {
	
	SpringSecurityService springSecurityService

    def index() { }
	
	def homepage() { }
	
	def contactUs() {}
	
	def search() {
		def users = displayAllUsers()
		params.users = users
	}
	
	private displayAllUsers() {
		def users = User.findAll() {
			order 'companyName', 'asc'
		}
//		def currentUser = session.user
//		def us = users.minus(currentUser)
//		System.out.println(currentUser)
//		System.out.println(us)
//		us
		users
	}
	
	private lookupUser() {
		User.get(springSecurityService.currentUser)
	}
}
