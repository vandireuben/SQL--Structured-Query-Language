#1 Create Fluxxx Company DATABASE

CREATE DATABASE Fluxxx_company;

-- The USE syntax enable seamless selection of desire Database (Fluxxx Company) without having to do it manually

USE Fluxxx_company;

#2 Create Fluxx Company Department table

CREATE TABLE Fluxxx_Department
			(Department_ID INT AUTO_INCREMENT PRIMARY KEY,
            Location VARCHAR (70),
			Department VARCHAR (70));

#3 Create Fluxx Company employee table

CREATE TABLE Employee_Record
		   (Employee_ID INT,
			Employee_Name VARCHAR (50), 
			Salary_Decimal DECIMAL (10,2),
			Date_Joined DATE,
			Department_ID INT,
            FOREIGN KEY (Department_ID) REFERENCES Fluxxx_Department (Department_ID));
					
            
#4 Value insertion into Fluxxx_Department

INSERT INTO Fluxxx_Department (Department_ID, Department, Location)
					 VALUE  (101, 'Sales', 'New York'),
							(102, 'Marketing', 'Los Angeles'),
							(103, 'Finance', 'Chicago');
						
#5 Value insertion into Fluxxx Company employee_record table

INSERT INTO Employee_Record (Employee_ID, Employee_Name, Salary_Decimal, Date_Joined, Department_ID)
					  VALUE (1, 'John Jenkins', 60000.00, '2023-04-15', 101),
							(2, 'Mary Alex', 70000.00, '2022-11-20', 102),
							(3, 'David William', 75000.00, '2021-09-10', 101),
							(4, 'Lisa Russell', 80000.00, '2024-02-28', 103),
							(5, 'Micheal Lange', 90000.00, '2022-07-05', 103),
                            (6, 'Dan mark', 85000.00, '2017-02-17', 102),
                            (7, 'Josiah Ben', 89000.00, '2021-11-17', 102),
                            (8, 'Chelsea Brown', 82000.00, '2015-03-25', 101),
                            (9, 'Destiny John', 60000.00, '2015-09-08', 102),
                            (10, 'Chris Joel', 65000.00, '2019-12-18', 102),
                            (11, 'Mark Ishaya', 50000.00, '2021-02-22', 102),
                            (12, 'Jerry Peter', 59000.00, '2022-09-09', 103),
                            (13, 'Justice John', 75000.00, '2018-10-03', 103),
                            (14, 'Abraham Lang', 78000.00, '2019-11-14', 102),
                            (15, 'Jeff Heldi', 80000.00, '2020-08-28', 103);