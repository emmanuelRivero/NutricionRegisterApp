package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class databaseValidate {
	public static boolean grupoInsert(String grupoId) {
		String queryCapacidad = "select capacidad from grupo where grupo_id="+grupoId+";";
		String queryRegistrosTotal = "select count(registro_id) from registro where grupo_id = "+grupoId+" AND active=1";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getCapacidad = null;
		ResultSet rsCapacidad = null;
		
		Statement getRegistrosTotal = null;
		ResultSet rsRegistrosTotal = null;
		
		
		int capacidad = 0;
		int RegistrosTotal = 0;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getCapacidad = conection.createStatement();
			getRegistrosTotal = conection.createStatement();
		
			rsCapacidad = getCapacidad.executeQuery(queryCapacidad);
			rsRegistrosTotal = getRegistrosTotal.executeQuery(queryRegistrosTotal);
			rsCapacidad.next();
			rsRegistrosTotal.next();
			
			capacidad = rsCapacidad.getInt("capacidad");
			RegistrosTotal = rsRegistrosTotal.getInt("count(registro_id)");
			System.out.println(capacidad);
			System.out.println(RegistrosTotal);
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			capacidad = -1;
	    }
		finally {
			if (rsCapacidad != null) {
		        try { rsCapacidad.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (rsRegistrosTotal != null) {
		        try { rsCapacidad.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (conection != null) {
		        try { conection.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getCapacidad != null) {
		        try { getCapacidad.close(); } catch (SQLException e) { /* ignored */}
		    }
			if (getRegistrosTotal != null) {
		        try { getRegistrosTotal.close(); } catch (SQLException e) { /* ignored */}
		    }
		}	
		
		if ((capacidad-RegistrosTotal) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean cuentaExist(String cuenta) {
		String query = "select cuenta from alumno where cuenta="+cuenta+";";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		boolean exist=true;
		int cuentaDB=0;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			if (!rs.next()) {
				exist = false;
			}else {
				exist = true;
				cuentaDB = rs.getInt("cuenta");
				System.out.println(cuentaDB);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			exist = false;
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
		
		return exist;
		
	}
	
	public static boolean cuentaRegistered(String cuenta) {
		String query = "select cuenta from registro where cuenta="+cuenta+";";
		databaseData nutricionDB = new databaseData();
		
		String dbIP = nutricionDB.getDbIP();
		String dbPort = nutricionDB.getDbPort();
		String dbName = nutricionDB.getDbName();
		String dbUser = nutricionDB.getDbUser();
		String dbPassword = nutricionDB.getDbPassword();
		
		Connection conection = null;
		Statement getData = null;
		ResultSet rs = null;
		
		boolean exist=true;
		int cuentaDB=0;
		
		try {		
			String url = "jdbc:mysql://" + dbIP + ":" + dbPort + "/" + dbName;
			Class.forName("com.mysql.jdbc.Driver");
			conection=DriverManager.getConnection(url,dbUser,dbPassword);
			getData = conection.createStatement();

		
			rs = getData.executeQuery(query);
			if (!rs.next()) {
				exist = false;
			}else {
				exist = true;
				cuentaDB = rs.getInt("cuenta");
				System.out.println(cuentaDB);
			}
		}
		catch (Exception e)
	    {
			System.out.println(e.getMessage());
			exist = false;
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
		
		return exist;
		
	}

	
}
