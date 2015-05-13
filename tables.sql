drop table Customer;
drop table Party;
drop table Party_Customers;
drop table Agent;
drop table Agent_Assignments;
drop table Transportation;
drop table Party_Transports;
drop table Attraction;
drop table Party_Attractions;
drop table Party_Events;
drop table Destination;
drop table Party_Destinations;
drop table Lodging;
drop table Review;

create table Customer (
	id integer primary key,
	dob date,
	email varchar(128),
	firstname varchar(64),
	lastname varchar(64)
);

create table Party (
	id integer primary key,
	owner integer not null,
	agentID integer not null,
	foreign key agentID references Agent.id,
	foreign key owner references Customer.id
);

create table Party_Customers (
	customerID integer not null,
	partyID integer not null,
	primary key (customerID, partyID),
	foreign key customerID references Customer.id,
	foreign key partyID references Party.id,
);

create table Agent (
	id integer primary key,
	firstname varchar(128),
	lastname varchar(128),
);

create table Agent_Assignments(
	partyID integer primary key,
	agentID integer not null,
	foreign key partyID references Party.id,
	foreign key agentID references Agent.id
);

create table Transportation (
	id integer primary key,
	type varchar(64),
	phonenumber char(10),
	company varchar(64),
	address varchar(64),
	capacity integer
);

create table Party_Transports(
	partyID integer not null,
	transportID integer not null,
	rentStart date not null,
	rentEnd date not null,
	primary key (partyID, transportID)
	foreign key partyID references Party.id,
	foreign key transportID references Transportation.id,
	check (rentStart < rentEnd)
);

create table Attraction (
	id integer primary key,
	destinationID integer not null,
	description varchar(256),
	address varchar(64),
	name varchar(64)
	time date,
	capacity integer,
	RSVP bit,
	foreign key destinationID references Destination.id
);

create table Party_Attractions (
	partyID integer not null,
	attractionID integer not null,
	primary key (partyID, attractionID),
	foreign key partyID references Party.id,
	foreign key attractionID references Attraction.id
);

create table Party_Events (
	partyID integer not null,
	eventID integer not null,
	primary key (partyID, eventID),
	foreign key partyID references Party.id,
	foreign key eventID references Attraction.id
);

create table Destination (
	id integer primary key,
	city varchar(32),
	country varchar(32)
);

create table Party_Destinations (
	partyID integer not null,
	destinationID integer not null,
	visitFrom date not null,
	visitTo date not null,
	foreign key partyID references Party.id,
	foreign key destinationID references Destination.id,
	check (visitFrom < visitTo)
);

create table Lodging (
	id integer primary key,
	destinationID integer not null,
	type varchar(32),
	company varchar(64),
	address varchar(64),
	phonenumber char(10),
	capacity integer,
	foreign key destinationID references Destination.id
);

create table Review (
	id integer primary key,
	transportationID integer,
	lodgingID integer,
	attractionID integer,
	eventID integer,
	rating integer not null,
	comment varchar(256),
	foreign key transportationID references Transportation.id,
	foreign key lodgingID references Lodging.id,
	foreign key attractionID references Attraction.id,
	foreign key eventID references Attraction.id
);