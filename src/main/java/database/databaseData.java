package database;

public class databaseData {
	private String dbIP;
	private String dbPort;
	private String dbName;
	private String dbUser;
	private String dbPassword;
	
	public databaseData() {
		dbIP = "35.231.140.162";
		dbPort = "3306";
		dbName = "nutricion";
		dbUser = "nutricion";
		dbPassword = "nutricion123Y#";
	}

	public String getDbIP() {
		return dbIP;
	}

	public void setDbIP(String dbIP) {
		this.dbIP = dbIP;
	}

	public String getDbPort() {
		return dbPort;
	}

	public void setDbPort(String dbPort) {
		this.dbPort = dbPort;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getDbUser() {
		return dbUser;
	}

	public void setDbUser(String dbUser) {
		this.dbUser = dbUser;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}
	
	
}
