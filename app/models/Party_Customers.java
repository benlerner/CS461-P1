package models;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "Party_Customers")
public class Party_Customers {
	@Id
	@JoinColumn(name = "Customer.id")
    @Basic(optional = false)
	public int customerID;
	
	@Id
	@JoinColumn(name = "Party.id")
    @Basic(optional = false)
	public int partyID;
}
