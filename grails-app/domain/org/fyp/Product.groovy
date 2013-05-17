package org.fyp

import java.util.Date;

class Product {
	
	// static embedded = ['user']

    String title
	String description
	byte[] image
	String imageType
	User user
	Date dateCreated

    static constraints = {
		title blank:false;
		description  blank:false;
		// Limit upload file size to 2MB
		image maxSize: 1024 * 1024 * 2
    }
}
