package org.fyp

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class ProductController {

    def index() { }
	
	def newProduct = {
		if(request instanceof MultipartHttpServletRequest) {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
			CommonsMultipartFile file = (CommonsMultipartFile)multiRequest.getFile("image");
			
			params.photoType  = file.getContentType()
			
			def product = new Product(title: params.title, description: params.description)
			def user = session.user
			def image = new byte[file.bytes.length]
			image = file.getBytes()
			product.user = user
			product.image = image
			product.imageType = file.getContentType()
			if (! product.save()) {
				// validation failed, render registration page again
				return [product:product]
			} else {
				// validate/save ok, store user in session, redirect to homepage
			redirect(controller:'user', action:'myPage')
			}
		}
	}
	
	def displayImage = {
		def product = Product.get(params.id)
		System.out.println(product)
		byte[] image = product.image
		response.setContentType('image/jpeg')
		//System.out.println(image.getContentType())
		response.outputStream << image
		response.outputStream.flush()
	}
}
