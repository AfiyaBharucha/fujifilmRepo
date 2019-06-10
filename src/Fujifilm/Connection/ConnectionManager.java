package Fujifilm.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection conn;
	static String url;

	public static Connection getCustConnection() {

		try {
			url = "jdbc:mysql://127.0.0.1:3306/fujifilm?useSSL=false";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "1995");
			System.out.println(conn);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return conn;

	}

}
