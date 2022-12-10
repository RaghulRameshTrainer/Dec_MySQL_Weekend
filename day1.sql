CREATE DATABASE prod;
USE prod;

-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- DEFAULT
-- CHECK
-- PRIMARY
-- FOREIGN KEY

CREATE TABLE unique_table(
empid INT UNIQUE,
empname VARCHAR(100),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_table VALUES(1000,'Ramshankar',40,'Mumbai');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1000,'Rudhra',40,'Mumbai');  -- ERROR since empid is duplicate
INSERT INTO unique_table VALUES(1001,'Rudhra',40,'Mumbai');  
INSERT INTO unique_table(empname,age,city) VALUES('Sairam',37,'Bangalore');  
INSERT INTO unique_table(empname,age,city) VALUES('Kathir',36,'Pune');  

-- NOT NULL
CREATE TABLE notnulltable(
empid INT NOT NULL,
empname VARCHAR(100),
age INT,
city VARCHAR(100)
);

INSERT INTO notnulltable VALUES(1000,'Ramshankar',40,'Mumbai');
SELECT * FROM notnulltable;
INSERT INTO notnulltable VALUES(1000,'Rudhra',40,'Mumbai'); 
INSERT INTO notnulltable VALUES(1001,'Rudhra',40,'Mumbai');  
INSERT INTO notnulltable(empname,age,city) VALUES('Sairam',37,'Bangalore');  -- empid should not be with null
INSERT INTO notnulltable(empid,empname,age,city) VALUES(1002,'Sairam',37,'Bangalore'); 



-- UNIQUE and NOT NULL
CREATE TABLE unique_notnulltable(
empid INT UNIQUE NOT NULL,
empname VARCHAR(100),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_notnulltable VALUES(1000,'Ramshankar',40,'Mumbai');
SELECT * FROM unique_notnulltable;
INSERT INTO unique_notnulltable VALUES(1000,'Rudhra',40,'Mumbai');  -- error due to duplicate
INSERT INTO unique_notnulltable VALUES(1001,'Rudhra',40,'Mumbai');  
INSERT INTO unique_notnulltable(empname,age,city) VALUES('Sairam',37,'Bangalore');  -- empid should not be with null
INSERT INTO unique_notnulltable(empid,empname,age,city) VALUES(1002,'Sairam',37,'Bangalore'); 

-- DEFAULT CONSTRAINS
CREATE TABLE default_table (
empid INT ,
empname VARCHAR(100),
age INT,
city VARCHAR(100) DEFAULT 'Mumbai'
);

INSERT INTO default_table VALUES(1000,'Raja',40,'Pune');
SELECT * FROM default_table;
INSERT INTO default_table(empid,empname,age) VALUES(1001,'Gayathri',30);
INSERT INTO default_table VALUES(1002,'Riya',-5,'Chennai');

-- CHECK CONSTRAINTS
CREATE TABLE check_table (
empid INT ,
empname VARCHAR(100),
age INT CHECK(age >0 AND age<=100),
city VARCHAR(100) CHECK ( city IN ('Mumbai','Delhi','Hyderabad','Bangalore') )
);

INSERT INTO check_table VALUES(1000,'Rakesh',100,'Mumbai');
SELECT * FROM check_table;
INSERT INTO check_table VALUES(1001,'Srikanth',-1,'Mumbai'); -- ERROR since age is < 1
INSERT INTO check_table VALUES(1001,'Srikanth',101,'Mumbai'); -- ERROR since age is > 100
INSERT INTO check_table VALUES(1001,'Venkatesh',55,'Chennai');

CREATE TABLE check_table_new (
empid INT ,
empname VARCHAR(100),
age INT ,
city VARCHAR(100) ,
CONSTRAINT check_age CHECK (age>0 and age<=100),
CONSTRAINT check_city CHECK (city IN ('Mumbai','Pune','Delhi','Hyderabad'))
);

INSERT INTO check_table_new VALUES(1000,'Rakesh',100,'Mumbai');
SELECT * FROM check_table_new;
INSERT INTO check_table_new VALUES(1001,'Srikanth',-1,'Mumbai'); -- ERROR since age is < 1
INSERT INTO check_table_new VALUES(1001,'Srikanth',101,'Mumbai'); -- ERROR since age is > 100
INSERT INTO check_table_new VALUES(1001,'Venkatesh',55,'Chennai');

-- PRIMARY KEY CONSTRAINT
CREATE TABLE pk_table (
empid INT PRIMARY KEY,    -- primary key => unique + not null
empname VARCHAR(100),
age INT ,
city VARCHAR(100) 
);

INSERT INTO pk_table VALUES(1000,'Rakesh',100,'Mumbai');
SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1001,'Srikanth',-1,'Mumbai'); 
INSERT INTO pk_table VALUES(1001,'Srikanth',101,'Mumbai');  -- duplicate entry error
INSERT INTO pk_table(empname,age,city) VALUES('Venkatesh',55,'Chennai');  -- error since empid is null

CREATE TABLE customer_tbl(
custid INT primary key,     -- Simple primary key
custname varchar(100) not null,
age INT check (age>0 and age<=100),
city varchar(100) default 'New Delhi'
);

INSERT INTO customer_tbl VALUES(1,'Ramesh',38,'Chennai'),(2,'Ashwin',40,'Pune'),(3,'Tharani',37,'Hyderabad');
INSERT INTO customer_tbl VALUES(1,'Raghul',38,'Bangalore'); -- duplicate error
INSERT INTO customer_tbl(custname,age,city) VALUES('Raghul',38,'Bangalore'); -- custid is null error


CREATE TABLE customer_tbl_new(
custid INT ,     -- Simple primary key
custname varchar(100) not null,
age INT check (age>0 and age<=100),
city varchar(100) default 'New Delhi',
email VARCHAR(100) ,
CONSTRAINT cust_email PRIMARY KEY (custid,email)  -- composite primary key 
);
INSERT INTO customer_tbl_new VALUES(100,'Devi',35,'Chennai','test@gmail.com');
SELECT * FROM customer_tbl_new;
INSERT INTO customer_tbl_new VALUES(100,'Durga',45,'Bangalore','personal@gmail.com');
INSERT INTO customer_tbl_new VALUES(101,'Satya',45,'Bangalore','personal@gmail.com');
INSERT INTO customer_tbl_new(custname,age,city,email) VALUES('Rooban',45,'Bangalore','ruban@gmail.com'); -- error since null for custid
INSERT INTO customer_tbl_new(custid,custname,age,city) VALUES(102,'Rooban',45,'Bangalore'); -- error since null for custid
INSERT INTO customer_tbl_new VALUES(101,'Satya',45,'Bangalore','personal@gmail.com');

-- FOREIGN KEY
CREATE TABLE transacation_tbl(
trans_id INT PRIMARY KEY,
custid INT,
product_name VARCHAR(100),
amount DECIMAL(20,2),
order_date DATE, -- CHECK(order_date <= current_date()),
FOREIGN KEY (custid) REFERENCES customer_tbl_new(custid) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM customer_tbl_new;
INSERT INTO transacation_tbl VALUES(1,100,'Mobile','50000.55', current_date());
SELECT * FROM transacation_tbl;
INSERT INTO transacation_tbl VALUES(2,102,'Mobile','50000.55', current_date()); -- reference ke violatiob

INSERT INTO transacation_tbl VALUES(2,101,'Mobile','50000.55', '2022-12-01');

SELECT * FROM customer_tbl_new;
SET sql_safe_updates=0;
UPDATE customer_tbl_new SET custid=1001 WHERE custname='Devi';
DELETE FROM customer_tbl_new WHERE custid=101;
UPDATE customer_tbl_new SET custid=1000 WHERE custid=100;


CREATE TABLE transacation_tbl_new(
trans_id INT PRIMARY KEY,
custid INT,
product_name VARCHAR(100),
amount DECIMAL(20,2),
order_date DATE, -- CHECK(order_date <= current_date()),
FOREIGN KEY (custid) REFERENCES customer_tbl_new(custid) 
);

INSERT INTO transacation_tbl_new VALUES(1,1000,'Mobile','50000.55', current_date());
SELECT * FROM transacation_tbl_new;
INSERT INTO transacation_tbl_new VALUES(2,1000,'Mobile','50000.55', current_date()); 

INSERT INTO transacation_tbl_new VALUES(3,1001,'Mobile','50000.55', '2022-12-01');

DELETE FROM customer_tbl_new WHERE custid=1001;
DELETE FROM transacation_tbl_new WHERE custid=1001;
DELETE FROM customer_tbl_new WHERE custid=1001;

-- ALTER STATEMENTS

DESC customer_tbl;
SELECT * FROM customer_tbl;

ALTER TABLE customer_tbl 
ADD COLUMN country VARCHAR(100) DEFAULT 'India';

ALTER TABLE customer_tbl
DROP COLUMN age;

ALTER TABLE customer_tbl 
RENAME COLUMN city to location;

ALTER TABLE customer_tbl
MODIFY COLUMN country varchar(20);

RENAME TABLE customer_tbl TO customer;

	DESC customer;
ALTER TABLE customer
ADD CONSTRAINT CHECK(country IN ('India','China','Australia'));
SELECT * FROM customer;
INSERT INTO customer VALUES(4,'Arun','Dearborn','USA'); -- ERROR 
INSERT INTO customer VALUES(4,'Arun','Dearborn','China');

ALTER TABLE customer DROP constraint customer_chk_1;
INSERT INTO customer VALUES(5,'Arun','Dearborn','Dubai');

ALTER TABLE customer ADD CONSTRAINT cntry_chk CHECK(country IN ('India','China','Australia','Dubai'));
INSERT INTO customer VALUES(6,'Vicky','Dearborn','Singapore');
ALTER TABLE customer DROP CONSTRAINT cntry_chk;
INSERT INTO customer VALUES(6,'Vicky','Dearborn','Singapore');
SELECT * FROM customer;

