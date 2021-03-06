CREATE TABLE SAILORS
 (
 SID INT,
 SNAME VARCHAR(10),
 RATING INT,
 AGE INT
 );
 DESCRIBE SAILORS;
 DROP TABLE SAILORS;
 INSERT INTO SAILORS(SID,SNAME,RATING,AGE)VALUES(22, 'Dustin', 7, 45),(29, 'Brutas', 1, 33),
 (31, 'Lubber', 8, 55),(32, 'Andy', 8, 25),(58, 'Rusty', 10, 35),(64, 'Horatio', 7, 35),
 (71, 'Zorba', 10, 16),(74, 'Horatio', 9, 35),(85, 'Art', 3, 26),(95, 'Bob', 3, 64);
 SELECT * FROM SAILORS;
 
CREATE TABLE BOATS
(
BID  INT,
BNAME  VARCHAR(10),
COLOR VARCHAR(10)
);
DESCRIBE BOATS;
INSERT INTO BOATS(BID,BNAME,COLOR)VALUES(101,'INTERLAKE','BLUE'),
(102,'INTERLAKE','RED'),(103,'CLIPPER','GREEN'),(104,'MARINE','RED');
SELECT * FROM BOATS;

CREATE TABLE RESERVES
(
SID  INT,
BID  INT,
DAY DATE
);
DESCRIBE RESERVES;
INSERT INTO RESERVES(SID,BID,DAY)VALUES(22,101,'98-10-10'),
(22,102,'98-10-10'),(22,103,'98-08-10'),(22,104,'98-07-10'),
(31,102,'98-10-11'),(31,103,'98-06-11'),(31,104,'98-12-11'),
(64,101,'98-05-09'),(64,102,'98-08-09'),(74,103,'98-08-09');
SELECT * FROM RESERVES;
SELECT SNAME, AGE FROM SAILORS;
SELECT * FROM SAILORS,RESERVES WHERE SAILORS.SID = RESERVES.SID AND BID = 101;
SELECT SNAME FROM SAILORS WHERE RATING >7;
SELECT SNAME FROM SAILORS,RESERVES,BOATS WHERE BOATS.BID = 103 AND BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID;
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE COLOR = 'RED' AND BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID ORDER BY AGE;
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE ( COLOR = 'RED' OR COLOR = 'GREEEN') AND BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID;
SELECT DISTINCT COLOR FROM SAILORS,RESERVES,BOATS WHERE SNAME = 'LUBBER'AND BOATS.BID = RESERVES.BID AND sailors.sid = RESERVES.SID;
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE COLOR = 'RED'AND
BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID UNION
SELECT DISTINCT SNAME FROM SAILORS,RESERVES,BOATS WHERE COLOR = 'GREEN' AND
 BOATS.BID = RESERVES.BID AND SAILORS.SID = RESERVES.SID;
 SELECT DISTINCT SNAME FROM SAILORS,RESERVES WHERE RESERVES.SID = SAILORS.SID;
 SELECT SNAME,RESERVES.SID FROM RESERVES,SAILORS WHERE SAILORS.SID = RESERVES.SID 
 GROUP BY DAY,RESERVES.SID,SNAME HAVING COUNT(DAY)>1 ;
 SELECT SNAME,AGE FROM SAILORS WHERE AGE =(SELECT MIN(AGE) FROM SAILORS) ;
 SELECT SNAME,RATING FROM SAILORS WHERE RATING >(SELECT MAX(RATING) FROM SAILORS WHERE SNAME = 'Horatio');
 SELECT SNAME,SID FROM(SELECT SNAME,RESERVES.SID,COUNT(BID) AS ID FROM RESERVES,SAILORS
  WHERE RESERVES.SID = SAILORS.SID GROUP BY RESERVES.SID,SNAME) A WHERE ID =( SELECT COUNT(BID) FROM BOATS);
SELECT COUNT(C.SNAME)FROM(SELECT DISTINCT SNAME FROM SAILORS) C;
SELECT AVG(AGE) FROM SAILORS;
SELECT RATING,AVG(AGE) FROM SAILORS GROUP BY RATING;
SELECT A.RATING,B.MEAN FROM(SELECT COUNT(SNAME) AS NUM,RATING FROM SAILORS GROUP BY RATING HAVING COUNT(SNAME)>1)A,
(SELECT RATING,AVG(AGE) AS MEAN FROM SAILORS GROUP BY RATING ) B WHERE A.RATING = B.RATING;