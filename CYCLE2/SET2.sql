CREATE TABLE STUDENT_INFO
(
Sid  INT UNIQUE ,
STUD_NAME   VARCHAR(20),
STUDE_SCORE NUMERIC(5,2) DEFAULT 20
);
DROP TABLE STUDENT_INFO;
ALTER TABLE STUDENT_INFO ADD PRIMARY KEY (Sid);
DESCRIBE STUDENT_INFO;
INSERT INTO STUDENT_INFO VALUES(1,'SANDRA',198),(2,'DEVU',123),(3,'ROSHMI',190),(4,'NISHA',200);
UPDATE STUDENT_INFO SET STUDE_SCORE = STUDE_SCORE + 5 WHERE STUDE_SCORE > 150;
SELECT *FROM STUDENT_INFO;
CREATE TABLE WORKER
(
WORKER_ID    INT,
FIRST_NAME   VARCHAR(15),
LAST_NAME    VARCHAR(15),
SALARY       NUMERIC(8),
JOINING_DATE DATE,
DEPARTMENT   VARCHAR (15)
);
DESCRIBE WORKER;

CREATE TABLE BONUS
( 
WORKER_ID INT, 
BONUS_DATE DATE, 
BONUS_AMOUNT NUMERIC(6) 
);
DESCRIBE BONUS;
ALTER TABLE WORKER ADD PRIMARY KEY (WORKER_ID);
ALTER TABLE BONUS ADD CONSTRAINT FK_COD_CSD FOREIGN KEY(WORKER_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE ;
INSERT INTO WORKER (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)VALUES (1,'monika','arora',100000,'2014-02-20','hr'),
(2,'niharika','verma',80000,'2014-06-11','admin'),
(3,'vishal','singhal',300000,'2014-02-20','hr'),
(4,'amithabh','singh',500000,'2014-02-20','admin'),
(5,'vivek','bhati',500000,'2014-06-11','admin'),
(6,'vipul','diwan',200000,'2014-06-11','account'),
(7,'satich','kumar',75000,'2014-01-20','admin'),
(8,'Geetika','Chauhan',90000,'2014-04-11','admin');
TRUNCATE TABLE WORKER;
SELECT *FROM WORKER;
INSERT INTO BONUS (WORKER_ID, BONUS_DATE,BONUS_AMOUNT) VALUES (1,'2016-02-20',5000),(2,'2016-06-11',3000),(3,'2016-02-20',4000),(1,'2016-02-20',4500),
(2,'2016-06-11',3500);
SELECT *FROM BONUS;
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;
SELECT * FROM WORKER ORDER BY TRIM(FIRST_NAME) ASC ;
SELECT * FROM WORKER WHERE TRIM(FIRST_NAME) != 'vipul' AND TRIM(FIRST_NAME)   != 'satich';
SELECT *FROM WORKER WHERE DEPARTMENT='admin';
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;
SELECT UPPER(FIRST_NAME) FROM WORKER;
SELECT DISTINCT DEPARTMENT FROM WORKER;
SELECT SUBSTR(FIRST_NAME,  1, 3) AS SMALL FROM WORKER;
SELECT RTRIM(FIRST_NAME) FROM WORKER;
SELECT LTRIM(DEPARTMENT) FROM worker;
SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) FROM WORKER ;
SELECT REPLACE(FIRST_NAME, 'a', 'A') AS FNAME FROM WORKER;
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT,SALARY,BONUS_AMOUNT  FROM WORKER,BONUS WHERE WORKER.WORKER_ID = BONUS.WORKER_ID AND BONUS_AMOUNT  > 4000 ;
DELETE FROM WORKER WHERE WORKER_ID=7;
SELECT * FROM WORKER;
ALTER TABLE BONUS DROP CONSTRAINT FK_COD_CSD;
ALTER TABLE BONUS ADD CONSTRAINT FK_COD_NA FOREIGN KEY(WORKER_ID) 
REFERENCES WORKER(WORKER_ID) ON DELETE NO ACTION ;
DELETE FROM WORKER WHERE WORKER_ID=8;
SELECT * FROM WORKER;