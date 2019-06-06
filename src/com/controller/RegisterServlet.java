package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Register;
import com.dao.RegisterController;

public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String a = request.getParameter("emailId");
		String b =request.getParameter("password");
		long c =Long.parseLong(request.getParameter("contact"));
		
		Register register = new Register();
		SessionFactory sessionFactory = null;
		Session session = null;
		HttpSession s = request.getSession();
		
		
		PrintWriter out = response.getWriter();
		
		if(b.equals(request.getParameter("confirmPassword"))){
		
			
			/*RegisterController rc = new RegisterController(a, b, c);
			rc.main(null);*/
			
			if(b.equals(request.getParameter("confirmPassword"))){
				 
				
				register.setEmailId(a);
				
				register.setContact(c);
				
				register.setPassword(b);
				
				sessionFactory = new Configuration().configure().buildSessionFactory();
				session = sessionFactory.openSession();
				session.beginTransaction();
				session.save(register);
				session.getTransaction().commit();
				s.setAttribute("name", "yes");
				System.out.println((String)s.getAttribute("name"));
				response.sendRedirect("home.jsp");
			}
				
		
			else{
				out.print("Pasword and Repeat password did'nt matched");
				
				
			}
			
			/*RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}
		
		else{
			
			out.println("Credentials did'nt matched");
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
			rd.include(request, response);
			
		}
		
*/		
			
			session.close();
	}

}
}
