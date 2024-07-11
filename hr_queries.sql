-- CSCI 2020 - Database Fundamentals
-- Lab 3: Intermediate SQL


-- A1. Employees from 650 area code 
SELECT * 
  FROM HR.Employees
 WHERE Phone_Number LIKE '515%';

-- A2. Employees with 501 in the phone number 
SELECT * 
  FROM HR.Employees
 WHERE Phone_Number LIKE '%121%';

-- A3. Employees phone number in the format ###.###.#### 
SELECT * 
  FROM HR.Employees
 WHERE Phone_Number LIKE '___.___.____';

-- A4. Employees phone number in the format ###.###.#### 
SELECT * 
  FROM HR.Employees
 WHERE REGEXP_LIKE (Phone_Number, '^\d\d\d\.\d\d\d\.\d\d\d\d$');

-- OR
SELECT * 
  FROM HR.Employees
 WHERE REGEXP_LIKE (Phone_Number, '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$');
 

-- A5. Employees phone number in the format ###.##.####.###### 
SELECT * 
  FROM HR.Employees
 WHERE REGEXP_LIKE (phone_number, '^\d\d\d\.\d\d\.\d\d\d\d\.\d\d\d\d\d\d$');

--OR
SELECT * 
  FROM HR.Employees
 WHERE REGEXP_LIKE (phone_number, '^[0-9]{3}\.[0-9]{2}\.[0-9]{4}\.[0-9]{6}$');
 
-- A6. Number of employees in each Department
SELECT department_id, COUNT(employee_id)
FROM HR.Employees
GROUP BY department_id;

-- B1. Employees last and first names 
SELECT Last_Name || ', ' || First_Name 
  FROM HR.Employees;

-- B2. Special Employee IDs in the format ZZ-### 
SELECT SUBSTR(last_name, 0, 1) ||
       SUBSTR (first_name, 0, 1) ||
       '-' ||
       Employee_ID 
  FROM HR.Employees;

-- B3. Department names surrounded by asterisks 
SELECT LPAD(Department_Name, 
                 LENGTH(Department_Name)+1, 
                 '*')
  FROM HR.Departments
 ORDER BY LENGTH(Department_Name);

-- B4. Formatted location addresses 
SELECT Street_Address || CHR(13) ||
       '     ' ||
       City || ', ' ||
       State_Province || ', ' ||
       Postal_Code || ', ' ||
       Country_ID 
  FROM HR.Locations;

-- B5. Formatted dates 
SELECT TO_CHAR(SYSDATE, 'MMYYYY'),
       TO_CHAR(SYSDATE, 'MON-YYYY'),
       TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
       TO_CHAR(SYSDATE, 'Month DD, YYYY'),
       TO_CHAR(SYSDATE, 'Day, Month DD, YYYY'),
       TO_CHAR(SYSDATE, 'Month DD, YYYY HH:mm:SS AM') 
  FROM DUAL;

