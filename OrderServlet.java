package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.bookOrderDAOimpl;
import com.DAO.cartDAOimpl;
import com.DB.DBconnect;
import com.entity.book_order;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("addr");
			String landmark = req.getParameter("land");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pin");
			String paymentType = req.getParameter("pay");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			// System.out.println(name+""+email+""+phone+""+fullAdd+""+paymentType);

			cartDAOimpl dao = new cartDAOimpl(DBconnect.getConn());
			List<cart> blist = dao.getBookByUser(id);

			if (blist.isEmpty()) {

				session.setAttribute("failedMsg", "Please add items");
				resp.sendRedirect("checkout.jsp");
			} 
			else 
			{
				bookOrderDAOimpl dao2 = new bookOrderDAOimpl(DBconnect.getConn());
				book_order o = null;

				ArrayList<book_order> orderList = new ArrayList<book_order>();

				Random r = new Random();

				for (cart c : blist) {

					o = new book_order();
					o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFullAdd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);

				}

				if ("noselect".equals(paymentType)) {

					session.setAttribute("failedMsg", "Choose payment method");
					resp.sendRedirect("checkout.jsp");
				} else {

					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Your order failed !");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
