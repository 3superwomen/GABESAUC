
<%@page import="gabes.Admin"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="rates" class="gabes.Rates" scope="session"/> 
<jsp:useBean id="customer" class="gabes.Customer" scope="session"/> 
<jsp:setProperty name="rates" property="itemNo"/>
<% 
int value = 0;

if((request.getParameter("quality"))== null)
{   
	value = 1;
	 
}
 if( (request.getParameter("delivery"))== null)
{  
 value = 2;}

if((request.getParameter("comments")).equals(""))
{
	value =3;}

 
 if(value!=0)
 {
	 response.sendRedirect("RateSeller.jsp?value="+ value);}
 else{
	 

    try{
     if(value!=0)
	 rates.setBidderNo(customer.getId());
	 int rating = Integer.parseInt(request.getParameter("rating"));
	 int quality = Integer.parseInt(request.getParameter("quality"));
	 int delivery = Integer.parseInt(request.getParameter("delivery"));
	 rates.setDelivery(delivery);
	 rates.setRating(rating);
	 rates.setQuality(quality);
	 rates.rateSeller(rates.getDelivery(), rates.getRating(),rates.getComments(), rates.getQuality(), rates.getItemNo(), rates.getBidderNo());
	 response.sendRedirect("RateSeller.jsp");
  
  }
 
	catch(SQLException e){

	          String error = e.getMessage();
	         response.sendRedirect("RateSeller.jsp?Error="+ error);
  }
	
 }

%>