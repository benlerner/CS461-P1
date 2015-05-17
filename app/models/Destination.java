package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Destination")
public class Destination {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "destination_seq")
	public int id;
	
	public String city;
	
	public String country;
}
