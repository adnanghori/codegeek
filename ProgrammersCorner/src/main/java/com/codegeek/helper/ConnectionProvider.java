package com.codegeek.helper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection con;
	private static String url = "jdbc:mysql://localhost:3306/programmerscorner";
	private static String username = "root";
	private static String password = "8898";
		public static Connection getConnection() throws SQLException{
			try {
				if(con==null) {
					Class.forName("com.mysql.cj.jdbc.Driver");
					con=DriverManager.getConnection(url,username,password);
				}
			}catch(ClassNotFoundException cnfe) {
				cnfe.printStackTrace();
		} /*
			 * catch(Exception e) { e.printStackTrace(); }
			 */
			
			return con;
			
		}
}
