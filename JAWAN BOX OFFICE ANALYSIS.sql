create database jawanboxoffice3weekanalysis;


use jawanboxoffice3weekanalysis;


CREATE TABLE Movie (
	MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseDate DATE
);

-- select * from Movie;
-- Table to store India Box Office Collection
CREATE TABLE IndiaBoxOffice (
    MovieID INT,
    OpeningDayAmount DECIMAL(10, 2),
    EndOfOpeningWeekendAmount DECIMAL(10, 2),
    Week1Amount DECIMAL(10, 2),
    Week2Amount DECIMAL(10, 2),
    Week3Amount DECIMAL(10, 2),
    LifetimeAmount DECIMAL(10, 2),
    PRIMARY KEY (MovieID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

-- select * from IndiaBoxOffice;


ALTER table IndiaBoxOffice
ADD COLUMN LifetimeAmount DECIMAL(10, 2);

-- Table to store Day Wise Box Office Collection
CREATE TABLE DayWiseCollection (
    MovieID INT,
    Day INT,
    Amount DECIMAL(10, 2),
    Performance VARCHAR(20),
    PRIMARY KEY (MovieID, Day),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

select * from DayWiseCollection;

-- Table to store Week Wise Box Office Collection
CREATE TABLE WeekWiseCollection (
    MovieID INT,
    Week INT,
    Amount DECIMAL(10, 2),
    Performance VARCHAR(20),
    PRIMARY KEY (MovieID, Week),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

select * from WeekWiseCollection;

-- Table to store Weekend Box Office Collection
CREATE TABLE WeekendCollection (
    MovieID INT,
    Weekend INT,
    Amount DECIMAL(10, 2),
    Performance VARCHAR(20),
    PRIMARY KEY (MovieID, Weekend),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

Select * from WeekEndCollection;


-- Table to store Overseas Box Office Collection
CREATE TABLE OverseasBoxOffice (
    MovieID INT,
    OpeningDayAmount DECIMAL(10, 2),
    OpeningWeekendAmount DECIMAL(10, 2),
    Week1Amount DECIMAL(10, 2),
    TopOverseasGross DECIMAL(10, 2),
    PRIMARY KEY (MovieID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

select * from OverseasBoxOffice;
-- Now we insert values into Movie Table --

INSERT INTO Movie (MovieID, Title, ReleaseDate)
VALUES
    (7, 'Jawan', '2023-09-07');

-- Now we insert values for IndiaBoxOffice--
INSERT INTO IndiaBoxOffice (MovieID, OpeningDayAmount, EndOfOpeningWeekendAmount, Week1Amount, Week2Amount, Week3Amount, Week4Amount, LifetimeAmount)
VALUES (7, 73.50, 203.00, 364.50, 143.50, 55.85, 40.10, 626.00);

-- Now we insert Values for Day Wise Box Office Collection
INSERT INTO DayWiseCollection (MovieID, Day, Amount, Performance) VALUES
(7, 1, 73.50, '0 % Red Box'),
(7, 2, 53.50, '27 % Red Box'),
(7, 3, 76.00, '42 % Red Box'),
(7, 4, 79.50, '5 % Red Box'),
(7, 5, 32.00, '60 % Red Box'),
(7, 6, 26.50, '17 % Red Box'),
(7, 7, 23.50, '11 % Red Box'),
(7, 8, 20.00, '15 % Red Box'),
(7, 9, 18.50, '8 % Red Box'),
(7, 10, 31.50, '70 % Red Box'),
(7, 11, 36.00, '14 % Red Box'),
(7, 12, 15.00, '58 % Red Box'),
(7, 13, 13.50, '10 % Red Box'),
(7, 14, 9.00, '33 % Red Box'),
(7, 15, 7.50, '17 % Red Box'),
(7, 16, 7.00, '7 % Red Box'),
(7, 17, 11.75, '68 % Red Box'),
(7, 18, 14.75, '26 % Red Box'),
(7, 19, 5.25, '64 % Red Box'),
(7, 20, 4.85, '8 % Red Box'),
(7, 21, 4.75, '2 % Red Box');

-- Assuming MOVIEID 7 represents the movie in question --
INSERT INTO WeekWiseCollection (MovieID, Week, Amount, Performance)
VALUES
    (7, 1, 364.50, 'Normal'),
    (7, 2, 143.50, '61 % Red Box'),
    (7, 3, 55.85, '61 % Red Box'),
    (7, 4, 40.10, '28 % Red Box');
    
-- INSERT values into weekend box office collection table
INSERT INTO WeekendCollection (MovieID, Weekend, Amount, Performance)
VALUES
    (7, 1, 203.00, 'Weekend 1'),
    (7, 2, 70.00, '66 % Red Box'),
    (7, 3, 26.25, '63 % Red Box'),
    (7, 4, 19.55, '26 % Red Box');

-- Insert values for OverseasBoxOffice table --
INSERT INTO OverseasBoxOffice (MovieID, OpeningDayAmount, OpeningWeekendAmount, Week1Amount, TopOverseasGross) VALUES
(7, 37.50, 142.00, 220.00, 405.00);

select * from OverseasBoxOffice;


-- Question 1 Retrieve General Movie Data--

select * from Movie;

-- Question 2 Retrieve India Box Office Details for Week 1 for Jawan Movie

select Week1Amount from IndiaBoxOffice;

-- Question 3 Retrieve Day 15 collection for Jawan --

select * from daywisecollection
where Day = 10;

-- Question 4  Retrieve Week-2 Collection for Jawan?

select Week, Amount
from weekwisecollection
Where Week = 2;


-- Question 5 Retrieve Third Weekend Collection for Jawan

select weekend, Amount
from Weekendcollection
where Weekend = 3;

-- Question 6 Retrieve Overseas Box Office Details for openingdayamount and openingweekendamount for Jawan

select OpeningDayAmount, OpeningWeekendAmount
from OverseasBoxOffice;

-- Question 7 Retrieve Day-Wise Collection for Animal Movie with performance '58 % Red Box'?

select * from daywisecollection
where Performance LIKE '58 % Red Box';

-- Question 8 Calaculate Total Lifetime Amount for Jawan?

select SUM(LifetimeAmount) as Total_Lifetime
from indiaboxoffice;

-- Question 9 Calculate Average Day-Wise Collection for Animal Movie --

select CEIL(AVG(Amount)) AS Average_Daywise_Collection
from DayWiseCollection;

-- Question 10 Calculate Total Box Office Collection for Jawan?

select m.Title
      ,(io.LifetimeAmount + o.TopOverseasGross) AS Total_Box_Office_Collection
from movie as m
JOIN indiaboxoffice as io using(MovieID)
JOIN overseasboxoffice as o using(MovieID);





