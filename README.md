# Employee Management System
(Java | JSP | Servlet | JDBC | MySQL)

A simple **Employee Management System** built using **Core Java + JSP/Servlet + JDBC + MySQL** in **Eclipse IDE** and deployed on **Apache Tomcat**.  
This project demonstrates login, form handling, database connectivity, and searching employee/student records by email.

---

## 📌 Features

### 🔐 Authentication
- Login using username & password
- Validates credentials from database

### 🔎 Search by Email
- Find a single record by entering an email
- Displays details fetched from MySQL

---

## 🧰 Tech Stack

- **Java** (Core Java)
- **JSP & Servlet**
- **JDBC**
- **MySQL**
- **HTML5 / CSS3**
- **Apache Tomcat 9+**
- **Eclipse IDE**
- **Maven** (if `pom.xml` is used)

---
## 📁 Project Structure

```
Employee/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── employee/
│       │           ├── servlet/     # Servlets
│       │           ├── dao/         # DAO classes
│       │           └── util/        # DB / utility logic
│       │
│       └── webapp/
|           | └── web.xml
│           ├── css/                # CSS files
│           ├── js/                 # JavaScript files
│           ├── WEB-INF/
│           └── *.jsp               # JSP pages
│
├── pom.xml                         # Maven dependencies
├── README.md
└── .gitignore
```

