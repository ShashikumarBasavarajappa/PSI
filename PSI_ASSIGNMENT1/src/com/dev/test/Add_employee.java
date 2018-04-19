package com.dev.test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.impl.Employee_actions;
import com.test.model.Employee;

@WebServlet("/Add_employee/*")
public class Add_employee extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=(((((((((((((" + request.getParameter("delete_button_value"));
		if (request.getParameter("add_employee") != null && !request.getParameter("add_employee").isEmpty()) {
			if (request.getParameter("add_employee").equals("add_employee")) {
				Employee e1 = new Employee();

				e1.setFirst_name(request.getParameter("first_name"));
				e1.setLast_name(request.getParameter("last_name"));
				e1.setEmail(request.getParameter("email"));
				e1.setGoc(request.getParameter("goc"));
				e1.setPassword(request.getParameter("password"));
				e1.setUsername(request.getParameter("username"));

				Employee_actions e11 = new Employee_actions();
				int email_exist = 0;
				try {
					email_exist = e11.is_email_exist(request.getParameter("email"));
					System.out.println("*************" + email_exist);
					if (email_exist != 0) {
						request.setAttribute("email_exist", "Email already exists in System");

						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);

					}
				} catch (ClassNotFoundException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (SQLException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				if (email_exist == 0) {
					try {
						e11.insert_data(e1);
						ArrayList<Employee> emp = e11.getdata();
						System.out.println("=================" + emp);
						request.setAttribute("employeess", emp);
						response.sendRedirect("home.jsp");
						// RequestDispatcher rd =
						// request.getRequestDispatcher("home.jsp");
						// rd.forward(request, response);
						// getServletConfig().getServletContext().getRequestDispatcher("/home.jsp").forward(request,response);
					} catch (ClassNotFoundException e) {

						e.printStackTrace();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			}
		} else if (request.getParameter("searched_employee") != null
				&& !request.getParameter("searched_employee").isEmpty()) {
			if (request.getParameter("searched_employee").equals("searched_employee")) {
				Employee_actions e11 = new Employee_actions();
				String first_name = request.getParameter("search");
				String last_name = request.getParameter("search2");
				if (first_name.isEmpty()) {
					try {
						ArrayList<Employee> emp = e11.getdata();
						emp = e11.getdata();
						request.setAttribute("employeess", emp);

						RequestDispatcher rd = request.getRequestDispatcher("list_employess.jsp");
						rd.forward(request, response);

					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					}

				} else {
					ArrayList<Employee> emp;
					try {
						emp = e11.search_data(first_name, last_name);
						request.setAttribute("employeess", emp);

						RequestDispatcher rd = request.getRequestDispatcher("list_employess.jsp");
						rd.include(request, response);

					} catch (ClassNotFoundException | SQLException e) {

						e.printStackTrace();
					}
				}
			}
		} else if (request.getParameter("delete_button_value") != null
				&& !request.getParameter("delete_button_value").isEmpty()) {

			System.out.println("========sadsadsa===========");
			Employee_actions e11 = new Employee_actions();
			int id = Integer.parseInt(request.getParameter("delete_button_value"));
			try {
				e11.delete(id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.sendRedirect("/PSI_ASSIGNMENT1");

		} else if (request.getParameter("update_button_value") != null
				&& !request.getParameter("update_button_value").isEmpty()) {

			int my_val = Integer.parseInt(request.getParameter("update_button_value"));
			Employee_actions e11 = new Employee_actions();
			ArrayList<Employee> emp;
			try {
				emp = e11.update_search_data(my_val);
				request.setAttribute("update_data_value", emp);

				RequestDispatcher rd = request.getRequestDispatcher("update_form.jsp");
				rd.forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {

				e.printStackTrace();
			}
		} else if (request.getParameter("update_data_form") != null
				&& !request.getParameter("update_data_form").isEmpty()) {

			int my_val = Integer.parseInt(request.getParameter("update_data_form"));
			Employee e1 = new Employee();

			e1.setFirst_name(request.getParameter("first_name"));
			e1.setLast_name(request.getParameter("last_name"));
			e1.setEmail(request.getParameter("email"));
			e1.setPassword(request.getParameter("password"));
			e1.setUsername(request.getParameter("username"));
			e1.setEmployee_id(request.getParameter("employee_id"));

			Employee_actions e11 = new Employee_actions();
			try {
				e11.update_employee_information(e1);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				System.out.println("----- FInaly i'm executing");
			}
			response.sendRedirect("/PSI_ASSIGNMENT1");
		}
	}

}
