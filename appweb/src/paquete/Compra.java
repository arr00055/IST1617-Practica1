package paquete;
import java.io.Serializable;

public class Compra implements Serializable {
	String idcompra;
	int idproducto;
	int cantidad;
	int preciodemanda;

		
	public Compra(String idcompra, int idproducto, int cantidad, int preciodemanda){
			this.idcompra=idcompra;
			this.idproducto=idproducto;
			this.cantidad=cantidad;
			this.preciodemanda=preciodemanda;
	}
			
	public String GetIdcompra() {
			return idcompra;
	}
		 
	public void SetIdcompra(String idcompra) {
			this.idcompra=idcompra;
	}

	public int GetIdproducto() {
		return idproducto;
	}
 
	public void SetIdproducto(int idproducto) {
		this.idproducto=idproducto;
	}
	
	public int GetCantidad() {
		return cantidad;
	}
 
	public void SetCantidad(int cantidad) {
		this.cantidad=cantidad;
	}
	
	public int GetPreciodemanda() {
		return preciodemanda;
	}
 
	public void SetPreciodemanda(int preciodemanda) {
		this.preciodemanda=preciodemanda;
	}
	
	public void setValue(String idcompra, int idproducto, int cantidad, int preciodemanda){
		this.idcompra=idcompra;
		this.idproducto=idproducto;
		this.cantidad=cantidad;
		this.preciodemanda=preciodemanda;
	}
}