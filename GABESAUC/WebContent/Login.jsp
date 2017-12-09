<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>Login </title>
<style>
div.container{
   width:100%
   border: 1px solid gray
 }
 header,footer{
 padding: lem;
 color:white;
 background-color: black;
 clear:left;
 text-align:center
 }
 </style>
 </head>
 <body bgcolor = "#99ff66">
 <div class ="container">
 <header>
 <h1> WELCOME TO GABES </h1>
 </header>
<form method="post" action="Login_action.jsp" name="Login">
<br><br>
<table align="center">
<tr>
	<th align "right"> Username: </th> 
	<td> <input name="username" size ="25%" height = "100" value=""></td>
<tr>
	<th align "right"> Password: </th>
   <td> <input name="password" size ="25%" height = "100" type ="password" value=""></td>
</tr>
<tr>
<td colspan="4" align ="right">
   <input style="color: black;" name="Confirm" value="Confirm" type="submit">
</td>
</tr>
<tr>
</form>
<td colspan="4" align ="right">
    <br> <br> <h4> New To GABES? </h2>
    <form method="post" action="Register.jsp" name="Login">
   <input style="color: black;" name="register" value="Create your GABES account" type="submit">
   </form>
</td>
</tr>
</table>
</body>

</div>
</html>