package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bean.Register;

public class EmailRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str = request.getParameter("emailId");
		System.out.println(str);
		Register r = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		
		sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		r = (Register) session.get(Register.class, str);
		
		if(r == null){
			response.sendRedirect("login.jsp");
		}
		else{
			response.sendRedirect("password.jsp");
		}
		
		session.close();
		
	}
	
}
