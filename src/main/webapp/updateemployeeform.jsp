<%@page import="com.qsp.repository2.EmployeeRepository"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
</head>

<body>

    <h1>Employee Update Form</h1>

    <%! EmployeeRepository employeeRepo = EmployeeRepository.getInstance(); %>

    <%
        String email = request.getParameter("email");
        ResultSet rs = employeeRepo.getEmployeeByEmail(email);

        if (rs == null)
            return;

        rs.next();

        String name = rs.getString(1);
        int age = rs.getInt(2);
        String phone = rs.getString(3);
        String gender = rs.getString(5);   // 👈 gender column
    %>

    <form action="updateemployee">
        <h1>
            <input type="hidden" name="email" value="<%=email%>"> <br>

            Name 
            <input type="text" name="name" value="<%=name%>"> <br>

            Age 
            <input type="text" name="age" value="<%=age%>"> <br>

            Phone number 
            <input type="text" name="phone" value="<%=phone%>"> <br>

            Gender 
            <br>
            <input type="radio" name="gender" value="Male"
                <%= "Male".equalsIgnoreCase(gender) ? "checked" : "" %>> Male

            <input type="radio" name="gender" value="Female"
                <%= "Female".equalsIgnoreCase(gender) ? "checked" : "" %>> Female
                
                 <input type="radio" name="gender" value="Other"
                <%= "Other".equalsIgnoreCase(gender) ? "checked" : "" %>> Other
            <br><br>

            <input type="submit" value="SUBMIT">
        </h1>
    </form>

</body>
</html>
