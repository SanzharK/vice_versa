package org.fyp

class AuctionController {

    def index() { }
	
	def newAuction = {
		if(request.method == 'POST') {
			def auction = new Auction(title: params.title, description: params.description, startDate: params.startDate, endDate: params.endDate)
			def user = session.user
			auction.host = user
			//service.user_id = session.user.id
			if (! auction.save()) {
				// validation failed, render registration page again
				return [auction:auction]
			} else {
				// validate/save ok, store user in session, redirect to homepage
			redirect(controller:'main', action:'homepage')
			}
		}
	}
}
