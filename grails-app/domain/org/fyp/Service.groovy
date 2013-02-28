package org.fyp

import java.util.Date;

class Service {

    String title
	String description
	User user
	Date dateCreated

    static constraints = {
		title blank:false;
		description  blank:false;
    }
}
