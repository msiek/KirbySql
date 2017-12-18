DROP TABLE EMPLOYEE
CREATE TABLE EMPLOYEE (
EmployeeID INT IDENTITY(1,1)PRIMARY KEY,
EmployeeName VARCHAR (25),
)

DROP TABLE CLIENT
CREATE TABLE CLIENT (
ClientID INT IDENTITY (1,1) PRIMARY KEY,
BusinessName VARCHAR (50) NOT NULL,
ClientPhone CHAR (10) NOT NULL,
PromotionalConsideration BIT NOT NULL,
InvestmentAmount DECIMAL (6,2) NOT NULL,
EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID)
)

DROP TABLE PARTNERSHIP_CONTACT
CREATE TABLE PARTNERSHIP_CONTACT (
ContactID INT IDENTITY (1,1)PRIMARY KEY,
ContactName VARCHAR (25),
ContactAddress VARCHAR (50),
ContactCity CHAR (25),
ContactState CHAR (15),
ContactPostalCode CHAR (5),
ContactPhoneNumber CHAR (10) NOT NULL,
ContactEmail VARCHAR (35) NOT NULL,
)

DROP TABLE PARTNERSHIP
CREATE TABLE PARTNERSHIP (
PartnershipID INT IDENTITY (1,1) PRIMARY KEY,
TimeStamp DATETIME NOT NULL,
PartnershipDescription VARCHAR (200) NOT NULL,
ClientID INT FOREIGN KEY REFERENCES CLIENT(ClientID),
EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
ContactID INT FOREIGN KEY REFERENCES PARTNERSHIP_CONTACT(ContactID)
)

DROP TABLE REQUEST_LOCATION
CREATE TABLE REQUEST_LOCATION (
LocationID INT IDENTITY (1,1)PRIMARY KEY,
LocationName VARCHAR (100) NOT NULL,
LocationAddress VARCHAR (50) NOT NULL,
LocationCity CHAR (20) NOT NULL,
LocationState CHAR (25) NOT NULL,
LocationPostalCode CHAR (5) NOT NULL
)

DROP TABLE REQUEST
CREATE TABLE REQUEST (
RequestID INT IDENTITY (1,1) PRIMARY KEY,
PartnershipID INT FOREIGN KEY REFERENCES PARTNERSHIP(PartnershipID),
LocationID INT FOREIGN KEY REFERENCES REQUEST_LOCATION(LocationID),
Date DateTime NOT NULL,
EventName VARCHAR (100) NOT NULL
)

DROP TABLE TALENT
CREATE TABLE TALENT (
TalentID INT IDENTITY (1,1) PRIMARY KEY,
TalentName VARCHAR (35) NOT NULL,
TalentTitle VARCHAR (25) NOT NULL,
)

DROP TABLE PROMOCOMMERCIAL
CREATE TABLE PROMOCOMMERCIAL (
PromoID INT (1,1) PRIMARY KEY,
PromoPSA BIT NOT NULL,
PromoDescription VARCHAR (200) NOT NULL,
RequestID INT FOREIGN KEY REFERENCES REQUEST(RequestID),
TalentID INT FOREIGN KEY REFERENCES TALENT(TalentID)
)

DROP TABLE INTERVIEW
CREATE TABLE INTERVIEW (
InterviewID INT IDENTITY (1,1) PRIMARY KEY,
InterviewDescription VARCHAR (200) NOT NULL
)

ALTER TABLE INTERVIEW
ADD InterviewDate DateTime

ALTER TABLE INTERVIEW DROP COLUMN InterviewDate

INSERT INTO EMPLOYEE  (EmployeeID , EmployeeName)
VALUES (1, 'Christina Burzler')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (2 , 'Tracy Fryar')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (3 , 'Hannah Allen')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (4 , 'Blaine Holland')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (5 , 'Lynnwood Young')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (6 , 'Taylor HUcks')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (7 , 'Michael McDoughnah')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (8 , 'Jason Ashmawi')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (9 , 'Kirby Hood')

INSERT INTO EMPLOYEE (EmployeeID , EmployeeName)
VALUES (10 , 'Billy Huggins')

INSERT INTO CLIENT (ClientID , EmployeeID , BusinessName , ClientPhone , PromotionalConsideration , InvestmentAmount)
VALUES (1 , 1 , 'Banton Media' , '8432991221' , '1' , '3000.00')

INSERT INTO PARTNERSHIP_CONTACT (ContactID , ContactName , ContactAddress , ContactCity , ContactState , ContactPostalCode , ContactPhoneNumber, ContactEmail)
VALUES (1 , 'Brandie Turner' , '10607 SC-707 Suite 110' , 'Myrtle Beach' , 'South Carolina' , '29588' , '8432291221' , 'cburzler@wpde.com')

INSERT INTO PARTNERSHIP (PartnershipID , ClientID , ContactID , PartnershipDescription , TimeStamp)
VALUES (1 , 1 , 1 , 'We always partner with them on all events' , '12/1/2017 20:24:05')

INSERT INTO REQUEST_LOCATION (LocationID , LocationName , LocationAddress , LocationCity , LocationState, LocationPostalCode)
VALUES (1 , 'Murrells Inlet Marshwalk' , '4025 Hwy 17 Business' , 'Murrells Inlet' , 'South Carolina' , '29576')

INSERT INTO TALENT (TalentID , TalentName , TalentTitle)
VALUES (1 , 'Ed Piotrowski' , 'Cheif Meterologist')

INSERT INTO INTERVIEW (InterviewID , InterviewDescription)
VALUES (1 , 'Ed Live on the Marshwalk for the Kick off of the event. LIVE for 5p, 6p, 7p, newscasts.')

INSERT INTO REQUEST (RequestID , PartnershipID , LocationID, EventName , Date)
VALUES ( 1 , 1 , 1 , 'Christmas on the MARSHWALK' , '11/18/2017')

INSERT INTO PROMOCOMMERCIAL (PromoID , TalentID , RequestID , PromoPSA , PromoDescription )
VALUES (1 , 1 , 1 , '1' , 'Come see the NEW Christmas Light display on the Grand Stand. Walk along the Marshwalk this year for the holidays')

INSERT INTO CLIENT (ClientID , EmployeeID , BusinessName , ClientPhone , PromotionalConsideration , InvestmentAmount)
VALUES (2 , 10 , 'RNDC' , '8037390188' , '0' , '00.00')

INSERT INTO PARTNERSHIP_CONTACT (ContactID , ContactName , ContactAddress , ContactCity , ContactState , ContactPostalCode , ContactPhoneNumber, ContactEmail)
VALUES (2 , 'Will Stallings' , '410 Foster Brothers Drive' , 'West Columbia' , 'South Carolina' , '29172' , '8438779981' , 'Will.Stallings@RNDC-USA.com')

INSERT INTO PARTNERSHIP (PartnershipID , ClientID , ContactID , PartnershipDescription , TimeStamp)
VALUES (2 , 2 , 2 , 'Every year we cover the event with either a VO or Live shots. We also have entries if anyone would like to go, we just need to know who wants to go.' , '12/1/2017 22:04:35')

INSERT INTO REQUEST_LOCATION (LocationID , LocationName , LocationAddress , LocationCity , LocationState, LocationPostalCode)
VALUES (2 , 'Hot Fish Club' , '4911 Highway 17 Business' , 'Murrells Inlet' , 'South Carolina' , '29576')

INSERT INTO TALENT (TalentID , TalentName , TalentTitle)
VALUES (2 , 'Ed Piotrowski' , 'Cheif Meterologist')

INSERT INTO INTERVIEW (InterviewID , InterviewDescription)
VALUES (2 , 'No Interview Requested')

INSERT INTO REQUEST (RequestID , PartnershipID , LocationID, EventName , Date)
VALUES ( 2 , 2 , 2 , '11th Annual I Believe A Childrens Holiday Fundraiser' , '12/05/2017')

INSERT INTO PROMOCOMMERCIAL (PromoID , TalentID , RequestID , PromoPSA , PromoDescription)
VALUES (2 , 2 , 2 , '0' , 'They would like for Ed to be in the Promos. Help 4 Kids, Collins Kids, and The Cliff and Carolyn Foundation They help the ever growing amount of children in need in our area around Christmas.')

INSERT INTO CLIENT (ClientID , EmployeeID , BusinessName , ClientPhone , PromotionalConsideration , InvestmentAmount)
VALUES (3 , 10 , 'Krispy Kreme' , '8434571837' , '0' , '00.00')

INSERT INTO PARTNERSHIP_CONTACT (ContactID , ContactName , ContactAddress , ContactCity , ContactState , ContactPostalCode , ContactPhoneNumber, ContactEmail)
VALUES (3 , 'David Moore' , '2607 US-17 Business' , 'Garden City' , 'South Carolina' , '29576' , '9104711199' , 'dmoore200@hotmail.com')

INSERT INTO PARTNERSHIP (PartnershipID , ClientID , ContactID , PartnershipDescription , TimeStamp)
VALUES (3 , 3 , 3 , 'We will be partnering with the three area Krispy Kremes for the Annual Toys for Tots' , '12/1/2017 22:20:35')

INSERT INTO REQUEST_LOCATION (LocationID , LocationName , LocationAddress , LocationCity , LocationState, LocationPostalCode)
VALUES (3 , 'Krispy Kreme' , '2607 US-17 Business' , 'Garden City' , 'South Carolina' , '29576')

INSERT INTO REQUEST_LOCATION (LocationID , LocationName , LocationAddress , LocationCity , LocationState, LocationPostalCode)
VALUES (4 , 'Krispy Kreme' , '101 Rodeo Drive' , 'Myrtle Beach' , 'South Carolina' , '29579')

INSERT INTO REQUEST_LOCATION (LocationID , LocationName , LocationAddress , LocationCity , LocationState, LocationPostalCode)
VALUES (5 , 'Krispy Kreme' , '1300 Highway 17 S' , 'North Myrtle Beach' , 'South Carolina' , '29582')

INSERT INTO TALENT (TalentID , TalentName , TalentTitle)
VALUES (3 , 'Ed Piotrowski' , 'Cheif Meterologist')

INSERT INTO TALENT (TalentID , TalentName , TalentTitle)
VALUES (4 , 'Amanda Kensith' , 'Morning Reporter')

INSERT INTO TALENT (TalentID , TalentName , TalentTitle)
VALUES (5 , 'Cecil Chandler' , 'Anchor')

INSERT INTO INTERVIEW (InterviewID , InterviewDescription)
VALUES (3 , 'Interview with Ed during the 5p, 6p, 7p newscasts and live weather')

INSERT INTO INTERVIEW (InterviewID , InterviewDescription)
VALUES ( 4 , 'Interview with Amanda during the 5a, 6a, 7a morning newscasts')

INSERT INTO INTERVIEW (InterviewID , InterviewDescription)
VALUES (5 , 'Interview with Cecil for a LIVE Carolina and Live show at noon')

INSERT INTO REQUEST (RequestID , PartnershipID , LocationID, EventName , Date)
VALUES ( 3 , 3 , 3 , 'Annual Krispy Kreme Toys for Tots' , '12/08/2017')

INSERT INTO PROMOCOMMERCIAL (PromoID , TalentID , RequestID , PromoPSA , PromoDescription)
VALUES (3 , 3 , 3 , '0' , 'Promoting Toys for Tots. For every unwrapped new toy or $5 cash donation, receive a dozen free glazed donuts')

INSERT INTO PROMOCOMMERCIAL (PromoID , TalentID , RequestID , PromoPSA , PromoDescription)
VALUES (3 , 4 , 3 , '0' , 'Promoting Toys for Tots. For every unwrapped new toy or $5 cash donation, receive a dozen free glazed donuts')

INSERT INTO PROMOCOMMERCIAL (PromoID , TalentID , RequestID , PromoPSA , PromoDescription)
VALUES (3 , 5 , 3 , '0' , 'Promoting Toys for Tots. For every unwrapped new toy or $5 cash donation, receive a dozen free glazed donuts')

ALTER TABLE REQUEST_LOCATION
ADD CONSTRAINT 'South Carolina' UNIQUE (LocationState)

SELECT * FROM INTERVIEW

SELECT INTERVIEW.InterviewDescription , REQUEST.EventName , REQUEST.Date , CLIENT.PromotionalConsideration
FROM INTERVIEW
JOIN REQUEST ON INTERVIEW.InterviewID = REQUEST.RequestID
JOIN CLIENT ON REQUEST.PartnershipID = CLIENT.ClientID

SELECT DISTINCT REQUEST.EventName , PARTNERSHIP.PartnershipDescription , PARTNERSHIP.EmployeeID
FROM PARTNERSHIP
JOIN REQUEST ON REQUEST.RequestID = PARTNERSHIP.PartnershipID
JOIN PARTNERSHIP AS TotalP ON PARTNERSHIP.PartnershipID = REQUEST.EventName

SELECT * FROM REQUEST

GO
CREATE PROCEDURE dbo.InterviewForEvent AS
SELECT INTERVIEW.InterviewDescription , REQUEST.EventName , REQUEST.Date , CLIENT.PromotionalConsideration
FROM INTERVIEW
JOIN REQUEST ON INTERVIEW.InterviewID = REQUEST.RequestID
JOIN CLIENT ON REQUEST.PartnershipID = CLIENT.ClientID
GO

EXEC dbo.InterviewForEvent

ALTER TABLE REQUEST
ADD FOREIGN KEY (InterviewID) REFERENCES INTERVIEW (InterviewID)
