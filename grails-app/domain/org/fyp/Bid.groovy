package org.fyp

import java.util.Date;

class Bid implements Serializable{
	
	// static embedded = ['products', 'services']
	
	User bidder
	Auction auction
	double amount
	String comment
	List<String> services
	List<String> products
	String currency
	 
	// time stamps: automatically populated by GORM
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		services nullable: true
		products nullable: true
    }
}
