package database;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class databaseInsert {

	public static boolean alumno(String cuenta, String nombre, String apellidoPaterno, String apellidoMaterno, String carrera, String desc_carrera, String sexo, String cicloID) {
		
		String query = "INSERT INTO alumno(cuenta,nombre,apellido_paterno,apellido_materno,carrera,desc_carrera,sexo,ciclo_id) VALUES ("+cuenta+",'"+nombre+"','"+apellidoPaterno+"','"+apellidoMaterno+"','"+carrera+"','"+desc_carrera+"','"+sexo+"','"+cicloID+"');";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		boolean status = true;
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			status = false;
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		return status;
	}	

	public static void ciclo(String nombre) {
		
		String query = "INSERT INTO  ciclo(nombre) VALUES ('"+nombre+"');";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}		
	}	

	public static void grupo(String nombre, String cicloID,String hospitalId,String capacidad) {
		
		String query = "INSERT INTO grupo(nombre,ciclo_id,hospital_id,capacidad) VALUES ('"+nombre+"',"+cicloID+","+hospitalId+","+capacidad+");";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}		
	}	
	
	public static void horario(String horario) {
		
		String query = "INSERT INTO horario(horario) VALUES ('"+horario+"');";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}		
	}
	
	public static boolean hospital(String nombre, String horario, String periodo, String domicilio) {
		
		String query = "INSERT INTO hospital (nombre,horario,periodo,domicilio) VALUES ('"+nombre+"','"+horario+"','"+periodo+"','"+domicilio+"');";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		boolean status = true;
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			status = false;
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}	
		return status;
	}	
	
	public static void usuario(String usuario, String nombres, String apellidoPaterno, String apellidoMaterno,String telefono, String domicilio, String password, String rol) {
		
		String query = "{call creaUsuario(?,?,?,?,?,?,?,?)}";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		CallableStatement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.prepareCall(query);
			insertData.setString(1, usuario);
			insertData.setString(2, nombres);
			insertData.setString(3, apellidoPaterno);
			insertData.setString(4, apellidoMaterno);
			insertData.setString(5, telefono);
			insertData.setString(6, domicilio);
			insertData.setString(7, password);
			insertData.setString(8, rol);
			
			insertData.executeUpdate();
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}		
	}
	
	public static boolean Registro(String cuenta, String horarioId, String grupoId, String cicloiD) {
		
		String query = "insert into registro(cuenta, horario_id,grupo_id,ciclo_id) values ("+cuenta+","+horarioId+","+grupoId+","+cicloiD+");";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		boolean status = true;
		
		Connection conection = null;
		Statement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.createStatement();
			insertData.executeUpdate(query);
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			status = false;
	    }
		finally {
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (insertData != null) {
		        try { insertData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}	
		return status;
	}
	
}
