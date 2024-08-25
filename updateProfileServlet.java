package com.user.servlet;

import java.io.IOException;

import com.DAO.userDAOimpl;
import com.DB.DBconnect;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class updateProfileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");

			Users us = new Users();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);

			HttpSession session = req.getSession();
			userDAOimpl dao = new userDAOimpl(DBconnect.getConn());

			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean f2 = dao.updateProfile(us);

				if (f2) {
					session.setAttribute("succMsg", "Profile updated sucessful !!");
					resp.sendRedirect("Edit_profile.jsp");
				} else {
					session.setAttribute("failedMsg", "Something went wrong !!");
					resp.sendRedirect("Edit_profile.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Your password is incorrect !!");
				resp.sendRedirect("Edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
