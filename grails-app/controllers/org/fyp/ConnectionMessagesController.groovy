package org.fyp

class ConnectionMessagesController {

    def index() { }
	
	def newConnectionMessages() {
		if(request.method == 'POST') {
			def forumMessage = new ConnectionMessages(message: params.message)
			def currentForum = ConnectionForum.findById(params.forumId)
			def sender = session.user
			forumMessage.forum = currentForum
			forumMessage.sender = sender
			if (! forumMessage.save()) {
				forumMessage.errors.each {
					println it
				}
				System.out.println('Message was not created')
				return [ConnectionMessages:forumMessage]
			} else {
				redirect(controller:'user', action:'myPage')
			}
		}
	}
}
