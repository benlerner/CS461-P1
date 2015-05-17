package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Lodging")
public class Lodging {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "lodging_seq")
	public int id;
	
	public int destinationID;
	
	public String type;
	
	public String company;
	
	public String address;
	
	public String phonenumber;
	
	public int capacity;
}
