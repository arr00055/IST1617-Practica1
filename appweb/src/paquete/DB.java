package paquete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.LinkedList;
import com.mysql.*;

import paquete.Producto;


public class DB {
	public  String DRIVER_MYSQL = "com.mysql.jdbc.Driver"; 
	public  String URL_MYSQL = "jdbc:mysql://localhost:3306/practica1";
	public  Connection conn;
	
		public DB(){
			cargarDriver();
		}
					
		public void cargarDriver() {
			try {
				Class.forName(DRIVER_MYSQL);
			} catch (ClassNotFoundException e) {
				System.err.println("ERROR AL REGISTRAR DRIVER");
				e.printStackTrace();
			}
		}
	
		public void getConexion(){
			try {
				conn = DriverManager.getConnection(URL_MYSQL,"root","");
			} catch (SQLException e) {
				System.err.println("ERROR AL CONECTAR CON BASE DE DATOS");
				e.printStackTrace();
			} 	
		}
		
//////////////////////////////// USUARIO /////////////////////////////////////////////////////////////
		public void insertUser(String usuario, String clave){
			getConexion();
			String sql="INSERT INTO usuarios (usuario, clave) VALUES (?,?);";
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, usuario);
				stmt.setString(2, clave);
				stmt.execute();
				stmt.close();
				conn.close();
			} 			catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public LinkedList<User> SearchUser(String usuario, String clave) {
			LinkedList<User> res=new LinkedList<User>();
			ResultSet rs = null;
			String sql="SELECT * FROM usuarios WHERE `usuario`= ? AND `clave` = ?";
			getConexion();
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, usuario);
				stmt.setString(2, clave);
				rs = stmt.executeQuery();
				while (rs.next()){
					User users = new User("","");
					users.setValue(usuario, clave);
					res.addLast(users);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 1) "+sql);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 2) "+sql);
			}
			return res;
		}		
		
		
//////////////////////////////////////////// PRODUCTO ////////////////////////////////////////////
		public ArrayList<Producto> SearchPurchase() {
			ArrayList<Producto> res=new ArrayList<Producto>();
			ResultSet rs = null;
			String sql="SELECT * FROM `producto`";
			getConexion();
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()){
					Producto prod = new Producto("","",0,"");
					String id=rs.getString(1);
					String nombre=rs.getString(2);
					double precio=rs.getDouble(3);
					String imagen=rs.getString(4);
					prod.setValue(id,nombre,precio,imagen);
					res.add(prod);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 1) "+sql);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 2) "+sql);
			}
			return res;
		}	
		
		public Producto SearchPurchaseByID (String id) {
			ResultSet rs = null;
			String sql="SELECT * FROM `producto` WHERE `id`= ?";
			Producto prod = new Producto("","",0,"");
			getConexion();
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				while (rs.next()){
					String id1=rs.getString(1);
					String nombre=rs.getString(2);
					double precio=rs.getDouble(3);
					String imagen=rs.getString(4);
					prod.setValue(id1,nombre,precio,imagen);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 1) "+sql);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 2) "+sql);
			}
			return prod;
		}	
		
//////////////////////////////////////////// LISTA DE COMPRA ////////////////////////////////////////////
		
		public void insertCart(String idcompra, int idproducto, int cantidad, int preciodemanda){
			getConexion();
			String sql="INSERT INTO compra (idcompra, idproducto, cantidad, preciodemanda) VALUES (?,?,?,?);";
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, idcompra);
				stmt.setInt(2, idproducto);
				stmt.setInt(3, cantidad);
				stmt.setInt(4, preciodemanda);
				stmt.execute();
				stmt.close();
				conn.close();
			} 			catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<Compra> SearchBuy(String idcompra){
			ArrayList<Compra> res=new ArrayList<Compra>();
			ResultSet rs = null;
			String sql="SELECT * FROM `compra` WHERE `idcompra`= ?";
			getConexion();
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, idcompra);
				rs = stmt.executeQuery();
				while (rs.next()){
					Compra compra = new Compra("",0,0,0);
					String idc=rs.getString(1);
					int idproducto=rs.getInt(2);
					int cantidad=rs.getInt(3);
					int preciodemanda=rs.getInt(4);
					compra.setValue(idc,idproducto,cantidad, preciodemanda);
					res.add(compra);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 1) "+sql);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error en >>>>> ejecutaSELECT(String select 2) "+sql);
			}
			return res;
		}
		
		public void CleanCart(String sessionid){
			getConexion();
			String sql="DELETE FROM `compra` WHERE idcompra = ?;";
			try {
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, sessionid);
				stmt.execute();
				stmt.close();
				conn.close();
			} 			catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	

}
	

