<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="paquete.Cliente" %>
<%@ page import="paquete.DB" %>
<%@ page import="paquete.Producto" %>
<%@ page import="paquete.Compra" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pedidos de compra</title>

<style type="text/css"> 
form {
     margin: 10px;
	 padding: 1em 0;
}

h1 {
	font-family: Arial Black,Arial Bold,Gadget,sans-serif;
	font-size: 24px;
	font-style: normal;
	font-variant: normal;
	font-weight: 500;
	line-height: 26.4px;
} 

ul li {
    background: #cce5ff;
    margin: 5px;
}

.content {
    width: 100%;
}

input{
margin-left: 23px;
}

.left {
    padding-left: 5px;
    padding-top: 5px;
    margin-left: 10px;
    float: left;
    position: relative;
    width: 45%;
    height: auto;
}

</style>
</head>
	<%  String nombre = (String)session.getAttribute("nombre");
		String email = (String)session.getAttribute("email");
		String apellido1 = (String)session.getAttribute("apellido1");
		String apellido2 = (String)session.getAttribute("apellido2");
	 %>
	 
	 <%	DB db = new DB();
	 HttpSession sessionid = request.getSession(true);
	 String codigo = sessionid.getId();
	 ArrayList<Compra> catalogo = db.SearchBuy(codigo);
	 int preciototal=0, quantity=0;
	 %> 

<body style="background:#80BFFF">
 
	<table>
		<ul>
		<li>Nombre: <%=nombre%> <%=apellido1%> <%=apellido2%></li>
		<li>Email: <%=email%></li>
		</ul>
	</table>
	
	<table>
		<ul>
		<h1> LISTA DE LA COMPRA </h1>
		 <% for(int i=0; i<catalogo.size(); i++){
         Compra c = catalogo.get(i);
         int id = c.GetIdproducto();
         String code = String.valueOf(id);
         Producto p = db.SearchPurchaseByID(code);
         %>
         
		<li><%=i+1%>. <%=p.getNombre() %> x <%=c.GetCantidad() %> Precio: <%=c.GetPreciodemanda() %> &#8364</li>
		<%preciototal=preciototal + c.GetPreciodemanda();
		quantity=quantity+c.GetCantidad();
		}%>
		<li>Precio total = <%=preciototal%> &#8364</li>
		</ul>
	</table>
	
	<form action = ShoppingCart method=post  style="float: left">
	
                    <td colspan="2" class="Botones">
                        <br>
                        <input type="submit" name="clear" class="button" value="Borrar lista" style="float: left">
                        <input type="submit" name="cancelar" class="button" value="Cancelar" style="float: left">
                    </td>
	</form>
	<div class="content">
	<div class="left">
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="G6XL8YBFKSZE4">
<input type="hidden" name="lc" value="ES">
<input type="hidden" name="item_name" value="Carro completo">
<input type="hidden" name="item_number" value="001">
<input type="hidden" name="amount" value="<%=preciototal%>">
<input type="hidden" name="currency_code" value="EUR">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="cn" value="Añadir instrucciones especiales para el vendedor:">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="1">
<input type="hidden" name="return" value="http://localhost:8080/appweb/ShoppingCart">
<input type="hidden" name="cancel_return" value="http://localhost:8080/appweb/ShoppingCart">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
<input type="image" src="https://www.sandbox.paypal.com/es_ES/ES/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma rápida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.sandbox.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form>









	</div>
	<div style="clear: both"></div> 
    </div>
 

</body>
</html>