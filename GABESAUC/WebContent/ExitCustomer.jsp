<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<% 
    try{
        customer.logout();
 	   session.invalidate(); 

    }
    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
    response.sendRedirect("Login.jsp");
   %> 