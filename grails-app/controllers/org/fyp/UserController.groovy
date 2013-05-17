package org.fyp

import java.math.MathContext
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
			def connections = new ArrayList<String>()
			u.connections = connections
			//def receiver = params.email --> creating fake emails
			sendMail {
				to 'sanzhar@hotmail.de'
				subject "Congratulations on your Registration with Tendora!"
				body "Welcome to Tendora! We hope you will enjoy our web site!"
			}
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
				redirect(controller:'user', action:'myPage')
			} else {
				flash.message = "User not found"
				redirect(controller:'main', action:'homepage')
			}
		} else if (session.user) {
			// don't allow login while user is logged in
			redirect(controller:'main', action:'homepage')
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
		params.liveAuctions = displayLiveAuctions()
		params.quotesAuctions = displayQuotesAuctions()
		params.generalAuctions = displayGeneralAuctions()
	}

	def show() {
		def searchedUser = User.findByCompanyName(params.id)
		params.searchedUser = searchedUser
		def products = Product.findAllByUser(searchedUser)
		params.products = products
		def services = Service.findAllByUser(searchedUser)
		params.services = services
		def reviews = Review.findAllByReviewdCompany(searchedUser)
		params.reviews = reviews
		double totalRating;
		for(int i=0; i < reviews.size(); i++) {
			totalRating += reviews[i].rating
		}
		double average = totalRating / reviews.size() * 2
		average = doubleRoundHalfUp(average, 0) / 2
		params.average = average
	}

	def addConnection() {
		def requestedUser = User.findById(params.id)
		def currentUser = session.user
		currentUser.connections.add(requestedUser.companyName)
		requestedUser.connections.add(currentUser.companyName)
		currentUser.save()
		requestedUser.save()
		def connectionForum = new ConnectionForum()
		connectionForum.participants = new ArrayList<String>()
		connectionForum.participants.add(currentUser.companyName)
		connectionForum.participants.add(requestedUser.companyName)
		connectionForum.messages = new ArrayList<ConnectionMessages>()
		connectionForum.save()
		redirect(controller:'user', action:'myPage')
	}

	def message() {
		def currentUser = session.user
		params.connections = currentUser.connections
		def connections = currentUser.connections
		def connectionForums = ConnectionForum.findAllByParticipants(currentUser.companyName)
		def revisedConnectionForums = []
		for(int i =0; i < connections.size(); i++) {
			for(int z = 0; z< connectionForums.size(); z++) {
				for(int x = 0; x<2; x++) {
					if(connections[i].equals(connectionForums[z].participants[x])) {
						revisedConnectionForums.add(connectionForums[z])
					}
				}
			}
		}
		System.out.println(revisedConnectionForums)
		params.connectionForums = revisedConnectionForums
	}

	def connect() {
		def currentUser = session.user
		// defined existing connections
		def exsConnection = currentUser.connections;
		params.existingConnections = exsConnection
		// all users in the db are possible connections
		def possibleConnections = User.findAll()
		def revisedConnectionList = [];
		// eliminate currently logged in company
		for(int i = 0; i < possibleConnections.size(); i++) {
			if(possibleConnections[i].companyName != currentUser.companyName)
				revisedConnectionList.add(possibleConnections[i]);
		}
		//need to check if possible connections are already connected to user
		def availableCompanies = [];
		if(exsConnection != []) {
			for(int z = 0; z < revisedConnectionList.size(); z++) {
				def matchedCounter = 0
				for(int x = 0; x < exsConnection.size(); x++) {
					if(revisedConnectionList[z].companyName == exsConnection[x]) {
						matchedCounter++;
					}
				}
				if(matchedCounter == 0) {
					availableCompanies.add(revisedConnectionList[z])
				}
			}
		}
		else {
			availableCompanies = revisedConnectionList
		}
		params.possibleConnections = availableCompanies
	}

	def proposal() {}
	
	def rate () {
		if(request.method == 'POST') {
			def review = new Review()
			review.reviewdCompany = User.findByCompanyName(params.ratedCompany)
			review.reviewer = session.user
			review.comment = params.comment
			review.rating = params.ratingInt as double
			System.out.println(params.ratingInt)
			if (!review.save(flush: true)) {
				review.errors.each {
					println it
				}
				System.out.println('Review was not created')
				return [review:review]
			} else {
				redirect(controller:'user', action:'connect')
			}
		}
	}

	private displayServices() {
		def u = User.findById(session.user.id)
		def services = Service.findAllByUser(u) {
		}
		services
	}

	private displayProducts() {
		def u = User.findById(session.user.id)
		def products = Product.findAllByUser(u) {
		}
		products
	}

	private displayLiveAuctions() {
		def u = session.user
		def live = 'Live Auction'
		//if(Auction.exists()) { //--> needs to be uncommented when a database is dropped.
			def liveAuctions = Auction.findAllByHostAndType(u, live) {

			}
			liveAuctions
		//}
	}

	private displayQuotesAuctions() {
		def u = session.user
		def quotes = 'Quotes Auction'
	//	if(Auction.exists() == true) {
			def quotesAuctions = Auction.findAllByHostAndType(u, quotes) {

			}
			quotesAuctions
	//	}
	}

	private displayGeneralAuctions() {
		def u = session.user
		def general = 'General Auction'
		if(Auction.exists()) {
			def generalAuctions = Auction.findAllByHostAndType(u, general) {

			}
			generalAuctions
		}
	}
	
	def doubleRoundHalfUp = { x, p ->
		BigDecimal bd = new BigDecimal(String.valueOf(x))
		BigDecimal bdRounded = bd.setScale(p , BigDecimal.ROUND_HALF_UP)
		return bdRounded.doubleValue()
	}

}