# Employee Management System

A RESTful Employee Management System built with **Java, Spring Boot, Spring Data JPA, Hibernate, and MySQL**.

The application provides APIs to create, retrieve, update, and delete employee records. It follows a layered backend architecture using **Controller, Service, Repository, and Entity** components.

---

## Features

- Create employee records
- Retrieve all employees
- Retrieve an employee by ID
- Update employee information
- Delete employee records
- Request validation
- Global exception handling
- MySQL database integration
- JPA/Hibernate-based persistence
- RESTful API design
- Maven-based project
- Environment-variable support for database credentials

---

## Tech Stack

| Technology | Purpose |
|---|---|
| Java 17 | Programming language |
| Spring Boot 3.3.5 | Backend framework |
| Spring Web | REST API development |
| Spring Data JPA | Data access layer |
| Hibernate | ORM / database persistence |
| MySQL | Relational database |
| Maven | Build and dependency management |
| Jakarta Validation | Request validation |
| Git & GitHub | Version control |

---

## Project Architecture

The application follows a layered architecture:

```text
                    Client
                      |
                      v
              +---------------+
              |   Controller  |
              +---------------+
                      |
                      v
              +---------------+
              |    Service    |
              +---------------+
                      |
                      v
              +---------------+
              |  Repository   |
              +---------------+
                      |
                      v
              +---------------+
              | JPA / Hibernate|
              +---------------+
                      |
                      v
              +---------------+
              |     MySQL     |
              +---------------+
```

### Layers

**Controller**

Handles HTTP requests and exposes REST endpoints.

**Service**

Contains the application/business logic and coordinates operations between the controller and repository.

**Repository**

Uses Spring Data JPA to communicate with the database.

**Entity**

Represents the employee data stored in the `employees` table.

**Exception Handling**

The project includes a custom employee-not-found exception and a global exception handler for API error responses.

---

## Project Structure

```text
employee-management-system/
│
├── database/
│   └── schema.sql
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── suraj/
│   │   │           └── employeemanagement/
│   │   │               │
│   │   │               ├── EmployeeManagementApplication.java
│   │   │               │
│   │   │               ├── controller/
│   │   │               │   └── EmployeeController.java
│   │   │               │
│   │   │               ├── entity/
│   │   │               │   └── Employee.java
│   │   │               │
│   │   │               ├── exception/
│   │   │               │   ├── EmployeeNotFoundException.java
│   │   │               │   └── GlobalExceptionHandler.java
│   │   │               │
│   │   │               ├── repository/
│   │   │               │   └── EmployeeRepository.java
│   │   │               │
│   │   │               └── service/
│   │   │                   └── EmployeeService.java
│   │   │
│   │   └── resources/
│   │       ├── application.properties
│   │       └── application-example.properties
│   │
│   └── test/
│       └── java/
│           └── com/
│               └── suraj/
│                   └── employeemanagement/
│                       └── EmployeeManagementApplicationTests.java
│
├── .gitignore
├── LICENSE
├── pom.xml
└── README.md
```

---

## Employee Entity

Each employee contains the following information:

| Field | Type | Description |
|---|---|---|
| `id` | Long | Automatically generated employee ID |
| `name` | String | Employee name |
| `email` | String | Unique employee email |
| `department` | String | Employee department |
| `salary` | BigDecimal | Employee salary |

### Validation

The application validates employee data using Jakarta Validation.

- Name cannot be blank
- Email cannot be blank
- Email must have a valid format
- Department cannot be blank
- Salary cannot be negative

---

# REST API

Base URL:

```text
http://localhost:8080
```

## 1. Get All Employees

```http
GET /api/employees
```

Example:

```bash
curl.exe http://localhost:8080/api/employees
```

Response when there are no employees:

```json
[]
```

---

## 2. Get Employee by ID

```http
GET /api/employees/{id}
```

Example:

```bash
curl.exe http://localhost:8080/api/employees/1
```

Example response:

```json
{
  "id": 1,
  "name": "Syed Mohd Asim",
  "email": "syedasim@example.com",
  "department": "Data Science",
  "salary": 60000.00
}
```

---

## 3. Create Employee

```http
POST /api/employees
```

Request body:

```json
{
  "name": "Syed Mohd Asim",
  "email": "syedasim@example.com",
  "department": "Data Science",
  "salary": 60000
}
```

The employee ID is generated automatically by the database.

---

## 4. Update Employee

```http
PUT /api/employees/{id}
```

Example:

```json
{
  "name": "Syed Mohd Asim",
  "email": "syedasim@example.com",
  "department": "Backend Engineering",
  "salary": 65000
}
```

---

## 5. Delete Employee

```http
DELETE /api/employees/{id}
```

Example:

```bash
curl.exe -X DELETE http://localhost:8080/api/employees/1
```

---

# Database Configuration

The application uses MySQL.

Default database:

```text
employee_db
```

The application is configured to use:

```text
localhost:3306
```

Database configuration is handled through environment variables:

```properties
spring.datasource.username=${DB_USERNAME:root}
spring.datasource.password=${DB_PASSWORD:}
```

This allows database credentials to remain outside the source code.

---

# Local Setup

## Prerequisites

Install the following:

- Java 17 or later
- Maven
- MySQL 8+
- Git

Verify Java:

```bash
java -version
```

Verify Maven:

```bash
mvn -version
```

Verify MySQL:

```bash
mysql --version
```

---

## 1. Clone the Repository

```bash
git clone https://github.com/Asim0125/Employee-Management-System.git
```

Move into the project:

```bash
cd Employee-Management-System
```

---

## 2. Create the Database

Open MySQL:

```bash
mysql -u root -p
```

Create the database:

```sql
CREATE DATABASE employee_db;
```

Verify:

```sql
SHOW DATABASES;
```

---

## 3. Configure Database Credentials

Set the database password using an environment variable.

### Windows PowerShell

```powershell
$env:DB_USERNAME="root"
$env:DB_PASSWORD="YOUR_MYSQL_PASSWORD"
```

Do not commit your actual database password to GitHub.

---

## 4. Build the Project

Run:

```bash
mvn clean compile
```

---

## 5. Start the Application

Run:

```bash
mvn spring-boot:run
```

The application runs on:

```text
http://localhost:8080
```

Test the API:

```bash
curl.exe http://localhost:8080/api/employees
```

---

# Database Schema

Hibernate manages the entity-to-table mapping.

The main database table is:

```text
employees
```

The project also contains:

```text
database/schema.sql
```

for the database schema.

---

# Testing the API

The complete CRUD flow can be tested using tools such as:

- PowerShell
- cURL
- Postman
- Any REST API client

Example using PowerShell:

### Create

```powershell
$body = @{
    name = "Syed Mohd Asim"
    email = "syedasim@example.com"
    department = "Data Science"
    salary = 60000
} | ConvertTo-Json

Invoke-RestMethod `
    -Uri "http://localhost:8080/api/employees" `
    -Method POST `
    -ContentType "application/json" `
    -Body $body
```

### Read

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:8080/api/employees" `
    -Method GET
```

### Update

```powershell
$body = @{
    name = "Syed Mohd Asim"
    email = "syedasim@example.com"
    department = "Backend Engineering"
    salary = 65000
} | ConvertTo-Json

Invoke-RestMethod `
    -Uri "http://localhost:8080/api/employees/1" `
    -Method PUT `
    -ContentType "application/json" `
    -Body $body
```

### Delete

```powershell
Invoke-RestMethod `
    -Uri "http://localhost:8080/api/employees/1" `
    -Method DELETE
```

---

# Error Handling

The application contains:

```text
EmployeeNotFoundException
```

for employee lookup failures.

A global exception handler is provided through:

```text
GlobalExceptionHandler
```

This allows API errors to be handled consistently instead of exposing raw application exceptions.

---

# Validation

Employee requests are validated before being persisted.

For example:

```java
@NotBlank
private String name;
```

```java
@Email
@NotBlank
private String email;
```

```java
@NotBlank
private String department;
```

```java
@PositiveOrZero
private BigDecimal salary;
```

This prevents invalid employee information from being stored.

---

# Maven Commands

Compile the application:

```bash
mvn compile
```

Run tests:

```bash
mvn test
```

Clean the build:

```bash
mvn clean
```

Build the project:

```bash
mvn package
```

Run the application:

```bash
mvn spring-boot:run
```

---

# Git Workflow

Clone:

```bash
git clone https://github.com/Asim0125/Employee-Management-System.git
```

Check status:

```bash
git status
```

Create a commit:

```bash
git add .
git commit -m "Update employee management system"
```

Push:

```bash
git push origin main
```

---

# Future Improvements

Possible future improvements include:

- Pagination and sorting
- Search and filtering
- DTO-based request/response models
- API documentation using OpenAPI/Swagger
- Unit and integration test expansion
- Authentication and authorization
- Docker support
- CI/CD pipeline
- Production database configuration
- Logging and monitoring

---

## Author

**Syed Mohd Asim**

GitHub:  
https://github.com/Asim0125

---

## License

This project is licensed under the license included in this repository.
