package com.qsp.container2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qsp.repository2.EmployeeRepository;

@WebServlet("/addemployee") // DDT (description deployment tool)
public class AddEmployeeServlet extends HttpServlet {

    private EmployeeRepository employeerepo = EmployeeRepository.getInstance();

    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("Add Employee service");

        RequestDispatcher rd = req.getRequestDispatcher("/emptydata");

        String name = req.getParameter("ename");
        if (name == null || name.isEmpty()) {  
            req.setAttribute("error", "name is empty");
            rd.forward(req, resp);
            return;
        }

        String age = req.getParameter("eage");
        if (age == null || age.isEmpty()) {
            req.setAttribute("error", "age is empty");
            rd.forward(req, resp);
            return;
        }

        String phone = req.getParameter("phone");
        if (phone == null || phone.isEmpty()) {
            req.setAttribute("error", "phone is empty");
            rd.forward(req, resp);
            return;
        }

        String email = req.getParameter("email");
        if (email == null || email.isEmpty()) {
            req.setAttribute("error", "email is empty");
            rd.forward(req, resp);
            return;
        }

        String gender = req.getParameter("egender");
        if (gender == null || gender.isEmpty()) {
            req.setAttribute("error", "gender is empty");
            rd.forward(req, resp);
            return;
        }

        // Console check
        System.out.println(name + " " + age + " " + phone + " " + email + " " + gender);

        // Call repository
        String response = employeerepo.addEmployee(name, age, phone, email, gender);

        // Send response
        PrintWriter pw = resp.getWriter();
        pw.println("<h1>" + response + "</h1>");
    }
}

