package org.fyp

import org.fyp.Service

@Grab(group='com.gmongo', module='gmongo', version='1.0')
import com.gmongo.GMongo


class UserController {

	def mongo = new GMongo("127.0.0.1", 27017)
	def db = mongo.getDB("gmongo")

	def index = {
		def services = displayServices()
		return [ services: services ]
	}

	def register = {
		// new user posts his registration details
		if (request.method == 'POST') {
			// create domain object and assign parameters using data binding
			def u = new User(params)
			def connections = ['']
			u.connections = connections
			//u.passwordHashed = u.password.encodeAsPassword()
			if (! u.save()) {
				// validation failed, render registration page again
				return [user:u]
			} else {
				// validate/save ok, store user in session, redirect to homepage
				session.user = u
				redirect(controller:'main', action:'homepage')
			}
		} else if (session.user) {
			// don't allow registration while user is logged in
			redirect(controller:'main')
		}
	}

	def login = {
		if (request.method == 'POST') {
			//def passwordHashed = params.password.encodeAsPassword()
			def u = User.findByEmailAndConfirm(params.email, params.password)
			if (u) {
				// username and password match -> log in
				session.user = u
				redirect(controller:'main', action:'homepage')
			} else {
				flash.message = "User not found"
				redirect(controller:'main', action:'homepage')
			}
		} else if (session.user) {
			// don't allow login while user is logged in
			redirect(controller:'main')
		}
	}

	def logout = {
		session.invalidate()
		redirect(controller:'main', action:'homepage')
	}

	def myPage() {
		def services = displayServices()
		params.services = services
		def products = displayProducts()
		params.products = products
		def amountOfServices = services.size()
		params.amountOfServices = amountOfServices
		def createdAuctions = displayCreatedAuctions()
		params.createdAuctions = createdAuctions
	}

	def show() {
		def user = User.findById(params.id)
		params.searchedUser = user
		def products = Product.findAllByUser(user)
		params.products = products
		def services = Service.findAllByUser(user)
		params.services = services
	}

	def addConnection() {
		def requestedUser = User.findById(params.id)
		def currentUser = session.user
		currentUser.connections.add(requestedUser.companyName)
		currentUser.save()
		redirect(controller:'user', action:'myPage')
	}

	def message() {
		def currentUser = session.user
		params.connections = currentUser.connections
	}

	def connect() {
		def currentUser = session.user
		def exsConnection = currentUser.connections;
		def revisedExsConnections = [];
		for(int i = 1; i < exsConnection.size(); i++) {
			revisedExsConnections.add(exsConnection[i])
		}
		params.existingConnections = revisedExsConnections
		def possibleConnections = User.findAll()
		def existingConnections = currentUser.connections
		def revisedConnectionList = [];
		for(int i = 0; i < possibleConnections.size(); i++) {
			if(possibleConnections[i].companyName != currentUser.companyName)
				for(int z = 1; z < existingConnections.size(); z++) {
					if(existingConnections[z] !=  possibleConnections[i].companyName)
						revisedConnectionList.add(possibleConnections[i]);
				}
		}
		params.possibleConnections = revisedConnectionList
	}

	def proposal() {}

	private displayServices() {
		def u = session.user
		def services = Service.findAllByUser(u) {
		}
		services
	}

	private displayProducts() {
		def u = session.user
		def products = Product.findAllByUser(u) {
		}
		products
	}

	private displayCreatedAuctions() {
		def u = session.user
		def createdAuctions = Auction.findAllByHost(u) {

		}
		createdAuctions
	}

}