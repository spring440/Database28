/* Starting to enter data from given data */

/* Create initial tempholding table for person entries */
GO
CREATE TABLE tempholding (
	fname			VARCHAR(50)		NOT NULL,
	lname			VARCHAR(50)		NOT NULL,
	add_street		VARCHAR(100)	NULL,
	add_city		VARCHAR(50)		NULL,
	add_zip			VARCHAR(20)		NULL,
	add_province	VARCHAR(50)		NULL,
	email			VARCHAR(100)	NULL
);

GO
INSERT INTO tempholding values ('Amanda', 'Long', '10 Napa Ct.', 'Lebanon', '97355', 'Oregon', 'ALong@gmail.com');
INSERT INTO tempholding values ('Christian', 'Shan', '1000 Bidweld Street', 'Haney', 'V2W 1W2', 'British Columbia', 'CShan@gmail.com');
INSERT INTO tempholding values ('Troy', 'Sara', '1002 N. Spoonwood Court', 'Hervey Bay', '4655', 'Queensland', 'TSara@gmail.com');
INSERT INTO tempholding values ('Kaitlyn', 'Baker', '1003 Matterhorn Ct', 'Lebanon', '97355', 'Oregon', 'KBaker@gmail.com');
INSERT INTO tempholding values ('Suzanne', 'Ma', '1005 Matterhorn Ct.', 'Cambridge', 'CB4 4BZ', 'England', 'SMa@gmail.com');
INSERT INTO tempholding values ('Anna', 'Jones', '1005 Matterhorn Ct.', 'Mill Valley', '94941', 'California', 'AJones@gmail.com');
INSERT INTO tempholding values ('Carlos', 'Baker', '1005 Tanager Court', 'Corvallis', '97330', 'Oregon', 'CBaker@gmail.com');
INSERT INTO tempholding values ('Tanya', 'Munoz', '1005 Tanager Court', 'Milsons Point', '2061', 'New South Wales', 'TMunoz@gmail.com');
INSERT INTO tempholding values ('Tabitha', 'Gill', '1006 Deercreek Ln', 'Bellflower', '90706', 'California', 'TGill@gmail.com');
INSERT INTO tempholding values ('Alexis', 'Lee', '1006 Deercreek Ln', 'Torrance', '90505', 'California', 'ALee@gmail.com');
INSERT INTO tempholding values ('Erick', 'Suri', '101 Adobe Dr', 'Coffs Harbour', '2450', 'New South Wales', 'ESuri@gmail.com');
INSERT INTO tempholding values ('Marcus', 'Evans', '101 Adobe Dr', 'Puyallup', '98371', 'Washington', 'MEvans@gmail.com');
INSERT INTO tempholding values ('Marcus', 'Clark', '101, avenue de la Gare', 'Peterborough', 'PB12', 'England', 'MClark@gmail.com');
INSERT INTO tempholding values ('Gilbert', 'Xu', '1010 Maple', 'Baltimore', '21201', 'Maryland', 'GXu@gmail.com');
INSERT INTO tempholding values ('Paula', 'Rubio', '1011 Yolanda Circle', 'Berkeley', '94704', 'California', 'PRubio@gmail.com');
INSERT INTO tempholding values ('Julian', 'Isla', '1011 Yolanda Circle', 'N. Vancouver', 'V7L 4J4', 'British Columbia', 'JIsla@gmail.com');
INSERT INTO tempholding values ('Jesse', 'Scott', '1013 Holiday Hills Dr.', 'Bremerton', '98312', 'Washington', 'JScott@gmail.com');
INSERT INTO tempholding values ('Naomi', 'Sanz', '1013 Holiday Hills Dr.', 'Gateshead', 'GA10', 'England', 'NSanz@gmail.com');
INSERT INTO tempholding values ('Isabella', 'Lee', '1015 Lynwood Drive', 'Metchosin', 'V9', 'British Columbia', 'ILee@gmail.com');
INSERT INTO tempholding values ('Dawn', 'Yuan', '1019 Carletto Drive', 'Berkeley', '94704', 'California', 'DYuan@gmail.com');
INSERT INTO tempholding values ('Olivia', 'Blue', '1019 Mt. Davidson Court', 'Burien', '98168', 'Washington', 'OBlue@gmail.com');
INSERT INTO tempholding values ('Emmanuel', 'Lopez', '1019 Mt. Davidson Court', 'London', 'SW8 4BG', 'England', 'ELopez@gmail.com');
INSERT INTO tempholding values ('Nathan', 'Yang', '102 Vista Place', 'Santa Monica', '90401', 'California', 'NYang@gmail.com');
INSERT INTO tempholding values ('Gabrielle', 'Wood', '1020 Book Road', 'Bremerton', '98312', 'Washington', 'GWood@gmail.com');
INSERT INTO tempholding values ('Katrina', 'Anand', '1020 Carletto Drive', 'Matraville', '2036', 'New South Wales', 'KAnand@gmail.com');
INSERT INTO tempholding values ('Anthony', 'Jones', '1020 Carletto Drive', 'Santa Cruz', '95062', 'California', 'AJones@gmail.com');
INSERT INTO tempholding values ('Natalie', 'Reed', '1023 Hawkins Street', 'Lebanon', '97355', 'Oregon', 'NReed@gmail.com');
INSERT INTO tempholding values ('Dakota', 'Ross', '1024 Walnut Blvd.', 'Colma', '94014', 'California', 'DRoss@gmail.com');
INSERT INTO tempholding values ('Shawn', 'Goel', '1025 Holly Oak Drive', 'Leeds', 'LE18', 'England', 'SGoel@gmail.com');
INSERT INTO tempholding values ('Nicole', 'Diaz', '1025 R St.', 'Kirkland', '98033', 'Washington', 'NDiaz@gmail.com');
INSERT INTO tempholding values ('Wyatt', 'Davis', '1025 Yosemite Dr.', 'Oregon City', '97045', 'Oregon', 'WDavis@gmail.com');
INSERT INTO tempholding values ('Christy', 'Huang', '1028 Green View Court', 'Chula Vista', '91910', 'California', 'CHuang@gmail.com');
INSERT INTO tempholding values ('Sydney', 'Evans', '1028 Green View Court', 'Oregon City', '97045', 'Oregon', 'SEvans@gmail.com');
INSERT INTO tempholding values ('Katherine', 'Baker', '1037 Hayes Court', 'Stoke-on-Trent', 'AS23', 'England', 'KBaker@gmail.com');
INSERT INTO tempholding values ('Edward', 'Wood', '1039 Adelaide St.', 'West Covina', '91791', 'California', 'EWood@gmail.com');
INSERT INTO tempholding values ('Johnny', 'Rai', '104 Hilltop Dr.', 'Springwood', '2777', 'New South Wales', 'JRai@gmail.com');
INSERT INTO tempholding values ('Emily', 'Moore', '104 Kaski Ln.', 'Portland', '97205', 'Oregon', 'EMoore@gmail.com');
INSERT INTO tempholding values ('Randy', 'Yang', '1040 Greenbush Drive', 'Silverwater', '2264', 'New South Wales', 'RYang@gmail.com');
INSERT INTO tempholding values ('Roy', 'Ruiz', '1040 Northridge Road', 'London', 'W1X3SE', 'England', 'RRuiz@gmail.com');
INSERT INTO tempholding values ('Marshall', 'Sun', '1044 San Carlos', 'Cincinnati', '45202', 'Ohio', 'MSun@gmail.com');
INSERT INTO tempholding values ('Gabriella', 'Perez', '1045 Lolita Drive', 'Torrance', '90505', 'California', 'GPerez@gmail.com');
INSERT INTO tempholding values ('Erika', 'Gill', '1045 Lolita Drive', 'Townsville', '4810', 'Queensland', 'EGill@gmail.com');
INSERT INTO tempholding values ('Kathryn', 'Shen', '1047 Las Quebradas Lane', 'North Sydney', '2055', 'New South Wales', 'KShen@gmail.com');
INSERT INTO tempholding values ('Sharon', 'Yuan', '1048 Burwood Way', 'Hervey Bay', '4655', 'Queensland', 'SYuan@gmail.com');
INSERT INTO tempholding values ('Victoria', 'Lee', '1048 Las Quebradas Lane', 'Walla Walla', '99362', 'Washington', 'VLee@gmail.com');
INSERT INTO tempholding values ('Brenda', 'Arun', '1048 Las Quebradas Lane', 'Wollongong', '2500', 'New South Wales', 'BArun@gmail.com');
INSERT INTO tempholding values ('Alex', 'Scott', '105 Clark Creek Lane', 'Port Macquarie', '2444', 'New South Wales', 'AScott@gmail.com');
INSERT INTO tempholding values ('Yolanda', 'Luo', '105 Woodruff Ln.', 'Bellingham', '98225', 'Washington', 'YLuo@gmail.com');
INSERT INTO tempholding values ('Martin', 'Vance', '1050 Creed Ave', 'London', 'W10 6BL', 'England', 'MVance@gmail.com');
INSERT INTO tempholding values ('Jeremy', 'Roberts', '081, boulevard du Montparnasse', 'Seattle', '98104', 'Washington', 'JRoberts@yahoo.com');
INSERT INTO tempholding values ('Amanda', 'Ramirez', '1 Smiling Tree Court', 'Los Angeles', '90012', 'California', 'ARamirez@yahoo.com');
INSERT INTO tempholding values ('Jada', 'Nelson', '100, rue des Rosiers', 'Everett', '98201', 'Washington', 'JNelson@yahoo.com');
INSERT INTO tempholding values ('Hunter', 'Wright', '1002 N. Spoonwood Court', 'Berkeley', '94704', 'California', 'HWright@yahoo.com');
INSERT INTO tempholding values ('Sierra', 'Wright', '1005 Fremont Street', 'Colma', '94014', 'California', 'SWright@yahoo.com');
INSERT INTO tempholding values ('Sarah', 'Simmons', '1005 Valley Oak Plaza', 'Langley', 'V3A 4R2', 'British Columbia', 'SSimmons@yahoo.com');
INSERT INTO tempholding values ('Mandar', 'Samant', '1005 Valley Oak Plaza', 'London', 'SW6 SBY', 'England', 'MSamant@yahoo.com');
INSERT INTO tempholding values ('Isaiah', 'Rogers', '1007 Cardinet Dr.', 'El Cajon', '92020', 'California', 'IRogers@yahoo.com');
INSERT INTO tempholding values ('Ian', 'Foster', '1008 Lydia Lane', 'Burbank', '91502', 'California', 'IFoster@yahoo.com');
INSERT INTO tempholding values ('Ben', 'Miller', '101 Candy Rd.', 'Redmond', '98052', 'Washington', 'BMiller@yahoo.com');
INSERT INTO tempholding values ('Sarah', 'Barnes', '1011 Green St.', 'Bellingham', '98225', 'Washington', 'SBarnes@yahoo.com');
INSERT INTO tempholding values ('Casey', 'Martin', '1013 Buchanan Rd', 'Port Macquarie', '2444', 'New South Wales', 'CMartin@yahoo.com');
INSERT INTO tempholding values ('Victoria', 'Murphy', '1013 Buchanan Rd', 'Yakima', '98901', 'Washington', 'VMurphy@yahoo.com');
INSERT INTO tempholding values ('Sydney', 'Rogers', '1016 Park Avenue', 'Burbank', '91502', 'California', 'SRogers@yahoo.com');
INSERT INTO tempholding values ('Marvin', 'Hernandez', '1019 Book Road', 'Rhodes', '2138', 'New South Wales', 'MHernandez@yahoo.com');
INSERT INTO tempholding values ('Carlos', 'Carter', '1019 Buchanan Road', 'Woodland Hills', '91364', 'California', 'CCarter@yahoo.com');
INSERT INTO tempholding values ('Rebekah', 'Garcia', '1019 Candy Rd.', 'Coffs Harbour', '2450', 'New South Wales', 'RGarcia@yahoo.com');
INSERT INTO tempholding values ('Haley', 'Henderson', '1019 Chance Drive', 'Sedro Woolley', '98284', 'Washington', 'HHenderson@yahoo.com');
INSERT INTO tempholding values ('Jacob', 'Taylor', '1019 Kenwal Rd.', 'Lake Oswego', '97034', 'Oregon', 'JTaylor@yahoo.com');
INSERT INTO tempholding values ('Seth', 'Martin', '1019 Pennsylvania Blvd', 'Marysville', '98270', 'Washington', 'SMartin@yahoo.com');
INSERT INTO tempholding values ('Larry', 'Suarez', '102 Vista Place', 'Milton Keynes', 'MK8 8DF', 'England', 'LSuarez@yahoo.com');
INSERT INTO tempholding values ('Garrett', 'Vargas', '10203 Acorn Avenue', 'Calgary', 'T2P 2G8', 'Alberta', 'GVargas@yahoo.com');
INSERT INTO tempholding values ('Abby', 'Martinez', '1023 Hawkins Street', 'Townsville', '4810', 'Queensland', 'AMartinez@yahoo.com');
INSERT INTO tempholding values ('Justin', 'Thomas', '1023 Riveria Way', 'Burbank', '91502', 'California', 'JThomas@yahoo.com');
INSERT INTO tempholding values ('Evelyn', 'Martinez', '1023 Riviera Way', 'Oxford', 'OX1', 'England', 'EMartinez@yahoo.com');
INSERT INTO tempholding values ('Pamela', 'Chapman', '1025 Yosemite Dr.', 'Townsville', '4810', 'Queensland', 'PChapman@yahoo.com');
INSERT INTO tempholding values ('Kayla', 'Griffin', '1026 Mt. Wilson Pl.', 'Lynnwood', '98036', 'Washington', 'KGriffin@yahoo.com');
INSERT INTO tempholding values ('Jill', 'Navarro', '1026 Mt. Wilson Pl.', 'South Melbourne', '3205', 'Victoria', 'JNavarro@yahoo.com');
INSERT INTO tempholding values ('Nathan', 'Walker', '1028 Indigo Ct.', 'Issaquah', '98027', 'Washington', 'NWalker@yahoo.com');
INSERT INTO tempholding values ('Tabitha', 'Moreno', '1028 Indigo Ct.', 'Warrnambool', '3280', 'Victoria', 'TMoreno@yahoo.com');
INSERT INTO tempholding values ('Mason', 'Sanchez', '1028 Royal Oak Rd.', 'Burlingame', '94010', 'California', 'MSanchez@yahoo.com');
INSERT INTO tempholding values ('Natasha', 'Navarro', '1029 Birchwood Dr', 'Burien', '98168', 'Washington', 'NNavarro@yahoo.com');
INSERT INTO tempholding values ('Kevin', 'Russell', '1029 Birchwood Dr', 'Olympia', '98501', 'Washington', 'KRussell@yahoo.com');
INSERT INTO tempholding values ('Katelyn', 'Rivera', '1030 Ambush Dr.', 'Bury', 'PE17', 'England', 'KRivera@yahoo.com');
INSERT INTO tempholding values ('Alfredo', 'Ortega', '1032 Buena Vista', 'North Ryde', '2113', 'New South Wales', 'AOrtega@yahoo.com');
INSERT INTO tempholding values ('Andrea', 'Campbell', '1032 Coats Road', 'Stoke-on-Trent', 'AS23', 'England', 'ACampbell@yahoo.com');
INSERT INTO tempholding values ('Jeremy', 'Peterson', '1035 Arguello Blvd.', 'San Diego', '92102', 'California', 'JPeterson@yahoo.com');
INSERT INTO tempholding values ('Arianna', 'Ramirez', '1036 Mason Dr', 'Port Orchard', '98366', 'Washington', 'ARamirez@yahoo.com');
INSERT INTO tempholding values ('Mario', 'Sharma', '1039 Adelaide St.', 'Port Macquarie', '2444', 'New South Wales', 'MSharma@yahoo.com');
INSERT INTO tempholding values ('Adam', 'Collins', '104 Hilltop Dr.', 'Concord', '94519', 'California', 'ACollins@yahoo.com');
INSERT INTO tempholding values ('Taylor', 'Martin', '1040 Greenbush Drive', 'Newton', 'V2L3W8', 'British Columbia', 'TMartin@yahoo.com');
INSERT INTO tempholding values ('Gabriel', 'Collins', '1040 Northridge Road', 'Woodland Hills', '91364', 'California', 'GCollins@yahoo.com');
INSERT INTO tempholding values ('Randall', 'Martin', '1042 Hooftrail Way', 'Newcastle', '2300', 'New South Wales', 'RMartin@yahoo.com');
INSERT INTO tempholding values ('Samantha', 'Jenkins', '1046 Cloverleaf Circle', 'Shawnee', 'V8Z 4N5', 'British Columbia', 'SJenkins@yahoo.com');
INSERT INTO tempholding values ('Justin', 'Simmons', '1046 San Carlos Avenue', 'Colma', '94014', 'California', 'JSimmons@yahoo.com');
INSERT INTO tempholding values ('Ethan', 'Winston', '1047 Las Quebradas Lane', 'Oak Bay', 'V8P', 'British Columbia', 'EWinston@yahoo.com');
INSERT INTO tempholding values ('Hunter', 'Roberts', '1048 Burwood Way', 'Haney', 'V2W 1W2', 'British Columbia', 'HRoberts@yahoo.com');
INSERT INTO tempholding values ('Nathaniel', 'Murphy', '105 Woodruff Ln.', 'Oakland', '94611', 'California', 'NMurphy@yahoo.com');
INSERT INTO tempholding values ('Charles', 'Wilson', '1050 Creed Ave', 'Lebanon', '97355', 'Oregon', 'CWilson@yahoo.com');
INSERT INTO tempholding values ('Carrie', 'Alvarez', '1050 Greenhills Circle', 'Lane Cove', '1597', 'New South Wales', 'CAlvarez@yahoo.com');
INSERT INTO tempholding values ('Paige', 'Alexander', '1050 Greenhills Circle', 'Langley', 'V3A 4R2', 'British Columbia', 'PAlexander@yahoo.com');


GO
INSERT INTO person (fname, lname, add_street, add_city, add_zip, add_province, email)
SELECT fname, lname, add_street, add_city, add_zip, add_province, email FROM tempholding

GO
DROP TABLE tempholding

/*
Create temp holding table for event and venue data
*/

CREATE TABLE tempholding (
	event_date	DATE	null,
	event_title	VARCHAR(50) null,
	event_region VARCHAR(50) null,
	venue_street	VARCHAR(100)	NULL,
	venue_city		VARCHAR(50)		NULL,
	venue_province	VARCHAR(50)		NULL,
	venue_country	VARCHAR(50)		NULL,
);

GO
INSERT INTO tempholding values ('2017-05-06', 'SQLSaturday #626 - Budapest 2017','Europe/Middle East/Africa','Mérnök u. 39.', 'Budapest','Budapest','Hungary');
INSERT INTO tempholding values ('2017-05-06', 'SQLSaturday #615 - Baltimore 2017','Canada/US','8890 McGaw Road', 'Columbia','Maryland','United States');
INSERT INTO tempholding values ('2017-05-13', 'SQLSaturday #608 - Bogota 2017','Latin America','Calle 76 No. 12-22', 'Bogota','Bogota D.C.','Colombia');
INSERT INTO tempholding values ('2017-05-20', 'SQLSaturday #616 - Kyiv 2017','Europe/Middle East/Africa','Peremohy Ave 84', 'Kiev','Misto Kyyiv','Ukraine ');
INSERT INTO tempholding values ('2017-05-20', 'SQLSaturday #588 - New York City 2017','Canada/US','11 Times Square', 'New York City','New York','United States');
INSERT INTO tempholding values ('2017-05-27', 'SQLSaturday #630 - Brisbane 2017','Asia Pacific','Level 28, 400 George Street Brisbane', 'Brisbane','Queensland','Australia');
INSERT INTO tempholding values ('2017-05-27', 'SQLSaturday #599 - Plovdiv 2017','Europe/Middle East/Africa','15 Gladston Str., 4000 Plovdiv', 'Plovdiv','Plovdiv','Bulgaria');
INSERT INTO tempholding values ('2017-06-03', 'SQLSaturday #638 - Philadelphia 2017','Canada/US','1000 College Blvd', 'Pensacola','Florida','United States');


GO
INSERT INTO venue (venue_street, venue_city, venue_province, venue_country)
SELECT venue_street, venue_city, venue_province, venue_country FROM tempholding

GO
INSERT INTO sql_event (venue_id, event_date, event_title, region)
SELECT v.venue_id, t.event_date, t.event_title, t.event_region FROM venue v INNER JOIN tempholding t ON v.venue_street = t.venue_street;

GO
DROP TABLE tempholding

/*
Create tempholding table for sponsors.  Creating rep person entries because the sponsor's are required to be registered as a person.  The sponsor level is also assigned per event the sponsor attends,
so the sponsors will be added for the first event as a test.
*/
GO 
CREATE TABLE tempholding (
	organization	VARCHAR(50)		NULL,
	sponsor_level	VARCHAR(50)		NULL,
	fname			VARCHAR(50)		NOT NULL,
	lname			VARCHAR(50)		NOT NULL
);

INSERT INTO tempholding values ('VMWare','Platinum Sponsor','VMWare','Rep');
INSERT INTO tempholding values ('Verizon Digital Media Services','Platinum Sponsor','VDMA','Rep');
INSERT INTO tempholding values ('Microsoft Corporation (GAP) (GAP Sponsor)','Platinum Sponsor','Microsoft','Rep');
INSERT INTO tempholding values ('Tintri','Platinum Sponsor','Tintri','Rep');
INSERT INTO tempholding values ('Amazon Web Services, LLC','Gold Sponsor','AWS','Rep');
INSERT INTO tempholding values ('Pyramid Analytics (GAP Sponsor)','Gold Sponsor','Pyramid','Rep');
INSERT INTO tempholding values ('Pure Storage','Gold Sponsor','Pure Storage','Rep');
INSERT INTO tempholding values ('Profisee','Gold Sponsor','Profisee','Rep');
INSERT INTO tempholding values ('NetLib Security','Silver Sponsor','Netlib Security','Rep');
INSERT INTO tempholding values ('Melissa Data Corp.','Silver Sponsor','Melissa Data','Rep');
INSERT INTO tempholding values ('Red Gate Software','Silver Sponsor','Red Gate','Rep');
INSERT INTO tempholding values ('SentryOne','Silver Sponsor','SentryOne','Rep');
INSERT INTO tempholding values ('Hush Hush','Bronze Sponsor','Hush Hush','Rep');
INSERT INTO tempholding values ('COZYROC','Bronze Sponsor','COZYROC','Rep');
INSERT INTO tempholding values ('SQLDocKit by Acceleratio Ltd.','Bronze Sponsor','SQLDOcKit','Rep');

GO
INSERT INTO person (fname, lname, organization)
SELECT fname, lname, organization FROM tempholding

GO
INSERT INTO sponsor (person_id)
SELECT p.person_id FROM person p INNER JOIN tempholding t ON p.fname = t.fname AND p.lname = t.lname AND p.organization = t.organization

GO
INSERT INTO sponsor_event (sponsor_id, event_id, sponsor_level)
SELECT p.person_id , '1', t.sponsor_level FROM person p INNER JOIN tempholding t ON p.fname = t.fname AND p.lname = t.lname AND p.organization = t.organization

GO
DROP TABLE tempholding

