package models;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Party_Attractions")
public class Party_Attractions {
	//References Party.id
	@Id
    @Basic(optional = false)
	public int partyID;
	
	//References Attraction.id
	@Id
    @Basic(optional = false)
	public int attractionID;
}
