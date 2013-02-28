package org.fyp

class ServiceController {

    def springSecurityService
	
    def index() { }
	
	def newService = {
		if(request.method == 'POST') {
			def service = new Service(title: params.title, description: params.description)
			def user = session.user
			service.user = user
			//service.user_id = session.user.id
			if (! service.save()) {
				// validation failed, render registration page again
				return [service:service]
			} else {
				// validate/save ok, store user in session, redirect to homepage
			redirect(controller:'user', action:'myPage')
			}
		}
	}
	
	private lookupUser() {
		User.get(springSecurityService.principal.id)
	}
}
