
-- 03_queries.sql
-- Core SQL Queries

-- 1. View all employees
SELECT * FROM Employee;

-- 2. Add a new employee
INSERT INTO Employee (first_name, last_name, dob, gender, email, phone, address, join_date, job_title, department, status)
VALUES ('John', 'Doe', '1990-01-01', 'M', 'john.doe@example.com', '9123456780', 'New Delhi', '2024-01-01', 'Tester', 'QA', 'Active');

-- 3. Update employee details
UPDATE Employee SET email = 'updated.email@example.com' WHERE emp_id = 1;

-- 4. Delete an employee
DELETE FROM Employee WHERE emp_id = 10;

-- 5. Record attendance
INSERT INTO Attendance (emp_id, date, check_in, check_out, working_hours)
VALUES (1, '2025-06-19', '09:00:00', '18:00:00', 9.0);

-- 6. View attendance of an employee for a month
SELECT * FROM Attendance WHERE emp_id = 1 AND MONTH(date) = 6 AND YEAR(date) = 2025;

-- 7. Apply for leave
INSERT INTO LeaveApplication (emp_id, leave_type, start_date, end_date, reason, status)
VALUES (1, 'Sick', '2025-06-15', '2025-06-17', 'Fever and rest', 'Pending');

-- 8. View leave history
SELECT * FROM LeaveApplication WHERE emp_id = 1;

-- 9. Approve a leave
UPDATE LeaveApplication SET status = 'Approved' WHERE leave_id = 1;

-- 10. View salary components
SELECT * FROM SalaryStructure WHERE emp_id = 1;

-- 11. Calculate salary for June 2025
SELECT 
  s.emp_id,
  (s.basic + s.hra + s.allowances + s.bonus) AS total_earnings,
  (d.tax + d.pf + d.other) AS total_deductions,
  ((s.basic + s.hra + s.allowances + s.bonus) - (d.tax + d.pf + d.other)) AS net_salary
FROM SalaryStructure s
JOIN Deductions d ON s.emp_id = d.emp_id
WHERE d.month_year = '2025-06';

-- 12. Generate salary slip for June 2025
INSERT INTO SalarySlip (emp_id, month_year, total_earnings, total_deductions, net_salary)
SELECT 
  s.emp_id,
  '2025-06',
  (s.basic + s.hra + s.allowances + s.bonus),
  (d.tax + d.pf + d.other),
  ((s.basic + s.hra + s.allowances + s.bonus) - (d.tax + d.pf + d.other))
FROM SalaryStructure s
JOIN Deductions d ON s.emp_id = d.emp_id
WHERE d.month_year = '2025-06';

-- 13. View salary slip
SELECT * FROM SalarySlip WHERE emp_id = 1 AND month_year = '2025-06';

-- 14. View employee net salaries in descending order
SELECT e.emp_id, e.first_name, e.last_name, ss.net_salary
FROM SalarySlip ss
JOIN Employee e ON e.emp_id = ss.emp_id
WHERE ss.month_year = '2025-06'
ORDER BY ss.net_salary DESC;
