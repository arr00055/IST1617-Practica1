<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="paquete.DB" %>
<%@ page import="paquete.Producto" %>
<%@ page import="paquete.Compra" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style type="text/css"> 
form {
    border: 3px solid #f1f1f1;
     margin: 0;
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/RegistrarCliente.js"></script>
        <link type="text/css" rel="stylesheet" href="css/css1.css" />
        <title>JSP Page</title>
        
    </head>
    <%
    	DB db = new DB();
        Producto p = db.SearchPurchaseByID(request.getParameter("codigoP"));
        
    %>
    
    <body style="background:#80BFFF">
        <form action="ShoppingCart" method="post">
            <table id="tablaAnadirCarrito">
                <tr>
                    <th colspan="2">
                        <h1>Añadir a carrito</h1>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <dd> <input type="hidden" name="CodigoProducto" value="<%=p.getId() %>" size="20" maxlength="30"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Nombre producto :
                    </td>
                    <td>
                        <dd> <input type="text" name="NombreProducto" class="campoNoEditable" value="<%=p.getNombre() %>" 
                               size="60" readonly="readonly"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Precio producto :
                    </td>
                    <td>
                        <dd> <input type="number" name="PrecioProducto" class="campoNoEditable" value="<%=p.getPrecio()%>" size="20" maxlength="30" readonly="readonly"> </dd>
                    </td>
                </tr>
                <tr>
                    <td class="primeraColumna">
                        Cantidad :
                    </td>
                    <td>
                        <dd> <input type="number" name="CantidadProducto" value="1" min="1"> </dd>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="submit" name="cancelar" class="button" value="Cancelar">
                        <input type="submit" name="add" class="button" value="Añadir Compra">
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>
                    </td>
                </tr>
            </table>
                    <input type="hidden" name="addPurchases" value="addPurchases">
        </form>
    </body>
</html>
