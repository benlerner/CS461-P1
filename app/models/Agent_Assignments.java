package models;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Agent_Assignments")
public class Agent_Assignments {
	//References Party.id
	@Id
	public int partyID;

	//References Agent.id
    @Basic(optional = false)
	public int agentID;
}
