package org.fyp

class BidController {

	def index() { }

	def newBid() {
		if(request.method == 'POST') {
			System.out.println('code executed')
			def bid = new Bid(params)
			def user = session.user
			bid.bidder = user
			def auction = Auction.get(params.auctionId)
			bid.auction = auction
			auction.bids.add(bid)
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
