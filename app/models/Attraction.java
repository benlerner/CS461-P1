package models;

import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Attraction")
public class Attraction {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "attraction_seq")
	public int id;

    @Basic(optional = false)
	public int destinationID;
	
	public String description;
	
	public String address;
	
	public String name;
}
