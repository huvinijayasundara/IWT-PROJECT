package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		String username = "root";
		String password = "123456";
		String url = "jdbc:mysql://localhost:3306/event_db?characterEncoding=utf8";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,username,password); 
		
		return conn;
		
	}
}
