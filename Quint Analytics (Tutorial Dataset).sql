#1 Creation of Database and Table.

CREATE DATABASE QUINT_ANALYTICS;

#2 Employee records Table creation

	CREATE TABLE employee_record 
		(ID INT PRIMARY KEY,
        First_name VARCHAR(10),
        Last_name VARCHAR(10),
		Age INT NOT NULL CHECK(Age > 15), 
        Gender VARCHAR(10) NOT NULL,
        Birth_date DATE);
        

#3/4 Inputting of values into Table (employee_record) that was created inside Quint Analytics Database.

INSERT INTO employee_record (ID, First_name, Last_name, Age, Gender, Birth_date)
					VALUE   (1, 'Emily', 'Wilson', 44, 'Female', '1979-09-25'),
							(3, 'Michael', 'Davis', 36, 'Male', '1987-03-04'),
							(4, 'Sarah', 'Ludgate', 29, 'Female', '1994-03-27'),
							(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
							(6, 'Olivia', 'Brown', 46, 'Female', '1977-07-30'),
							(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
							(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
							(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
							(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
							(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
							(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

#4/3 Increase the character length of First and Last name column, due to the length of employee_record ID 11 & 12.

ALTER TABLE employee_record 
	MODIFY Last_name VARCHAR (20),
	MODIFY First_name VARCHAR (20);

#11 To change the Contraint (PRIMARY KEY) on ID column due to the uneven arrangement of ID numbers of employee_record.

ALTER TABLE employee_record
	DROP PRIMARY KEY;

#12 To Add FOREIGN KEY constraint to the ID column that was dropped;

ALTER TABLE employee_record
	ADD CONSTRAINT fk_ID FOREIGN KEY (ID) REFERENCES employee_salary (employee_ID);


#7 Creating Table (employee_salary) inside Quint Analytics Database.

CREATE TABLE employee_salary
	(employee_ID INT PRIMARY KEY,
    First_name VARCHAR(10), 
    Last_name VARCHAR(10),
    Occupation VARCHAR(20),
    Salary INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES parks_company_departments (Department_ID));
    
#8/9 Inputting of values into our Table (employee_salary) that was created inside Quint Analytics Database.

INSERT INTO employee_salary (employee_ID, First_name, Last_name, Occupation, Salary, Dept_ID)
							VALUE   (1, 'Leslie', 'Knope', 'Deputy Director of Parks', 75000, 1),
									(2, 'Ron', 'Swanson', 'Director of Parks', 70000, 1),
									(3, 'Tom', 'Haverford', 'Enterprenueur', 50000, 1),
									(4, 'April', 'Ludgate', 'Assistant of the Director of Parks', 25000, 1),
									(5, 'Jerry', 'Gergich', 'Office Manager', 50000, 1),
									(6, 'Donna', 'Meagle', 'Office Manager', 60000, 1),
									(7, 'Ann', 'Perkins', 'Nurse', 55000, 4),
									(8, 'Chris', 'Traeger', 'City Manager', 90000, 3),
									(9, 'Ben', 'Wyatt', 'State Auditor', 70000, 6),
									(10, 'Andy', 'Dwyer', 'Shoe shiner and musician', 20000, 3),
									(11, 'Mark', 'Brendanawicz', 'City planner', 57000, 3),
									(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000, 1);

#9/8 Increase the character length of Last_name Occupation column, due to the length of employee_record ID 11, 12 amd 1.

ALTER TABLE employee_salary
	MODIFY Occupation VARCHAR(50),
    MODIFY Last_name VARCHAR(50);

#10 To drop the cell data of employee_ID 10, under Depth_ID column, due to the inabilty of the query to execute for the absence of that cell data we used '3' to manipulate the query to work and will be dropped later.

UPDATE employee_salary SET Dept_ID = NULL WHERE employee_ID = 10;


#5 Creating Table (parks_company_departments) inside Quint Analytics Database.

CREATE TABLE parks_company_departments
	(Department_ID INT PRIMARY KEY,
    Department_name VARCHAR(30));

#6 Inputting of values into our Table (parks_company_departments) that was created inside Quint Analytics Database.

INSERT INTO parks_company_departments (Department_ID, Department_name) 
								VALUE (1, 'Parks and Recreation'),
									  (2, 'Animal control'),
									  (3, 'Public works'),
									  (4, 'Healthcare'),
									  (5, 'Library'),
									  (6, 'Finance');