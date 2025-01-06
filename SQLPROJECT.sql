CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    Organizer VARCHAR(100)
);

INSERT INTO Events VALUES (1, 'Tech Summit', TO_DATE('2025-02-10', 'YYYY-MM-DD'), 'ABC Corp');
INSERT INTO Events VALUES (2, 'Business Workshop', TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'XYZ Ltd');
INSERT INTO Events VALUES (3, 'E Summit', TO_DATE('2025-02-02', 'YYYY-MM-DD'), 'IIT Bombay');
INSERT INTO Events VALUES (4, 'Pitch Perfect', TO_DATE('2025-03-19', 'YYYY-MM-DD'), 'PQR Ltd');
INSERT INTO Events VALUES (5, 'Mood Indigo', TO_DATE('2025-06-29', 'YYYY-MM-DD'), 'OLM Pvt Ltd');

select * from Events;


CREATE TABLE Venues (
    VenueID INT PRIMARY KEY,
    VenueName VARCHAR(100),
    Capacity INT,
    CostPerDay DECIMAL(10, 2)
);

INSERT INTO Venues VALUES (1, 'Auditorium A', 500, 20000.00);
INSERT INTO Venues VALUES (2, 'Conference Hall B', 200, 10000.00);
INSERT INTO Venues VALUES (3, 'Banquet Hall C', 300, 15000.00);
INSERT INTO Venues VALUES (4, 'Auditorium AC A1', 150, 20000.00);
INSERT INTO Venues VALUES (5, 'Conference Hall AC B1', 400, 25000.00);
INSERT INTO Venues VALUES (6, 'Banquet Hall AC C1', 150, 30000.00);

select * from Venues;


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    EventID INT,
    VenueID INT,
    BookingDate DATE,
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

INSERT INTO Bookings VALUES (1, 1, 1, TO_DATE('2025-02-09', 'YYYY-MM-DD'));
INSERT INTO Bookings VALUES (2, 2, 2, TO_DATE('2025-02-11', 'YYYY-MM-DD'));
INSERT INTO Bookings VALUES (3, 3, 3, TO_DATE('2025-04-24', 'YYYY-MM-DD'));
INSERT INTO Bookings VALUES (4, 4, 4, TO_DATE('2025-12-12', 'YYYY-MM-DD'));
INSERT INTO Bookings VALUES (5, 5, 5, TO_DATE('2025-12-31', 'YYYY-MM-DD'));

select * from Booking;


CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    EventID INT,
    ParticipantName VARCHAR(100),
    ContactInfo VARCHAR(100),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

INSERT INTO Participants VALUES (6, 1, 'John Doe', 'john@gmail.com');
INSERT INTO Participants VALUES (7, 2, 'Jane Smith', 'jane@gmail.com');
INSERT INTO Participants VALUES (8, 3, 'James Harish', 'james@gmail.com');
INSERT INTO Participants VALUES (9, 4, 'Kamala Jobs', 'kamala@gmail.com.com');
INSERT INTO Participants VALUES (10, 5, 'Harry Evil', 'harry@gmail.com');

select * from Participants;


SELECT VenueName 
FROM Venues 
WHERE VenueID NOT IN (
    SELECT VenueID 
    FROM Bookings 
    WHERE BookingDate = TO_DATE('2025-02-10', 'YYYY-MM-DD')
);

CREATE OR REPLACE PROCEDURE CalculateEventCost (EventIDInput INT) AS
    VenueCost DECIMAL(10,2);
    TotalCost DECIMAL(10,2);
BEGIN
    SELECT CostPerDay INTO VenueCost
    FROM Venues
    WHERE VenueID = (SELECT VenueID FROM Bookings WHERE EventID = EventIDInput);
    TotalCost := VenueCost + (VenueCost * 0.2);

    DBMS_OUTPUT.PUT_LINE('Total Cost for Event ' || EventIDInput || ': ' || TotalCost);
END;
/


CREATE OR REPLACE TRIGGER PreventDoubleBooking
BEFORE INSERT ON Bookings
FOR EACH ROW
DECLARE
    OverlapCount INT;
BEGIN
    SELECT COUNT(*)
    INTO OverlapCount
    FROM Bookings
    WHERE VenueID = :NEW.VenueID AND BookingDate = :NEW.BookingDate;

    IF OverlapCount > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'This venue is already booked for the selected date.');
    END IF;
END;
/
