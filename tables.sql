drop table Customer;
drop table Party;
drop table Party_Customers;
drop table Agent;
drop table Agent_Assignments;
drop table Transportation;
drop table Party_Transports;
drop table Attraction;
drop table Event;
drop table Party_Attractions;
drop table Party_Events;
drop table Destination;
drop table Party_Destinations;
drop table Lodging;
drop table Review;

create table Customer (
	id serial primary key,
	dob date,
	email varchar(128),
	firstname varchar(64),
	lastname varchar(64)
);

create table Party (
	id serial primary key,
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
	id serial primary key,
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
	id serial primary key,
	type varchar(64),
	phonenumber varchar(10),
	company varchar(64),
	website varchar(64),
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
	id serial primary key,
	destinationID integer not null,
	description varchar(256),
	address varchar(64),
	name varchar(64)
	foreign key destinationID references Destination.id
);

create table Event (
	id serial primary key,
	attractionID integer not null,
	description varchar(256),
	address varchar(64),
	name varchar(64)
	time date,
	capacity integer,
	RSVP bit,
	foreign key attractionID references Attraction.id
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
	foreign key eventID references Event.id
);

create table Destination (
	id serial primary key,
	city varchar(32),
	country varchar(32)
);

create table Party_Destinations (
	partyID integer not null,
	destinationID integer not null,
	visitFrom date not null,
	visitTo date not null,
	primary key(partyID, destinationID, visitFrom)
	foreign key partyID references Party.id,
	foreign key destinationID references Destination.id,
	check (visitFrom < visitTo)
);

create table Lodging (
	id serial primary key,
	destinationID integer not null,
	type varchar(32),
	company varchar(64),
	address varchar(64),
	phonenumber varchar(10),
	capacity integer,
	foreign key destinationID references Destination.id
);

create table Review (
	id serial primary key,
	transportationID integer,
	lodgingID integer,
	attractionID integer,
	eventID integer,
	rating integer not null,
	comment varchar(256),
	foreign key transportationID references Transportation.id on delete cascade,
	foreign key lodgingID references Lodging.id on delete cascade,
	foreign key attractionID references Attraction.id on delete cascade,
	foreign key eventID references Event.id on delete cascade
);

insert into Customer (dob, email, firstname, lastname) values ('1983-03-01', 'jdoe@gmail.com', 'John', 'Doe');
insert into Customer (dob, email, firstname, lastname) values ('1991-09-14', 'bob123@gmail.com', 'Bob', 'Jameson');
insert into Customer (dob, email, firstname, lastname) values ('1989-11-05', 'mt185@yahoo.com', 'Michelle', 'Thompson');

insert into Agent (firstname, lastname) values ('Betty', 'Clark');

insert into Transportation (type, phonenumber, company, website, capacity) values ('Bus', '18774626342', 'Megabus', 'us.megabus.com', 50);
insert into Transportation (type, phonenumber, company, website, capacity) values ('Air', '18004552720', 'Delta Airlines', 'www.delta.com', 200);

insert into Destination (city, country) values ('Miami', 'USA');
insert into Destination (city, country) values ('Myrtle Beach', 'USA');

insert into Attraction (destinationID, description, address, name) values (1, 'Miami Beach is a coastal resort city in Miami-Dade County, Florida, United States.', null, 'Miami Beach');
insert into Attraction (destinationID, description, address, name) values (1, 'The Miami Seaquarium is a 38-acre oceanarium located on the island of Virginia Key in Biscayne Bay, Miami-Dade County, Florida, United States and is located near downtown Miami. Founded in 1955, it is the oldest oceanarium in the United States.', '4400 Rickenbacker Causeway, Key Biscayne, FL 33149', 'Miami Seaquarium');

insert into Attraction (destinationID, description, address, name) values (2, 'Broadway at the Beach is a shopping center located in Myrtle Beach, South Carolina. Since its inception in 1996, it has grown to be one of Myrtle Beach''s premier shopping destinations.', null, 'Broadway At the Beach');
insert into Attraction (destinationID, description, address, name) values (2, 'Family Kingdom Amusement Park is the only seaside amusement park in Myrtle Beach, South Carolina. Located on Ocean Boulevard, in the heart of Myrtle Beach, the amusement park has 37 rides for adults and children of all ages, including thrill rides, family rides, kiddie rides and go karts.', '300 S Ocean Blvd, Myrtle Beach, SC 29577', 'Family Kingdom Amusement Park');

insert into Lodging (destinationID, type, company, address, phonenumber, capacity) values (1, 'Hotel', 'Red Roof Plus+', '3401 Northwest Le Jeune Rd, Miami, FL 33142', '3058714221', 5);
insert into Lodging (destinationID, type, company, address, phonenumber, capacity) values (1, 'Hotel', 'Four Seasons Hotel Miami', '1435 Brickell Ave, Miami, FL 33131', '3053583535', 5);
insert into Lodging (destinationID, type, company, address, phonenumber, capacity) values (2, 'Hotel', 'Carolinian Beach Resort', '2506 N Ocean Blvd, Myrtle Beach, SC 29577', '8434486861', 5);