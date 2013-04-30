package org.fyp

class AuctionController {

	def index() { }

	def quotesAuctionBidderView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		def messages = displayForumMessages(auction)
		params.messages = messages
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
		// this is not right!
		def currentBids = Bid.listOrderByAmount(order: "asc")
		def currentWinner = currentBids[0]
		System.out.println(currentWinner)
		params.currentWinningBid = currentWinner
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
		// messages
		def messages = displayForumMessages(auction)
		params.messages = messages
	}

	def liveAuctionHostView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		def currentBids = Bid.findAllByAuction(auction)
		params.currentBids = currentBids
	}

	def chooseAuction() {}

	def auctionHome() {
		def auctions = Auction.findAll()
		def currentUser = getCurrentUser()
		// check if a user is logged in
		if(session.user) {
			for(int i = 0; i < auctions.size(); i++) {
				if(auctions[i].host.email == currentUser.email) {
					auctions.remove(auctions[i])
				}
			}
		}
		params.auctions = auctions
	}

	def newQuotesAuction() {
		if(request.method == 'POST') {
			def quotesAuction = new Auction(params)
			def user = session.user
			def bidderEmail = new ArrayList<String>()
			def bids = new ArrayList<Bid>()
			quotesAuction.host = user
			quotesAuction.bidderEmail = bidderEmail
			quotesAuction.bids = bids
			quotesAuction.type = 'Quotes Auction'
			quotesAuction.status = 'announced'
			def auctionForum = new AuctionForum(auction: quotesAuction)
			auctionForum.messages = new ArrayList<ForumMessage>()
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
			//def user = session.user
			def bids = new ArrayList<Bid>()
			liveAuction.host = getCurrentUser()
			liveAuction.bids = bids
			liveAuction.type = 'Live Auction'
			liveAuction.status = 'announced'
			def auctionForum = new AuctionForum(auction: liveAuction)
			auctionForum.messages = new ArrayList<ForumMessage>()
			if (! (liveAuction.save(flush: true) && auctionForum.save(flush: true))) {
				liveAuction.errors.each {
					println it
				}
				auctionForum.errors.each {
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
			def user = getCurrentUser()
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
	
	private getCurrentUser() {
		def currentUser = session.user
		currentUser
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

	private displayForumMessages(auction) {
		def forum = AuctionForum.findByAuction(auction)
		def messages = ForumMessage.findAllByForum(forum)
		messages
	}
}
