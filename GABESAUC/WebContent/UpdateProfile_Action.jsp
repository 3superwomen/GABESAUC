<%@page import="gabes.Customer"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="customer" property="*"/>

<%
try{
	  customer.updateProfile();

 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("UpdateProfile.jsp");
%>