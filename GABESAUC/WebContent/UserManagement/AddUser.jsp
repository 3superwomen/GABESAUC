<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>User Management</title>
</head>
<body>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="admin" class="gabes.Admin" scope="session"/>

<%  String value = request.getParameter("value");
if(value!=null)
   out.println("PASSWORD DOES NOT MATCH RETYPE PASSWORD");%>
<table style="text-align: left; width: 653px; height: 100px;" border="1"
    			cellpadding="2" cellspacing="2">
    			
    <br>

<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
User List</h1>			
	<tbody>
    		<tr>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">User ID</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">User Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">First </span><br
    			style="font-family: Arial Black;">
    			<span style="font-family: Arial Black;">Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Last Name</span><br>
    			</td>
    			<td style="vertical-align: top;"><span
    			style="font-family: Arial Black;">Email</span> </td>
    			<td style="vertical-align: top; font-family: Arial Black;">Password<br>
    			</td>
    		</tr>
	<%try{ 
          ResultSet rs = admin.getCustomers();
         while (rs.next()) { %>
  		     <tr>
    				 <td style="vertical-align: top; text-align: center;"><%=rs.getInt("id")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("username")%><br>
    				</td>
                    <td style="vertical-align: top; text-align: center;"><%=rs.getString("fname")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("lname")%><br>
    				</td>
    				<td style="vertical-align: top; text-align: center;"><%=rs.getString("emailad")%><br>
    				</td>
    				<td  style="vertical-align:  top; text-align: center;"><input type="password" value="<%=rs.getString("password")%>"> </td>
              </tr>
  	
                
  <%}%>
               </tbody>
    			</table>

<br>
<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Add User<br>
</h2>
<form style="font-family: Arial Black;" method="post"
action="AddUser_Action.jsp" name="AddForm">
<div style="text-align: left;"><big>User
Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <small><small><small><small>&nbsp;</small></small></small></small>
<input name="id" value= <%=admin.seqcustId()%> readonly> <br>
Username&nbsp;&nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="username" value=""> <br>
First
name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="fname" value=""> <br>
Last name&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
name="lname" value=""> <br>
Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
name="emailad" value=""> <br>
Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
name="password" value=""> <br>
Retype Password&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="password2" value=""><br>
</div>
<input style="color: black;" name="Add" value="Add" type="submit"><input
style="color: black;" name="Clear" value="Clear" type="reset"> </form>
<br>
<br>
       
<% rs.close();}

    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }

%>
</body>
</html>

