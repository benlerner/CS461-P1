package models;

import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Event")
public class Event {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_seq")
	public int id;
	
    //References Attraction.id
    @Basic(optional = false)
	public int attractionID;
	
	public String description;
	
	public String address;
	
	public String name;
	
	public Date time;
	
	public boolean RSVP;
}
