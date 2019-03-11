package models;

public class Grupo {
	private int id;
	private String nombre;
	private int hospitalID;	
	private String hospital;
	private int capacidad;
	private int cicloID;
	
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
	public int getHospitalID() {
		return hospitalID;
	}
	public void setHospitalID(int hospitalID) {
		this.hospitalID = hospitalID;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public int getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	public int getCicloID() {
		return cicloID;
	}
	public void setCicloID(int cicloID) {
		this.cicloID = cicloID;
	}
	
}
