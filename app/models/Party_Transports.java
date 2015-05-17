package models;

import java.sql.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Party_Transports")
public class Party_Transports {
	//References Party.id
	@Id
    @Basic(optional = false)
	public int partyID;
	
	@Id
    @Basic(optional = false)
	public int transportID;

    @Basic(optional = false)
	public Date rentStart;

    @Basic(optional = false)
	public Date rentEnd;
}
