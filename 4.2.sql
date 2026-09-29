CREATE TABLE STUDENT (
    StudentID    INT PRIMARY KEY,
    StudentMajor VARCHAR(50)
);

CREATE TABLE COURSE (
    CourseID   INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE INSTRUCTOR (
    InstructorID   INT PRIMARY KEY,
    InstructorName VARCHAR(100)
);

CREATE TABLE ROOM (
    Room     VARCHAR(10) PRIMARY KEY,
    Building VARCHAR(50)
);

CREATE TABLE SECTION (
    CourseID     INT NOT NULL,
    TimeSlot     VARCHAR(20) NOT NULL,
    InstructorID INT,
    Room         VARCHAR(10),
    PRIMARY KEY (CourseID, TimeSlot),
    FOREIGN KEY (CourseID)     REFERENCES COURSE(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES INSTRUCTOR(InstructorID),
    FOREIGN KEY (Room)         REFERENCES ROOM(Room)
);

CREATE TABLE ENROLLMENT (
    StudentID INT NOT NULL,
    CourseID  INT NOT NULL,
    TimeSlot  VARCHAR(20) NOT NULL,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID)          REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseID, TimeSlot) REFERENCES SECTION(CourseID, TimeSlot)
);