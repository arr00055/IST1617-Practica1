package paquete;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ShoppingCart")
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList <Producto> consult = new ArrayList<Producto>();
	ArrayList <Compra> comp = new ArrayList<Compra>();
    int costeTotal=0; 

    public void doPost(
        HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
    	PrintWriter out = response.getWriter();
    	if ( request.getParameter("checkout") != null ){
            out.println("<h1>Gracias por su pedido.</h1>");
            
    	}  else  if ( request.getParameter("add") != null ) {
                addPurchases( request, comp );
                out.println(
                    "<h1>Compra añadida, por favor continua.</h1>");
                response.sendRedirect("ShoppingCart.jsp");
                
        } else  if ( request.getParameter("clear") != null ){
                	DeletePurchases(request);
                	costeTotal=0;
                	response.sendRedirect("Datosborrados.jsp");
                	
        } else  if ( request.getParameter("cancelar") != null ){
        			 response.sendRedirect("ShoppingCart.jsp");
                
                } 
        out.close();
        
    }

    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
    	HttpSession s = request.getSession(true);
        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        s.setAttribute("nombre", nombre);
        s.setAttribute("email", email);
        s.setAttribute("apellido1", apellido1);
        s.setAttribute("apellido2", apellido2);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ShoppingCart.jsp");
        rd.forward(request, response);
    }

    void addPurchases( HttpServletRequest request, ArrayList comp) {
    	HttpSession session = request.getSession();
    	DB db = new DB();
    	Producto prod = new Producto("","",0,"");
    	String idproducto = request.getParameter("CodigoProducto");
    	String value = request.getParameter("CantidadProducto");
    	prod = db.SearchPurchaseByID(idproducto);
    	int preciototal=0;
    	double precio = 0;
    	
    	String sessionid = session.getId();
    	int cantidad=0, idp=0;
    	
        cantidad = Integer.parseInt(value);
        idp = Integer.parseInt(idproducto);
        precio = prod.getPrecio();
        
        preciototal= (int) (cantidad*precio);
       	System.out.println(+cantidad);
       	Compra c = new Compra(sessionid,idp, cantidad, preciototal);
       	comp.add(c);
        db.insertCart(sessionid, idp, cantidad, preciototal);
     }
    
    void DeletePurchases(HttpServletRequest request){
    	DB db = new DB();
    	HttpSession session = request.getSession();
    	String sessionid = session.getId();
    	db.CleanCart(sessionid);
    }

	private int parseInt(String string) {
		// TODO Auto-generated method stub
		return 0;
	}
}