-- DROP DATABASE Academy
CREATE DATABASE Academy
GO
USE Academy 

CREATE TABLE Groups
(
   Id INT PRIMARY KEY IDENTITY,
   [Name] NVARCHAR(50) NOT NULL  UNIQUE,
   Rating INT NOT NULL ,
   [Year] INT NOT NULL ,
  
   CONSTRAINT CK_Groups_Rating CHECK(Rating>=0 AND Rating <= 5),
   CONSTRAINT CK_Groups_Year CHECK([Year]>0 AND [Year] <= 5),
   CONSTRAINT CK_Groups_Name CHECK([Name] != ' '),
   CONSTRAINT UQ_Groups_Name UNIQUE([Name])
)


CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY,
	Financing MONEY NOT NULL  DEFAULT(0),
	[Name] NVARCHAR(100) NOT NULL ,

	CONSTRAINT CK_Departments_Financing CHECK(Financing >=0),
	CONSTRAINT CK_Departments_Name CHECK([Name] != ' '),
	CONSTRAINT UQ_Departments_Name  UNIQUE([Name])
)


CREATE TABLE Faculties
(
	Id INT PRIMARY KEY IDENTITY,
	Dean NVARCHAR(100) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL ,

	CONSTRAINT CK_Faculties_Name CHECK([NAME] != ' '),
	CONSTRAINT CK_Faculties_Dean CHECK(Dean != ' '),
	CONSTRAINT UQ_Faculties_Name UNIQUE([Name])
)

CREATE TABLE Teachers
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL ,
	Surname NVARCHAR(100) NOT NULL ,	
	EmploymentDate DATE NOT NULL ,
	Position NVARCHAR(100) NOT NULL,
	IsAssistant BIT NOT NULL DEFAULT(0),
	IsProfessor BIT NOT NULL DEFAULT(0),
	Salary MONEY NOT NULL,
	Premium MONEY NOT NULL DEFAULT(0),
	

	CONSTRAINT CK_Teachers_EmploymentDate CHECK(EmploymentDate >= '1990-01-01'),
	CONSTRAINT CK_Teachers_Name CHECK([NAME] != ' '),
	CONSTRAINT CK_Teachers_Position CHECK(Position != ' '),
	CONSTRAINT CK_Teachers_Premium CHECK(Premium>=0) ,
	CONSTRAINT CK_Teachers_Salary CHECK(Salary>0),
	CONSTRAINT CK_Teachers_Surname CHECK(Surname != ' ') 
)



insert into Groups ([Name], Rating, [Year]) values ('FSDM_3911_ru', 2, 5);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_3911_az', 4, 3);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_1911_ru', 5, 4);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_1911_az', 2, 2);
insert into Groups ([Name], Rating, [Year]) values ('FBM_2916_ru', 0, 5);
insert into Groups ([Name], Rating, [Year]) values ('FBM_2916_az', 4, 2);
insert into Groups ([Name], Rating, [Year]) values ('FBM_4916_ru',  1, 4);
insert into Groups ([Name], Rating, [Year]) values ('FBM_4916_az',  3, 1);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_6911_ru', 5, 1);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_6911_az', 1, 3);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_5911_ru',  3, 4);
insert into Groups ([Name], Rating, [Year]) values ('FSDM_5911_az',  2, 3);


insert into Faculties (Dean, [Name]) values ('Faith Unthank', 'Software Development');
insert into Faculties (Dean, [Name]) values ('Lianne Turvey', 'Computer Graphics and Design');
insert into Faculties (Dean, [Name]) values ('Sherrie Springer', 'Networks and Cybersecurity');


insert into Departments (Financing, [Name]) values ('$47310.22', 'Java');
insert into Departments (Financing, [Name]) values ('$31680.44', 'C++');
insert into Departments (Financing, [Name]) values ('$41680.44', 'C#');

insert into Departments (Financing, [Name]) values ('$12310.22', 'Photoshop');
insert into Departments (Financing, [Name]) values ('$8680.44', 'Gravit Designer');
insert into Departments (Financing, [Name]) values ('$11680.44', 'Autodesk SketchBook');

insert into Departments (Financing, [Name]) values ('$28310.22', 'Cybersecurity');
insert into Departments (Financing, [Name]) values ('$27680.44', 'Networks');
insert into Departments (Financing, [Name]) values ('$21680.44', 'Administration');


insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-10-16', 1, 0, 'Junior', 'Hogan', 'Ker', '$90.24', '$1942.77');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2008-02-14', 0, 1, 'Senior', 'Mersey', 'Derle', '$538.88', '$1825.87');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1999-01-07', 1, 0, 'Middle', 'Roland', 'Hemms', '$78.40', '$1424.51');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-11-28', 1, 0, 'Senior', 'Emelita', 'Older', '$438.57', '$941.47');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1993-07-08', 0, 1, 'Senior', 'Doretta', 'Newbury', '$223.16', '$1387.31');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-04-27', 1, 0, 'Middle', 'Ulises', 'Manuello', '$99.40', '$1465.61');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1991-02-08', 1, 0, 'Senior', 'Corie', 'Petel', '$156.37', '$1382.33');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1995-07-19', 1, 0, 'Junior', 'Peggi', 'Corps', '$509.92', '$1354.95');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-02-08', 0, 1, 'Senior', 'Mabelle', 'Churchlow', '$233.20', '$1698.91');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2003-12-25', 1, 0, 'Middle', 'Loralie', 'Flury', '$125.38', '$805.68');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1996-05-04', 0, 1, 'Senior', 'Pavlov', 'Taudevin', '$294.50', '$1508.75');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1993-04-03', 1, 0, 'Junior', 'Arlina', 'Sennett', '$466.79', '$1956.79');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2002-07-15', 0, 1, 'Senior', 'Stanley', 'Cleeve', '$220.85', '$894.78');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-08-08', 1, 0, 'Junior', 'Carroll', 'Seneschal', '$70.52', '$802.88');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-09-02', 0, 1, 'Middle', 'Salim', 'Cajkler', '$596.14', '$1688.10');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2006-10-03', 1, 0, 'Junior', 'Shep', 'Rangell', '$263.76', '$1602.63');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2003-07-02', 1, 0, 'Junior', 'Loren', 'Zoren', '$578.65', '$1577.32');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2003-05-04', 0, 1, 'Middle', 'Belia', 'O''Carrol', '$310.09', '$1280.98');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-06-24', 1, 0, 'Junior', 'Rafferty', 'McArdle', '$248.75', '$1790.61');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-05-22', 0, 1, 'Middle', 'Gaelan', 'McMillan', '$291.28', '$661.04');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2001-08-12', 1, 0, 'Junior', 'Minna', 'Messier', '$169.19', '$1767.64');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2016-06-24', 0, 1, 'Middle', 'Vivian', 'Szymanzyk', '$242.85', '$943.36');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2010-01-01', 1, 0, 'Junior', 'Darnell', 'Shinton', '$236.40', '$1024.43');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2004-09-24', 0, 1, 'Senior', 'Sunshine', 'Stobbes', '$120.58', '$1570.93');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2007-08-02', 1, 0, 'Junior', 'Northrup', 'Kob', '$61.68', '$839.23');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2017-10-03', 0, 1, 'Senior', 'Cathlene', 'Prescote', '$387.56', '$1698.65');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2006-11-07', 1, 0, 'Junior', 'Osborn', 'Blythe', '$107.54', '$1717.63');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2005-12-17', 0, 1, 'Senior', 'Minor', 'Dodgshun', '$554.75', '$1825.81');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1996-09-21', 1, 0, 'Junior', 'Elmer', 'O'' Scallan', '$264.65', '$1823.41');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-03-30', 0, 1, 'Senior', 'Jason', 'Scholey', '$500.35', '$1646.63');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1990-08-24', 1, 0, 'Junior', 'Sybil', 'Gibbins', '$379.93', '$1077.84');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2012-10-18', 0, 1, 'Senior', 'Ardene', 'Drake', '$316.70', '$1446.59');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-01-26', 1, 0, 'Junior', 'Gib', 'Thick', '$337.41', '$1230.39');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2016-06-30', 0, 1, 'Senior', 'Guenevere', 'Martin', '$574.83', '$1158.87');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-07-28', 1, 0, 'Junior', 'Jilli', 'Maber', '$336.46', '$1497.38');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1995-03-06', 1, 0, 'Junior', 'Foster', 'Pallesen', '$319.15', '$1854.09');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2001-03-28', 1, 0, 'Junior', 'Lissi', 'McIvor', '$479.47', '$956.88');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2013-09-25', 0, 1, 'Senior', 'Denny', 'Truluck', '$471.08', '$1225.12');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-06-15', 1, 0, 'Junior', 'Gordon', 'Leare', '$128.48', '$678.96');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1992-03-27', 0, 1, 'Senior', 'Agnesse', 'Carnalan', '$511.53', '$1093.26');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-07-14', 1, 0, 'Junior', 'Rodi', 'Coveney', '$420.60', '$1459.54');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-01-10', 1, 0, 'Junior', 'Lucho', 'Kreber', '$513.81', '$1920.77');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2002-03-22', 1, 0, 'Middle', 'Georgina', 'Lasselle', '$404.98', '$601.21');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1993-08-15', 1, 0, 'Middle', 'Maggee', 'Camps', '$238.11', '$1352.94');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-05-27', 1, 0, 'Middle', 'Drusy', 'Maly', '$99.70', '$1568.70');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2013-04-29', 1, 0, 'Middle', 'Jaime', 'Mileham', '$132.46', '$706.83');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2004-03-12', 1, 0, 'Middle', 'Evangelin', 'Heustace', '$508.62', '$632.83');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2012-01-28', 1, 0, 'Middle', 'Gabie', 'Baseley', '$63.63', '$1083.40');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2017-12-10', 1, 0, 'Middle', 'Derick', 'MacKintosh', '$231.62', '$659.30');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1994-04-01', 1, 0, 'Middle', 'Augustine', 'Turpey', '$458.09', '$1415.32');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1993-09-26', 1, 0, 'Middle', 'Fee', 'Skyrm', '$556.33', '$1717.07');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2011-05-30', 1, 0, 'Middle', 'Gabi', 'Symson', '$583.81', '$1462.21');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2008-02-01', 0, 1, 'Senior', 'Russell', 'Scothron', '$181.39', '$1943.55');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1991-12-12', 1, 0, 'Middle', 'Clarette', 'MacKeeg', '$248.99', '$1556.48');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2008-01-02', 1, 0, 'Middle', 'Rolfe', 'Marconi', '$548.67', '$1484.97');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2006-04-16', 0, 1, 'Middle', 'Eyde', 'Senecaut', '$519.78', '$1831.47');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-04-15', 1, 0, 'Middle', 'Elizabet', 'Jaquemar', '$297.76', '$1183.21');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2015-05-15', 1, 0, 'Senior', 'Jemmy', 'Brehault', '$191.54', '$725.61');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1993-04-17', 0, 1, 'Middle', 'Cloris', 'Scay', '$222.00', '$810.88');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1995-03-20', 1, 0, 'Senior', 'Modesty', 'Lacase', '$77.52', '$902.14');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-03-19', 0, 1, 'Middle', 'Merv', 'Brammar', '$99.61', '$754.72');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2000-12-18', 1, 0, 'Senior', 'Obie', 'Pulster', '$232.58', '$1297.58');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2009-03-18', 0, 1, 'Senior', 'Jimmy', 'Laughlan', '$273.94', '$1160.77');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2012-12-16', 1, 0, 'Middle', 'Elke', 'Merriton', '$246.99', '$1077.31');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2001-06-24', 0, 1, 'Senior', 'Pip', 'Lafoy', '$157.68', '$1483.53');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1999-09-23', 0, 1, 'Senior', 'Sande', 'Newall', '$382.18', '$1644.35');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1991-08-23', 1, 0, 'Middle', 'Adolphus', 'Nottram', '$313.22', '$1403.70');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2017-01-19', 0, 1, 'Senior', 'Everard', 'Clewlowe', '$201.41', '$631.92');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-08-07', 1, 0, 'Senior', 'Caro', 'Lyes', '$152.43', '$1020.15');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1998-10-10', 0, 1, 'Middle', 'Gabby', 'Bernardt', '$470.91', '$967.90');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2010-11-28', 1, 0, 'Junior', 'Susy', 'Kettlestring', '$558.33', '$1807.43');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2010-04-23', 0, 1, 'Senior', 'Brittaney', 'Bridgeland', '$456.13', '$1007.38');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2016-02-02', 1, 0, 'Junior', 'Ogden', 'Gumery', '$560.83', '$1376.90');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1996-03-15', 0, 1, 'Senior', 'Lorrin', 'Torbet', '$416.04', '$602.27');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2018-09-13', 1, 0, 'Junior', 'Malia', 'Fransson', '$148.86', '$981.20');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-05-18', 0, 1, 'Senior', 'Leroi', 'Glandfield', '$69.66', '$1315.66');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2007-10-30', 1, 0, 'Middle', 'Robbyn', 'Caudray', '$348.48', '$1047.56');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2015-12-10', 1, 0, 'Middle', 'Trip', 'Hallworth', '$386.10', '$779.75');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2003-11-21', 1, 0, 'Middle', 'Gerek', 'Robelow', '$256.75', '$1338.09');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2007-03-27', 1, 0, 'Middle', 'Rabi', 'Foux', '$59.84', '$1358.61');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2017-02-22', 1, 0, 'Middle', 'Fritz', 'Horribine', '$359.44', '$1363.41');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1992-03-31', 1, 0, 'Middle', 'Kelley', 'Murrow', '$202.56', '$787.76');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2001-08-25', 1, 0, 'Middle', 'Lorne', 'McMurty', '$483.22', '$1258.62');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2017-07-04', 1, 0, 'Middle', 'Malva', 'Jiroudek', '$485.25', '$700.32');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1995-09-03', 1, 0, 'Middle', 'Jemimah', 'Boothman', '$522.97', '$670.61');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2014-12-05', 1, 0, 'Middle', 'Sawyere', 'Newman', '$173.77', '$1171.59');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1992-12-23', 1, 0, 'Middle', 'Isabelle', 'Warne', '$304.69', '$1500.96');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2009-05-19', 0, 1, 'Senior', 'Packston', 'Killingback', '$535.89', '$930.02');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1999-03-15', 1, 0, 'Middle', 'Stephani', 'Shelford', '$496.28', '$1134.14');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2002-09-16', 0, 1, 'Senior', 'Matthew', 'Iglesia', '$379.03', '$1148.40');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2004-08-30', 1, 0, 'Junior', 'Cathryn', 'Laverock', '$345.50', '$947.53');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2005-04-30', 0, 1, 'Senior', 'Kerr', 'Lukovic', '$121.79', '$1766.67');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2006-10-15', 0, 1, 'Senior', 'Janine', 'Letts', '$456.97', '$1061.88');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2009-09-08', 1, 0, 'Junior', 'Rees', 'Forgan', '$501.04', '$692.65');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2015-07-17', 0, 1, 'Senior', 'Georges', 'Cicerone', '$305.59', '$1181.71');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2009-11-24', 1, 0, 'Middle', 'Lianne', 'Bendare', '$584.14', '$1221.89');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-09-14', 1, 0, 'Junior', 'Amata', 'Dobey', '$63.00', '$1030.10');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('1996-05-05', 0, 1, 'Senior', 'Edy', 'Steanyng', '$348.18', '$1293.19');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2020-10-12', 1, 0, 'Junior', 'Kippie', 'Tweedell', '$523.89', '$1584.27');
insert into Teachers (EmploymentDate, IsAssistant, IsProfessor, Position, Name, Surname, Premium, Salary) values ('2019-07-22', 1, 0, 'Middle', 'Kerrie', 'Spenceley', '$292.54', '$1163.57');




--Задания
--1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке.

SELECT * 
FROM Departments
ORDER BY ID DESC

--2. Вывести названия групп и их рейтинги, используя в качестве названий выводимых полей “Group Name” и “Group Rating” соответственно.

SELECT [Name] AS 'Group Name',Rating AS 'Group Rating'
FROM Groups

--3. Вывести для преподавателей их фамилию, процент ставки по отношению к надбавке и процент ставки по отношению к зарплате (сумма ставки и надбавки).

SELECT Surname , 
Premium/Salary*100 AS 'Premium (%)', -- 'Percent Premium to Salary',
Salary/(Salary+Premium)*100 AS 'Salary (%)' , --'Percent Salary to FULL Salary'
Salary + Premium AS 'Salary with Premium ($)' 
FROM Teachers

--4. Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”.

SELECT 'The dean of faculty '+[Name] + ' is ' + Dean AS 'Full info'
FROM Faculties

--5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.

SELECT Surname
FROM Teachers
WHERE IsProfessor LIKE 1 AND Salary > 1050

--6. Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.

SELECT [Name]
FROM Departments
WHERE Financing < 11000 OR Financing > 25000

--7. Вывести названия факультетов кроме факультета “Computer Science”.( Заменил на "Software Development")

SELECT [Name]
FROM Faculties
WHERE [Name] <> 'Software Development' --OR ( Name NOT LIKE 'Software Development' OR  Name != 'Software Development')

--8. Вывести фамилии и должности преподавателей, которые не являются профессорами.

SELECT Surname,Position
FROM Teachers
WHERE IsProfessor <> 1

--9. Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550.

SELECT Surname,Position,Salary  AS 'Salary ($)',Premium  AS 'Premium ($)'
FROM Teachers
WHERE IsAssistant LIKE 1 AND Premium BETWEEN 160 AND 550


--10.Вывести фамилии и ставки ассистентов.

SELECT Surname,Salary  AS 'Salary ($)'
FROM Teachers
WHERE IsAssistant LIKE 1

--11.Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000.

SELECT Surname,Position
FROM Teachers
WHERE EmploymentDate < '01.01.2000'

--12.Вывести названия кафедр, которые в алфавитном порядке располагаются до кафедры “Software Development”. (iz za otsustvie kafedri zamenil na Cybersecurity)
--Выводимое поле должно иметь название “Name of Department”.

SELECT [Name] AS 'Name of Department'
FROM Departments
WHERE [Name] < 'Cybersecurity'
ORDER BY [Name] 

--13.Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200.

SELECT Surname
FROM Teachers
WHERE IsAssistant LIKE 1 AND (Salary+Premium) <= 1200

--14.Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4.

SELECT [Name]
FROM Groups
WHERE [Year] LIKE 5 AND Rating BETWEEN 2 AND 4

--15.Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.

SELECT Surname
FROM Teachers
WHERE IsAssistant LIKE 1 AND Salary <550  OR Premium <200