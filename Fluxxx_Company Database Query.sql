# Find the employee name and salary with the highest pay in each department who joined in the last 
-- 3years, along with their department name and location.

WITH record AS 
	(SELECT Department_ID,
			Employee_Name,
            Date_Joined
	FROM employee_record
	WHERE Date_Joined >= '2022-01-01'),
record2 AS
	(SELECT Department_ID,
			MAX(Salary_Decimal)
	FROM employee_record
	GROUP BY Department_ID),
department AS
	(SELECT Department_ID,
			Department, 
			Location
	FROM fluxxx_department)
SELECT *
FROM record 
INNER JOIN record2 
	ON record.Department_ID = record2.Department_ID
INNER JOIN department 
	ON record2.Department_ID = department.Department_ID;
