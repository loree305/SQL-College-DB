#--Grandfield College script file

#---Create and open the Granfield college database

DROP database if exists grandfield_college;

CREATE database grandfield_college;

USE grandfield_college;

/******************************************************
load grandfield_college database tables:
	Staff
			ComputerStaff
			Requests
			Location
			Software
			License
			ReleaseForms
			Computers
	
*******************************************************/

#--Create the Staff tables

create table Staff
( StaffID			varchar(10) not null primary key,
  FirstName			varchar(10),
  LastName			varchar(10) not null,
  PhoneNumber			varchar(10) not null,
  Address			varchar(25) not null,
  City				varchar(20) not null,
  Zip				int(5)  not null,
  HireDate			date,
  Statuses			varchar(10),
  Department			varchar(10)
);

#--Create Software tables

create table Software
(SoftwareID			varchar(10) not null primary key,
SoftwareIssues			varchar(50) not null,
SoftwareSolution		varchar(50)  not null
);

#--Create the Computers tables

create table Computers
( ComputerID			varchar(10) not null primary key,
Statuses			varchar(10) not null,
SoftwareInstallDate		date, 
SoftwareRemovalDate		date,
SoftwareID	varchar(10),
FOREIGN KEY SoftwareID(SoftwareID)
REFERENCES Software(SoftwareID)			
);


#-- Create the ComputerStaff tables

create table ComputerStaff

(ComputerStaffID		int not null primary key auto_increment,
Privilege			varchar(6) not null,
StaffID 			varchar(10),
ComputerID			varchar(10),
FOREIGN KEY StaffID(StaffID)
REFERENCES Staff(StaffID),
FOREIGN KEY ComputerID(ComputerID)
REFERENCES Computers(ComputerID)

);	

#-- Create the Requests tables

create table Requests
(RequestID		       int not null primary key auto_increment,
 Statuses		       varchar(10) not null,
 Issue			       varchar(10) not null,
 RequestDate		       date,
CompID					varchar(10)

);	

#--Create the Location tables

create table Locations	       
(BuildingID		     int(5)	not null primary key	,
RoomID			     int(5)	not null ,
Computer			varchar(10)

);	




#--Create the License tables

create table Licenses
(LicenseID		        int not null primary key,
LicenseType			varchar(10),
 StartDate			date not null,
 EndDate			date not null,
SoftwareName			varchar(20)	
);

#--Create ReleaseForms tables

create table RealeaseForms
(ReleaseFormID			  int not null primary key auto_increment,
Statuses				  varchar(10) not null,
RequestDate			 	 date,
License 				varchar(10),
professor				varchar(10)		

);


		