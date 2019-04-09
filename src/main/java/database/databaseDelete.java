package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class databaseDelete {
	
	public static void Alumno(String cuenta) {
		String query = "UPDATE alumno SET active=0 WHERE cuenta="+cuenta+";";
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

	public static void Grupo(String grupoId) {
		
		String query = "UPDATE grupo SET active=0 WHERE grupo_id="+grupoId+";";
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
	public static void Hospital(String hospitalId) {
		
		String query = "UPDATE hospital SET active=0 WHERE hospital_id="+hospitalId+";";
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
	public static void Horario(String horarioId) {
		
		String query = "UPDATE horario SET active=0 WHERE horario_id="+horarioId+";";
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
	public static void Usuario(String usuarioId) {
		
		String query = "UPDATE users SET active=0 WHERE user_id="+usuarioId+";";
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
	public static void Registro(String registroId) {
		
		String query = "UPDATE registro SET active=0 WHERE registro_id="+registroId+";";
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
}
