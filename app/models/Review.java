package models;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Review {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_seq")
	public int id;
	
	public int transportationID;
	
	public int lodgingID;
	
	public int attractionID;
	
	public int eventID;
	
	public int rating;
	
	public String comment;
}
