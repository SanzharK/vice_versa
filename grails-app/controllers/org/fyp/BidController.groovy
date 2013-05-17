package org.fyp

class BidController {
	
	def index() { }
	
	def show() {
		def currentBid = Bid.get(params.id)
		def host = session.user
		def currentTender = currentBid.auction
		
		if(currentBid.products[0]) {
			def product = Product.findById(currentBid.products[0])
			params.product = product
		}
		if(currentBid.services[0]) {
			def service = Service.findById(currentBid.services[0])
			params.service = service
		}
		params.bid = currentBid
		params.host = host
		params.tender = currentTender
	}

	def newBid() {
		if(request.method == 'POST') {
			System.out.println('code executed')
			def bid = new Bid(params)
			def user = session.user
			bid.bidder = user
			def auction = Auction.get(params.auctionId)
			bid.auction = auction
			bid.currency = params.currency
			bid.services = []
			bid.products = []
			if(params.service != 'null') {
				//def service = Service.findByTitle(params.service)
				bid.services << params.service
			}
			if(params.product != 'null') {
				//def product = Product.findByTitle(params.product)
				bid.products << params.product
			}
			if (! bid.save(flush: true)) {
				bid.errors.each {
					println it
				}
				System.out.println('Bid was not created')
				return [bid:bid]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}
}
