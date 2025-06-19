
-- 02_sample_data.sql
-- Insert sample employees and related records

INSERT INTO Employee (first_name, last_name, dob, gender, email, phone, address, join_date, job_title, department, status)
VALUES
('Aarav', 'Patel', '1990-04-23', 'M', 'aarav.patel@example.com', '9876543210', 'Mumbai', '2021-01-10', 'Developer', 'IT', 'Active'),
('Ananya', 'Sharma', '1992-07-12', 'F', 'ananya.sharma@example.com', '8765432109', 'Bangalore', '2020-03-15', 'HR Executive', 'HR', 'Active'),
('Rohan', 'Mehra', '1988-11-05', 'M', 'rohan.mehra@example.com', '7654321098', 'Delhi', '2019-08-20', 'Accountant', 'Finance', 'Active'),
('Priya', 'Verma', '1993-06-18', 'F', 'priya.verma@example.com', '9871234560', 'Chennai', '2022-04-12', 'Designer', 'Marketing', 'Active'),
('Kabir', 'Khan', '1985-01-30', 'M', 'kabir.khan@example.com', '9123456789', 'Kolkata', '2018-12-01', 'Manager', 'Operations', 'Active'),
('Sneha', 'Reddy', '1994-09-22', 'F', 'sneha.reddy@example.com', '9988776655', 'Hyderabad', '2023-02-10', 'Intern', 'IT', 'Active'),
('Vikram', 'Joshi', '1991-03-17', 'M', 'vikram.joshi@example.com', '9665544332', 'Pune', '2020-06-05', 'Developer', 'IT', 'Active'),
('Meera', 'Iyer', '1995-05-01', 'F', 'meera.iyer@example.com', '9332211000', 'Chennai', '2019-10-10', 'HR Manager', 'HR', 'Active'),
('Arjun', 'Desai', '1989-02-14', 'M', 'arjun.desai@example.com', '9556677889', 'Ahmedabad', '2017-07-18', 'Analyst', 'Finance', 'Active'),
('Neha', 'Gupta', '1996-12-25', 'F', 'neha.gupta@example.com', '9001122334', 'Delhi', '2021-11-11', 'Support Executive', 'Support', 'Active');

-- Sample Salary Structure
INSERT INTO SalaryStructure (emp_id, basic, hra, allowances, bonus)
VALUES
(1, 30000, 10000, 5000, 2000),
(2, 28000, 8000, 4000, 1000),
(3, 35000, 12000, 6000, 3000),
(4, 26000, 7000, 3000, 500),
(5, 50000, 15000, 8000, 4000),
(6, 15000, 4000, 2000, 0),
(7, 31000, 9000, 4500, 2500),
(8, 36000, 11000, 5500, 3500),
(9, 40000, 13000, 7000, 4500),
(10, 25000, 6000, 3500, 1000);

-- Sample Deductions
INSERT INTO Deductions (emp_id, month_year, tax, pf, other)
VALUES
(1, '2025-06', 3000, 1500, 500),
(2, '2025-06', 2800, 1400, 400),
(3, '2025-06', 3500, 1750, 600),
(4, '2025-06', 2600, 1300, 300),
(5, '2025-06', 5000, 2500, 700),
(6, '2025-06', 1500, 750, 200),
(7, '2025-06', 3100, 1550, 450),
(8, '2025-06', 3600, 1800, 500),
(9, '2025-06', 4000, 2000, 600),
(10, '2025-06', 2500, 1250, 300);
