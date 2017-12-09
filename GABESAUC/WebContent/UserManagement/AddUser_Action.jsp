<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/> 
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="customer" property="username"/>
<jsp:setProperty name="customer" property="fname"/>
<jsp:setProperty name="customer" property="lname"/>
<jsp:setProperty name="customer" property="id"/>
<jsp:setProperty name="customer" property="emailad"/>

<%
if(!((request.getParameter("password")).equals(request.getParameter("password2"))))
{
	response.sendRedirect("AddUser.jsp?value="+ 1);
}
else{
try{
	  customer.setPassword(request.getParameter("password"));
	  customer.setAdminUsername(admin.getUsername());
	  customer.addCustomer();
   
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("AddUser.jsp");
}
%>