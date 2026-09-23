package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		HttpSession session=req.getSession();
			
		int id=Integer.parseInt(req.getParameter("id"));
		
		String name=req.getParameter("username");
		
		String email=req.getParameter("email");
		
		String phone_no=req.getParameter("phone_no");
		
		String address=req.getParameter("address");
		
		String landmark=req.getParameter("landmark");
		
		String city=req.getParameter("city");
		
		String state=req.getParameter("state");
		
		String pincode=req.getParameter("pincode");
		
		String paymentType=req.getParameter("payment");
		
		String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
		
		/*System.out.println(name+" "+email+" "+phone_no+" "+fullAdd+" "+paymentType);*/
		
		CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
		
		List<Cart> blist=dao.getBookByUser(id);
		
		if(blist.isEmpty())
		{
			session.setAttribute("failedMsg","Add Item");
			resp.sendRedirect("checkout.jsp");
		}else
		{
		
		BookOrderDAOImpl dao2=new BookOrderDAOImpl(DBConnect.getConn());
		
		Book_Order o=null;
		
		ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
		Random r=new Random();
		for(Cart c:blist)
		{
			o=new Book_Order();
			o.setUid(1);
			o.setUserName(name);
			o.setEmail(email);
			o.setPhone_no(phone_no);
			o.setFulladd(fullAdd);
			o.setBookName(c.getBookName());
			o.setAuthor(c.getAuthor());
			o.setPrice(c.getPrice()+"");
			o.setPaymentType(paymentType);
			orderList.add(o);
			
		}
		
		if("noselect".equals(paymentType))
		{
			session.setAttribute("failedMsg","Choose Payment Method");
			resp.sendRedirect("checkout.jsp");
		}else
		{
			boolean f=dao2.saveOrder(orderList);
			
			if(f)
			{
				resp.sendRedirect("order_success.jsp");
			}
			else
			{
				session.setAttribute("failedMsg","Your Order Failed");
				resp.sendRedirect("checkout.jsp");
			}
		}
		}	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
}
