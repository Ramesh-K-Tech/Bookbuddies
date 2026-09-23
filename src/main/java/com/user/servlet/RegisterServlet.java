package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phone_no=req.getParameter("phone_no");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phone_no+" "+password+" "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone_no(phone_no);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUser(email);
				
				if(f2)
				{
					boolean f=dao.userRegister(us);
					
					if(f)
					{
						session.setAttribute("succMsg","Registered Successfully..");
						resp.sendRedirect("login.jsp");
					}else
					{
					
						session.setAttribute("failedMsg","Something Wrong on Server..");
						resp.sendRedirect("register.jsp");
					}
					
				}else {

					session.setAttribute("failedMsg","User Already Exist");
					resp.sendRedirect("register.jsp");
					
				}
			}else
			{
				session.setAttribute("failedMsg","Please Check Agree & Terms Condition"
						+ "");
				resp.sendRedirect("register.jsp");
			}
			
	}catch(Exception e){
		e.printStackTrace();
		}
	
	}	

}
