
CREATE TABLE STUDENT (
    StudentID    INT PRIMARY KEY,
    StudentName  VARCHAR(100),
    StudentMajor VARCHAR(50)
);

CREATE TABLE PARTICIPATION (
    StudentID   INT,
    ProjectID   INT,
    Role        VARCHAR(50),
    HoursWorked INT,
    StartDate   DATE,
    EndDate     DATE,
    PRIMARY KEY (StudentID, ProjectID),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (ProjectID) REFERENCES PROJECT(ProjectID)
);

CREATE TABLE SUPERVISOR (
    SupervisorID   INT PRIMARY KEY,
    SupervisorName VARCHAR(100),
    SupervisorDept VARCHAR(50)
);

CREATE TABLE PROJECT (
    ProjectID    INT PRIMARY KEY,
    ProjectTitle VARCHAR(150),
    ProjectType  VARCHAR(50),
    SupervisorID INT,
    FOREIGN KEY (SupervisorID) REFERENCES SUPERVISOR(SupervisorID)
);