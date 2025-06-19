# 💼 HR Payroll System (MySQL/MariaDB Only)

## 👩‍💼👨‍💼 Project Overview

This project implements a comprehensive **HR Payroll Management System** using **MySQL/MariaDB only**, focusing on back-end database operations without any frontend or external backend code.

The system handles:
- Employee management
- Attendance tracking
- Timesheet entries
- Leave applications and approvals
- Salary structure and deduction tracking
- Monthly payroll and salary slip generation
- Bonus features like audit logs, views, and stored procedures

---

## 📁 Project Files

| File Name                  | Description                                         |
|---------------------------|-----------------------------------------------------|
| `01_schema.sql`           | Complete database schema in 3NF (DDL)               |
| `02_sample_data.sql`      | Sample data for employees, salaries, deductions     |
| `03_queries.sql`          | CRUD operations, attendance, leaves, payroll        |
| `04_advanced_features.sql`| Triggers, views, and stored procedures (Bonus)      |
| `README.md`               | Project documentation and usage instructions        |

---

## 🧠 Database Schema Summary

The system is designed with the following normalized tables:

- `Employee` – Stores personal and job details
- `Attendance` – Tracks check-in/out times and working hours
- `Timesheet` – Stores shift and overtime data
- `LeaveApplication` – Handles leave requests and approvals
- `LeaveBalance` – Tracks remaining leave balances
- `SalaryStructure` – Basic salary, allowances, bonuses
- `Deductions` – Monthly tax, PF, and other deductions
- `SalarySlip` – Monthly earnings, deductions, and net pay
- `AuditLog` – Logs key changes for traceability

---

## ⚙️ How to Use (Execution Steps)

### ✅ 1. Create & Use Database
```sql
CREATE DATABASE hr_payroll;
USE hr_payroll;

SOURCE 01_schema.sql;
SOURCE 02_sample_data.sql;
SOURCE 03_queries.sql;
SOURCE 04_advanced_features.sql;
