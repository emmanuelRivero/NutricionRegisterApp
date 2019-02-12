package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class databaseInsert {
	
	public static void hospital(String nombre, String telefono, String responsable, String domicilio) {
		
		String query = "insert into hospital (nombre, telefono, responsable, domicilio) values (?,?,?,?);";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		PreparedStatement insertData = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;			
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			insertData = conection.prepareStatement(query);
		
			insertData.setString(1, telefono);
			insertData.setString(2, nombre);
			insertData.setString(3, responsable);
			insertData.setString(4, domicilio);
			
			insertData.execute();
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
