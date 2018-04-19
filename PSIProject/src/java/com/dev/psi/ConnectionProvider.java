/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dev.psi;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author insbasavar
 */
public class ConnectionProvider {
    public static Connection getConnection() throws SQLException, ClassNotFoundException 
	{ 
	String dbName = "jdbc:postgresql://localhost:5432/PSI_EJB";
        String dbDriver = "org.postgresql.Driver";
        String userName = "postgres";
        String password = "shashi"; 

        try{
                    System.out.println("=9999ASDASDSADS99999");

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
