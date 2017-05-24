<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro de usuario.</title>

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
    margin-bottom: 5px;
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
            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("usuario"))
                        userName = cookie.getValue();
                }
            }
            if (userName == null)
                response.sendRedirect("Login.jsp");
        %>
        <h1>
            Hola
            <%=userName%>, introduce tus datos para el registro.
        </h1>       
        <form action="ShoppingCart" method="GET">        
        <label for="email"><b>Email: </b></label><br><input type="text" name="email"><br>       
        <label for="nombre"><b>Nombre: </b></label><br><input type="text" name="nombre"><br>       
        <label for="apellido1"><b>Primer apellido: </b></label><br><input type="text" name="apellido1"><br>
        <label for="apellido2"><b>Segundo apellido: </b></label><br><input type="text" name="apellido2"><br><br>
        <input type="submit"value="Registrarse" >
        </form> 
        
    </div>
</body>
</html>