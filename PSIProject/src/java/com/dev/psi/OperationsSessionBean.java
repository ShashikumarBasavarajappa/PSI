/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dev.psi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author insbasavar
 */
@Stateless
public class OperationsSessionBean implements OperationsSessionBeanRemote {

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
    public float add(String first_name,String last_name,String goc,String username,String password,Double contact_no, String email){
        try {
            
            Connection con = ConnectionProvider.getConnection();
            String Employee = "employess";
            String sqlCreate = "CREATE TABLE IF NOT EXISTS " + Employee + "  (first_name VARCHAR(100),"
                    + "last_name           VARCHAR(101),"
                    + "password varchar(100),"
                    + "username varchar(200),"
                    + "email varchar(100),"
                    + "goc varchar(100),"
                    + "contact_no double precision,"
                    + "Employee_id serial primary key)";
            
            Statement stmt = con.createStatement();
            stmt.execute(sqlCreate);
            
           
            String query = " insert into employess (first_name, last_name, username, email, password, goc, contact_no)"
                   + " values (?, ?, ?, ?, ?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
               ps.setString(1, first_name);
	    ps.setString(2, last_name);
	    ps.setString(3, username);
	    ps.setString(4, email);
	    ps.setString(5, password);
	    ps.setString(6, goc);
            
            ps.setDouble(7, contact_no);
            ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 1;
    }
    
    public  ArrayList<Employee> search(String first_name, String last_name){
        
        ArrayList<Employee> e31 =  new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getConnection();
            String query = "select * from employess where (first_name like ? or last_name like ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, first_name  + "%");
            ps.setString(2, last_name  + "%");
            
            ResultSet rs=ps.executeQuery();
            
            
            
            while(rs.next()){
             
                Employee emp =  new Employee();
                emp.setFirst_name(rs.getString("first_name"));
				emp.setLast_name(rs.getString("last_name"));
				emp.setEmail(rs.getString("email"));
				emp.setGoc(rs.getString("goc"));
				emp.setUsername(rs.getString("username"));
				emp.setPassword(rs.getString("password"));
				emp.setEmployee_id(rs.getInt("employee_id"));
             
                e31.add(emp);
            }            
        } catch (SQLException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("================" + e31);
        return e31;        
        
    }
    
    public void delete(int id) {
        try {
            Connection con = ConnectionProvider.getConnection();
            String query = "delete from employess where employee_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id); 	
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
    public List<Employee> update_data_get(int update_data_value){
        List<Employee> ls =  new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getConnection();
            String query = "select * from employess where employee_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, update_data_value);
            
            
            ResultSet rs=ps.executeQuery();
            
            
            
            while(rs.next()){
             
                Employee emp =  new Employee();
                emp.setFirst_name(rs.getString("first_name"));
                emp.setLast_name(rs.getString("last_name"));
                emp.setEmail(rs.getString("email"));
                emp.setGoc(rs.getString("goc"));
                emp.setUsername(rs.getString("username"));
                emp.setPassword(rs.getString("password"));
                emp.setEmployee_id(rs.getInt("employee_id"));
                
                ls.add(emp);
                
            }   } catch (SQLException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
}
    public void update_employee_form_data(String first_name,String last_name,String username,String password,String email,int employee_id){
        try {
            Connection con = ConnectionProvider.getConnection();
            String sql = "update employess set first_name=?, last_name = ?, password = ? ,username= ? , email = ? where employee_id=?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, password);
            ps.setString(4, username);
            ps.setString(5, email);            
            ps.setInt(6 , employee_id);
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OperationsSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

