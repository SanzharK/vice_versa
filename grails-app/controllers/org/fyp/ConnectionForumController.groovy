package org.fyp

class ConnectionForumController {

    def index() { }
	
	def connectionForum() { 
		def currentForum = ConnectionForum.findById(params.id)
		params.currentForum = currentForum
		def messages = displayForumMessages(currentForum)
		params.messages = messages
		System.out.println(params.messages)
	}
	
	private displayForumMessages(forum) {
		def messages = ConnectionMessages.findAllByForum(forum)
		messages
	}
}
