package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOimpl;
import com.DAO.cartDAOimpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class cartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
			BookDtls b = dao.getBookById(bid);

			cart c = new cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));

			cartDAOimpl dao2 = new cartDAOimpl(DBconnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Book Added to cart");
				resp.sendRedirect("all_new_book.jsp");
			} else {
				session.setAttribute("failed", "Something went wrong !!");
				resp.sendRedirect("all_new_book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
