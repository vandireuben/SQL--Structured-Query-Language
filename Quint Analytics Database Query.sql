#Display all employee with salary 50000 and above
SELECT * 
FROM employee_salary
WHERE Salary >= 5000;

#Display all employee that are not female
SELECT * 
FROM employee_record
WHERE Gender != 'Female';

#Display all male employee records with birth year 1985 and above
SELECT * 
FROM employee_record
WHERE Birth_date >= '1985-01-01';

#Display all employee records with birth year 1985 and above or all female employee
SELECT * 
FROM employee_record
WHERE Birth_date >= '1985-01-01' OR Gender = 'Female';

#Search for an employee with first name ‘Leslie’ having age 44
SELECT * 
FROM employee_record
WHERE First_name = 'Leslie' AND Age = 44;

#Search for an employee with first name ‘Leslie’ having age 44 or employee with 55 years and above
SELECT * 
FROM employee_record
WHERE (First_name = 'Leslie' AND Age = 44) OR Age >= 55;

#Search for any employee with first name starting with ‘Jer’
SELECT * 
FROM employee_record
WHERE First_name LIKE 'Jer%';

#Find the average age of all male employee and female employee that are above age 40
SELECT Gender, 
	avg(Age)
FROM employee_record
WHERE Age > 40
GROUP BY Gender;

#Find the average, maximum and minimum age of all female employee and male employee
SELECT Gender, 
	avg(Age),
    max(Age),
    min(Age)
FROM employee_record
GROUP BY Gender;

#Arrange all employee first names in alphabetical order 
SELECT First_name
FROM employee_record
ORDER BY First_name;

#Display first 4 employee after employee ID 5
SELECT *
FROM employee_record
LIMIT 4 OFFSET 4;

#Find the average salary of any managerial position in occupation column, with salary above 50000
SELECT Occupation,
	AVG(Salary) as avg_sal
FROM employee_salary
WHERE Occupation LIKE '%manager%'
GROUP BY Occupation
HAVING avg_sal > 50000;

#Join employee record and employee salary, so that we can find out the employee full information's that are containing in both tables.
SELECT *
FROM employee_record emp1
INNER JOIN employee_salary emp2
	ON emp1.ID = emp2.employee_ID;

#Join employee record (ID, First name, & Age columns) and employee salary (Occupation & Salary columns), so that we can find out the employee full information's that are containing in both tables.
SELECT emp1.ID,
	 emp1.First_name, 
	 emp1.Age,
	 emp2.Occupation, 
	 emp2.Salary
FROM employee_record emp1
INNER JOIN employee_salary emp2
	ON emp1.ID = emp2.employee_ID;

#Join employee record to employee salary, returning all records only in employee record table and match records of employee salary on the employee records. (Try the opposite on this question and the two previous ones)
SELECT *
FROM employee_record emp1
RIGHT OUTER JOIN employee_salary emp2
	ON emp1.ID = emp2.employee_ID;

#Run a self join on employee record (ID, first & last names of the two tables), to shuffle the staff to run a task in the company
SELECT emp1.employee_ID, 
	emp1.first_name, 
    emp1.last_name,
    emp2.employee_ID, 
	emp2.first_name, 
    emp2.last_name
FROM employee_salary emp1
INNER JOIN employee_salary emp2
	ON emp1.employee_ID+1 = emp2.employee_ID;

#Display all employee record table & merge with employee salary table intersects, and display all employee salary table & merge with parks company department to show all employee department’s
SELECT *
FROM employee_record emp1
INNER JOIN employee_salary emp2
	ON emp1.ID = emp2.employee_ID
INNER JOIN parks_company_departments emp3
	ON emp2.Dept_ID = emp3.Department_ID;

#Join employee record table & employee salary table, returning only staff that works in parks and recreation department in parks company department table.
SELECT *
FROM employee_record emp1
INNER JOIN employee_salary emp2
	ON emp1.ID = emp2.employee_ID
INNER JOIN parks_company_departments emp3
	ON emp2.Dept_ID = emp3.Department_ID
WHERE Department_ID = 1;

#Combine (UNION) first and last name of employee record and salary
SELECT ID,
	First_name,
	Last_name
FROM employee_record
UNION 
SELECT employee_ID,
	First_name,
	Last_name
FROM employee_salary;

#Find out & display FULL NAME of all employee with age above 50 (Label them as ‘Old employee’) and receiving salary above 70000 (Label them as ‘Highly paid employee’).
SELECT First_name,
	Last_name, 
    'Old employee' AS Age_stat
FROM employee_record 
WHERE Age > 50
UNION 
SELECT First_name,
      Last_name, 
	    'Over paid' AS Pay_stat
FROM employee_salary
WHERE Salary > 70000;

#Find out & display full name of all male employee with age above 40 (Label them as ‘Old male employee’), all female employee age above 40 (Label them as ‘Old female employee’) and receiving salary above 70000 (Label them as ‘Highly paid employee’). 
SELECT First_name,
	Last_name, 
    'Old male employee' AS Age_stat
FROM employee_record 
WHERE Gender = 'Male' AND Age > 40
UNION
SELECT First_name,
	Last_name, 
    'Old female employee' AS Age_stat
FROM employee_record 
WHERE Gender = 'Female' AND Age > 40
UNION 
SELECT First_name,
      Last_name, 
	    'Over paid' AS Pay_stat
FROM employee_salary
WHERE Salary > 70000;

#Create a case statement showing (Old employee) on employee that are 50 years and above, (Middle age employee) for employee between 32 to 50, and (Young employee) on employee below 30 years.
SELECT First_name,
	Age,
	CASE 
		WHEN Age >= 50 THEN 'Old employee'
        WHEN Age BETWEEN 32 AND 50 THEN 'Middle age employee'
        WHEN Age < 30 THEN 'Young employee'
	END AS STATUS
FROM employee_record;

#Using the case statement increase the employee with salary below 50000 by 5%, while above 50000 by 7%, and finance department 10% increment. Displaying employee full name, initial salary and increased salary.
SELECT First_name,
	Salary,
	CASE 
		WHEN Salary > 50000 THEN Salary + Salary * 0.07
        WHEN Salary < 50000 THEN Salary + Salary * 0.05
	END AS Increased_sal,
    CASE 
		WHEN Dept_ID = 6 THEN Salary * 0.10
	END AS Additional_Bonus
FROM employee_salary;

#Using subquery display all employee in employee record table that works in parks and recreation department found in parks company department table.(NOTE only employee record table record needs to be displayed)
SELECT *
FROM employee_record
WHERE ID IN (SELECT employee_ID
				FROM employee_salary 
			WHERE Dept_ID = 1);

#Display all employee full names, individual salary, and general average salary attached to each employee salary for comparison.
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, 
		Salary,
        (SELECT AVG(Salary) 
        FROM employee_salary) AS Average_Sal
FROM employee_salary;

#Using subquery, find the average, maximum and minimum age of separate employee genders (Male & Female) of the initial aggregated data (average, maximum and minimum age of separate employee genders).
SELECT Gender,
	AVG(Age) AS Avg_age, 
    MAX(Age) AS Max_age, 
    MIN(Age) AS Min_age
FROM employee_record
GROUP BY Gender;

#Using subquery, find the average of the maximum age of  employee of the initial aggregated data.
SELECT  AVG(Max_age)
FROM (SELECT Gender, AVG(Age)
		AS Avg_age, 
        MAX(Age) AS Max_age, 
        MIN(Age) AS Min_age 
	FROM employee_record 
	GROUP BY Gender) AS Aggregated_table;
