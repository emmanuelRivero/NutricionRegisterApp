package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class databaseUpdate {

	public static boolean Alumno(String cuenta, String nombre, String apellidoPaterno, String apellidoMaterno, String carrera, String descCarrera, String sexo) {
		
		String query = "UPDATE alumno SET nombre='"+nombre+"', apellido_paterno='"+apellidoPaterno+"',apellido_materno='"+apellidoMaterno+"', carrera='"+carrera+"', desc_carrera='"+descCarrera+"', sexo='"+sexo+"' WHERE cuenta="+cuenta+";";
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

	public static boolean Alumno(String cuenta, String nombre, String apellidoPaterno, String apellidoMaterno, String carrera, String descCarrera, String sexo, String cicloID) {
		
		String query = "UPDATE alumno SET nombre='"+nombre+"', apellido_paterno='"+apellidoPaterno+"',apellido_materno='"+apellidoMaterno+"', carrera='"+carrera+"', desc_carrera='"+descCarrera+"', sexo='"+sexo+"', ciclo_id="+cicloID+" WHERE cuenta="+cuenta+";";
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
	
	
	public static void Grupo(String grupoId, String nombre, String hospitalID, String capacidad) {
		
		String query = "UPDATE grupo SET nombre='"+nombre+"', hospital_id="+hospitalID+", capacidad="+capacidad+" where grupo_id="+grupoId+";";
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

	public static void Horario(String horarioId, String horario) {
		
		String query = "UPDATE horario SET horario='"+horario+"' WHERE horario_id="+horarioId+";";
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
	
	
	public static boolean hospital(String id, String nombre, String horario, String periodo, String domicilio) {
		
		String query = "UPDATE hospital SET nombre='"+nombre+"', horario='"+horario+"', periodo ='"+periodo+"',domicilio='"+domicilio+"' WHERE hospital_id="+id+";";
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
	
	public static boolean Registro(String horarioId, String grupoId, String registroId) {
		
		String query = "UPDATE registro SET horario_id="+horarioId+", grupo_id="+grupoId+" WHERE registro_id="+registroId+";";
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

	public static boolean Registro(String cuenta, String cicloID, String email,String telefono, String emergencia, String telfam, String historial, String cartilla, String fotos, String seguro, String horario) {
		
		String query = "update registro SET email='"+email+"', telefono='"+telefono+"', emergencia='"+emergencia+"', telfam='"+telfam+"', historial="+historial+",cartilla="+cartilla+",fotos="+fotos+",seguro="+seguro+",horario="+horario+" where cuenta="+cuenta+" AND ciclo_id="+cicloID+";";
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
