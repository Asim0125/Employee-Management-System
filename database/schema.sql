CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

CREATE TABLE IF NOT EXISTS employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department VARCHAR(100) NOT NULL,
    salary DECIMAL(12,2)
);

-- Optional sample records
INSERT INTO employees (name, email, department, salary)
VALUES
('Amit Sharma', 'amit.sharma@example.com', 'IT', 55000.00),
('Priya Patil', 'priya.patil@example.com', 'HR', 48000.00);
