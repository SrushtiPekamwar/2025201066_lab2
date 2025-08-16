# Lab 2 - Stored Procedures Assignment

-----------------------------------------------------------------------------------------------
# Github repository link
https://github.com/SrushtiPekamwar/2025201066_lab2
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
## Files in this submission
- q1.sql : This file contains stored procedure ListAllSubscribers() which uses a cursor to iterate through all subscribers and print their names.
- q2.sql : This file contains stored procedure GetWatchHistoryBySubscriber(IN sub_id INT) that returns all shows watched by a subscriber along with watch time.
- q3.sql : This file contains stored procedure AddSubscriberIfNotExists(IN subName VARCHAR(100)) to add a new subscriber if they do not already exist.
- q4.sql : This file contains stored procedure SendWatchTimeReport() which internally calls GetWatchHistoryBySubscriber() for all subscribers only if they have watched something.
- q5.sql : This file contains stored procedure with a cursor to loop through each subscriber and call GetWatchHistoryBySubscriber() to print their watch history.
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
# Create database
CREATE DATABASE StreamingService;
USE StreamingService;
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
# Create required tables
CREATE TABLE Subscribers (
    SubscriberID INT PRIMARY KEY,
    SubscriberName VARCHAR(100),
    SubscriptionDate DATE
);

CREATE TABLE Shows (
    ShowID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE WatchHistory (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    ShowID INT,
    SubscriberID INT,
    WatchTime INT,
    -- Duration in minutes
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (SubscriberID) REFERENCES
    Subscribers(SubscriberID)
);
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
# How to call each procedure

1. CALL ListAllSubscribers();   --> No parameters need to be passed

2. CALL GetWatchHistoryBySubscriber(23);   --> Subscriber id needs to be passed as the parameter

3. CALL AddSubscriberIfNotExists('Srushti Pekamwar');  --> Name of the subscriber which needs 
                                                           to be added should be passed as a parameter

4. CALL SendWatchTimeReport();  --> No parameter needs to be passed
   But before calling this stored procedure GetWatchHistoryBySubscriber(23); this should be created first

5. CALL SendWatchTimeReport5();  --> No parameter needs to be passed
   But before calling this stored procedure GetWatchHistoryBySubscriber(23); this should be created first
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
# If all Procedures are created at once then the execution flow must be 

CALL ListAllSubscribers();
CALL GetWatchHistoryBySubscriber(1);
CALL AddSubscriberIfNotExists('Varad');
CALL SendWatchTimeReport();
CALL SendWatchTimeReport5();
-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------
# Data which I used for testing

INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019),
(4, 'Breaking Bad', 'Crime', 2008),
(5, 'Money Heist', 'Thriller', 2017),
(6, 'Friends', 'Comedy', 1994),
(7, 'Game of Thrones', 'Fantasy', 2011),
(8, 'Dark', 'Sci-Fi', 2017),
(9, 'Lucifer', 'Crime', 2016),
(10, 'Narcos', 'Crime', 2015),
(11, 'Death Note', 'Anime', 2006),
(12, 'Attack on Titan', 'Anime', 2013),
(13, 'Demon Slayer', 'Anime', 2019),
(14, 'Jujutsu Kaisen', 'Anime', 2020),
(15, 'One Piece', 'Anime', 1999),
(16, 'Sacred Games', 'Crime', 2018),
(17, 'Mirzapur', 'Action', 2018),
(18, 'Family Man', 'Thriller', 2019),
(19, 'Panchayat', 'Comedy', 2020),
(20, 'Delhi Crime', 'Drama', 2019),
(21, 'Made in Heaven', 'Drama', 2019),
(22, 'Kota Factory', 'Drama', 2019),
(23, 'Little Things', 'Romance', 2016),
(24, 'Breathe', 'Thriller', 2018),
(25, 'Scam 1992', 'Drama', 2020),
(26, 'Asur', 'Thriller', 2020),
(27, 'The Boys', 'Superhero', 2019),
(28, 'WandaVision', 'Superhero', 2021),
(29, 'The Umbrella Academy', 'Superhero', 2019),
(30, 'Loki', 'Superhero', 2021);


INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05'),
(4, 'Sophia Johnson', '2023-03-20'),
(5, 'Liam Brown', '2023-04-01'),
(6, 'Olivia Martinez', '2023-04-15'),
(7, 'Noah Garcia', '2023-04-25'),
(8, 'Ava Wilson', '2023-05-05'),
(9, 'William Moore', '2023-05-15'),
(10, 'Isabella Taylor', '2023-05-25'),
(11, 'Rajesh Kumar', '2023-06-05'),
(12, 'Priya Sharma', '2023-06-15'),
(13, 'Amit Patel', '2023-06-25'),
(14, 'Sneha Reddy', '2023-07-05'),
(15, 'Arjun Singh', '2023-07-15'),
(16, 'Neha Gupta', '2023-07-25'),
(17, 'Vikram Iyer', '2023-08-05'),
(18, 'Ananya Rao', '2023-08-15'),
(19, 'Karan Mehta', '2023-08-25'),
(20, 'Pooja Nair', '2023-09-05'),
(21, 'Siddharth Joshi', '2023-09-15'),
(22, 'Rohit Malhotra', '2023-09-25'),
(23, 'Meera Kapoor', '2023-10-05'),
(24, 'Aditya Verma', '2023-10-15'),
(25, 'Divya Bhatia', '2023-10-25'),
(26, 'Manish Chawla', '2023-11-05'),
(27, 'Ishita Desai', '2023-11-15'),
(28, 'Harsh Vardhan', '2023-11-25'),
(29, 'Tanya Agarwal', '2023-12-05'),
(30, 'Srushti Pekamwar', '2023-12-15');


INSERT INTO WatchHistory (HistoryID, ShowID, SubscriberID, WatchTime) VALUES
(1, 1, 1, 120),
(2, 6, 1, 80),
(3, 4, 2, 90),
(4, 10, 2, 100),
(5, 16, 2, 110),
(6, 7, 4, 150),
(7, 8, 4, 140),
(8, 25, 4, 130),
(9, 26, 4, 120),
(10, 5, 5, 85),
(11, 12, 6, 100),
(12, 13, 6, 95),
(13, 14, 6, 120),
(14, 15, 6, 200),
(15, 27, 6, 150),
(16, 28, 6, 135),
(17, 15, 7, 180),
(18, 19, 7, 90),
(19, 18, 8, 75),
(20, 21, 8, 100),
(21, 22, 8, 110),
(22, 25, 10, 110),
(23, 2, 10, 95),
(24, 9, 10, 85),
(25, 20, 10, 105),
(26, 30, 10, 100),
(27, 3, 11, 130),
(28, 8, 13, 140),
(29, 1, 13, 100),
(30, 2, 13, 90),
(31, 11, 13, 160),
(32, 23, 13, 75),
(33, 24, 13, 95),
(34, 16, 14, 100),
(35, 18, 14, 80),
(36, 17, 15, 120),
(37, 19, 15, 100),
(38, 21, 15, 90),
(39, 22, 17, 105),
(40, 26, 17, 100),
(41, 27, 17, 150),
(42, 29, 17, 140),
(43, 24, 18, 95),
(44, 26, 19, 100),
(45, 7, 19, 160),
(46, 12, 19, 130),
(47, 14, 19, 120),
(48, 20, 19, 90),
(49, 27, 20, 150),
(50, 28, 20, 120),
(51, 29, 22, 130),
(52, 30, 22, 110),
(53, 6, 22, 80),
(54, 9, 23, 85),
(55, 11, 23, 150),
(56, 13, 23, 140),
(57, 17, 23, 100),
(58, 2, 24, 95),
(59, 14, 26, 125),
(60, 15, 26, 200),
(61, 19, 27, 70),
(62, 20, 27, 95),
(63, 21, 27, 100),
(64, 22, 27, 90),
(65, 25, 27, 130),
(66, 23, 28, 90),
(67, 24, 28, 100),
(68, 25, 28, 110),
(69, 26, 28, 120),
(70, 27, 28, 140),
(71, 30, 28, 130),
(72, 11, 29, 150),
(73, 12, 29, 140),
(74, 13, 29, 120);
-----------------------------------------------------------------------------------------------