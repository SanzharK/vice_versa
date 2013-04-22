package org.fyp

class AuctionController {

	def index() { }

	def liveAuctionHost() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		//		def message = new ForumMessage(message: params.message)
		//		def sender = session.user
		//		message.sender = sender
		//		def forum = AuctionForum.findByAuction(auction)
		//		message.forum = forum
		//		forum.messages.add(message)
	}

	def quotesAuctionBidderView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
	}

	def quotesAuctionHostView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		def currentBids = Bid.findAllByAuction(auction)
		params.currentBids = currentBids
	}
	
	def liveAuctionBidderView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		//
		def now = Calendar.instance
		def today = now.time
		def milliseconds = today.time
		def startDateMillis = auction.startDate.time
		//
		def exactDate = auction.endDate.format("yyyy/MM/dd HH/mm/ss")
		System.out.println(exactDate +"---"+ milliseconds +" vs "+startDateMillis)
		params.auctionTime = auction.endDate
		params.exactDate = exactDate
	}
	
	def liveAuctionHostView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
	}

	def chooseAuction() {}

	def auctionHome() {
		def auctions = Auction.findAll()
		params.auctions = auctions
	}

	def newQuotesAuction() {
		if(request.method == 'POST') {
			def quotesAuction = new Auction(params)
			def user = session.user
			def bidderEmail = new ArrayList<String>()
			def bids = []
			quotesAuction.host = user
			quotesAuction.bidderEmail = bidderEmail
			quotesAuction.bids = bids
			quotesAuction.type = 'Quotes Auction'
			quotesAuction.status = 'announced'
			if (! quotesAuction.save(flush: true)) {
				quotesAuction.errors.each {
					println it
				}
				System.out.println('Auction was not created')
				return [auction:quotesAuction]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}

	def newLiveAuction() {
		if(request.method == 'POST') {
			def liveAuction = new Auction(params)
			def user = session.user
			def bidderEmail = new ArrayList<String>()
			def bids = []
			liveAuction.host = user
			liveAuction.bidderEmail = bidderEmail
			liveAuction.bids = bids
			liveAuction.type = 'Live Auction'
			liveAuction.status = 'announced'
			if (! liveAuction.save(flush: true)) {
				liveAuction.errors.each {
					println it
				}
				System.out.println('Auction was not created')
				return [auction:liveAuction]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}

	def newGeneralAuction() { }

	def newAuction = {
		if(request.method == 'POST') {
			def auction = new Auction(title: params.title, description: params.description, startDate: params.startDate, endDate: params.endDate)
			def user = session.user
			def bidders = []
			def bids = []
			auction.host = user
			auction.bidders = bidders
			auction.bids = bids
			def auctionForum = new AuctionForum(auction: auction)
			def auctionForumMessages = ['There are no posts yet']
			auctionForum.messages = auctionForumMessages
			if (! auction.save()) {
				auction.errors.each {
					println it
				}
				System.out.println('Auction was not created')
				return [auction:auction]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}

	def startAuction() {
		def auction = Auction.findById(params.id)
		System.out.println(auction)
		auction.status = 'started'
		if (! auction.save()) {
			auction.errors.each {
				println it
			}
			System.out.println('Auction was not changed')
			return [auction:auction]
		} else {
			redirect(controller:'user', action:'myPage')
		}
	}

	private findAuction() {
		def auctions = Auction.findAll() {

		}
		auctions
	}
	
	private getExactTimeAndDate(Auction auction) {
		def startDate = auction.startDate
		def exactDate = startDate.format("yyyy/mm/dd hh/mm/ss")
		def endDate = auction.endDate
	}
}
