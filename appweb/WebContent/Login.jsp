<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Autenticación.</title>

<style type="text/css"> 
form {
    border: 3px solid #f1f1f1;
     margin: 0;
	 padding: 1em 0;
	 background-color: lightblue;
	 }
	 
form label {
    display: inline-block;
    width: 150px;
    color: black;
}

form input {
    display: inline-block;
    width: 200px;
    margin-bottom: 10px;
}

h1 {
	font-family: Arial Black,Arial Bold,Gadget,sans-serif;
	font-size: 24px;
	font-style: normal;
	font-variant: normal;
	font-weight: 500;
	line-height: 26.4px;
} 

</style>
</head>

<body style="background:#80BFFF">
<div align="center">
        <%
            /*String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("usuario"))
                        userName = cookie.getValue();
                }
            }
            if (userName == null)
                response.sendRedirect("ShoppingCart.jsp");*/
        %>

	    <h1><b>Introduzca sus credenciales: </b></h1>
       <form action="Login" method="POST">
       <label for="usuario"><b>Usuario: </b></label> </b> <input type="text" name="usuario" size="20"> <br><br>
       <label for="clave"><b>Contraseña: </b></label></b> <input type="password" name="clave" size="20"><br><br>
       <input type="submit" value="Entrar"/>
       </form></div>
</body>
</html>