package org.fyp

class MainController {

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
		users
	}
}
