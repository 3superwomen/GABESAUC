<%@page import="gabes.Customer"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<%
try{
	String name = request.getParameter("itemName");
	String cat = request.getParameter("itemCat");
	String sprice = request.getParameter("itemSPrice");
	String aucS = request.getParameter("itemAucS");
	String aucE = request.getParameter("itemAucE");
	String desc = request.getParameter("itemDesc");

	
	customer.editProfile(username,fname,lname,email,phoneno,newpw);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("UpdateProfile.jsp");
%>