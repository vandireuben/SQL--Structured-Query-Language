#1 Creation of Database

CREATE DATABASE Veoliah_Company;

-- USE syntax is used to select the exact Database (Veoliah_Company) we intend using without manually doing so

USE Veoliah;

#2 Creating Veoliah_Departments table

CREATE TABLE Veoliah_Departments
		(Department_ID INT AUTO_INCREMENT PRIMARY KEY,
		Department_name VARCHAR(30));
        
#3 Creating Veoliah employee_salary table

CREATE TABLE employee_salary
		(ID INT AUTO_INCREMENT PRIMARY KEY,
		First_name VARCHAR(50), 
		Last_name VARCHAR(50),
		Occupation VARCHAR(50),
		Salary INT,
		Dept_ID INT,
        FOREIGN KEY (Dept_ID) REFERENCES Veoliah_Departments (Department_ID));
        
#4 Creating Veoliah employee_record table

CREATE TABLE employee_record 
		(employee_ID INT,
        First_name VARCHAR(20) DEFAULT('NEW EMPLOYEE'),
        Last_name VARCHAR(20),
		Age INT NOT NULL CHECK(Age > 15), 
        Gender VARCHAR(10) NOT NULL,
        Birth_date DATE,
        FOREIGN KEY (employee_ID) REFERENCES employee_salary (ID));

#5 Populating the Veoliah departments table with values

INSERT INTO Veoliah_Departments (Department_name) 
						  VALUE ('Parks and Recreation'),
								('Animal control'),
								('Public works'),
								('Healthcare'),
								('Library'),
								('Finance');

#6 Inserting salary data into Veoliah's employee table

INSERT INTO employee_salary (First_name, Last_name, Occupation, Salary, Dept_ID)
					VALUE   ('Emily', 'Wilson', 'Deputy Director of Parks', 75000, 1),
							('Julia', 'Martin', 'Director of Parks', 70000, 1),
							('Michael', 'Davis', 'Enterprenueur', 50000, 1),
							('Sarah', 'Ludgate', 'Assistant of the Director of Parks', 25000, 1),
							('Jerry', 'Gergich', 'Office Manager', 50000, 1),
							('Olivia', 'Brown', 'Office Manager', 60000, 1),
							('Ann', 'Perkins', 'Nurse', 55000, 4),
							('Chris', 'Traeger', 'City Manager', 90000, 3),
							('Ben', 'Wyatt', 'State Auditor', 70000, 6);
                            
-- Due to the absence of Dept_ID of employee salary ID-10, we decided to INSERT it separetely to avoid error as we run our codes
                           
INSERT INTO employee_salary (First_name, Last_name, Occupation, Salary)
					 VALUES ('Andy', 'Dwyer', 'Shoe shiner and musician', 20000);
                     
INSERT INTO employee_salary (First_name, Last_name, Occupation, Salary, Dept_ID)
					VALUE	('Mark', 'Brendanawicz', 'City planner', 57000, 3),
							('Craig', 'Middlebrooks', 'Parks Director', 65000, 1);

 
#7 Populating the Veoliah employee_record table with values

INSERT INTO employee_record (employee_ID, First_name, Last_name, Age, Gender, Birth_date)
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