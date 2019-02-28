package models;

public class Hospital {
	private int id;
	private String nombre;
	private String horario;
	private String periodo;
	private String domiclio;
	
	
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
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
	public String getDomiclio() {
		return domiclio;
	}
	public void setDomiclio(String domiclio) {
		this.domiclio = domiclio;
	}
	
	
}
