package database;

import java.sql.*;
import java.util.ArrayList;

import models.*;

public class databaseQuery {
	
	private static ResultSet doQuery(String query) {
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conection=DriverManager.getConnection(url,dbUser,dbPassword);
			Statement getData = conection.createStatement();
			ResultSet rs;
		
			rs = getData.executeQuery(query);
			return rs;			
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			return null;
	    }
	}	
	
	//Registros
	public static ResultSet getRegistros() {
		String query = "select r.registro_id, r.cuenta, a.nombre, a.apellido_paterno, a.apellido_materno, hor.dias_semana,hor.horario,hosp.nombre,g.nombre,c.nombre from registro AS r JOIN horario AS hor ON r.horario_id=hor.horario_id JOIN alumno AS a ON r.cuenta=a.cuenta JOIN grupo AS g ON g.grupo_id=hor.grupo_id JOIN hospital AS hosp ON hor.hospital_id=hosp.hospital_id JOIN ciclo as c ON c.ciclo_id=g.ciclo_id;";
		ResultSet rs;
	    rs = doQuery(query);
	    return rs;   
	}

	//Registros
	public static ArrayList<Hospital> getHospitales() {
		String query = "select hospital_id, nombre, telefono, responsable, domicilio from hospital;";
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
				hospital.setTelefono(rs.getString("telefono"));
				hospital.setResponsable(rs.getString("responsable"));
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
	public static ResultSet getUser() {
		String query = "select user_id, username, nombres, apellido_paterno, apellido_materno, telefono, domicilio from users;";
		ResultSet rs;
	    rs = doQuery(query);
	    return rs;
		
	}
	
	
}
