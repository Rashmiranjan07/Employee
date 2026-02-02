package com.qsp.container2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qsp.repository2.EmployeeRepository;

@WebServlet("/")
public class DeleteEmployeeServlet {

	private EmployeeRepository employeerepo = EmployeeRepository.getInstance();
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		employeerepo.deleteEmployeeByEmail(email);
		RequestDispatcher rd = req.getRequestDispatcher("");
		rd.forward(req, resp);
		
	}
	
	}





