-- DROP DATABASE University
CREATE DATABASE University
GO
USE University 

---------------------------------------------------------------
CREATE TABLE Curators
(
	Id INT PRIMARY KEY IDENTITY ,
	[Name] NVARCHAR(50) NOT NULL ,
	Surname NVARCHAR(50) NOT NULL ,
	
	CONSTRAINT CK_Curators_Name CHECK([Name] != ' '),
	CONSTRAINT CK_Curators_Surname CHECK(Surname != ' ')
)


---------------------------------------------------------------
CREATE TABLE Faculties
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL ,

	CONSTRAINT CK_Faculties_Name CHECK([NAME] != ' '),
	CONSTRAINT UQ_Faculties_Name UNIQUE([Name])
)


---------------------------------------------------------------
CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY,
	Building INT NOT NULL ,
	Financing MONEY NOT NULL  DEFAULT(0),
	[Name] NVARCHAR(100) NOT NULL ,
	FacultyId INT NOT NULL ,

	CONSTRAINT CK_Departments_Financing CHECK(Financing >=0),
	CONSTRAINT CK_Departments_Building CHECK(Building BETWEEN 1 AND 5),
	CONSTRAINT CK_Departments_Name CHECK([Name] != ' '),
	CONSTRAINT UQ_Departments_Name  UNIQUE([Name]),
	CONSTRAINT FK_Departments_FacultyId FOREIGN KEY (FacultyId) REFERENCES Faculties(Id)
)


---------------------------------------------------------------
CREATE TABLE Groups
(
   Id INT PRIMARY KEY IDENTITY,
   [Name] NVARCHAR(50) NOT NULL ,
   [Year] INT NOT NULL ,
   DepartmentId INT  NOT NULL,
  
   CONSTRAINT CK_Groups_Year CHECK([Year] BETWEEN 0 AND 5),
   CONSTRAINT CK_Groups_Name CHECK([Name] != ' '),
   CONSTRAINT UQ_Groups_Name UNIQUE([Name]),
   CONSTRAINT FK_Groups_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)



---------------------------------------------------------------
CREATE TABLE GroupsCurators
(
	Id INT PRIMARY KEY IDENTITY,
	CuratorId INT NOT NULL,
	GroupId INT NOT NULL,

	CONSTRAINT FK_GroupsCurators_CuratorId FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
	CONSTRAINT FK_GroupsCurators_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
)



---------------------------------------------------------------
CREATE TABLE Subjects
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,

	CONSTRAINT CK_Subjects_Name CHECK([Name] != ' ' ),
	CONSTRAINT UQ_Subjects_Name UNIQUE([Name])
)



---------------------------------------------------------------
CREATE TABLE Teachers
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL ,
	Surname NVARCHAR(100) NOT NULL ,
	IsProfessor BIT NOT NULL DEFAULT(0),
	Salary MONEY NOT NULL,
	
	CONSTRAINT CK_Teachers_Name CHECK([Name] != ' '),
	CONSTRAINT CK_Teachers_Salary CHECK(Salary>0),
	CONSTRAINT CK_Teachers_Surname CHECK(Surname != ' ') 
)



---------------------------------------------------------------
CREATE TABLE Lectures
(
	Id INT PRIMARY KEY IDENTITY,
	[Date] DATE NOT NULL, 
	SubjectId INT NOT NULL,
	TeacherId  INT NOT NULL,

	CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
	CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)



---------------------------------------------------------------
CREATE TABLE GroupsLectures
(
	Id INT PRIMARY KEY IDENTITY,
	GroupId INT NOT NULL,
	LectureId INT NOT NULL,

	CONSTRAINT FK_GroupsLectures_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
	CONSTRAINT FK_GroupsLectures_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
)



---------------------------------------------------------------
CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL ,
	Surname NVARCHAR(100) NOT NULL ,
	Rating INT NOT NULL,
	GroupId INT NOT NULL, -- ETO pole sam dobavil iz za nalicie v nekotorix zaprosov
	
	CONSTRAINT CK_Students_Name CHECK([Name] != ' '),
	CONSTRAINT CK_Students_Rating CHECK(Rating BETWEEN 0 AND 5),
	CONSTRAINT CK_Students_Surname CHECK(Surname != ' ') ,
	CONSTRAINT FK_Students_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
)



-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Curators ([Name], Surname) VALUES ('Mersey', 'Derle');
INSERT INTO Curators ([Name], Surname) VALUES ('Roland', 'Hemms');
INSERT INTO Curators ([Name], Surname) VALUES ('Emelita', 'Older');
INSERT INTO Curators ([Name], Surname) VALUES ('Doretta', 'Newbury');
INSERT INTO Curators ([Name], Surname) VALUES ('Ulises', 'Manuello');
INSERT INTO Curators ([Name], Surname) VALUES ('Corie', 'Petel');
INSERT INTO Curators ([Name], Surname) VALUES ('Peggi', 'Corps');
INSERT INTO Curators ([Name], Surname) VALUES ('Mabelle', 'Churchlow');
INSERT INTO Curators ([Name], Surname) VALUES ('Loralie', 'Flury');
INSERT INTO Curators ([Name], Surname) VALUES ('Pavlov', 'Taudevin');
INSERT INTO Curators ([Name], Surname) VALUES ('Arlina', 'Sennett');
INSERT INTO Curators ([Name], Surname) VALUES ('Stanley', 'Cleeve');


INSERT INTO Faculties  VALUES ('Software Development');
INSERT INTO Faculties  VALUES ('Computer Graphics and Design');
INSERT INTO Faculties  VALUES ('Networks and Cybersecurity');


INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (1,'$47310.22', 'Java',1);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (1,'$31680.44', 'C++',1);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (1,'$41680.44', 'C#',1);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (2,'$12310.22', 'Photoshop',2);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (2,'$8680.44', 'Gravit Designer',2);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (2,'$11680.44', 'Autodesk SketchBook',2);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (3,'$28310.22', 'Cybersecurity',3);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (3,'$27680.44', 'Networks',3);
INSERT INTO Departments (Building,Financing, [Name],FacultyId) VALUES (3,'$21680.44', 'Administration',3);


INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_ru', 1, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_az', 1, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_ru', 5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_az', 2, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_ru', 1, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_az', 4, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_ru',  5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_az',  6, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_ru', 7, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_az', 8, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_ru',  9, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_az',  7, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('Otstalie_6699_aa',  1, 5); -- qruppa so srezami (dlya 6 zaprosa)


INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 3, 13);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 3, 10);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 5, 8);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (11, 2);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 6, 7);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  1, 12);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 7, 6);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (8, 5);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 9, 4);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  2, 11);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 10, 3);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 4, 9);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 12, 1);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 3, 6);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 5, 6);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (11, 6);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 6, 5);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  1, 4);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 7, 4);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (8, 3);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 9, 3);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES (  2, 2);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 10, 2);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 4, 2);
INSERT INTO GroupsCurators (CuratorId,GroupId) VALUES ( 12, 2);


INSERT INTO Subjects ([Name]) VALUES ( 'Mastering Java Machine Learning');
INSERT INTO Subjects ([Name]) VALUES ( 'Learn C the Hard Way');
INSERT INTO Subjects ([Name]) VALUES ( 'C# 8.0 and .NET Core 5.0');
INSERT INTO Subjects ([Name]) VALUES ( 'The Adobe Photoshop CC Book for Digital Photographers');
INSERT INTO Subjects ([Name]) VALUES ('Gravit Designer User Guide');
INSERT INTO Subjects ([Name]) VALUES ( '‎Autodesk SketchBook in 2011');
INSERT INTO Subjects ([Name]) VALUES ( 'Practical Malware Analysis:');
INSERT INTO Subjects ([Name]) VALUES ( 'Computer Networks (5th Edition)');
INSERT INTO Subjects ([Name]) VALUES ( 'Administrative Thinkers');



INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Minor', 'Dodgshun','$1825.81');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Elmer', 'Scallan',  '$1823.41');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jason', 'Scholey', '$1646.63');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Sybil', 'Gibbins',  '$1077.84');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Ardene', 'Drake', '$1446.59');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Gib', 'Thick',  '$1230.39');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Guenevere', 'Martin', '$1158.87');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jilli', 'Maber','$1497.38');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Foster', 'Pallesen', '$1854.09');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Lissi', 'McIvor',  '$956.88');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Denny', 'Truluck', '$1225.12');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Gordon', 'Leare',  '$678.96');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Agnesse', 'Carnalan', '$1093.26');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Rodi', 'Coveney','$1459.54');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Lucho', 'Kreber',  '$1920.77');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Georgina', 'Lasselle',  '$601.21');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Maggee', 'Camps',  '$1352.94');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Drusy', 'Maly',  '$1568.70');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jaime', 'Mileham', '$706.83');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Evangelin', 'Heustace', '$632.83');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Gabie', 'Baseley',  '$1083.40');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Derick', 'MacKintosh', '$659.30');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Augustine', 'Turpey', '$1415.32');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Fee', 'Skyrm',  '$1717.07');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Gabi', 'Symson',  '$1462.21');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Russell', 'Scothron',  '$1943.55');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Clarette', 'MacKeeg',  '$1556.48');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Rolfe', 'Marconi',  '$1484.97');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Eyde', 'Senecaut',  '$1831.47');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Elizabet', 'Jaquemar',  '$1183.21');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jemmy', 'Brehault',  '$725.61');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Cloris', 'Scay',  '$810.88');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Modesty', 'Lacase',  '$902.14');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Merv', 'Brammar',  '$754.72');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Obie', 'Pulster', '$1297.58');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jimmy', 'Laughlan',  '$1160.77');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Elke', 'Merriton', '$1077.31');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Pip', 'Lafoy', '$1483.53');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Sande', 'Newall',  '$1644.35');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Adolphus', 'Nottram', '$1403.70');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Everard', 'Clewlowe',  '$631.92');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Caro', 'Lyes', '$1020.15');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Gabby', 'Bernardt', '$967.90');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Susy', 'Kettlestring',  '$1807.43');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Brittaney', 'Bridgeland',  '$1007.38');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Ogden', 'Gumery', '$1376.90');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Lorrin', 'Torbet', '$602.27');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Malia', 'Fransson', '$981.20');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Leroi', 'Glandfield', '$1315.66');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Robbyn', 'Caudray',  '$1047.56');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Trip', 'Hallworth',  '$779.75');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Gerek', 'Robelow',  '$1338.09');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Fritz', 'Horribine','$1363.41');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Kelley', 'Murrow', '$787.76');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Lorne', 'McMurty', '$1258.62');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Malva', 'Jiroudek', '$700.32');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Jemimah', 'Boothman', '$670.61');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Sawyere', 'Newman', '$1171.59');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Isabelle', 'Warne', '$1500.96');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Packston', 'Killingback', '$930.02');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Stephani', 'Shelford',  '$1134.14');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Matthew', 'Iglesia', '$1148.40');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Cathryn', 'Laverock', '$947.53');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Kerr', 'Lukovic',  '$1766.67');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Janine', 'Letts',  '$1061.88');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Rees', 'Forgan','$692.65');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Georges', 'Cicerone', '$1181.71');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Lianne', 'Bendare',  '$1221.89');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Amata', 'Dobey', '$1030.10');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Edy', 'Steanyng', '$1293.19');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (1,'Kippie', 'Tweedell',  '$1584.27');
INSERT INTO Teachers (IsProfessor,[Name], Surname, Salary) VALUES (0,'Kerrie', 'Spenceley', '$1163.57');





INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-05-18', 9, 2);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-11', 6, 7);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-30', 1, 12);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-04-24', 7, 6);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-13', 5, 8);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-03-06', 6, 7);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-02-25', 1, 12);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-09-25', 7, 6);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-08-03', 5, 8);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-06-20', 8, 5);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-02', 9, 4);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-06-05', 2, 11);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-03-16', 3, 10);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-06-12', 3, 44);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-02-05', 3, 56);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-09-28', 3, 23);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-16', 3, 22);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-03-26', 3, 35);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-17',3, 3);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-09-13',4, 9);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-06',6, 1);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-03-31', 5, 33);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-22', 9, 21);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-22', 6, 13);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-28', 1, 14);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-31', 7, 15);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-19', 8, 16);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-22', 9, 17);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-02-26', 2, 16);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-04-03',3, 19);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-04-22',4, 20);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-24',6, 21);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-03-04', 5, 24);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-18', 9, 25);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-05-15', 6, 26);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-01', 1, 27);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-01-07', 7, 28);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-02-13', 8, 29);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-04-13', 9, 30);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-08-21', 2, 31);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-31',3, 32);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-10',4, 33);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-18',6, 34);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-30', 5, 36);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-30', 9, 37);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-08-13', 6, 38);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-14', 1, 33);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-03-19', 7, 34);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-26', 8, 33);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-11', 9, 40);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-24', 2, 41);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-02-17',3, 42);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-04-02',4, 42);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-09-25',6, 43);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-26',  5, 45);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-05-13', 9, 46);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-24', 6, 47);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-28', 1, 48);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-04-26', 7, 49);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-12-02', 8, 50);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-29', 9, 51);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-01-31', 2, 52);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-07-17',3, 53);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-10-27',4, 54);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-29',6, 55);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-05-02', 5, 57);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-08-10', 9, 58);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-04-10', 6, 59);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-05-06', 1, 60);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-11-07', 7, 61);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-03-07', 8, 62);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2021-01-09',  9, 63);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-01', 2, 22);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 1, 13);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 1, 23);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 4, 21);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 2, 14);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-05', 5, 5);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-04', 6, 6);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-05', 6, 12);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-06', 7, 36);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-07', 7, 35);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-07', 8, 34);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 4, 23);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 1, 21);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-02', 5, 14);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-05', 2, 5);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-04', 6, 6);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-05', 8, 12);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-06', 8, 36);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-07', 7, 35);
INSERT INTO Lectures ([Date],SubjectId,TeacherId) VALUES ('2020-01-07', 9, 34);
					

INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 22);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 25);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 47);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 69);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 1, 73);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 1, 74);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  1, 75);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 1, 77);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 1, 81);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 56);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 58);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 7);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (2, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 85);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 2, 41);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 44);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 21);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (  2, 74);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 76);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 12);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 9);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 24);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 3, 36);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 34);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 22);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 9);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 4, 46);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 26);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 13);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 37);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 78);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 79);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 5, 83);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 6);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 39);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 80);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 15);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 27);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 6, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 6);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 29);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 17);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 5);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 82);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 7, 41);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 18);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 30);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 5);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 3);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 42);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (8, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 31);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 19);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 43);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 9, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10,33);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 30);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 20);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10,45);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 2);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 10, 22);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 2);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 14);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 8);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 27);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 11);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 17);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 26);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 49);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 23);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 4);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 41);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 1);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES (11, 38);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 11, 35);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 13, 5);
INSERT INTO GroupsLectures (GroupId,LectureId) VALUES ( 13, 9);

insert into Students (GroupId,[Name], Surname, Rating) values (13,'Oktay', 'Aliev', 0); --srezavwiesya
insert into Students (GroupId,[Name], Surname, Rating) values (13,'Axmed', 'Cumaev', 0);--srezaviesya
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Gerianna', 'Deas', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Gerianna', 'Deas', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Rosana', 'McGettrick', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Flory', 'Pitcher', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Sigvard', 'Cardew', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Phip', 'Norcliff', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Harli', 'Krop', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Gage', 'Beer', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Mechelle', 'Taffs', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Peyter', 'Cast', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Hershel', 'Hawtry', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Pavel', 'Volya', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Zidan', 'Famin', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Akula', 'Ribyev', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Nastya', 'Maxmudova', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Nikita', 'Cerkasov', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Ced', 'Penchen', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Sawa', 'Puckov', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Dima', 'zaycev', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (1,'Farid', 'Abdullaev', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Scarface', 'Bellerby', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Dill', 'Ramberg', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Moyra', 'Ivashinnikov', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Yurik', 'Densell', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Lynn', 'Isted', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Tabbie', 'Archell', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Julietta', 'Gieraths', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Joelly', 'Frankling', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Petrina', 'Veness', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (11,'Sarina', 'Kinnock', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Daloris', 'Legat', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Viole', 'Shellsheere', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Arda', 'Caccavella', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Mario', 'Denk', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Archaimbaud', 'Zettler', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Merline', 'Mugford', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Emmet', 'Hoyles', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Cletis', 'Blackstone', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Tommy', 'Botting', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Chloette', 'Osgorby', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Virgilio', 'Dobing', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Artemus', 'Vernalls', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (12,'Vyky', 'Brunone', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Riordan', 'Yakebovitch', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Isa', 'Salmond', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Cherish', 'Scinelli', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Glori', 'Ecclesall', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Mellicent', 'Sherwood', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (2,'Monah', 'Telford', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Kat', 'Robel', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Colver', 'Bragge', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Pepe', 'Hercock', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Prescott', 'Dinis', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Mela', 'Bendell', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Melisande', 'Spinke', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Gabbey', 'Severn', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Carmen', 'Andryushin', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (10,'Guillermo', 'Pottes', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Judd', 'Humbles', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Janice', 'Loidl', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Jilly', 'Robertacci', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Zondra', 'Ausiello', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Ambrosi', 'Van der Kruijs', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Stacie', 'Fallow', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Salvidor', 'Sangra', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Worden', 'Keely', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Tim', 'Dearnaley', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Art', 'McKillop', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Camellia', 'Lantuff', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Ellsworth', 'Sitford', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (3,'Eal', 'Shackelton', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Elnora', 'Cromleholme', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Arleyne', 'McGregor', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Nickie', 'Rainsden', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Caitlin', 'Atkirk', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Lona', 'Jocelyn', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Kath', 'Maudlen', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Austin', 'Baxster', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Henrie', 'Tournie', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Vida', 'Gerring', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Tiffie', 'Neno', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Ezmeralda', 'Kohtler', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (5,'Annalee', 'Shuker', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Abrahan', 'Curlis', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Gigi', 'Brantzen', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Danny', 'Raleston', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Eloise', 'Watling', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Corette', 'Burel', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (4,'Archer', 'Saffen', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (6,'Lorena', 'Dampier', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Nicky', 'Loughney', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Karole', 'Martschke', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Robin', 'Settle', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Ryun', 'Sturch', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Tim', 'Eykelbosch', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (7,'Tait', 'Terrelly', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Robbie', 'Cruz', 2);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Stacy', 'Frugier', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Stacee', 'Pierpoint', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Simonette', 'Selly', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Charmine', 'Deason', 3);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Kandy', 'Coates', 5);
insert into Students (GroupId,[Name], Surname, Rating) values (8,'Jocko', 'Beenham', 0);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Eleonora', 'Segrave', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Cordie', 'Pennicott', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Leann', 'Flade', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Carleen', 'Rubinlicht', 1);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Melony', 'De Cristofalo', 4);
insert into Students (GroupId,[Name], Surname, Rating) values (9,'Dolly', 'Bosch', 0);
-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------



--Запросы 
--1. Вывести номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000. 

SELECT SubQuery.Building , SubQuery.[SumFinancing]
FROM (SELECT Departments.Building, SUM(Departments.Financing) as 'SumFinancing'
	  FROM Departments
	  GROUP BY Departments.Building) as SubQuery
WHERE SubQuery.[SumFinancing] > 100000



--2. Вывести названия групп 5-го курса кафедры “Software Development” (кафедры Java), которые имеют более 10 пар в первую неделю. 

-- 1ый учебный день 1-ой недели
SELECT MIN([Date])
FROM Lectures

--последний учебный день 1-ой неделя
SELECT (DATEADD(DD,7,MIN([Date]))) 
FROM Lectures


-- конечный запрос
SELECT Groups.[Name] , COUNT(Groups.[Name])
FROM Groups
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
WHERE Departments.[Name] = 'Java' AND  Groups.[Year] LIKE 5 AND [Date] < (SELECT (DATEADD(DD,7,MIN([Date]))) 
                                                                          FROM Lectures)
GROUP BY Groups.[Name]
 
 

--3. Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы “D221”. (FSDM_3911_ru)

-- рейтинг группы “D221”. (FSDM_3911_ru)
SELECT AVG(Students.Rating)
FROM Students
JOIN Groups ON Students.GroupId = Groups.Id
WHERE Groups.[Name] LIKE 'FSDM_3911_ru'

-- конечный запрос
SELECT Groups.[Name] , AVG(Students.Rating) AS 'Avg rating'
FROM Students
JOIN Groups ON Students.GroupId = Groups.Id
GROUP BY Groups.[Name]
HAVING AVG(Students.Rating) > All(SELECT AVG(Students.Rating)
                                 FROM Students
                                 JOIN Groups ON Students.GroupId = Groups.Id
                                 WHERE Groups.[Name] LIKE 'FSDM_3911_ru') 

--4. Вывести фамилии и имена преподавателей, ставка которых выше средней ставки профессоров. 

--средней ставки профессоров. 
SELECT AVG(Salary)
FROM Teachers
WHERE IsProfessor LIKE 1


-- конечный запрос
SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full name'
FROM Teachers
WHERE IsProfessor LIKE 0 AND Salary > ALL(SELECT AVG(Salary)
                                          FROM Teachers
                                          WHERE IsProfessor LIKE 1)


--5. Вывести названия групп, у которых больше одного куратора. 
 
SELECT Groups.[Name]
FROM Groups
JOIN GroupsCurators ON GroupsCurators.GroupId = Groups.Id
GROUP BY Groups.[Name]
HAVING COUNT(*) > 1


--6. Вывести названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) меньше, чем минимальный рейтинг групп 5-го курса. 

--  рейтинг групп 5-го курса. 
SELECT Groups.[Name], AVG(Students.Rating) as  AvgRating
FROM Students
JOIN Groups ON Students.GroupId = Groups.Id
WHERE Groups.[Year] LIKE 5
GROUP BY Groups.[Name] 


--минимальный  рейтинг групп 5-го курса. 
SELECT MIN(SubQuery.AvgRating)  AS MinRating
FROM (SELECT Groups.[Name], AVG(Students.Rating) AS AvgRating
      FROM Students
      JOIN Groups ON Students.GroupId = Groups.Id
      WHERE Groups.[Year] LIKE 5
      GROUP BY Groups.[Name]) AS SubQuery


-- конечный запрос
SELECT Groups.[Name]
FROM Groups
JOIN Students ON Students.GroupId = Groups.Id
GROUP BY Groups.[Name]
HAVING AVG(Students.Rating) < ALL(SELECT MIN(SubQuery.AvgRating)  AS MinRating
                                  FROM (SELECT Groups.[Name], AVG(Students.Rating) AS AvgRating
                                        FROM Students
                                        JOIN Groups ON Students.GroupId = Groups.Id
                                        WHERE Groups.[Year] LIKE 5
                                        GROUP BY Groups.[Name]) AS SubQuery)



--7. Вывести названия факультетов, суммарный фонд финансирования кафедр которых больше суммарного фонда финансирования кафедр факультета “Computer Science”. (Computer Graphics and Design)


-- суммарного фонда финансирования кафедр факультета “Computer Science”. (Computer Graphics and Design)
SELECT SUM(Departments.Financing) AS SumFinancing
FROM Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id
WHERE Faculties.[Name] LIKE 'Computer Graphics and Design'


--конечный
SELECT Faculties.[Name]
FROM Faculties
JOIN Departments ON Departments.FacultyId = Faculties.Id
GROUP BY Faculties.[Name]
HAVING SUM(Departments.Financing)  > ALL(SELECT SUM(Departments.Financing) AS SumFinancing
                                         FROM Faculties
                                         JOIN Departments ON Departments.FacultyId = Faculties.Id
                                         WHERE Faculties.[Name] LIKE 'Computer Graphics and Design')



--8. Вывести названия дисциплин и полные имена преподавателей, читающих наибольшее количество лекций по ним. 

-- количество читаемых лекций учителями по предмету . 
SELECT  Subjects.[Name],CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full name', COUNT(*) AS 'Count read'
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
GROUP BY  Subjects.[Name],CONCAT(Teachers.[Name],' ' + Teachers.Surname) 


--конечный запрос
--максимум читающих лекций по предмету разными учителями 
SELECT SubQuery.[Name], SubQuery.[Full name], MAX(SubQuery.[Count read]) as MaxRead
FROM (SELECT  Subjects.[Name],CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full name', COUNT(*) AS 'Count read'
      FROM Lectures
      JOIN Teachers ON Lectures.TeacherId = Teachers.Id
      JOIN Subjects ON Lectures.SubjectId = Subjects.Id
      JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
      GROUP BY  Subjects.[Name],CONCAT(Teachers.[Name],' ' + Teachers.Surname)) as SubQuery
GROUP BY SubQuery.[Name], SubQuery.[Full name]


--9. Вывести название дисциплины, по которому читается меньше всего лекций. 

-- количество читаемых лекций по предметам
SELECT  Subjects.[Name], COUNT(*) AS 'Count read'
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
GROUP BY Subjects.[Name]




--минимум
SELECT MIN(SubQuery.[Count read]) as MinRead
FROM (SELECT  Subjects.[Name], COUNT(*) AS 'Count read'
      FROM Lectures
      JOIN Teachers ON Lectures.TeacherId = Teachers.Id
      JOIN Subjects ON Lectures.SubjectId = Subjects.Id
      JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
      GROUP BY Subjects.[Name]) AS SubQuery

	  	   	   
--конечный запрос
SELECT  Subjects.[Name] , COUNT(*) as MinRead
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
GROUP BY Subjects.[Name]
HAVING COUNT(*) = (SELECT MIN(SubQuery.[Count read]) as MinRead
                   FROM (SELECT  Subjects.[Name], COUNT(*) AS 'Count read'
                         FROM Lectures
                         JOIN Teachers ON Lectures.TeacherId = Teachers.Id
                         JOIN Subjects ON Lectures.SubjectId = Subjects.Id
                         JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
                         GROUP BY Subjects.[Name]) AS SubQuery)


--10. Вывести количество студентов и читаемых дисциплин на кафедре “Software Development”.(Gravit Designer) 
--(Предметы заполнялись рандомно)

SELECT  COUNT(*) AS 'Count student' , Subjects.[Name]
FROM Students
JOIN Groups ON Groups.Id = Students.GroupId
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
WHERE Departments.[Name] LIKE 'Gravit Designer'
GROUP BY  Subjects.[Name] 


