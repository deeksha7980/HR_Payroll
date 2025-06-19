
-- 01_schema.sql
-- HR Payroll System Schema

CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('M', 'F', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    join_date DATE,
    job_title VARCHAR(100),
    department VARCHAR(50),
    status ENUM('Active', 'Inactive')
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    date DATE,
    check_in TIME,
    check_out TIME,
    working_hours DECIMAL(4,2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Timesheet (
    timesheet_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    date DATE,
    shift_type ENUM('Morning', 'Evening', 'Night'),
    overtime_hours DECIMAL(4,2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE LeaveApplication (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason TEXT,
    status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE LeaveBalance (
    emp_id INT PRIMARY KEY,
    annual_leave INT DEFAULT 20,
    sick_leave INT DEFAULT 10,
    unpaid_leave INT DEFAULT 0,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE SalaryStructure (
    emp_id INT PRIMARY KEY,
    basic DECIMAL(10,2),
    hra DECIMAL(10,2),
    allowances DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Deductions (
    emp_id INT,
    month_year VARCHAR(7),
    tax DECIMAL(10,2),
    pf DECIMAL(10,2),
    other DECIMAL(10,2),
    PRIMARY KEY (emp_id, month_year),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE SalarySlip (
    slip_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    month_year VARCHAR(7),
    total_earnings DECIMAL(10,2),
    total_deductions DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    generated_on DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE AuditLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action VARCHAR(100),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    performed_by VARCHAR(100)
);
