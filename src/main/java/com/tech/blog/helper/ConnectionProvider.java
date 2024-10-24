package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // driver class load
            	Class.forName("com.mysql.cj.jdbc.Driver");
                // create a connection
            	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Sweeti@12345");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
