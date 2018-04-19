package com.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException, ClassNotFoundException 
	{ 
		String dbName = "jdbc:postgresql://localhost:5432/PSI";
        String dbDriver = "org.postgresql.Driver";
        String userName = "postgres";
        String password = "shashi"; 

        try{
        Class.forName(dbDriver);
        System.out.println("=999999999");
        Connection con = DriverManager.getConnection(dbName, userName, password);
        System.out.println("Got Connection");
        return con;
	} 
        catch (SQLException e) {

            System.out.println("Connection Failed Shashi");
            e.printStackTrace();
            return (Connection) e;

        }
      finally{
    	  System.out.println("===========");
      }
	}
}
