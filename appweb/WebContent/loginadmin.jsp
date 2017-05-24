<%@ page import="java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrador.</title>
</head>

<body bgcolor="white"> 
<TABLE BORDER="1" ALIGN=CENTER> 
<caption><b>Cabeceras existentes:</b></caption> 
<TR BGCOLOR="#FFAD00"> 
<TH>Nombre cabecera</TH> 
<TH>Valor cabecera</TH> 
<%Enumeration nombresCabeceras = request.getHeaderNames(); 
while(nombresCabeceras.hasMoreElements()) { 
	String nombre = (String)nombresCabeceras.nextElement();%> 
	<TR><TD><%=nombre%></TD> 
	<TD><%=request.getHeader(nombre)%></TD> 
<%}%> 
</TABLE> 
<br> 
<div align="center"> 
<B>Método de petición: </B><%=request.getMethod()%> <BR> 
<B>URI pedida: </B><%=request.getRequestURI()%><BR> 
<B>Protocolo: </B><%=request.getProtocol()%><br>
<b>El identificador de la sesion es:</b> <%=session.getId()%><br>
<b>La fecha y hora actual es:</b> <%=new Date()%>
</div>
<br>
<table BORDER="1" ALIGN=CENTER> 
<caption><b>Información de Cookies:</b></caption> 
<TR BGCOLOR="#FFAD00"> 
<TH>Nombre de la cookie</TH> 
<TH>Valor de la cookie</TH></TR>
 <%Cookie[] cookies = request.getCookies(); 
Cookie cookie;
 for(int i=0; i<cookies.length; i++) { 
	 cookie = cookies[i];%>
<TR> 
<TD><%=cookie.getName()%></TD> 
<TD><%=cookie.getValue()%></TD></TR>
<%}%>
</table>
</body> 
</html>