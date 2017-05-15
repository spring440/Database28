CREATE TABLE person (
	/*
	Required Fields:  First name, last name.  
	The lengths are based around the RFC 2218: A Common Schema for the Internet White Pages Service. https://tools.ietf.org/html/rfc2218
	I have padded the fields a little to add more wiggle room.
	*/

	person_id		INT				IDENTITY (1,1) NOT NULL,
	fname			VARCHAR(50)		NOT NULL,
	lname			VARCHAR(50)		NOT NULL,
	add_street		VARCHAR(100)	NULL,
	add_street_2	VARCHAR(50)		NULL,
	add_city		VARCHAR(50)		NULL,
	add_zip			VARCHAR(20)		NULL,
	add_province	VARCHAR(50)		NULL,
	email			VARCHAR(100)	NULL,
	organization	VARCHAR(50)		NULL,
	CONSTRAINT PK_person_pid PRIMARY KEY CLUSTERED (person_id ASC)
);


GO
CREATE TABLE presenter (
	person_id		INT				NOT NULL,
	CONSTRAINT PK_presenter_pid PRIMARY KEY NONCLUSTERED (person_id ASC),
	CONSTRAINT FK_presenter_pid FOREIGN KEY (person_id) REFERENCES person(person_id)
);

GO
CREATE TABLE attendee (
	person_id		INT				NOT NULL,
	CONSTRAINT PK_attendee_pid PRIMARY KEY NONCLUSTERED (person_id ASC),
	CONSTRAINT FK_attendee_pid FOREIGN KEY (person_id) REFERENCES person(person_id)
);

GO
CREATE TABLE organizer (
	person_id		INT				NOT NULL,
	CONSTRAINT PK_organizer_pid PRIMARY KEY NONCLUSTERED (person_id ASC),
	CONSTRAINT FK_organizer_pid FOREIGN KEY (person_id) REFERENCES person(person_id)
);

GO
CREATE TABLE volunteer (
	person_id		INT				NOT NULL,
	CONSTRAINT PK_volunteer_pid PRIMARY KEY NONCLUSTERED (person_id ASC),
	CONSTRAINT FK_volunteer_pid FOREIGN KEY (person_id) REFERENCES person(person_id)
);

GO
CREATE TABLE sponsor (
	person_id		INT				NOT NULL,
	CONSTRAINT PK_sponsor_pid PRIMARY KEY NONCLUSTERED (person_id ASC),
	CONSTRAINT FK_sponsor_pid FOREIGN KEY (person_id) REFERENCES person(person_id)
);

GO
CREATE TABLE venue (
	venue_id		INT				IDENTITY (1,1) NOT NULL,
	venue_name		VARCHAR(150)	NULL,
	venue_street	VARCHAR(100)	NULL,
	venue_street_2	VARCHAR(50)		NULL,
	venue_city		VARCHAR(50)		NULL,
	venue_zip		VARCHAR(20)		NULL,
	venue_province	VARCHAR(50)		NULL,
	venue_country	VARCHAR(50)		NULL,
	CONSTRAINT PK_venue_vid PRIMARY KEY CLUSTERED (venue_id ASC)
);

GO
CREATE TABLE sql_event (
	event_id		INT				IDENTITY (1,1) NOT NULL,
	venue_id		INT				NOT NULL,
	event_date		DATE			NOT NULL,
	event_title		VARCHAR(50)		NOT NULL,
	organizer_id	INT				NULL,
	region			VARCHAR(50)		NOT NULL,
	CONSTRAINT PK_sql_event_eid PRIMARY KEY CLUSTERED (event_id ASC),
	CONSTRAINT FK_sql_event_oid FOREIGN KEY (organizer_id) REFERENCES organizer(person_id),
	CONSTRAINT FK_sql_event_vid	FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

/*
	Only one SQL Saturday event can be hosted at a specific venue on the same date.
*/

GO
CREATE UNIQUE NONCLUSTERED INDEX IDX_sql_event_vid_date
	ON sql_event(venue_id ASC, event_date ASC);

GO
CREATE TABLE room (
	room_id			INT				IDENTITY (1,1) NOT NULL,
	room_name		VARCHAR(50)		NOT NULL,
	room_size		INT				NULL,
	room_number		VARCHAR(10)		NULL,
	venue_id		INT				NOT NULL,
	CONSTRAINT PK_room_rid PRIMARY KEY CLUSTERED (room_id ASC),
	CONSTRAINT FK_room_vid FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

/*
	The following unique index to ensure that room_numbers per venue are not duplicated.
*/

GO
CREATE UNIQUE NONCLUSTERED INDEX IDX_room_roomnum_venue
	ON room(room_name ASC, venue_id ASC);

GO
CREATE TABLE track (
	track_id		INT				IDENTITY (1,1) NOT NULL,
	topic			VARCHAR(50)		NOT NULL,
	CONSTRAINT PK_track_tid PRIMARY KEY CLUSTERED (track_id ASC)
);

GO
CREATE TABLE class (
	class_id			INT				IDENTITY (1,1) NOT NULL,
	classname			VARCHAR(150)	NOT NULL,
	track_id			INT				NULL,
	duration			INT				CONSTRAINT DEF_presentation_duration DEFAULT (60) NOT NULL,
	difficulty			VARCHAR(15)		NULL,
	class_desc			VARCHAR(100)	NULL,
	class_grade_avg		VARCHAR(10)		NULL,
	CONSTRAINT PK_class_cid PRIMARY KEY CLUSTERED (class_id ASC),
	CONSTRAINT FK_class_tid FOREIGN KEY (track_id) REFERENCES track(track_id)
);

GO
CREATE UNIQUE NONCLUSTERED INDEX IDX_class_classname
	ON class(classname);

GO
CREATE TABLE class_presenter (
	class_id			INT				NOT NULL,
	presenter_id		INT				NOT NULL,
	CONSTRAINT PK_class_presenter_cid_pid PRIMARY KEY NONCLUSTERED (class_id ASC, presenter_id ASC),
	CONSTRAINT FK_class_presenter_cid FOREIGN KEY (class_id) REFERENCES class(class_id),
	CONSTRAINT FK_class_presenter_pid FOREIGN KEY (presenter_id) REFERENCES presenter(person_id)
);

GO
CREATE TABLE schedule (
	event_id		INT				NOT NULL,
	class_id		INT				NOT NULL,
	start_time		TIME			NOT NULL,
	room_id			INT				NOT NULL,
	CONSTRAINT PK_schedule_eid_st_rid PRIMARY KEY NONCLUSTERED (event_id ASC, start_time ASC, room_id ASC),
	CONSTRAINT FK_schedule_eid FOREIGN KEY (event_id) REFERENCES sql_event(event_id),
	CONSTRAINT FK_schedule_cid FOREIGN KEY (class_id) REFERENCES class(class_id),
	CONSTRAINT FK_schedule_rid FOREIGN KEY (room_id) REFERENCES room(room_id)
);

GO
CREATE TABLE sponsor_presentation (
	sponsor_presentation_id			INT	IDENTITY (1,1) NOT NULL,
	sponsor_id		INT				NOT NULL,
	title			VARCHAR(50)		NOT NULL,
	topic			VARCHAR(255)	NULL,
	presentation_grade_avg VARCHAR(10) NULL,
	CONSTRAINT PK_sponsor_presentation_spid PRIMARY KEY CLUSTERED (sponsor_presentation_id ASC),
	CONSTRAINT FK_sponsor_sid FOREIGN KEY (sponsor_id) REFERENCES sponsor(person_id),
);

GO
CREATE TABLE sponsor_raffle_entry (
	/*
		No unique index on sponsor_id and attendee because attendee's are allowed to enter a raffle multiple times.
	*/
	sponsor_id		INT				NOT NULL,
	attendee_id		INT				NOT NULL,
	event_id		INT				NOT NULL,
	CONSTRAINT FK_sponsor_raffle_entry_sid FOREIGN KEY (sponsor_id) REFERENCES sponsor(person_id),
	CONSTRAINT FK_sponsor_raffle_entry_aid FOREIGN KEY (attendee_id) REFERENCES attendee(person_id),
	CONSTRAINT FK_sponsor_raffle_entry_eid FOREIGN KEY (event_id) REFERENCES sql_event(event_id)
);

GO
CREATE TABLE sponsor_event (
	sponsor_id		INT				NOT NULL,
	event_id		INT				NOT NULL,
	sponsor_presentation_id	INT		NULL,
	sponsor_level	VARCHAR(50)		NULL,
	prize			VARCHAR(50)		NULL,
	sponsor_table	VARCHAR(10)		NULL,
	CONSTRAINT PK_sponsor_event_sid_eid PRIMARY KEY NONCLUSTERED (sponsor_id ASC, event_id ASC),
	CONSTRAINT FK_sponsor_event_sid FOREIGN KEY (sponsor_id) REFERENCES sponsor(person_id),
	CONSTRAINT FK_sponsor_event_eid FOREIGN KEY (event_id) REFERENCES sql_event(event_id),
	CONSTRAINT FK_sponsor_event_spid FOREIGN KEY (sponsor_presentation_id) REFERENCES sponsor_presentation(sponsor_presentation_id)
);