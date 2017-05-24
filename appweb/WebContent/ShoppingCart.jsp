<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="paquete.DB" %>
<%@ page import="paquete.Cliente" %>
<%@ page import="paquete.Producto" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compra de artículos</title>

<style type="text/css"> 
form {
    border: 3px solid #f1f1f1;
     margin:10px;
	 padding: 1em 0;
	 background-color: lightblue;
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
        <%
            String codigo = request.getParameter("sessionid");
        	String nombre = request.getParameter("nombre");
        	String apellido1 = request.getParameter("apellido1");
        	String apellido2 = request.getParameter("apellido2");
        	String email = request.getParameter("email");
        	
        	HttpSession sesion = request.getSession();
        	String ses = sesion.getId();
        	
        %>

<div align= "center" ><h1> Catalogo de productos </h1> </div>
<form action = Logout method=Get margin-botton=0> <input type="submit" value="Cerrar sesión"/>
<div align="center"><input type="button" value="Mostrar carrito" onclick="location.href='Carrito.jsp?nombre=<%=nombre%>&&apellido1=<%=apellido1%>&&apellido2=<%=apellido2%>&&email=<%=email%>&&sesionid=<%=ses%>'"></div>
</form>

<form action="ShoppingCart" method=get>  
	  
        <form id="frmCatalogo">
            
            <table width="800" id="tablaCatalogo">
                <tr>
                    <th colspan="3">
                    </th>
                </tr>
                
                <tbody>
                 
                <% DB db = new DB();
                    ArrayList<Producto> catalogo = db.SearchPurchase();
                    int jump = 0;
                    for(int i=0; i<catalogo.size(); i++){
                        Producto p = catalogo.get(i);
                 %>
                 
                            <th>
                               <img src="images/<%=p.getImagen()%>" width="100" height="100"/>
                               <br><%=p.getNombre()%></br>
                               Precio: <%=p.getPrecio() %> &#8364<br>
                            <input type="button" class="BotonADD" name="btnADD" value="Añadir al carrito" onclick="location.href='AddCarrito.jsp?codigoP=<%=p.getId()%>'"><br>
                            <br></br>
                            </th>
                <%
                        jump++;
                        if(jump == 4){
                            %>
                            
                            <tr>
                                
                            <%
                            jump = 0;
                        } 
                    }
                %>
                </tbody>
            </table>
        </form> 

</body>
</html>