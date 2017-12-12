<%@ page language="java" import="java.sql.*" %>
<%@page import="gabes.Customer"%>
<%@page errorPage="AddItemErrorPage.jsp" %>
<html>
<head><title>Add User Error Page</title>
<style>
</style>
</head>
<body>
<font face="verdana">
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<%
String name = request.getParameter("itemName");
String cat = request.getParameter("itemCat");
String sprice = request.getParameter("itemSPrice");
String aucEM = request.getParameter("itemAucEM");
String aucED = request.getParameter("itemAucED");
String aucEY = request.getParameter("itemAucEY");
Date aucE =new Date (Integer.parseInt(aucEY),Integer.parseInt(aucEM)-1,Integer.parseInt(aucED));



try{
	
	
	String desc = request.getParameter("itemDesc");
	
	customer.addItem(name,desc,cat,aucE,sprice);
//	customer.editProfile(username,fname,lname,email,phoneno,newpw);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("addItem.jsp");
%>
</font>
</body>
</html>