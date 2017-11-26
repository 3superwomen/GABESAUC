<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>

<jsp:setProperty name="customer" property="*"/> 
<% 
try{
	 admin.addUser();
   
}catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("WelcomeAdmin.jsp");
%>