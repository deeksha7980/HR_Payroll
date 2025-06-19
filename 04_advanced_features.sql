-- Triggers, Views, Stored Procedures

-- Trigger: Log employee updates
CREATE TRIGGER trg_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
INSERT INTO AuditLog(emp_id, action, performed_by)
VALUES (OLD.emp_id, 'Updated Employee Record', USER());

-- View: Monthly payroll summary
CREATE VIEW MonthlyPayrollSummary AS
SELECT 
  e.emp_id,
  e.first_name,
  e.last_name,
  s.basic,
  s.hra,
  s.allowances,
  s.bonus,
  d.tax,
  d.pf,
  d.other,
  (s.basic + s.hra + s.allowances + s.bonus) AS total_earnings,
  (d.tax + d.pf + d.other) AS total_deductions,
  ((s.basic + s.hra + s.allowances + s.bonus) - (d.tax + d.pf + d.other)) AS net_salary
FROM SalaryStructure s
JOIN Deductions d ON s.emp_id = d.emp_id
JOIN Employee e ON s.emp_id = e.emp_id
WHERE d.month_year = '2025-06';

-- Stored Procedure: Calculate gratuity
DELIMITER //
CREATE PROCEDURE CalculateGratuity(IN emp_id_input INT)
BEGIN
  DECLARE years_worked INT;
  SELECT TIMESTAMPDIFF(YEAR, join_date, CURDATE()) INTO years_worked
  FROM Employee WHERE emp_id = emp_id_input;

  SELECT emp_id, years_worked AS years, (years_worked * basic * 0.5) AS gratuity
  FROM SalaryStructure
  WHERE emp_id = emp_id_input;
END;
//
DELIMITER ;

-- Stored Procedure: Generate all salary slips for a month
DELIMITER //
CREATE PROCEDURE GenerateSalarySlips(IN input_month_year VARCHAR(7))
BEGIN
  INSERT INTO SalarySlip (emp_id, month_year, total_earnings, total_deductions, net_salary)
  SELECT 
    s.emp_id,
    input_month_year,
    (s.basic + s.hra + s.allowances + s.bonus),
    (d.tax + d.pf + d.other),
    ((s.basic + s.hra + s.allowances + s.bonus) - (d.tax + d.pf + d.other))
  FROM SalaryStructure s
  JOIN Deductions d ON s.emp_id = d.emp_id
  WHERE d.month_year = input_month_year;
END;
//
DELIMITER ;
