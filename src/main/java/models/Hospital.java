package models;

public class Hospital {
	private int id;
	private String nombre;
	private String telefono;
	private String responsable;
	private String domiclio;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getResponsable() {
		return responsable;
	}
	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}
	public String getDomiclio() {
		return domiclio;
	}
	public void setDomiclio(String domiclio) {
		this.domiclio = domiclio;
	}
	
	
}
