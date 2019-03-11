package models;

public class Registro {
	private int id;
	private int cuenta;
	private String nombres;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private int horarioID;
	private String horario;
	private int grupoID;
	private String grupo;
	private int hospitalID;	
	private String hospital;
	private int cicloID;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCuenta() {
		return cuenta;
	}
	public void setCuenta(int cuenta) {
		this.cuenta = cuenta;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getApellidoPaterno() {
		return apellidoPaterno;
	}
	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}
	public String getApellidoMaterno() {
		return apellidoMaterno;
	}
	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}
	public int getHorarioID() {
		return horarioID;
	}
	public void setHorarioID(int horarioID) {
		this.horarioID = horarioID;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public int getGrupoID() {
		return grupoID;
	}
	public void setGrupoID(int grupoID) {
		this.grupoID = grupoID;
	}
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
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
	public int getCicloID() {
		return cicloID;
	}
	public void setCicloID(int cicloID) {
		this.cicloID = cicloID;
	}
}
