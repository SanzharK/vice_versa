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
    }
}
