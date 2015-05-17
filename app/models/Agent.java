package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Agent")
public class Agent {
	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "agent_seq")
	public int id;
	
	public String firstname;
	
	public String lastname;
}
