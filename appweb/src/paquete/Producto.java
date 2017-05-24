package paquete;

import java.io.Serializable;

public class Producto implements Serializable {
	// Variables de Producto
	private String id;
	private String nombre;
	private double precio;
	private String imagen;
	
	// Constructor de la clase
	public Producto(String id, String nombre, double precio, String imagen){
		this.id = id;
		this.nombre = nombre;
		this.precio = precio;
		this.imagen=imagen;
	}
	
	// Constructor específico
	public Producto(String id){
		this.id = id;
	}
 
	// Getters y Setters
	public String getId() {
		return id;
	}
 
	public void setId(String id) {
		this.id = id;
	}
 
	public String getNombre() {
		return nombre;
	}
 
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
 
	public double getPrecio() {
		return precio;
	}
 
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String getImagen() {
		return imagen;
	}
 
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	public void setValue(String id, String nombre, double precio, String imagen){
		this.id=id;
		this.nombre=nombre;
		this.precio=precio;
		this.imagen=imagen;
	}
	
	// Sobreescritura del método equals()
	@Override
	public boolean equals(Object obj) {
		return (obj instanceof Producto) && 
			   ((Producto) obj).getId() == this.id;
	}
 
	// Sobreescritura del método toString()
	@Override
	public String toString() {
		return this.nombre + " (" + String.format( "%.2f", this.precio ) + "&euro;)";
	}
 
}