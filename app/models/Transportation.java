package models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Transportation")
public class Transportation {
	@Id
	public int id;
	
	public String type;
	
	public String phonenumber;
	
	public String address;
	
	public int capacity;
}
