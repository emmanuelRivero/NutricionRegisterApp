package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class databaseInsert {
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
}
