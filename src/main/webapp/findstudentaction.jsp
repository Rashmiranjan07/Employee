<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.qsp.repository2.EmployeeRepository" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    background:
        radial-gradient(circle at top left, #fbc2eb, transparent 40%),
        radial-gradient(circle at bottom right, #a6c1ee, transparent 40%),
        linear-gradient(135deg, #e0eafc, #cfdef3);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.card {
    width: 100%;
    max-width: 760px;
    background: rgba(255, 255, 255, 0.55);
    backdrop-filter: blur(20px);
    border-radius: 26px;
    box-shadow: 0 30px 70px rgba(0,0,0,0.2);
    overflow: hidden;
}

.header {
    padding: 40px 30px 60px;
    text-align: center;
    background: linear-gradient(120deg, #667eea, #764ba2);
    color: white;
}

.header h1 {
    font-size: 30px;
    font-weight: 600;
}

.avatar-wrap {
    display: flex;
    justify-content: center;
    margin-top: -45px;
}

.avatar {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    background: linear-gradient(135deg, #ff9a9e, #fad0c4);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
}

.content {
    padding: 40px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
}

tr {
    background: rgba(255,255,255,0.7);
    border-radius: 12px;
}

th, td {
    padding: 16px 20px;
    text-align: left;
}

th {
    width: 35%;
    color: #555;
}

.footer {
    text-align: center;
    padding: 18px;
    font-size: 13px;
    color: #555;
}
</style>
</head>

<body>

<%
    EmployeeRepository emprepo = EmployeeRepository.getInstance();

    String email = request.getParameter("email");

    String name = "Not Available";
    int age = 0;
    String phone = "Not Available";
    String gender = "Not Available";

    ResultSet rs = null;

    try {
        rs = emprepo.getStudentByEmail(email); // method name kept as-is
        if (rs.next()) {
            name = rs.getString(1);
            age = rs.getInt(2);
            phone = rs.getString(3);
            email = rs.getString(4);
            gender = rs.getString(5);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
    }
%>

<div class="card">

    <div class="header">
        <h1>Employee Profile</h1>
        <span>Professional Employee Details</span>
    </div>

    <div class="avatar-wrap">
        <div class="avatar">👤</div>
    </div>

    <div class="content">
        <table>
            <tr>
                <th>Full Name</th>
                <td><%= name %></td>
            </tr>
            <tr>
                <th>Age</th>
                <td><%= age %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= phone %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= email %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= gender %></td>
            </tr>
        </table>
    </div>

    <div class="footer">
        ✨ Employee Management System · 2026
    </div>

</div>

</body>
</html>
