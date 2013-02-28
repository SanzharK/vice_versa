package org.fyp

class ProductController {

    def springSecurityService

    def index() { }
	
	def newProduct = {
		if(request.method == 'POST') {
			def product = new Product(title: params.title, description: params.description, image: params.image)
			def user = session.user
			product.user = user
			//service.user_id = session.user.id
			if (! product.save()) {
				// validation failed, render registration page again
				return [product:product]
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
