use prod;

-- JOINS
-- INNER JOIN
-- OUTER JOIN
-- 	   LEFT OUTER JOIN
--     RIGHT OUTER JOIN
--     FULL OUTER JOIN
-- SELF JOIN

RENAME TABLE customer TO customer_old;

CREATE TABLE CUSTOMER(
custid INT,
custname VARCHAR(100),
city VARCHAR(20)
);

INSERT INTO CUSTOMER VALUES(1000,'Raghul Ramesh','Chennai');
INSERT INTO CUSTOMER VALUES(1001,'Malini Sekar','Bangalore');
INSERT INTO CUSTOMER VALUES(1002,'Prabha','Hyderabad');
INSERT INTO CUSTOMER VALUES(1003,'Aveek Sharma','Mumbai');
INSERT INTO CUSTOMER VALUES(1004,'Bala Murugan','Delhi');
INSERT INTO CUSTOMER VALUES(1005,'Kathir','Kolkata');


CREATE TABLE TRANSACTIONS(
transid INT,
custid INT,
prodname VARCHAR(30),
amount int
);
INSERT INTO TRANSACTIONS VALUE(1,1000,'Mobile',25000);
INSERT INTO TRANSACTIONS VALUE(2,1001,'Laptop',70000);
INSERT INTO TRANSACTIONS VALUE(3,1004,'Desktop',50000);
INSERT INTO TRANSACTIONS VALUE(4,1000,'TV',55000);
INSERT INTO TRANSACTIONS VALUE(5,1002,'Fridge',25000);
INSERT INTO TRANSACTIONS VALUE(6,1002,'Washinmachine',33000);
INSERT INTO TRANSACTIONS VALUE(7,1001,'Pendrive',2000);
INSERT INTO TRANSACTIONS VALUE(8,1003,'TV',55000);
INSERT INTO TRANSACTIONS VALUE(9,1003,'Mobile',25000);
INSERT INTO TRANSACTIONS VALUE(10,1006,'Laptop',70000); 

SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTIONS;

-- INNSER JOIN
SELECT custname,prodname,amount,city FROM CUSTOMER c INNER JOIN TRANSACTIONS t ON c.custid=t.custid;
SELECT custname,prodname,amount,city FROM CUSTOMER c JOIN TRANSACTIONS t ON c.custid=t.custid;

-- LEFT JOIN
SELECT * FROM CUSTOMER c LEFT OUTER JOIN TRANSACTIONS t ON c.custid=t.custid;

-- RIGHT JOIN
SELECT * FROM CUSTOMER c RIGHT JOIN TRANSACTIONS t ON c.custid=t.custid;

-- FULL JOIN
SELECT * FROM CUSTOMER c JOIN TRANSACTIONS t;

-- SELF JOIN

CREATE TABLE emp(
empid INT PRIMARY KEY,
empname VARCHAR(100),
salary INT,
manager_id INT,
FOREIGN KEY (manager_id) REFERENCES emp(empid)
);

INSERT INTO emp VALUES(1,'Ramesh',100000,1);
INSERT INTO emp VALUES(2,'Raghul',150000,1);
INSERT INTO emp VALUES(3,'Ramya',70000,1);
INSERT INTO emp VALUES(4,'Durga',50000,1);
INSERT INTO emp VALUES(5,'Rajesh',200000,2);
INSERT INTO emp VALUES(6,'Venkatesh',100000,2);
INSERT INTO emp VALUES(7,'Mohan',90000,2);
INSERT INTO emp VALUES(8,'Aveek',100000,5);
INSERT INTO emp VALUES(9,'Levin',300000,5);
INSERT INTO emp VALUES(10,'Dinesh',100000,7);

SELECT * FROM emp;

SELECT e1.empname, e1.salary , e2.salary as mgr_sal, e2.empname as mgr_name FROM emp e1 , emp e2
WHERE e1.manager_id=e2.empid
AND e1.salary > e2.salary;

-- SUB QUERY
SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTIONS;

SELECT * 
FROM CUSTOMER 
WHERE custid NOT IN ( 
SELECT custid FROM TRANSACTIONS);

SELECT * FROM TRANSACTIONS WHERE CUSTID NOT IN (SELECT CUSTID FROM CUSTOMER);


-- GROUP BY
SELECT * FROM survey;
SELECT company FROM survey;
SELECT DISTINCT company FROM survey;
UPDATE survey SET company='Infosys' WHERE company='Infosys Pvt Lmt';
UPDATE survey SET company='TCS' WHERE company='Tata Consultancy Services';
UPDATE survey SET company='CTS' WHERE company='Congnizant';

SELECT * FROM survey;
SELECT count(*) FROM survey;
# TCS : 47, Infosys : 39, CTS: 38, NULL : 6
SELECT company, count(*) FROM survey
GROUP BY company;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY count(*) DESC;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY company DESC ,count(*) DESC;

SELECT company,Place, count(*) 
FROM survey
WHERE company!='' and Place!=''  -- condition on existing column should be applied on WHERE class
GROUP BY company,Place  -- all the column in select class should be grouped using group by
HAVING count(*) > 5    -- condition on derived column should be applied using HAVING class
ORDER BY company DESC ,count(*) DESC;  -- to print the result in an order (default is ascending)

-- SUB QUERY
SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTIONS;

SELECT * 
FROM CUSTOMER 
WHERE custid NOT IN ( 
SELECT custid FROM TRANSACTIONS);

SELECT * FROM TRANSACTIONS WHERE CUSTID NOT IN (SELECT CUSTID FROM CUSTOMER);


-- GROUP BY
SELECT * FROM survey;
SELECT company FROM survey;
SELECT DISTINCT company FROM survey;
UPDATE survey SET company='Infosys' WHERE company='Infosys Pvt Lmt';
UPDATE survey SET company='TCS' WHERE company='Tata Consultancy Services';
UPDATE survey SET company='CTS' WHERE company='Congnizant';

SELECT * FROM survey;
SELECT count(*) FROM survey;
# TCS : 47, Infosys : 39, CTS: 38, NULL : 6
SELECT company, count(*) FROM survey
GROUP BY company;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY count(*) DESC;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY company DESC ,count(*) DESC;

SELECT company,Place, count(*) 
FROM survey
WHERE company!='' and Place!=''  -- condition on existing column should be applied on WHERE class
GROUP BY company,Place  -- all the column in select class should be grouped using group by
HAVING count(*) > 5    -- condition on derived column should be applied using HAVING class
ORDER BY company DESC ,count(*) DESC;  -- to print the result in an order (default is ascending)

-- SUB QUERY
SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTIONS;

SELECT * 
FROM CUSTOMER 
WHERE custid NOT IN ( 
SELECT custid FROM TRANSACTIONS);

SELECT * FROM TRANSACTIONS WHERE CUSTID NOT IN (SELECT CUSTID FROM CUSTOMER);


-- GROUP BY
SELECT * FROM survey;
SELECT company FROM survey;
SELECT DISTINCT company FROM survey;
UPDATE survey SET company='Infosys' WHERE company='Infosys Pvt Lmt';
UPDATE survey SET company='TCS' WHERE company='Tata Consultancy Services';
UPDATE survey SET company='CTS' WHERE company='Congnizant';

SELECT * FROM survey;
SELECT count(*) FROM survey;
# TCS : 47, Infosys : 39, CTS: 38, NULL : 6
SELECT company, count(*) FROM survey
GROUP BY company;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY count(*) DESC;

SELECT company,Place, count(*) FROM survey
GROUP BY company,Place
ORDER BY company DESC ,count(*) DESC;

SELECT company,Place, count(*) 
FROM survey
WHERE company!='' and Place!=''  -- condition on existing column should be applied on WHERE class
GROUP BY company,Place  -- all the column in select class should be grouped using group by
HAVING count(*) > 5    -- condition on derived column should be applied using HAVING class
ORDER BY company DESC ,count(*) DESC;  -- to print the result in an order (default is ascending)

SELECT company,Place, max(salary) 
FROM survey
WHERE company!='' and Place!=''  -- condition on existing column should be applied on WHERE class
GROUP BY company,Place  -- all the column in select class should be grouped using group by
-- HAVING count(*) > 5    -- condition on derived column should be applied using HAVING class
ORDER BY max(salary) DESC;  -- to print the result in an order (default is ascending

SELECT company, max(salary) 
FROM survey
WHERE company!='' and Place!=''  -- condition on existing column should be applied on WHERE class
GROUP BY company  -- all the column in select class should be grouped using group by
-- HAVING count(*) > 5    -- condition on derived column should be applied using HAVING class
ORDER BY max(salary) DESC;  -- to print the result in an order (default is ascending

-- VIEW (Virtual Table)
SELECT * FROM survey;

CREATE VIEW comp_data AS
SELECT company,place,country FROM survey;

SELECT * FROM comp_data WHERE place='Mumbai';


ALTER VIEW comp_data AS
SELECT company,place FROM survey;

SELECT distinct company FROM comp_data ;


SELECT * FROM survey;
INSERT INTO survey VALUES('HERE technologies',40,10000,'Mumbai','India',0);

-- INDEX
SELECT * FROM CUSTOMER;
CREATE INDEX cust_idx ON customer(custid);
SELECT * FROM CUSTOMER WHERE custid=1002;
CREATE INDEX cust_idx_2 ON customer(custid,city);
SELECT * FROM customer WHERE custid>1002 AND city!='Chennai';

SHOW INDEXES FROM pk_table;
SHOW INDEXES FROM CUSTOMER;


-- NUMERIC FUNCTION

SELECT * FROM survey;
SELECT * FROM survey WHERE salary='';
UPDATE survey SET salary=1000 WHERE salary='';
ALTER TABLE survey MODIFY COLUMN salary INT;


SELECT max(salary) , min(salary) , avg(salary), count(*) FROM survey WHERE salary != '';

-- STRING FUNCTIONS
SELECT * FROM survey;

SELECT DISTINCT company FROM survey WHERE salary>9000;
SELECT DISTINCT upper(company) FROM survey WHERE salary>9000;
SELECT DISTINCT lower(company) FROM survey WHERE salary>9000;

SELECT CONCAT(company,'-',place,'-',country) as info FROM survey;
SELECT CONCAT_WS('-',company,place,country) as info FROM survey;

SELECT DISTINCT company, LENGTH(company) FROM survey;

SELECT DISTINCT REPLACE(REPLACE(company,'technologies','Tech'),'HERE','SOFTWARE') FROM survey;

SELECT DISTINCT Place FROM survey;
SELECT * FROM CUSTOMER
UNION
SELECT * FROM CUSTOMER;

SELECT custid FROM CUSTOMER
UNION
SELECT custid FROM TRANSACTIONS;

SELECT custid FROM CUSTOMER
UNION ALL
SELECT custid FROM TRANSACTIONS;

SELECT * FROM CUSTOMER
UNION ALL
SELECT * FROM CUSTOMER;

SELECT DISTINCT UPPER(SUBSTR(place,1,3)) FROM survey;

SELECT DISTINCT UPPER(SUBSTR(place,-5)) FROM survey;

SELECT DISTINCT REVERSE(company) FROM survey ;

SELECT DISTINCT RIGHT(Place,3) FROM survey;


SELECT company,age,salary,place,country,gender,CASE
WHEN place='Mumbai' THEN 'Marathi'
WHEN place='Chennai' THEN 'Tamil'
WHEN place='Delhi' THEN 'Hindi'
WHEN place='Bangalore' THEN 'Kannadam'
WHEN place='Calcutta' THEN 'Bengali'
ELSE 'English' END AS 'Language'
 FROM survey;
 
 SELECT company,age,salary,place,country,gender,CASE 
 WHEN salary>5000 THEN 'HIGHLY PAID' 
 ELSE 'less paid' END as category 
 FROM survey;
 
 
ALTER TABLE survey MODIFY COLUMN gender CHAR(1);

 UPDATE survey SET gender=CASE 
 WHEN gender='0' THEN 'M'
 ELSE 'F'
 END;
 
 SELECT * FROM survey;
 
 SELECT coalesce(company,country) , age, salary, coalesce(Place,country) , country, gender
 FROM survey;
 
 SELECT * FROM CUSTOMER;
 INSERT INTO CUSTOMER(custid,custname) VALUES(1006,'Ranga');
 INSERT INTO CUSTOMER(custid,city) VALUES(1006,'Mumbai');
 
 SELECT  coalesce(custname,'NA') , coalesce(city,"TRICHY") FROM customer;
  SELECT  coalesce(custname,city) , coalesce(city,custname) FROM customer;
  
  DESC customer;
  
  SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME='customer';
  
  SELECT * FROM TRANSACTIONS;
  
  SELECT transid, custid , prodname, amount, IF (amount>50000,"HIGH","less") FROM TRANSACTIONS;
  
  SELECT * FROM CUSTOMER;
  
  -- SELECT NULLIF(city,"MISSING") FROM CUSTOMER;
  
  -- DATE FUNCTIONS
  
--   %a weekdays short name   (Sun, Mon...Sat)
--   %w weekday full name  (Sunday,Monday...Saturday)
--   %b Month short name (Jan, Feb...Dec)
--   %M Month full name (January, February...December)
--   %d day (0-31)
--   %D 1st , 2nd , 3rd
--   %c Month in number(1-12)
--   %y year in 2 digit ( 22, 23)
--   %Y year in 4 digit (2022, 2023)
--   %H hour (24 hrs format)
--   %I hour in 12 hrs format
--   %p AM | PM
--   %i minutes (0-59)
--   %S seconds (0-59)
  
SELECT current_date()  ;
SELECT current_time();
select current_timestamp();
SELECT CURDATE();
SELECT NOW();

CREATE TABLE users (
uid INT,
username VARCHAR(100),
registered_date datetime
);

INSERT INTO users VALUES(1,'Prakash',current_timestamp());
SELECT * FROM users;
INSERT INTO users VALUES(2,'Arun','2022-12-01 10:0:00');
INSERT INTO users VALUES(3,'Vignesh','2022-11-01 10:0:00');
INSERT INTO users VALUES(4,'Vignesh','2020-01-01 10:0:00');
INSERT INTO users VALUES(5,'Ashwin','2021-01-01 10:0:00');

SELECT username, registered_date,
YEAR(registered_date) as yr FROM users;

SELECT username,registered_date, YEAR(registered_date) as yr,
MONTH(registered_date) as mnth ,
day(registered_date) as dy ,
date(registered_date) as dt,
time(registered_date) as tm,
hour(registered_date) as hr,
minute(registered_date) as min,
second(registered_date) as scnds,
date_format(registered_date,'%d-%c-%Y %I:%m %p') as cur_time,
date_format(registered_date,'%W') as weekday
FROM users;

select date_format( current_timestamp(), '%W, %d %M, %Y %I:%i %p') as cur_time;
select date_format( current_timestamp(), '%c/%d/%Y %I:%i %p') as cur_time;

SELECT date_add( current_date(), INTERVAL 30 DAY ) as future_day ;
SELECT date_add( current_date(), INTERVAL 10 YEAR ) as future_day ;
SELECT date_add( current_timestamp(), INTERVAL 3 HOUR ) as future_day ;

SELECT date_sub( current_date(), INTERVAL 30 DAY ) as future_day ;
SELECT date_sub( current_date(), INTERVAL 10 YEAR ) as future_day ;

SELECT datediff('2022-12-11','2022-12-01') as diff ;

SELECT * FROM users;

SELECT * FROM users WHERE year(registered_date)=2022;
SELECT * FROM users WHERE year(registered_date)<2022;

SELECT * FROM users WHERE year(registered_date)=2022 and MONTH(registered_date)=12;

SELECT * FROM transactions where transid BETWEEN 2 and 6;

SELECT * FROM users WHERE date(registered_date) BETWEEN '2021-01-01' AND '2022-12-01';

SELECT * FROM survey WHERE place like 'C%';
SELECT * FROM survey WHERE place like '%a';
SELECT * FROM survey WHERE place like '%o%';
SELECT * FROM survey WHERE place like 'C%c%';
SELECT * FROM survey WHERE place like 'C_c%';
SELECT * FROM survey WHERE place like 'C__c%';



