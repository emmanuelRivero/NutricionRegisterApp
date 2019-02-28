package database;

import java.sql.*;
import java.util.ArrayList;

import models.*;

public class databaseQuery {
	
	//Alumno
	public static ArrayList<Alumno> getAlumno() {
		String query = "select cuenta, nombre, apellido_paterno, apellido_materno, carrera, desc_carrera, sexo from alumno where active=1;";
		ArrayList<Alumno> alumnos = new ArrayList<Alumno>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Alumno alumno = new Alumno();
				
				alumno.setCuenta(rs.getInt("cuenta"));
				alumno.setNombre(rs.getString("nombre"));
				alumno.setApellidoPaterno(rs.getString("apellido_paterno"));
				alumno.setApellidoMaterno(rs.getString("apellido_materno"));
				alumno.setCarrera(rs.getString("carrera"));
				alumno.setDescCarrera(rs.getString("desc_carrera"));
				alumno.setSexo(rs.getString("sexo"));
				
				alumnos.add(alumno);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return alumnos;
	}	
	
	//Ciclo
	public static ArrayList<Ciclo> getCiclo() {
		String query = "select ciclo_id, nombre from ciclo WHERE active=1;";
		ArrayList<Ciclo> ciclos = new ArrayList<Ciclo>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Ciclo ciclo = new Ciclo();
				
				ciclo.setId(rs.getInt("ciclo_id"));
				ciclo.setNombre(rs.getString("nombre"));
				
				ciclos.add(ciclo);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return ciclos;
	}	
	
	//Grupos
	public static ArrayList<Grupo> getGrupo() {
		String query = "select g.grupo_id, g.nombre, c.nombre from grupo AS g JOIN ciclo as c ON g.ciclo_id=c.ciclo_id WHERE g.active=1;";
		ArrayList<Grupo> grupos = new ArrayList<Grupo>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Grupo grupo = new Grupo();
				
				grupo.setId(rs.getInt("g.grupo_id"));
				grupo.setNombre(rs.getString("g.nombre"));
				grupo.setCiclo(rs.getString("c.nombre"));
				
				grupos.add(grupo);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return grupos;
	}	
	
	//Horario
	public static ArrayList<Horario> getHorario() {
		String query = "select hor.horario_id, hor.periodo, hor.horario, hosp.nombre, g.nombre, hor.cupo_total from horario as hor JOIN hospital as hosp ON hor.hospital_id=hosp.hospital_id JOIN grupo AS g ON hor.grupo_id=g.grupo_id WHERE hor.active=1;";
		ArrayList<Horario> horarios = new ArrayList<Horario>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Horario horario = new Horario();
				
				horario.setId(rs.getInt("hor.horario_id"));
				horario.setPeriodo(rs.getInt("hor.periodo"));
				horario.setHorario(rs.getString("hor.horario"));
				horario.setHospital(rs.getString("hosp.nombre"));
				horario.setGrupo(rs.getString("g.nombre"));
				horario.setCupoTotal(rs.getInt("hor.cupo_total"));
				
				horarios.add(horario);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return horarios;
	}
	
	//Registros
	public static ArrayList<Registro> getRegistros() {
		String query = "select r.registro_id, r.cuenta, a.nombre, a.apellido_paterno, a.apellido_materno,hor.horario,hosp.nombre,g.nombre,c.nombre from registro AS r JOIN horario AS hor ON r.horario_id=hor.horario_id JOIN alumno AS a ON r.cuenta=a.cuenta JOIN grupo AS g ON g.grupo_id=hor.grupo_id JOIN hospital AS hosp ON hor.hospital_id=hosp.hospital_id JOIN ciclo as c ON c.ciclo_id=g.ciclo_id WHERE r.active=1;";
		ArrayList<Registro> registros = new ArrayList<Registro>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Registro registro = new Registro();
				registro.setId(rs.getInt("r.registro_id"));
				registro.setCuenta(rs.getInt("r.cuenta"));
				registro.setNombres(rs.getString("a.nombre"));
				registro.setApellidoPaterno(rs.getString("a.apellido_paterno"));
				registro.setApellidoMaterno(rs.getString("a.apellido_materno"));
				registro.setHorario(rs.getString("hor.horario"));
				registro.setHospital(rs.getString("hosp.nombre"));
				registro.setGrupo(rs.getString("g.nombre"));
				registro.setCiclo(rs.getString("c.nombre"));
				
				registros.add(registro);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return registros;
	}

	//Hospital
	public static ArrayList<Hospital> getHospitales() {
		String query = "select hospital_id, nombre, horario, periodo, domicilio from hospital WHERE active=1;";
		ArrayList<Hospital> hospitales = new ArrayList<Hospital>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Hospital hospital = new Hospital();
				hospital.setId(rs.getInt("hospital_id"));
				hospital.setNombre(rs.getString("nombre"));
				hospital.setHorario(rs.getString("horario"));
				hospital.setPeriodo(rs.getString("periodo"));
				hospital.setDomiclio(rs.getString("domicilio"));
				
				hospitales.add(hospital);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return hospitales;
	}	
	
	// Users data
	public static ArrayList<Usuario> getUsuario() {
		String query = "select u.user_id, u.username, u.nombres, u.apellido_paterno, u.apellido_materno, u.telefono, u.domicilio, r.rolname from users AS u JOIN roles AS r ON u.rol_id=r.rol_id WHERE u.active=1;";
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			
			while(rs.next()){
				Usuario usuario = new Usuario();
				
				usuario.setId(rs.getInt("u.user_id"));
				usuario.setUserName(rs.getString("u.username"));
				usuario.setNombres(rs.getString("u.nombres"));
				usuario.setApellidoPaterno(rs.getString("u.apellido_paterno"));
				usuario.setApellidoMaterno(rs.getString("u.apellido_materno"));
				usuario.setTelefono(rs.getString("u.telefono"));
				usuario.setDomicilio(rs.getString("u.domicilio"));
				usuario.setRol(rs.getString("r.rolname"));
				
				usuarios.add(usuario);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rs != null) {
		        try { rs.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return usuarios;
	}	

	
	
}
