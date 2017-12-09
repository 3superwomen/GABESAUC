<%@ page language="java" import="java.sql.*,java.util.*" %>
<%@page import="gabes.Customer"%>
<%@page errorPage="AddItemErrorPage.jsp" %>
<html>
<head><title>Add User Error Page</title>
</head>
<body>
<font face="verdana">
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<%
try{
	String name = request.getParameter("itemName");
	String cat = request.getParameter("itemCat");
	String sprice = request.getParameter("itemSPrice");
	String aucEM = request.getParameter("itemAucEM");
	String aucED = request.getParameter("itemAucED");
	String aucEY = request.getParameter("itemAucEY");
	java.sql.Date aucE = new java.sql.Date (Integer.parseInt(aucEY),Integer.parseInt(aucEM),Integer.parseInt(aucED));
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date cur = new java.sql.Date(utilDate.getTime());
	if(aucE.before(cur)){
		
	}
	String desc = request.getParameter("itemDesc");
	
	customer.addItem(name,desc,cat,aucE,sprice);
//	customer.editProfile(username,fname,lname,email,phoneno,newpw);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
out.println("Add successfully!");
response.sendRedirect("addItem.jsp");
%>
</font>
</body>
</html>