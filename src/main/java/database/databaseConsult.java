package database;

import java.sql.*;

public class databaseConsult {
	public static ResultSet getData() {
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conection=DriverManager.getConnection("jdbc:mysql://35.196.88.143:3306/nutricion","nutricion","nutricion123Y#");
		Statement getData = conection.createStatement();
		
		String query = "select username from users;";
		ResultSet rs;
		rs = getData.executeQuery(query);
	    
		return rs;
        }
		
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		
		return null;
	}

}
