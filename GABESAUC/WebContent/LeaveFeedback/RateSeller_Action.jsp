
<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="rates" class="gabes.Rates" scope="session"/> 
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="rates" property="itemNo"/>
<jsp:setProperty name="rates" property="comments"/>


<%
try{
	 rates.setBidderNo(customer.getId());
	 int delivery=  Integer.parseInt(request.getParameter("delivery"));
	 int rating = Integer.parseInt(request.getParameter("rating"));
	 int quality = Integer.parseInt(request.getParameter("quality"));
	 rates.rateSeller(rates.getDelivery(), rates.getRating(),rates.getComments(), rates.getQuality(), rates.getItemNo(), rates.getBidderNo());
   
  }
catch(SQLException e){  
	String error = e.getMessage();
	response.sendRedirect("RateSeller.jsp?Error="+ error);
  }


%>