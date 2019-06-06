package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.*;

import com.bean.Register;

public class RegisterController {
	static private String emailId ;
	static private long contact ;
	static private String password ;
	
	public RegisterController(String emailId, String password, long contact){
		this.emailId = emailId;
		this.contact = contact;
		this.password = password;
	
		
	}
	
	
	public static void main(String[] args) {
		Register register = new Register();
	
		
		
		register.setEmailId(emailId);
		
		register.setContact(contact);
		
		register.setPassword(password);
		
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(register);
		session.getTransaction().commit();
	}
	
	
	public void setData(){
		
	}
	
	

}
