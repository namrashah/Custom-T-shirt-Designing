package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Register;

public class PasswordServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("password");
		System.out.println(str);
		Register r = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		
		sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		r = (Register) session.get(Register.class, str);
		
		System.out.println();
		
		
		if(r == null){
			response.sendRedirect("password.jsp");
		}
		else{
			HttpSession s = request.getSession();
			s.setAttribute("name", "yes");
			
			response.sendRedirect("home.jsp");
			
		
		}
		
		session.close();
		
	}
	
}
