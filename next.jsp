
<%@ page language="java" import="com.bean.* , org.hibernate.* , org.hibernate.cfg.*;" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="shortcut icon" href="images/images_LOGO.jpg">
</head>
<body>

<%! 
	Register register = new Register();
	SessionFactory sessionFactory = null;
	Session session = null;
%>
	
	<%
		String a = request.getParameter("emailId");
		String b =request.getParameter("password");
		long c =Long.parseLong(request.getParameter("contact"));
	
		
		if(b.equals(request.getParameter("confirmPassword"))){
			 
			
			register.setEmailId(a);
			
			register.setContact(c);
			
			register.setPassword(b);
			
			sessionFactory = new Configuration().configure().buildSessionFactory();
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(register);
			session.getTransaction().commit();
		}
			
	
		else{
			out.print("Pasword and Repeat password did'nt matched");
			
			
		}
		
	%>

</body>
</html>