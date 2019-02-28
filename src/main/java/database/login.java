package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.*;

public class login {
	public static Session loginUser(String user, String password) {
		String autentica = "select autenticaUsuario('"+user+"','"+password+"');";
		String datosSession = "select u.username, r.rolname from users as u JOIN roles as r ON u.rol_id=r.rol_id where u.username='"+user+"';";
		Session session= new Session();
		databaseData nutricionDB = new databaseData();
		
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		Statement getSessionData = null;
		ResultSet rsAuth = null;
		ResultSet rsSession= null;
		session.setUsername(null);
		session.setRol(null);;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rsAuth = getData.executeQuery(autentica);
			rsAuth.next();
			if (rsAuth.getInt(1) == 1) {
				getSessionData = conection.createStatement();
				rsSession = getSessionData.executeQuery(datosSession);
				rsSession.next();
				session.setUsername(rsSession.getString("u.username"));
				session.setRol(rsSession.getString("r.rolname"));
			} else {
				System.out.println("Couln't authenticate");
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
	    }
		finally {
			if (rsAuth != null) {
		        try { rsAuth.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (rsSession != null) {
		        try { rsSession.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getData != null) {
		        try { getData.close(); } catch (SQLException e) { /* ignored */}
		    }			
		}
		
		return session;
	}
}
