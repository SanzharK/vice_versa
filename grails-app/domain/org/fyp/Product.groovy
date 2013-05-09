package org.fyp

import java.util.Date;

class Product {

    String title
	String description
	byte[] image
	User user
	Date dateCreated

    static constraints = {
		title blank:false;
		description  blank:false;
		// Limit upload file size to 2MB
		image maxSize: 1024 * 1024 * 2
    }
}
