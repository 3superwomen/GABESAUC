
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="customer" property="username"/>
<jsp:setProperty name="customer" property="fname"/>
<jsp:setProperty name="customer" property="lname"/>
<jsp:setProperty name="customer" property="id"/>
<jsp:setProperty name="customer" property="emailad"/>
<jsp:setProperty name="customer" property="phoneno"/>

<%
if(!((request.getParameter("password")).equals(request.getParameter("password2"))))
{ %>
	<jsp:forward page = "Register.jsp">
	 <jsp:param name = "value" value="1"/>
	</jsp:forward>
<%}
else{
try{
	  customer.setPassword(request.getParameter("password"));
	  customer.registerCustomer();
   
 }catch(IllegalStateException ise){
    out.println(ise.getMessage());
}
response.sendRedirect("Login.jsp");
}
%>