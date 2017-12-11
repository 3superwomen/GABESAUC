<%@ page language="java" import="java.sql.*,gabes.*"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="item" class="gabes.Item" scope="session"/> 
<jsp:setProperty name="item" property="*"/> 
<%
    item.deleteItem();
    response.sendRedirect("DeleteItem.jsp");
%>