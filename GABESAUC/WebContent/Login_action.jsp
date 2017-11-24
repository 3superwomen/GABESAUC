<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class= "gabes.Admin" scope="session"/> 
<jsp:useBean id="customer" class= "gabes.Customer" scope="session"/> 
<jsp:setProperty name="admin" property="*"/> 
<jsp:setProperty name="customer" property="username"/> 
<jsp:setProperty name="customer" property="password"/> 
<%if (admin.login())
    response.sendRedirect("WelcomeAdmin.jsp");
 else if(customer.login())
    response.sendRedirect("WelcomeCustomer.jsp");
 else
	 response.sendRedirect("Login.jsp");
%> 


