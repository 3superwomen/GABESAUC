<%@ page language="java" import="java.sql.*,java.util.*" %>
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
try{
String name = request.getParameter("itemName");
String cat = request.getParameter("itemCat");
String sprice = request.getParameter("itemSPrice");
String aucEM = request.getParameter("itemAucEM");
String aucED = request.getParameter("itemAucED");
String aucEY = request.getParameter("itemAucEY");
String desc = request.getParameter("itemDesc");
String auc = aucEY+"-"+aucEM+"-"+aucED;

Calendar cal = Calendar.getInstance();
cal.set(Integer.parseInt(aucEY),Integer.parseInt(aucEM),Integer.parseInt(aucED));
// set Date portion to January 1, 1970
// cal.set( cal.YEAR, Integer.parseInt(aucEY) );
// cal.set( cal.MONTH, Integer.parseInt(aucEM) );
// cal.set( cal.DATE, Integer.parseInt(aucED) );
java.sql.Date jsqlD = java.sql.Date.valueOf( 
        cal.get(cal.YEAR) + "-" + 
        cal.get(cal.MONTH) + "-" + 
        cal.get(cal.DATE) );

	customer.addItem(name,desc,cat,jsqlD,sprice);
//	customer.editProfile(username,fname,lname,email,phoneno,newpw);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("addItem.jsp");
%>
</font>
</body>
</html>