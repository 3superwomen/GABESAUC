<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class= "gabes.Admin" scope="session"/> 
<jsp:useBean id="customer" class= "gabes.Customer" scope="session"/> 
<jsp:setProperty name="customer" property="*"/> 
<jsp:setProperty name="admin" property="*"/> 

<%if (admin.login()){
    response.sendRedirect("WelcomeAdmin.jsp");
      customer = null;}
else if(customer.login()){
	 response.sendRedirect("WelcomeCustomer.jsp");
     admin = null;}
 else
 { response.sendRedirect("Login.jsp");}
%> 


