package com.user.servlet;

import java.io.IOException;

import com.DAO.userDAO;
import com.DAO.userDAOimpl;
import com.DB.DBconnect;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			Users us = new Users();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				userDAOimpl dao = new userDAOimpl(DBconnect.getConn());

				boolean f2 = dao.checkUser(email);

				if (f2) {
					boolean f = dao.userRegister(us);

					if (f) {

						session.setAttribute("succMsg", "Registration Sucessful !!");
						resp.sendRedirect("register.jsp");
					} else {

						session.setAttribute("failedMsg", "Something wrong !!");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User already exists");
					resp.sendRedirect("register.jsp");
				}

			} else {
				// System.out.println("Please check Agree & terms condition");

				session.setAttribute("failedMsg", "Please check Agree & terms condition !!");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}