-- DROP DATABASE University
CREATE DATABASE University
GO
USE University 


CREATE TABLE LectureRooms
(
	Id INT PRIMARY KEY IDENTITY,
	Building INT NOT NULL,
	[Name] NVARCHAR(50) NOT NULL ,

	CONSTRAINT CK_LectureRooms_Building CHECK(Building BETWEEN 1 AND 5),
	CONSTRAINT CK_LectureRooms_Name CHECK([Name] != ' '),
    CONSTRAINT UQ_LectureRooms_Name UNIQUE([Name])

)


CREATE TABLE Teachers
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL ,
	Surname NVARCHAR(50) NOT NULL , 
	
	CONSTRAINT CK_Teachers_Name CHECK([Name] != ' '), 
	CONSTRAINT CK_Teachers_Surname CHECK(Surname != ' ') 
)



CREATE TABLE Subjects
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(100) NOT NULL,

	CONSTRAINT CK_Subjects_Name CHECK([Name] != ' ' ),
	CONSTRAINT UQ_Subjects_Name UNIQUE([Name])
)




CREATE TABLE Heads
(
	Id INT PRIMARY KEY IDENTITY,
	TeacherId INT NOT NULL,

	CONSTRAINT FK_Heads_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)




CREATE TABLE Assistants
(
   Id INT PRIMARY KEY IDENTITY,
   TeacherId INT NOT NULL,

   CONSTRAINT FK_Assistants_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
) 



CREATE TABLE Curators
(
	Id INT PRIMARY KEY IDENTITY,
	TeacherId INT NOT NULL,

	CONSTRAINT FK_Curators_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)




CREATE TABLE Deans
(
	Id INT PRIMARY KEY IDENTITY,
	TeacherId INT NOT NULL,

	CONSTRAINT FK_Deans_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)



CREATE TABLE Lectures
(
	Id INT PRIMARY KEY IDENTITY,
	SubjectId INT NOT NULL,
	TeacherId  INT NOT NULL,

	CONSTRAINT FK_Lectures_SubjectId FOREIGN KEY (SubjectId) REFERENCES Subjects(Id),
	CONSTRAINT FK_Lectures_TeacherId FOREIGN KEY (TeacherId) REFERENCES Teachers(Id)
)




CREATE TABLE Faculties
(
	Id INT PRIMARY KEY IDENTITY,
	Building INT NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	DeanId INT NOT NULL,

	CONSTRAINT CK_Faculties_Building CHECK(Building BETWEEN 1 AND 5),
	CONSTRAINT CK_Faculties_Name CHECK([Name] != ' '),
	CONSTRAINT UQ_Faculties_Name UNIQUE([Name]),
	CONSTRAINT FK_Faculties_DeanId FOREIGN KEY (DeanId) REFERENCES Deans(Id)

)

CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY,
	Building INT NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	FacultyId INT NOT NULL,
	HeadId INT NOT NULL,

	CONSTRAINT CK_Departments_Building CHECK(Building BETWEEN 1 AND 5),
	CONSTRAINT CK_Departments_Name CHECK([Name] != ' '),
	CONSTRAINT UQ_Departments_Name UNIQUE([Name]),
	CONSTRAINT FK_Departments_FacultyId FOREIGN KEY (FacultyId) REFERENCES Faculties(Id),
	CONSTRAINT FK_Departments_HeadId FOREIGN KEY (HeadId) REFERENCES Heads(Id)
)


CREATE TABLE Groups
(
   Id INT PRIMARY KEY IDENTITY,
   [Name] NVARCHAR(50) NOT NULL ,
   [Year] INT NOT NULL ,
   DepartmentId INT  NOT NULL,
  
   CONSTRAINT CK_Groups_Year CHECK([Year] BETWEEN 1 AND 5),
   CONSTRAINT CK_Groups_Name CHECK([Name] != ' '),
   CONSTRAINT UQ_Groups_Name UNIQUE([Name]),
   CONSTRAINT FK_Groups_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
)



CREATE TABLE GroupsCurators
(
	Id INT PRIMARY KEY IDENTITY,
	CuratorId INT NOT NULL,
	GroupId INT NOT NULL,

	CONSTRAINT FK_GroupsCurators_CuratorId FOREIGN KEY (CuratorId) REFERENCES Curators(Id),
	CONSTRAINT FK_GroupsCurators_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id)
)



CREATE TABLE GroupsLectures
(
	Id INT PRIMARY KEY IDENTITY,
	GroupId INT NOT NULL,
	LectureId INT NOT NULL,

	CONSTRAINT FK_GroupsLectures_GroupId FOREIGN KEY (GroupId) REFERENCES Groups(Id),
	CONSTRAINT FK_GroupsLectures_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id)
)



CREATE TABLE Schedules
(
	Id INT PRIMARY KEY IDENTITY,
	Class INT NOT NULL,
	[DayOfWeek] INT NOT NULL,
	[Week] INT NOT NULL,
	LectureId INT NOT NULL,
	LectureRoomId INT NOT NULL,

	CONSTRAINT CK_Schedules_Class CHECK(Class BETWEEN 1 AND 8),
	CONSTRAINT CK_Schedules_DayOfWeek CHECK([DayOfWeek] BETWEEN 1 AND 7),
	CONSTRAINT CK_Schedules_Week CHECK([Week] BETWEEN 1 AND 52),
	CONSTRAINT FK_Schedules_LectureId FOREIGN KEY (LectureId) REFERENCES Lectures(Id),
	CONSTRAINT FK_Schedules_LectureRoomId FOREIGN KEY (LectureRoomId) REFERENCES LectureRooms(Id)

)

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


INSERT INTO LectureRooms (Building ,[Name]) VALUES (1, 'Room # 1');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (1, 'Room # 2');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (1, 'Room # 3');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (1, 'Room # 4');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (1, 'Room # 5');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (2, 'Room # 6');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (2, 'Room # 7');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (2, 'Room # 8');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (2, 'Room # 9');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (2, 'Room # 10');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (3, 'Room # 11');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (3, 'Room # 12');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (3, 'Room # 13');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (3, 'Room # 14');
INSERT INTO LectureRooms (Building ,[Name]) VALUES (3, 'Room # 15');


INSERT INTO Teachers ([Name], Surname) VALUES ('Minor', 'Dodgshun');
INSERT INTO Teachers ([Name], Surname) VALUES ('Elmer', 'Scallan');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jason', 'Scholey');
INSERT INTO Teachers ([Name], Surname) VALUES ('Sybil', 'Gibbins');
INSERT INTO Teachers ([Name], Surname) VALUES ('Ardene', 'Drake');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gib', 'Thick');
INSERT INTO Teachers ([Name], Surname) VALUES ('Guenevere', 'Martin');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jilli', 'Maber');
INSERT INTO Teachers ([Name], Surname) VALUES ('Foster', 'Pallesen');
INSERT INTO Teachers ([Name], Surname) VALUES ('Lissi', 'McIvor');
INSERT INTO Teachers ([Name], Surname) VALUES ('Denny', 'Truluck');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gordon', 'Leare');
INSERT INTO Teachers ([Name], Surname) VALUES ('Agnesse', 'Carnalan');
INSERT INTO Teachers ([Name], Surname) VALUES ('Rodi', 'Coveney');
INSERT INTO Teachers ([Name], Surname) VALUES ('Lucho', 'Kreber');
INSERT INTO Teachers ([Name], Surname) VALUES ('Georgina', 'Lasselle');
INSERT INTO Teachers ([Name], Surname) VALUES ('Maggee', 'Camps');
INSERT INTO Teachers ([Name], Surname) VALUES ('Drusy', 'Maly');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jaime', 'Mileham');
INSERT INTO Teachers ([Name], Surname) VALUES ('Evangelin', 'Heustace');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gabie', 'Baseley');
INSERT INTO Teachers ([Name], Surname) VALUES ('Derick', 'MacKintosh');
INSERT INTO Teachers ([Name], Surname) VALUES ('Augustine', 'Turpey');
INSERT INTO Teachers ([Name], Surname) VALUES ('Fee', 'Skyrm');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gabi', 'Symson');
INSERT INTO Teachers ([Name], Surname) VALUES ('Russell', 'Scothron');
INSERT INTO Teachers ([Name], Surname) VALUES ('Clarette', 'MacKeeg');
INSERT INTO Teachers ([Name], Surname) VALUES ('Rolfe', 'Marconi');
INSERT INTO Teachers ([Name], Surname) VALUES ('Eyde', 'Senecaut');
INSERT INTO Teachers ([Name], Surname) VALUES ('Elizabet', 'Jaquemar');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jemmy', 'Brehault');
INSERT INTO Teachers ([Name], Surname) VALUES ('Cloris', 'Scay');
INSERT INTO Teachers ([Name], Surname) VALUES ('Modesty', 'Lacase');
INSERT INTO Teachers ([Name], Surname) VALUES ('Merv', 'Brammar');
INSERT INTO Teachers ([Name], Surname) VALUES ('Obie', 'Pulster');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jimmy', 'Laughlan');
INSERT INTO Teachers ([Name], Surname) VALUES ('Elke', 'Merriton');
INSERT INTO Teachers ([Name], Surname) VALUES ('Pip', 'Lafoy');
INSERT INTO Teachers ([Name], Surname) VALUES ('Sande', 'Newall');
INSERT INTO Teachers ([Name], Surname) VALUES ('Adolphus', 'Nottram');
INSERT INTO Teachers ([Name], Surname) VALUES ('Everard', 'Clewlowe');
INSERT INTO Teachers ([Name], Surname) VALUES ('Caro', 'Lyes');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gabby', 'Bernardt');
INSERT INTO Teachers ([Name], Surname) VALUES ('Susy', 'Kettlestring');
INSERT INTO Teachers ([Name], Surname) VALUES ('Brittaney', 'Bridgeland');
INSERT INTO Teachers ([Name], Surname) VALUES ('Ogden', 'Gumery');
INSERT INTO Teachers ([Name], Surname) VALUES ('Lorrin', 'Torbet');
INSERT INTO Teachers ([Name], Surname) VALUES ('Malia', 'Fransson');
INSERT INTO Teachers ([Name], Surname) VALUES ('Leroi', 'Glandfield');
INSERT INTO Teachers ([Name], Surname) VALUES ('Robbyn', 'Caudray');
INSERT INTO Teachers ([Name], Surname) VALUES ('Trip', 'Hallworth');
INSERT INTO Teachers ([Name], Surname) VALUES ('Gerek', 'Robelow');
INSERT INTO Teachers ([Name], Surname) VALUES ('Fritz', 'Horribine');
INSERT INTO Teachers ([Name], Surname) VALUES ('Kelley', 'Murrow');
INSERT INTO Teachers ([Name], Surname) VALUES ('Lorne', 'McMurty');
INSERT INTO Teachers ([Name], Surname) VALUES ('Malva', 'Jiroudek');
INSERT INTO Teachers ([Name], Surname) VALUES ('Jemimah', 'Boothman');
INSERT INTO Teachers ([Name], Surname) VALUES ('Sawyere', 'Newman');
INSERT INTO Teachers ([Name], Surname) VALUES ('Isabelle', 'Warne');
INSERT INTO Teachers ([Name], Surname) VALUES ('Packston', 'Killingback');
INSERT INTO Teachers ([Name], Surname) VALUES ('Stephani', 'Shelford');
INSERT INTO Teachers ([Name], Surname) VALUES ('Matthew', 'Iglesia');
INSERT INTO Teachers ([Name], Surname) VALUES ('Cathryn', 'Laverock');
INSERT INTO Teachers ([Name], Surname) VALUES ('Kerr', 'Lukovic');
INSERT INTO Teachers ([Name], Surname) VALUES ('Janine', 'Letts');
INSERT INTO Teachers ([Name], Surname) VALUES ('Rees', 'Forgan');
INSERT INTO Teachers ([Name], Surname) VALUES ('Georges', 'Cicerone');
INSERT INTO Teachers ([Name], Surname) VALUES ('Lianne', 'Bendare');
INSERT INTO Teachers ([Name], Surname) VALUES ('Amata', 'Dobey');
INSERT INTO Teachers ([Name], Surname) VALUES ('Edy', 'Steanyng');
INSERT INTO Teachers ([Name], Surname) VALUES ('Kippie', 'Tweedell');
INSERT INTO Teachers ([Name], Surname) VALUES ('Kerrie', 'Spenceley');



INSERT INTO Subjects ([Name]) VALUES ( 'Mastering Java Machine Learning');
INSERT INTO Subjects ([Name]) VALUES ( 'Learn C the Hard Way');
INSERT INTO Subjects ([Name]) VALUES ( 'C# 8.0 and .NET Core 5.0');
INSERT INTO Subjects ([Name]) VALUES ( 'The Adobe Photoshop CC Book for Digital Photographers');
INSERT INTO Subjects ([Name]) VALUES ('Gravit Designer User Guide');
INSERT INTO Subjects ([Name]) VALUES ( '‎Autodesk SketchBook in 2011');
INSERT INTO Subjects ([Name]) VALUES ( 'Practical Malware Analysis:');
INSERT INTO Subjects ([Name]) VALUES ( 'Computer Networks (5th Edition)');
INSERT INTO Subjects ([Name]) VALUES ( 'Administrative Thinkers');


INSERT INTO Deans (TeacherId) VALUES ( 32);
INSERT INTO Deans (TeacherId) VALUES ( 30);
INSERT INTO Deans (TeacherId) VALUES ( 31);

INSERT INTO Assistants (TeacherId) VALUES ( 11);
INSERT INTO Assistants (TeacherId) VALUES ( 10);
INSERT INTO Assistants (TeacherId) VALUES ( 13);
INSERT INTO Assistants (TeacherId) VALUES ( 38);
INSERT INTO Assistants (TeacherId) VALUES ( 12);
INSERT INTO Assistants (TeacherId) VALUES ( 15);
INSERT INTO Assistants (TeacherId) VALUES ( 17);
INSERT INTO Assistants (TeacherId) VALUES ( 14);
INSERT INTO Assistants (TeacherId) VALUES ( 18);
INSERT INTO Assistants (TeacherId) VALUES ( 16);
INSERT INTO Assistants (TeacherId) VALUES ( 20);
INSERT INTO Assistants (TeacherId) VALUES ( 48);
INSERT INTO Assistants (TeacherId) VALUES ( 36);
INSERT INTO Assistants (TeacherId) VALUES ( 19);
INSERT INTO Assistants (TeacherId) VALUES ( 37);
INSERT INTO Assistants (TeacherId) VALUES ( 39);
INSERT INTO Assistants (TeacherId) VALUES ( 35);
INSERT INTO Assistants (TeacherId) VALUES ( 45);
INSERT INTO Assistants (TeacherId) VALUES ( 40);
INSERT INTO Assistants (TeacherId) VALUES ( 43);
INSERT INTO Assistants (TeacherId) VALUES ( 41);
INSERT INTO Assistants (TeacherId) VALUES ( 53);
INSERT INTO Assistants (TeacherId) VALUES ( 42);
INSERT INTO Assistants (TeacherId) VALUES ( 34);
INSERT INTO Assistants (TeacherId) VALUES ( 46);
INSERT INTO Assistants (TeacherId) VALUES ( 51);
INSERT INTO Assistants (TeacherId) VALUES ( 49);
INSERT INTO Assistants (TeacherId) VALUES ( 50);
INSERT INTO Assistants (TeacherId) VALUES ( 44);
INSERT INTO Assistants (TeacherId) VALUES ( 52);
INSERT INTO Assistants (TeacherId) VALUES ( 47);

INSERT INTO Curators (TeacherId) VALUES ( 29);
INSERT INTO Curators (TeacherId) VALUES ( 23);
INSERT INTO Curators (TeacherId) VALUES ( 26);
INSERT INTO Curators (TeacherId) VALUES ( 25);
INSERT INTO Curators (TeacherId) VALUES ( 28);
INSERT INTO Curators (TeacherId) VALUES ( 22);
INSERT INTO Curators (TeacherId) VALUES ( 27);
INSERT INTO Curators (TeacherId) VALUES ( 24);
INSERT INTO Curators (TeacherId) VALUES ( 21);





INSERT INTO Heads (TeacherId) VALUES ( 8);
INSERT INTO Heads (TeacherId) VALUES ( 2);
INSERT INTO Heads (TeacherId) VALUES ( 5);
INSERT INTO Heads (TeacherId) VALUES ( 6);
INSERT INTO Heads (TeacherId) VALUES ( 4);
INSERT INTO Heads (TeacherId) VALUES ( 3);
INSERT INTO Heads (TeacherId) VALUES ( 7);
INSERT INTO Heads (TeacherId) VALUES ( 9);
INSERT INTO Heads (TeacherId) VALUES ( 1);

INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 2);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 7);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 12);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 6);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 8);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 7);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 12);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 6);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 8);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 5);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 4);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 11);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 10);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 44);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 56);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 23);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 22);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 35);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 3);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 9);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 1);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 33);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 21);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 13);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 14);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 15);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 16);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 17);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 16);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 19);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 20);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 21);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 24);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 25);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 26);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 27);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 28);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 29);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 30);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 31);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 32);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 33);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 34);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 36);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 37);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 38);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 33);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 34);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 33);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 40);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 41);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 42);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 42);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 43);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 45);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 46);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 47);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 48);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 49);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 50);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 51);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 52);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 3, 53);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 54);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 55);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 57);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 58);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 59);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 60);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 61);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 62);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 63);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 22);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 13);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 23);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 21);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 14);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 5);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 6);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 12);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 36);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 35);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 34);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 4, 23);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 1, 21);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 5, 14);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 2, 5);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 6, 6);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 12);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 8, 36);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 7, 35);
INSERT INTO Lectures (SubjectId,TeacherId) VALUES ( 9, 34);





INSERT INTO Faculties (Building,[Name],DeanId) VALUES (1,'Software Development',1);
INSERT INTO Faculties (Building,[Name],DeanId) VALUES (2,'Computer Graphics and Design',2);
INSERT INTO Faculties (Building,[Name],DeanId) VALUES (3,'Networks and Cybersecurity',3);




INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (1, 'Java',1,1);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (1, 'C++',1,2);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (1, 'C#',1,3);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (2, 'Photoshop',2,4);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (2,'Gravit Designer',2,5);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (2, 'Autodesk SketchBook',2,6);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (3, 'Cybersecurity',3,7);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (3, 'Networks',3,8);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (3, 'Administration',3,9);


-- dlya 7 zadanie pobolwe korpusov
INSERT INTO Faculties (Building,[Name],DeanId) VALUES (4,'Test faculties',3);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (4, 'Test Departmens1',4,9);
INSERT INTO Departments (Building,[Name],FacultyId,HeadId) VALUES (5, 'Test Departmens2',4,9);


INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_ru', 1, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_3911_az', 1, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_ru', 5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_1911_az', 2, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_ru', 1, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_2916_az', 4, 2);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_ru',  5, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FBM_4916_az',  6, 5);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_ru', 7, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_6911_az', 8, 1);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_ru',  9, 4);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('FSDM_5911_az',  7, 3);
INSERT INTO Groups ([Name], DepartmentId, [Year]) VALUES ('Otstalie_6699_aa',  1, 5); 


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


INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 4, 22, 57, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 27, 59, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 5, 84, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 5, 45, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 1, 31, 21, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 32, 25, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 5, 27, 87, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 5, 52, 26, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 5, 5, 2, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 5, 45, 86, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 3, 36, 22, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 4, 40, 45, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 5, 30, 57, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 49, 32, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 1, 14, 44, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 5, 22, 43, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 2, 51, 80, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 10, 36, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 4, 7, 13, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 16, 83, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 4, 44, 70, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 7, 42, 53, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 7, 45, 4, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 4, 3, 14, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 3, 25, 83, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 2, 15, 63, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 10);


INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 13);


INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 2, 82, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 4, 73, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 7, 16, 52, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 6, 41, 81, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 31, 57, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 3, 23, 1, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 5, 3, 86, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 37, 21, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 1, 18, 3, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 9, 89, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 7, 39, 61, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 6, 46, 18, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 3, 46, 61, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 2, 47, 29, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 4, 25, 89, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 6, 15, 31, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 6, 26, 88, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 4, 16, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 23, 16, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 3, 17, 52, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 10, 90, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 6, 34, 33, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 24, 24, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 5, 18, 13, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 5, 46, 68, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 2, 43, 22, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 1, 36, 89, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 5, 16, 60, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 1, 1, 3, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 5, 47, 16, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 1, 27, 54, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 3, 25, 10, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 4, 33, 75, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 2, 4, 81, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 2, 19, 34, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 2, 28, 47, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 40, 42, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 3, 14, 44, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 18, 64, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 4, 52, 37, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 7, 23, 45, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 4, 7, 1, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 6, 49, 66, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 45, 83, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 52, 19, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 7, 22, 54, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 25, 43, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 4, 12, 5, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 8, 50, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 3, 46, 27, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 6, 15, 66, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 5, 1, 19, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 8, 26, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 5, 49, 33, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 34, 40, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 46, 31, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 7, 50, 12, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 43, 3, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 31, 30, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 5, 9, 9, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 6, 16, 6, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 2, 7, 29, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 2, 52, 61, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 19, 61, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 39, 32, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 3, 36, 33, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 6, 51, 6, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 1, 31, 88, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 3, 23, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 2, 1, 62, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 1, 38, 86, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 17, 24, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 2, 4, 81, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 4, 12, 8, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 5, 15, 88, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 7, 41, 84, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 2, 45, 47, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 6, 52, 24, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 2, 17, 8, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 7, 26, 21, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 6, 23, 70, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 7, 35, 63, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 30, 2, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 4, 13, 57, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 4, 9, 89, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 47, 68, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 4, 24, 83, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 2, 44, 81, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 1, 2, 31, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 3, 26, 52, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 5, 24, 74, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 7, 19, 20, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 6, 42, 11, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 3, 8, 31, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 6, 46, 66, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 7, 41, 84, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 3, 5, 83, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 33, 84, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 2, 46, 16, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 6, 41, 67, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 39, 59, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 1, 36, 13, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 27, 65, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 2, 86, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 4, 48, 67, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 5, 15, 7, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 1, 22, 22, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 39, 46, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 6, 14, 73, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 6, 9, 25, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 6, 17, 50, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 5, 80, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 4, 45, 72, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 3, 11, 90, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 40, 3, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 3, 28, 9, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 6, 35, 15, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 2, 53, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 7, 13, 60, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 3, 20, 35, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 4, 43, 7, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 3, 28, 33, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 7, 17, 54, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 3, 52, 84, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 4, 11, 88, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 27, 66, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 14, 35, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 7, 35, 78, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 5, 26, 41, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 6, 23, 9, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 7, 1, 82, 6);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 7, 48, 8, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 6, 45, 20, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 1, 30, 23, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 5, 27, 60, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 7, 4, 24, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 3, 4, 53, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 7, 44, 54, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 7, 21, 35, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 2, 32, 40, 11);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 2, 27, 48, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 7, 26, 40, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 7, 26, 2, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 5, 29, 60, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 4, 15, 48, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 1, 3, 50, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 5, 31, 28, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 23, 62, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 7, 3, 7, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 2, 39, 75, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 2, 26, 37, 10);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 6, 34, 13, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 1, 32, 89, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 2, 21, 13, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 4, 16, 50, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 3, 12, 7, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 6, 31, 33, 4);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (7, 1, 30, 16, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 3, 14, 20, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 15, 39, 7);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 5, 12, 59, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 25, 90, 5);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 4, 29, 86, 8);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (4, 5, 32, 90, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (6, 1, 27, 79, 3);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (2, 5, 18, 67, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (1, 5, 30, 90, 13);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 4, 18, 68, 15);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 6, 42, 58, 14);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 6, 42, 65, 12);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 1, 21, 32, 9);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (8, 5, 2, 89, 2);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (3, 7, 51, 24, 1);
INSERT INTO Schedules (Class, [DayOfWeek], [Week], LectureId, LectureRoomId) VALUES (5, 2, 29, 41, 4);


--Запросы
--1. Вывести названия аудиторий, в которых читает лекции преподаватель “Edward Hopper”. (Augustine Turpey) 
SELECT DISTINCT LectureRooms.[Name]
FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN Schedules ON Schedules.LectureId = Lectures.Id
JOIN LectureRooms ON Schedules.LectureRoomId = LectureRooms.Id
WHERE CONCAT(Teachers.[Name],' ' + Teachers.Surname) LIKE 'Augustine Turpey'


--2. Вывести фамилии ассистентов, читающих лекции в группе “F505”. (FSDM_3911_ru)

SELECT Teachers.Surname 
FROM Teachers
JOIN Assistants ON Assistants.TeacherId = Teachers.Id
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Groups.Name LIKE 'FSDM_3911_ru'


--3. Вывести дисциплины, которые читает преподаватель “Alex Carmack” для групп 5-го курса. (Modesty Lacase)

SELECT Subjects.[Name]
FROM Subjects
JOIN Lectures ON Lectures.SubjectId = Subjects.Id
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
WHERE Groups.[Year] LIKE 5 AND CONCAT(Teachers.[Name],' ' + Teachers.Surname) LIKE 'Modesty Lacase'


--4. Вывести фамилии преподавателей, которые не читают лекции по понедельникам. 

--все преподы которые читают лекцию среду 
SELECT DISTINCT CONCAT(Teachers.[Name],' ' + Teachers.Surname)
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Schedules ON Schedules.LectureId = Lectures.Id 
WHERE Schedules.[DayOfWeek] = 1

--окончательный запрос
SELECT DISTINCT Teachers.Surname 
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Schedules ON Schedules.LectureId = Lectures.Id 
WHERE CONCAT(Teachers.[Name],' ' + Teachers.Surname)  <> ALL(SELECT DISTINCT CONCAT(Teachers.[Name],' ' + Teachers.Surname)
                                                             FROM Teachers
                                                             JOIN Lectures ON Teachers.Id = Lectures.TeacherId
                                                             JOIN Schedules ON Schedules.LectureId = Lectures.Id 
                                                             WHERE Schedules.[DayOfWeek] = 1)



--5. Вывести названия аудиторий, с указанием их корпусов, в которых нет лекций в среду второй недели на третьей паре. 

-- те аудитории где есть лекций в среду второй недели на третьей паре. 
SELECT LectureRooms.[Name]
FROM LectureRooms
JOIN Schedules ON Schedules.LectureRoomId = LectureRooms.Id
JOIN Lectures ON Schedules.LectureId = Lectures.Id
WHERE Schedules.[DayOfWeek] LIKE 3 AND [Week] LIKE 2


--окончательный запрос
SELECT DISTINCT LectureRooms.[Name] , LectureRooms.Building
FROM LectureRooms
JOIN Schedules ON Schedules.LectureRoomId = LectureRooms.Id
JOIN Lectures ON Schedules.LectureId = Lectures.Id
WHERE LectureRooms.[Name] <> ALL(SELECT LectureRooms.[Name]
                              FROM LectureRooms
                              JOIN Schedules ON Schedules.LectureRoomId = LectureRooms.Id
                              JOIN Lectures ON Schedules.LectureId = Lectures.Id
                              WHERE Schedules.[DayOfWeek] LIKE 3 AND [Week] LIKE 2)


--6. Вывести полные имена преподавателей факультета “Computer Science” ('Software Development'), которые не преподают группы кафедры “Software Development”. ('Java')

--1ый варинат
SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' 
FROM Teachers
JOIN Curators ON Curators.TeacherId = Teachers.Id
JOIN GroupsCurators ON GroupsCurators.CuratorId = Curators.Id
JOIN Groups ON GroupsCurators.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id 
WHERE  Faculties.[Name] LIKE 'Software Development' AND Departments.[Name] NOT LIKE 'Java'


--2ой вариант
SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name'
FROM Teachers
JOIN Curators ON Curators.TeacherId = Teachers.Id
JOIN GroupsCurators ON GroupsCurators.CuratorId = Curators.Id
JOIN Groups ON GroupsCurators.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Faculties.Id = Departments.FacultyId
WHERE Faculties.[Name] LIKE 'Software Development'
AND CONCAT(Teachers.[Name],' ' + Teachers.Surname) <> ALL(SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' 
                                                          FROM Teachers
                                                          JOIN Curators ON Curators.TeacherId = Teachers.Id
                                                          JOIN GroupsCurators ON GroupsCurators.CuratorId = Curators.Id
                                                          JOIN Groups ON GroupsCurators.GroupId = Groups.Id
                                                          JOIN Departments ON Groups.DepartmentId = Departments.Id
                                                          JOIN Faculties ON Faculties.Id = Departments.FacultyId
                                                          WHERE Departments.[Name] LIKE 'Java'  )



--7. Вывести список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий. 

SELECT Building FROM Faculties
UNION
SELECT Building FROM Departments
UNION
SELECT Building FROM  LectureRooms


--8. Вывести полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты. 


SELECT '1. Dean   :  ' + CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' FROM Teachers JOIN Deans ON Deans.TeacherId = Teachers.Id
UNION
SELECT '2. Heads  :  ' +  CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' FROM Teachers JOIN Heads ON Heads.TeacherId = Teachers.Id
UNION 
SELECT '3. Teacher :  ' + CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' 
FROM Teachers
WHERE CONCAT(Teachers.[Name],' ' + Teachers.Surname) <> ALL(SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) FROM Teachers JOIN Deans ON Deans.TeacherId = Teachers.Id)
AND CONCAT(Teachers.[Name],' ' + Teachers.Surname) <> ALL(SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) FROM Teachers JOIN Heads ON Heads.TeacherId = Teachers.Id)
AND CONCAT(Teachers.[Name],' ' + Teachers.Surname) <> ALL(SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) FROM Teachers JOIN Assistants ON Assistants.TeacherId = Teachers.Id)
AND CONCAT(Teachers.[Name],' ' + Teachers.Surname) <> ALL(SELECT CONCAT(Teachers.[Name],' ' + Teachers.Surname) FROM Teachers JOIN Curators ON Curators.TeacherId = Teachers.Id)
UNION
SELECT '4. Curators :  ' + CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' FROM Teachers JOIN Curators ON Curators.TeacherId = Teachers.Id
UNION
SELECT '5. Assistants :  ' + CONCAT(Teachers.[Name],' ' + Teachers.Surname) AS 'Full Name' FROM Teachers JOIN Assistants ON Assistants.TeacherId = Teachers.Id



--9. Вывести дни недели (без повторений), в которые имеются занятия в аудиториях “A311” и “A104” корпуса 6. (Otstalie_6699_aa ,FSDM_1921_az)

SELECT DISTINCT 
CASE
	WHEN Schedules.[DayOfWeek] = 1 THEN  'Monday'
	WHEN Schedules.[DayOfWeek] = 2 THEN  'Thuesday'
	WHEN Schedules.[DayOfWeek] = 3 THEN  'Wednesday'
	WHEN Schedules.[DayOfWeek] = 4 THEN  'Thursday'
	WHEN Schedules.[DayOfWeek] = 5 THEN  'Friday'
	WHEN Schedules.[DayOfWeek] = 6 THEN  'Saturday'
	WHEN Schedules.[DayOfWeek] = 7 THEN  'Sunday'
END AS 'Week of day'
FROM Schedules
JOIN Lectures ON Schedules.LectureId = Lectures.Id
JOIN GroupsLectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId =  Departments.Id
WHERE Groups.[Name] LIKE 'Otstalie_6699_aa' OR Groups.[Name] LIKE 'FSDM_1921_az' AND Departments.Building LIKE 6


























