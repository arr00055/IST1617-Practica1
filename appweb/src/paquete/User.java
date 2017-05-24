package paquete;

import java.io.Serializable;

public class User implements Serializable{
	public String usuario;
	public String clave;

	
	public User(String usuario, String clave){
		this.usuario = usuario;
		this.clave = clave;
	}	
	
	public void setValue(String usuario, String clave){
		this.usuario=usuario;
		this.clave=clave;
	}
	
	
}