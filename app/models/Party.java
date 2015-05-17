package models;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Party")
public class Party {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "party_seq")
	public int id;
    
    //References Customer.id
    @Basic(optional = false)
    public int owner;
    
    //References Agent.id
    @Basic(optional = false)
    public int agentID;
}
