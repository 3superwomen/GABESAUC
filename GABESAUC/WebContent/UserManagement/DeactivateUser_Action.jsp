<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/> 
<jsp:setProperty name="admin" property="*"/>

<%
try{
	String username = request.getParameter("username");
	admin.deactivateUser(username);
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("DeactivateUser.jsp");
%>

