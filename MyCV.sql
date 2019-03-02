CREATE DATABASE MyCV;

CREATE TABLE Project
(
	id SERIAL PRIMARY KEY,
	name NAME NOT NULL,
	link TEXT NOT NULL,
	description TEXT
);

CREATE TABLE Skill
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	level INT NOT NULL,
	CONSTRAINT skill_level_check CHECK(level <= 100 and level > 0)
);

CREATE TABLE DevLanguage
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	level INT NOT NULL,
	description TEXT,
	CONSTRAINT devlanguage_level_check CHECK(level <=100 and level >0)
);

CREATE TABLE Specialized
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	description TEXT
);

CREATE TABLE  PersionalInfo
(
	id SERIAL PRIMARY KEY,
	major TEXT NOT NULL,
	specializedID INT NOT NULL,
	email TEXT NOT NULL,
	phone TEXT NOT NULL,
	about TEXT,
	CONSTRAINT persionalinfo_specialized_fk FOREIGN KEY(specializedID) REFERENCES Specialized(id) ON UPDATE CASCADE
);

CREATE TABLE Qualification
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	date DATE NOT NULL,
	result TEXT,
	expire DATE
);

CREATE TABLE Contact
(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	subject TEXT,
	message TEXT NOT NULL
);

CREATE TABLE Admins
(
	id TEXT PRIMARY KEY,
	password TEXT NOT NULL,
	email TEXT,
	name TEXT NOT NULL
);

CREATE TABLE Email
(
	email TEXT PRIMARY KEY
);

--Test Function--
-->select * from Email
-->drop database mycv

-----------------------Grant Access---------------------
--GRANT ALL PRIVILEGES ON DATABASE MyCV to chota5511;
--ALTER USER chota5511 WITH SUPERUSER;

------------------------Test Values----------------------
INSERT INTO Project(name,link,description) VALUES('Hotel Booking','https://github.com/chota5511/HotelBooking','An project website targeted to provide services to help people find their suiltable hotels easier with input destination or location. This project developt with ASP.NET MVC5 and PostgreSQL');
INSERT INTO Project(name,link,description) VALUES('Class Manager','https://github.com/chota5511/ClassManager','A subject project being created to help class leader manage his/her class easier. This project develop with WPF and using Microsoft SQL Server  as database.');
INSERT INTO Project(name,link,description) VALUES('Slay and Revenge','https://github.com/chota5511/CNPM','A project game using Unity game engine. This game is about a guy are on his revenge journey');

INSERT INTO Skill(name,level) VALUES('Logical Thinking',75);
INSERT INTO Skill(name,level) VALUES('Programming',50);
INSERT INTO Skill(name,level) VALUES('Creativity',50);
INSERT INTO Skill(name,level) VALUES('Public Speaking',65);
INSERT INTO Skill(name,level) VALUES('English',60);
INSERT INTO Skill(name,level) VALUES('Japanese',20);

INSERT INTO DevLanguage(name,level,description) VALUES('C/C++',40,'C++ is a high-level programming language developed by Bjarne Stroustrup at Bell Labs. C++ adds object-oriented features to its predecessor, C. C++ is one of the most popular programming language for graphical applications, such as those that run in Windows and Macintosh environments.');
INSERT INTO DevLanguage(name,level,description) VALUES('Ruby',50,'Ruby is an open source, object-oriented programming language created by Yukihiro “Matz” Matsumoto. Designed to provide a programming language that focuses on simplicity and productivity, the creation of Ruby drew its inspiration from Lisp, Smalltalk and Perl.');
INSERT INTO DevLanguage(name,level,description) VALUES('Rails',50,'Ruby on Rails. ... Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.');
INSERT INTO DevLanguage(name,level,description) VALUES('Java',50,'Java is a general-purpose computer-programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible.');
INSERT INTO DevLanguage(name,level,description) VALUES('C#/.NET',70,'C# is a general object-oriented programming (OOP) language for networking and Web development. C# is specified as a common language infrastructure (CLI) language. ... Initially, C# was developed as C-Like Object Oriented Language (Cool).');

INSERT INTO Specialized(name,description) VALUES('Infomation Security','Understand how the software work to prevert unauthorized access, use, disclosure, disruption, modification, inspection, recording or destruction of information.') ;
INSERT INTO Specialized(name,description) VALUES('Software Engineer','Working on design, development, testing and evaluation of software') ;

INSERT INTO PersionalInfo(major,specializedID,email,phone,about) VALUES('Infomation Technology',1,'quannnl92@gmail.com','(+84) 903343107','In order to gain more experience in real workplace environment and be able to know how to programs more effective at work. Moreover, I also want to improve my English skills and understand more about requests of Customer which is why I wish to apply my CV to your company');

INSERT INTO Admins(id,password,name) VALUES('admin','admin','admin');