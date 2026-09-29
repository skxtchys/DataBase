CREATE TABLE FACULTY (
    FacultyID   INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Department  VARCHAR(50)
);

CREATE TABLE CLUB (
    ClubID      INT PRIMARY KEY,
    ClubName    VARCHAR(100) NOT NULL,
    FoundedDate DATE,
    AdvisorID   INT,
    FOREIGN KEY (AdvisorID) REFERENCES FACULTY(FacultyID)
);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName  VARCHAR(50),
    Major     VARCHAR(50)
);

CREATE TABLE MEMBERSHIP (
    StudentID INT NOT NULL,
    ClubID    INT NOT NULL,
    JoinDate  DATE NOT NULL,
    Position  VARCHAR(30) DEFAULT 'Member',
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ClubID)    REFERENCES CLUB(ClubID) ON DELETE CASCADE
);

CREATE TABLE ROOM (
    Room     VARCHAR(10) PRIMARY KEY,
    Building VARCHAR(50),
    Capacity INT
);

CREATE TABLE EVENT (
    EventID   INT PRIMARY KEY,
    ClubID    INT NOT NULL,
    EventName VARCHAR(100),
    EventDate DATE,
    StartTime TIME,
    EndTime   TIME,
    Room      VARCHAR(10),
    FOREIGN KEY (ClubID) REFERENCES CLUB(ClubID) ON DELETE CASCADE,
    FOREIGN KEY (Room)   REFERENCES ROOM(Room)
);

CREATE TABLE ATTENDANCE (
    StudentID INT NOT NULL,
    EventID   INT NOT NULL,
    Status    VARCHAR(20) DEFAULT 'Registered',
    PRIMARY KEY (StudentID, EventID),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (EventID)   REFERENCES EVENT(EventID) ON DELETE CASCADE
);

CREATE TABLE BUDGET (
    ClubID         INT NOT NULL,
    FiscalYear     INT NOT NULL,
    TotalAllocated DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ClubID, FiscalYear),
    FOREIGN KEY (ClubID) REFERENCES CLUB(ClubID) ON DELETE CASCADE
);

CREATE TABLE EXPENSE (
    ExpenseID   INT PRIMARY KEY,
    ClubID      INT NOT NULL,
    FiscalYear  INT NOT NULL,
    Amount      DECIMAL(10,2) NOT NULL,
    Category    VARCHAR(50),
    ExpenseDate DATE,
    Description VARCHAR(200),
    FOREIGN KEY (ClubID, FiscalYear) REFERENCES BUDGET(ClubID, FiscalYear)
);