<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.qsp.repository2.EmployeeRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	min-height: 100vh;
	background: linear-gradient(135deg, #667eea, #764ba2);
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	width: 520px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(14px);
	border-radius: 22px;
	padding: 35px;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
	animation: fadeIn 1s ease-in-out;
	color: #fff;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.header {
	text-align: center;
	margin-bottom: 30px;
}

.header h1 {
	font-size: 28px;
	letter-spacing: 1px;
}

.avatar {
	width: 90px;
	height: 90px;
	border-radius: 50%;
	margin: 20px auto;
	background: linear-gradient(135deg, #00c6ff, #0072ff);
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 36px;
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.4);
}

table {
	width: 100%;
	margin-top: 20px;
	border-collapse: separate;
	border-spacing: 0 14px;
}

th, td {
	padding: 14px 16px;
	text-align: left;
}

th {
	width: 35%;
	color: #f1f1f1;
	font-weight: 500;
}

td {
	background: rgba(255, 255, 255, 0.9);
	color: #333;
	border-radius: 10px;
	font-weight: 500;
}

.message {
	text-align: center;
	font-size: 16px;
	margin-top: 20px;
	color: #ffdddd;
}

.footer {
	margin-top: 30px;
	text-align: center;
	font-size: 13px;
	opacity: 0.9;
}
</style>
</head>

<body>
	<%
	EmployeeRepository emprepo = EmployeeRepository.getInstance();

	String email = request.getParameter("email");

	String name = "";
	int age = 0;
	String phone = "";
	String gender = "";
	boolean found = false;

	ResultSet rs = null;

	if (email != null) {
		try {
			rs = emprepo.getEmployeeByEmail(email);
			if (rs.next()) {
		found = true;
		name = rs.getString(1);
		age = rs.getInt(2);
		phone = rs.getString(3);
		email = rs.getString(4);
		gender = rs.getString(5);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
		rs.close();
		}
	}
	%>

	<div class="card">

		<div class="header">
			<h1>Employee Profile</h1>
		</div>

		<div class="avatar">👤</div>

		<%
		if (found) {
		%>
		<table>
			<tr>
				<th>Full Name</th>
				<td><%=name%></td>
			</tr>
			<tr>
				<th>Age</th>
				<td><%=age%></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><%=phone%></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=email%></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td><%=gender%></td>
			</tr>
		</table>
		<%
		} else {
		%>
		<div class="message">❌ Employee not found or email not provided
		</div>
		<%
		}
		%>

		<div class="footer">Employee Management System</div>

	</div>
</body>
</html>
