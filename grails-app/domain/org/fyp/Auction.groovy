package org.fyp

import java.util.Date;

class Auction {
	
	String title
	String description
	Date startDate
	Date endDate
	User host
	List<Bid> bids
	String status
	String category
	String type
	String currency
	double increment
	
	// time stamps: automatically populated by GORM
	Date dateCreated
	Date lastUpdated
	
	static embedded = ['bids']

    static constraints = {
		startDate nullable: true
		endDate nullable: true
		increment nullable: true
    }
}
