package org.fyp

class ForumMessageController {

	def index() { }

	def newForumMessage() {
		if(request.method == 'POST') {
			def forumMessage = new ForumMessage(message: params.message)
			def currentAuction = Auction.get(params.auctionId)
			def currentAuctionForum = AuctionForum.findByAuction(currentAuction)
			def sender = session.user
			forumMessage.forum = currentAuctionForum
			forumMessage.sender = sender
			if (! forumMessage.save()) {
				forumMessage.errors.each {
					println it
				}
				System.out.println('Message was not created')
				return [ForumMessage:forumMessage]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}
}
