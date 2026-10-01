# Employee Management System

A Java-based Employee Management System built using **Java, Spring Boot, Spring Data JPA, Hibernate, MySQL and REST APIs**.

This project demonstrates CRUD operations, REST API development, database integration, validation, layered architecture and exception handling.

## Project Overview

The application provides REST APIs to manage employee records.

### Main Features

- Create an employee
- Retrieve all employees
- Retrieve an employee by ID
- Update employee details
- Delete an employee
- MySQL database integration
- JPA/Hibernate ORM
- Request validation
- Global exception handling
- Layered application structure

## Technology Stack

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- Hibernate
- MySQL
- Maven
- REST APIs
- Git / GitHub

## Project Architecture

```text
Client / Postman
       |
       v
EmployeeController
       |
       v
EmployeeService
       |
       v
EmployeeRepository
       |
       v
Spring Data JPA / Hibernate
       |
       v
     MySQL
```

## Project Structure

```text
employee-management-system/
│
├── src/
│   ├── main/
│   │   ├── java/com/suraj/employeemanagement/
│   │   │   ├── controller/
│   │   │   │   └── EmployeeController.java
│   │   │   ├── entity/
│   │   │   │   └── Employee.java
│   │   │   ├── exception/
│   │   │   │   ├── EmployeeNotFoundException.java
│   │   │   │   └── GlobalExceptionHandler.java
│   │   │   ├── repository/
│   │   │   │   └── EmployeeRepository.java
│   │   │   ├── service/
│   │   │   │   └── EmployeeService.java
│   │   │   └── EmployeeManagementApplication.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── application-example.properties
│   │
│   └── test/
│       └── java/com/suraj/employeemanagement/
│           └── EmployeeManagementApplicationTests.java
│
├── database/
│   └── schema.sql
├── .gitignore
├── pom.xml
└── README.md
```

## Prerequisites

Install the following:

- JDK 17 or later
- Maven 3.8+
- MySQL 8+
- Git
- Postman (optional, for API testing)

## Database Setup

You can let the application create the database automatically using the JDBC URL, or run the SQL script manually.

To create it manually:

```sql
CREATE DATABASE employee_db;
```

You can also use:

```text
database/schema.sql
```

to create the database, table and optional sample records.

## Configure MySQL

Open:

```text
src/main/resources/application.properties
```

The project uses environment variables with fallback values:

```properties
spring.datasource.username=${DB_USERNAME:root}
spring.datasource.password=${DB_PASSWORD:root}
```

For example, on Windows:

```text
DB_USERNAME=root
DB_PASSWORD=your_password
```

Do not commit real database passwords to GitHub.

## Run the Application

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/employee-management-system.git
cd employee-management-system
```

Build the project:

```bash
mvn clean install
```

Run the application:

```bash
mvn spring-boot:run
```

The application will start at:

```text
http://localhost:8080
```

## REST API Endpoints

### 1. Create Employee

```http
POST /api/employees
Content-Type: application/json
```

Request:

```json
{
  "name": "Rahul Patil",
  "email": "rahul.patil@example.com",
  "department": "IT",
  "salary": 60000
}
```

### 2. Get All Employees

```http
GET /api/employees
```

### 3. Get Employee by ID

```http
GET /api/employees/1
```

### 4. Update Employee

```http
PUT /api/employees/1
Content-Type: application/json
```

Request:

```json
{
  "name": "Rahul Patil",
  "email": "rahul.patil@example.com",
  "department": "Engineering",
  "salary": 65000
}
```

### 5. Delete Employee

```http
DELETE /api/employees/1
```

## Sample Response

```json
{
  "id": 1,
  "name": "Rahul Patil",
  "email": "rahul.patil@example.com",
  "department": "Engineering",
  "salary": 65000
}
```

## Design Approach

The application follows a simple layered architecture:

### Controller Layer

Handles HTTP requests and exposes REST endpoints.

### Service Layer

Contains business logic and coordinates application operations.

### Repository Layer

Uses Spring Data JPA to communicate with the database.

### Entity Layer

Maps the Employee Java class to the MySQL `employees` table using JPA annotations.

### Exception Handling

A global exception handler provides consistent responses for missing employees and validation errors.

## What I Practiced

- Core Java and OOP
- Spring Boot application development
- REST API development
- Spring Data JPA
- Hibernate ORM
- MySQL database integration
- CRUD operations
- SQL and database relationships
- Request validation
- Exception handling
- Maven project management
- Git and GitHub

## Project Description for Resume / Naukri

**Employee Management System | Personal Project**

Designed and developed a full-stack employee management application using Java and Spring Boot. Implemented CRUD operations through RESTful APIs and used Spring Data JPA and Hibernate for database interactions. Configured MySQL database tables and relationships for efficient storage and retrieval of employee information.

**Tech Stack:** Java, Spring Boot, Spring Data JPA, Hibernate, MySQL, REST APIs, Maven, Git.

## Important Security Note

Never commit:

- AWS access keys
- AWS secret keys
- MySQL production passwords
- API keys
- `.env` files containing credentials
- Private certificates

Use environment variables or local configuration files for sensitive values.
