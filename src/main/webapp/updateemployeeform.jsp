<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.qsp.repository2.EmployeeRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Employee</title>

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

/* Glass Card */
.container {
	width: 100%;
	max-width: 480px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	border-radius: 22px;
	padding: 35px;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
	animation: fadeIn 0.9s ease-in-out;
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
h1 {
	text-align: center;
	color: #fff;
	margin-bottom: 30px;
	font-size: 26px;
	letter-spacing: 1px;
}

/* Form */
form {
	color: #fff;
	font-size: 14px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600;
}

input[type="text"], input[type="number"] {
	width: 100%;
	padding: 12px 14px;
	border-radius: 12px;
	border: none;
	outline: none;
	font-size: 14px;
	margin-bottom: 18px;
	background: rgba(255, 255, 255, 0.95);
	transition: 0.3s;
}

input[type="text"]:focus, input[type="number"]:focus {
	transform: scale(1.02);
	box-shadow: 0 0 12px rgba(102, 126, 234, 0.8);
}

/* Gender */
.gender-group {
	margin-bottom: 20px;
}

.gender-group input {
	margin-right: 6px;
}

.gender-group label {
	margin-right: 14px;
	font-weight: normal;
}

/* Button */
input[type="submit"] {
	width: 100%;
	padding: 14px;
	border-radius: 14px;
	border: none;
	font-size: 15px;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
	background: linear-gradient(135deg, #00c6ff, #0072ff);
	transition: 0.4s;
}

input[type="submit"]:hover {
	transform: translateY(-3px);
	box-shadow: 0 12px 25px rgba(0, 114, 255, 0.6);
}
</style>
</head>

<body>

	<div class="container">

		<h1>Employee Update Form</h1>

		<%
		EmployeeRepository employeeRepo = EmployeeRepository.getInstance();

		String email = request.getParameter("email");
		ResultSet rs = employeeRepo.getEmployeeByEmail(email);

		if (rs == null || !rs.next()) {
			out.println("Employee not found");
			return;
		}

		String name = rs.getString(1);
		int age = rs.getInt(2);
		String phone = rs.getString(3);
		String gender = rs.getString(5);
		%>

		<form action="updateemployee" method="post">

			<input type="hidden" name="email" value="<%=email%>"> <label>Name</label>
			<input type="text" name="name" value="<%=name%>" required> <label>Age</label>
			<input type="number" name="age" value="<%=age%>" required> <label>Phone</label>
			<input type="text" name="phone" value="<%=phone%>" required>

			<label>Gender</label>
			<div class="gender-group">
				<input type="radio" name="gender" value="Male"
					<%="Male".equalsIgnoreCase(gender) ? "checked" : ""%>> Male

				<input type="radio" name="gender" value="Female"
					<%="Female".equalsIgnoreCase(gender) ? "checked" : ""%>>
				Female <input type="radio" name="gender" value="Other"
					<%="Other".equalsIgnoreCase(gender) ? "checked" : ""%>>
				Other
			</div>

			<input type="submit" value="UPDATE EMPLOYEE">

		</form>

	</div>

</body>
</html>
