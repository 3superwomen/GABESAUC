<%@page import="gabes.Customer"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<%-- <jsp:setProperty name="customer" property="*"/> --%>

<%
try{
	String username = request.getParameter("username");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("emailad");
	String phoneno = request.getParameter("phoneno");
	String newpw = request.getParameter("newpw");
	String redonewpw = request.getParameter("redonewpw");
	String oldpw = request.getParameter("oldpw");
	if(newpw=="" && redonewpw ==""){
		newpw = oldpw;
	}
// 	else {
// 		if(!newpw.equals(redonewpw)){
// 			response.sendRedirect("UpdateErrorPage.jsp");
// 		}
// 	}
	customer.editProfile(username,fname,lname,email,phoneno,newpw);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("EditProfile.jsp");
%>