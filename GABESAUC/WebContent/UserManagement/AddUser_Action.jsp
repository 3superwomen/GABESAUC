<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/> 
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="customer" property="*"/>

<%
try{
	  customer.setAdminUsername(admin.getUsername());
	  customer.addCustomer();
   
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("AddUser.jsp");
%>