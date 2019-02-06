package database;

import java.sql.*;

public class databaseConsult {
	//Registros
	public static ResultSet getRegistros() {
		String dbIP;
		String dbPort;
		String dbName;
		String dbUser;
		String dbPassword;
		
		dbIP = "35.196.88.143";
		dbPort = "3306";
		dbName = "nutricion";
		dbUser = "nutricion";
		dbPassword = "nutricion123Y#";
		
		try {
			
		String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conection=DriverManager.getConnection(url,dbUser,dbPassword);
		Statement getData = conection.createStatement();
		
		String query = "select r.registro_id, r.cuenta, a.nombre, a.apellido_paterno, a.apellido_materno, hor.dias_semana,hor.horario,hosp.nombre,g.nombre,c.nombre from registro AS r JOIN horario AS hor ON r.horario_id=hor.horario_id JOIN alumno AS a ON r.cuenta=a.cuenta JOIN grupo AS g ON g.grupo_id=hor.grupo_id JOIN hospital AS hosp ON hor.hospital_id=hosp.hospital_id JOIN ciclo as c ON c.ciclo_id=g.ciclo_id;";
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

	
	// Users data
	public static ResultSet getUser() {
		String dbIP;
		String dbPort;
		String dbName;
		String dbUser;
		String dbPassword;
		
		dbIP = "35.196.88.143";
		dbPort = "3306";
		dbName = "nutricion";
		dbUser = "nutricion";
		dbPassword = "nutricion123Y#";
		
		try {
			
		String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conection=DriverManager.getConnection(url,dbUser,dbPassword);
		Statement getData = conection.createStatement();
		
		String query = "select user_id, username, nombres, apellido_paterno, apellido_materno, telefono, domicilio from users;";
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
}
