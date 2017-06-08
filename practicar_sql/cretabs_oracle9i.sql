DROP TABLE JOB_GRADES;
DROP TABLE JOB_HISTORY;
DROP TABLE EMPLOYEES;
DROP TABLE DEPARTMENTS;
DROP TABLE JOBS;
DROP TABLE LOCATIONS;
DROP TABLE COUNTRIES;
DROP TABLE REGIONS;

CREATE TABLE REGIONS(
    REGION_ID NUMBER,
    REGION_NAME VARCHAR2(25),
    PRIMARY KEY (REGION_ID));

			
CREATE TABLE COUNTRIES(
    COUNTRY_ID CHAR(2),
    COUNTRY_NAME VARCHAR2(40),
    REGION_ID NUMBER,
    PRIMARY KEY (COUNTRY_ID),
    FOREIGN KEY(REGION_ID) REFERENCES REGIONS(REGION_ID));				


CREATE TABLE LOCATIONS (
     LOCATION_ID NUMBER(4),
     STREET_ADDRESS VARCHAR2(40),
     POSTAL_CODE VARCHAR2(12),
     CITY VARCHAR2(30) NOT NULL,
     STATE_PROVINCE VARCHAR2(25),
     COUNTRY_ID CHAR(2),
     PRIMARY KEY(LOCATION_ID),
     FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID)); 


CREATE TABLE DEPARTMENTS(
   DEPARTMENT_ID NUMBER(4),
   DEPARTMENT_NAME VARCHAR2(30) NOT NULL,
   MANAGER_ID NUMBER(6),
   LOCATION_ID NUMBER(4),
   PRIMARY KEY(DEPARTMENT_ID),
   FOREIGN KEY(LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID));


CREATE TABLE JOBS(
   JOB_ID VARCHAR2(10),
   JOB_TITLE VARCHAR2(35) NOT NULL,
   MIN_SALARY NUMBER(6),
   MAX_SALARY NUMBER(6),
   PRIMARY KEY(JOB_ID));


CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID NUMBER(6),
    FIRST_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(25) NOT NULL,
    EMAIL VARCHAR2(25) NOT NULL,
    PHONE_NUMBER VARCHAR2(20),
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR2(10) NOT NULL,
    SALARY NUMBER(8,2),
    COMMISSION_PCT NUMBER(2,2),
    MANAGER_ID NUMBER(6),
    DEPARTMENT_ID NUMBER(4),
    PRIMARY KEY(EMPLOYEE_ID),
    FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID),
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID),
    CONSTRAINT EMP_EMAIL_UK UNIQUE(EMAIL));


CREATE TABLE JOB_HISTORY(
  EMPLOYEE_ID NUMBER(6),
  START_DATE DATE NOT NULL,
  END_DATE DATE NOT NULL,
  JOB_ID VARCHAR2(10) NOT NULL,
  DEPARTMENT_ID NUMBER(4),
  PRIMARY KEY(EMPLOYEE_ID, JOB_ID),
  FOREIGN KEY(EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID),
  FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID),
  FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID));

CREATE TABLE JOB_GRADES(
     GRADE_LEVEL VARCHAR2(3),
     LOWEST_SAL NUMBER,
     HIGHEST_SAL NUMBER);


INSERT INTO REGIONS VALUES (1, 'Europe');
INSERT INTO REGIONS VALUES (2, 'Americas');
INSERT INTO REGIONS VALUES (3, 'Asia');
INSERT INTO REGIONS VALUES (4, 'Middle East and Africa');



INSERT INTO COUNTRIES VALUES( 'CA', 'Canada', 2);
INSERT INTO COUNTRIES VALUES( 'DE', 'Germany', 1);
INSERT INTO COUNTRIES VALUES( 'UK', 'United Kingdom', 1);
INSERT INTO COUNTRIES VALUES( 'US', 'United States of America', 2);



INSERT INTO LOCATIONS VALUES( 1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO LOCATIONS VALUES( 1500, '2001 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO LOCATIONS VALUES( 1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO LOCATIONS VALUES( 1800, '460 Bloor St. W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');
INSERT INTO LOCATIONS VALUES( 2500, 'Magdalen Centre, The Ofxord Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');




INSERT INTO DEPARTMENTS VALUES (10, 'Administration', 200, 1700);
INSERT INTO DEPARTMENTS VALUES (20, 'Marketing', 201, 1800);
INSERT INTO DEPARTMENTS VALUES (50, 'Shipping', 124, 1500);
INSERT INTO DEPARTMENTS VALUES (60, 'IT', 103, 1400);
INSERT INTO DEPARTMENTS VALUES (80, 'Sales', 149, 2500);
INSERT INTO DEPARTMENTS VALUES (90, 'Executive', 100, 1700);
INSERT INTO DEPARTMENTS VALUES (110, 'Accounting', 205, 1700);
INSERT INTO DEPARTMENTS VALUES (190, 'Contracting', NULL, 1700);



INSERT INTO JOBS VALUES('AD_PRES', 'President', 20000, 40000);
INSERT INTO JOBS VALUES('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO JOBS VALUES('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO JOBS VALUES('AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO JOBS VALUES('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO JOBS VALUES('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO JOBS VALUES('SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO JOBS VALUES('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO JOBS VALUES('ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO JOBS VALUES('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO JOBS VALUES('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO JOBS VALUES('MK_REP', 'Marketing Representative', 4000, 9000);



INSERT INTO EMPLOYEES VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', '17-06-87','AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO EMPLOYEES VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '21-09-89','AD_VP', 17000, NULL, 100, 90); 
INSERT INTO EMPLOYEES VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '13-01-93','AD_VP', 17000, NULL, 100, 90); 
INSERT INTO EMPLOYEES VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '03-01-90','IT_PROG', 9000, NULL, 102, 60); 
INSERT INTO EMPLOYEES VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '21-05-91','IT_PROG', 6000, NULL, 103, 60); 
INSERT INTO EMPLOYEES VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '07-02-99','IT_PROG', 4200, NULL, 103, 60); 
INSERT INTO EMPLOYEES VALUES (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '16-11-99','ST_MAN', 5800, NULL, 100, 50); 
INSERT INTO EMPLOYEES VALUES (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '17-10-95','ST_CLERK', 3500, NULL, 124, 50); 
INSERT INTO EMPLOYEES VALUES (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '29-01-97','ST_CLERK', 3100, NULL, 124, 50); 
INSERT INTO EMPLOYEES VALUES (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', '15-03-98','ST_CLERK', 2600, NULL, 124, 50); 
INSERT INTO EMPLOYEES VALUES (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '09-07-98','ST_CLERK', 2500, NULL, 124, 50); 
INSERT INTO EMPLOYEES VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '29-01-00','SA_MAN', 10500, .2, 100, 80); 
INSERT INTO EMPLOYEES VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '11-05-96','SA_REP', 11000, .3, 149, 80); 
INSERT INTO EMPLOYEES VALUES (176, 'Jonathan', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '24-03-98','SA_REP', 8600, .2, 149, 80); 
INSERT INTO EMPLOYEES VALUES (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '24-05-99','SA_REP', 7000, .15, 149, NULL); 
INSERT INTO EMPLOYEES VALUES (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '17-09-87','AD_ASST', 4400, NULL, 101, 10); 
INSERT INTO EMPLOYEES VALUES (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '17-02-96','MK_MAN', 13000, NULL, 100, 20); 
INSERT INTO EMPLOYEES VALUES (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', '17-08-97','MK_REP', 6000, NULL, 201, 20); 
INSERT INTO EMPLOYEES VALUES (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '07-06-94','AC_MGR', 12000, NULL, 101, 110); 
INSERT INTO EMPLOYEES VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', '07-06-94','AC_ACCOUNT', 8300, NULL, 205, 110);  


INSERT INTO JOB_HISTORY VALUES( 102, '13-01-93', '24-07-98', 'IT_PROG', 60);
INSERT INTO JOB_HISTORY VALUES( 101, '21-09-89', '27-10-93', 'AC_ACCOUNT', 110);
INSERT INTO JOB_HISTORY VALUES( 101, '28-10-93', '15-03-97', 'AC_MGR', 110);
INSERT INTO JOB_HISTORY VALUES( 201, '17-02-96', '19-12-99', 'MK_REP', 20);
INSERT INTO JOB_HISTORY VALUES( 144, '24-03-98', '31-12-99', 'ST_CLERK', 50);
INSERT INTO JOB_HISTORY VALUES( 142, '01-01-99', '31-12-99', 'ST_CLERK', 50);
INSERT INTO JOB_HISTORY VALUES( 200, '17-09-87', '17-06-93', 'AD_ASST', 90);
INSERT INTO JOB_HISTORY VALUES( 176, '24-03-98', '31-12-98', 'SA_REP', 80);
INSERT INTO JOB_HISTORY VALUES( 176, '01-01-99', '31-12-99', 'SA_MAN', 80);
INSERT INTO JOB_HISTORY VALUES( 200, '01-07-94', '31-12-98', 'AC_ACCOUNT', 90);



INSERT INTO JOB_GRADES VALUES('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES('F', 25000, 40000);

COMMIT			
/
