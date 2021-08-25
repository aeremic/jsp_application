package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider implements IProvider{
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
