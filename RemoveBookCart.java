package com.user.servlet;

import java.io.IOException;

import com.DAO.cartDAOimpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		cartDAOimpl dao = new cartDAOimpl(DBconnect.getConn());
		boolean f = dao.deleteBook(bid,uid,cid);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Book removed from cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMsg", "Something went wrong !!");
			resp.sendRedirect("checkout.jsp");
		}
	}
}
