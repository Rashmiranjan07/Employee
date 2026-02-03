package com.qsp.container2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qsp.repository2.EmployeeRepository;

@WebServlet("/updateemployee")
public class UpdateEmployeeServlet extends HttpServlet {

	private EmployeeRepository employeerepo = EmployeeRepository.getInstance();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Get data from update form
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String phone = req.getParameter("phone");
		String gender = req.getParameter("gender");

		// Update employee in DB
		employeerepo.updateEmployeeByEmail(email, name, age, phone, gender);

		// Redirect back to all employees page
		RequestDispatcher rd = req.getRequestDispatcher("allemployee.jsp");
		rd.forward(req, resp);
	}
}
