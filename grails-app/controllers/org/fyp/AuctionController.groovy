package org.fyp

//import javax.swing.text.Document
import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.jsoup.select.Elements


class AuctionController {

	def index() { }
	
	def tendoraGenius() {
		def tenderTitle = params.title
		def tenderCategory = params.category
		def tenderCurrency = params.currency
		def tenderDescription = params.description
		
		@Grapes( @Grab('org.jsoup:jsoup:1.6.1'))
		Document doc = Jsoup.connect("http://www.huntoffice.ie/basic-office-tables.html").get();
		def results = doc.select("table.new-products-list td.product")
		params.results = results
		
		Document docIkea = Jsoup.connect("http://www.ikea.com/us/en/catalog/categories/departments/workspaces/20651/?filter=online").get();
		def resultsIkea = doc.select("div.productLists")
		params.resultsIke = resultsIkea
	}

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
		def currentBids = Bid.findAllByAuction(auction, [sort:"amount", order:"asc"])
		def currentWinner = currentBids[0]
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
		
		def services = Service.findAllByUser(session.user)
		System.out.println(services)
		params.services = services
		def products = Product.findAllByUser(session.user)
		params.products = products
	}

	def liveAuctionHostView() {
		def auction = Auction.findById(params.id)
		params.currentAuction = auction
		def currentBids = Bid.findAllByAuction(auction)
		params.currentBids = currentBids
		def exactDate = auction.endDate.format("yyyy/MM/dd HH/mm/ss")
		params.exactDate = exactDate
		def messages = displayForumMessages(auction)
		params.messages = messages
	}

	def chooseAuction() {}

	def auctionHome() {
		def liveAuctions = Auction.findAllByType('Live Auction')
		def quotesAuctions = Auction.findAllByType('Quotes Auction')
		def generalAuctions = Auction.findAllByType('General Auction')
		def currentUser = getCurrentUser()
		// check if a user is logged in and then delete him from the list of tenders displayed
		if(session.user) {
			for(int i = 0; i < liveAuctions.size(); i++) {
				if(liveAuctions[i].host.email == currentUser.email) {
					liveAuctions.remove(liveAuctions[i])
				}
			}
			params.liveAuctions = liveAuctions
			for(int i = 0; i < quotesAuctions.size(); i++) {
				if(quotesAuctions[i].host.email == currentUser.email) {
					quotesAuctions.remove(quotesAuctions[i])
				}
			}
			params.quotesAuctions = quotesAuctions
			for(int i = 0; i < generalAuctions.size(); i++) {
				if(generalAuctions[i].host.email == currentUser.email) {
					generalAuctions.remove(generalAuctions[i])
				}
			}
			params.generalAuctions = generalAuctions
		}
	}

	def newQuotesAuction() {
		if(request.method == 'POST') {
			def quotesAuction = new Auction(params)
			def user = getCurrentUser()
			def bids = new ArrayList<Bid>()
			quotesAuction.host = user
			quotesAuction.bids = bids
			quotesAuction.type = 'Quotes Auction'
			quotesAuction.status = 'announced'
			def auctionForum = new AuctionForum(auction: quotesAuction)
			auctionForum.messages = new ArrayList<ForumMessage>()
			if (! (quotesAuction.save(flush: true) && auctionForum.save(flush: true))) {
				quotesAuction.errors.each {
					println it
				}
				auctionForum.errors.each {
					println it
				}
				System.out.println('Auction was not created')
				return [auction:quotesAuction]
			} else {
				sendMail {
					to "tweet@tweetymail.com"
					subject ""
					body "New Quotes Tender was created on #tendora by " + quotesAuction.host.companyName + "! #tendora_" + params.category
				}
				redirect(controller:'user', action:'myPage')
			}
		}
	}

	def newLiveAuction() {
		if(request.method == 'POST') {
			def liveAuction = new Auction(params)
			//def user = session.user
			liveAuction.host = getCurrentUser()
			liveAuction.bids = []
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
				sendMail {
					to "tweet@tweetymail.com"
					subject ""
					body "New Live Tender was created on #tendora by " + liveAuction.host.companyName + "! #tendora_" + params.category
				}
				redirect(controller:'user', action:'myPage')
			}
		}
	}

	def newGeneralAuction() { }

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
