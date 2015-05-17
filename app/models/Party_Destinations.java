package models;

import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Party_Destinations")
public class Party_Destinations {

	@Id
    @Basic(optional = false)
	public int partyID;

	@Id
    @Basic(optional = false)
	public int destinationID;
	
	public Date visitFrom;
	
	public Date visitTo;
}
