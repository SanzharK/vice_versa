package org.fyp

import java.util.Date;

class Service {

	// static embedded = ['user']
	
    String title
	String description
	User user
	Date dateCreated

    static constraints = {
		title blank:false;
		description  blank:false;
    }
}
