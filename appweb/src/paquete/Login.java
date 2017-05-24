package paquete;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final String userIDadmin = "admin";
    private final String passwordIDadmin = "admin";
    private final String userID = "usuario";
    private final String passwordID = "usuario";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DB db=new DB();
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        
		LinkedList <User> consult = new LinkedList<User>();
		consult = db.SearchUser(usuario, clave);
 
        if (userIDadmin.equals(usuario) && passwordIDadmin.equals(clave)) {
            //Cookie galleta = new Cookie("admin", usuario);
            //La cookie expira en 60 min. 
            //galleta.setMaxAge(3600);
            //response.addCookie(galleta);
            response.sendRedirect("loginadmin.jsp");
        } else if(consult.isEmpty() == false) {	        	
            Cookie galleta = new Cookie("usuario", usuario);
            //La cookie expira en 60 min. 
            galleta.setMaxAge(60);
            response.addCookie(galleta);
            response.sendRedirect("loginusuario.jsp");
        }
        else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Login.jsp");
            PrintWriter out = response.getWriter();
            out.println("<font color=red>Contraseña y/o usuario incorrecto.</font>\n");
            rd.include(request, response);
        }
 
	}

}
