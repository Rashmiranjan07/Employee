<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.qsp.repository2.EmployeeRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>All Employees</title>

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
	padding: 30px;
}

/* Container */
.container {
	width: 100%;
	max-width: 1000px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	border-radius: 22px;
	padding: 35px;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
	animation: fadeIn 1s ease-in-out;
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

/* Title */
h1 {
	text-align: center;
	color: #fff;
	margin-bottom: 30px;
	font-size: 28px;
	letter-spacing: 1px;
}

/* Table */
table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0 12px;
}

thead td {
	color: #2b2b2b; /* darker heading */
	font-weight: 700;
	font-size: 14px;
	padding-bottom: 10px;
}

tr {
	background: rgba(255, 255, 255, 0.9);
	border-radius: 14px;
}

td {
	padding: 14px 16px;
	font-size: 14px;
	color: #222;
}

tr td:first-child {
	border-top-left-radius: 14px;
	border-bottom-left-radius: 14px;
}

tr td:last-child {
	border-top-right-radius: 14px;
	border-bottom-right-radius: 14px;
}

/* Buttons */
a {
	text-decoration: none;
	padding: 7px 14px;
	border-radius: 18px;
	font-size: 13px;
	font-weight: bold;
	transition: 0.3s;
	display: inline-block;
}

.update {
	background: linear-gradient(135deg, #00c6ff, #0072ff);
	color: #fff;
}

.update:hover {
	box-shadow: 0 8px 20px rgba(0, 114, 255, 0.6);
	transform: translateY(-2px);
}

.delete {
	background: linear-gradient(135deg, #ff758c, #ff7eb3);
	color: #fff;
}

.delete:hover {
	box-shadow: 0 8px 20px rgba(255, 117, 140, 0.6);
	transform: translateY(-2px);
}

/* Footer */
.footer-text {
	margin-top: 22px;
	text-align: center;
	font-size: 13px;
	color: #eee;
	opacity: 0.9;
}

/* Mobile */
@media ( max-width : 768px) {
	table, thead, tbody, tr, td {
		display: block;
		width: 100%;
	}
	thead {
		display: none;
	}
	tr {
		margin-bottom: 12px;
		padding: 10px;
	}
	td {
		padding: 10px;
	}
}
</style>
</head>

<body>

	<%
	EmployeeRepository employeerepo = EmployeeRepository.getInstance();
	ResultSet rs = employeerepo.getAllEmployee();
	%>

	<div class="container">

		<h1>All Employees</h1>

		<table>
			<thead>
				<tr>
					<td>Name</td>
					<td>Age</td>
					<td>Phone</td>
					<td>Email</td>
					<td>Update</td>
					<td>Delete</td>
				</tr>
			</thead>

			<tbody>
				<%
				while (rs != null && rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>

					<td>
    <a class="update" href="updateemployee.jsp?email=<%=rs.getString(4)%>">
        Update
    </a>
</td>
<td>
    <a class="delete" href="deleteemployee?email=<%=rs.getString(4)%>">
        Delete
    </a>
</td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="footer-text">Employee Management System</div>

	</div>

</body>
</html>




