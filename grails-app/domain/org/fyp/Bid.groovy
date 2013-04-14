package org.fyp

import java.util.Date;

class Bid {
	
	User bidder
	Auction auction
	double amount
	String comment
	// time stamps: automatically populated by GORM
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
    }
}
