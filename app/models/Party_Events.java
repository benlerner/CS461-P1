package models;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Party_Events")
public class Party_Events {
	//References Party.id
	@Id
    @Basic(optional = false)
	public int partyID;
	
	//References Event.id
	@Id
    @Basic(optional = false)
	public int eventID;
}
