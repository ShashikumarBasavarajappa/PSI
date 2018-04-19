package com.test.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import com.test.model.ConnectionProvider;
import com.test.model.Employee;

public class Employee_actions {

	public void insert_data(Employee e1) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String Employee = "employess";
		String sqlCreate = "CREATE TABLE IF NOT EXISTS " + Employee + "  (first_name VARCHAR(100),"
				+ "  last_name           VARCHAR(101)," + " password varchar(100)," + " username varchar(200),"
				+ "email varchar(100)," + "goc varchar(100)," + "contact_no INTEGER,"
				+ "Employee_id serial primary key)";

		Statement stmt = con.createStatement();
		stmt.execute(sqlCreate);

		String query = " insert into employess (first_name, last_name, username, email, password, goc)"
				+ " values (?, ?, ?, ?, ?,?)";

		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, e1.getFirst_name());
		ps.setString(2, e1.getLast_name());
		ps.setString(3, e1.getUsername());
		ps.setString(4, e1.getEmail());
		ps.setString(5, e1.getPassword());
		ps.setString(6, e1.getGoc());
		// ps.setInt(7, e1.getContact_no());
		ps.execute();
		con.close();

	}

	public ArrayList<Employee> getdata() throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from employess");
		ResultSet rs = ps.executeQuery();

		ArrayList<Employee> e31 = new ArrayList<>();

		while (rs.next()) {
			Employee e3 = new Employee();
			e3.setFirst_name(rs.getString("first_name"));
			e3.setLast_name(rs.getString("last_name"));
			e3.setEmail(rs.getString("email"));
			e3.setGoc(rs.getString("goc"));
			e3.setUsername(rs.getString("username"));
			e3.setPassword(rs.getString("password"));
			e3.setEmployee_id(rs.getInt("employee_id"));
			e31.add(e3);
		}

		return e31;

	}

	public ArrayList<Employee> search_data(String first_name, String last_name)
			throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String query = "select * from employess where (first_name like ? or last_name like ?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, first_name + "%");
		ps.setString(2, last_name + "%");

		ResultSet rs = ps.executeQuery();

		ArrayList<Employee> e31 = new ArrayList<>();

		while (rs.next()) {
			Employee e3 = new Employee();
			e3.setFirst_name(rs.getString("first_name"));
			e3.setLast_name(rs.getString("last_name"));
			e3.setEmail(rs.getString("email"));
			e3.setGoc(rs.getString("goc"));
			e3.setUsername(rs.getString("username"));
			e3.setPassword(rs.getString("password"));
			e3.setEmployee_id(rs.getInt("employee_id"));
			e31.add(e3);
		}

		return e31;

	}

	public ArrayList<Employee> update_search_data(int name) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String query = "select * from employess where employee_id = ?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, name);

		ResultSet rs = ps.executeQuery();

		ArrayList<Employee> e31 = new ArrayList<>();

		while (rs.next()) {
			Employee e3 = new Employee();
			e3.setFirst_name(rs.getString("first_name"));
			e3.setLast_name(rs.getString("last_name"));
			e3.setEmail(rs.getString("email"));
			e3.setGoc(rs.getString("goc"));
			e3.setUsername(rs.getString("username"));
			e3.setPassword(rs.getString("password"));
			e3.setEmployee_id(rs.getInt("employee_id"));
			e31.add(e3);
		}

		return e31;

	}

	public void delete(int id) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String query = "delete from employess where employee_id=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, id);
		ps.executeUpdate();
	}

	public void update_employee_information(Employee emp) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String sql = "update employess set first_name=?, last_name = ?, password = ? ,username= ? , email = ? ,goc =? where employee_id=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, emp.getFirst_name());
		ps.setString(2, emp.getLast_name());
		ps.setString(3, emp.getPassword());
		ps.setString(4, emp.getUsername());
		ps.setString(5, emp.getEmail());
		ps.setString(6, emp.getGoc());
		ps.setInt(7, emp.getEmployee_id());

		ps.executeUpdate();
	}

	public int is_email_exist(String email) throws ClassNotFoundException, SQLException {
		Connection con = ConnectionProvider.getConnection();
		String query = "select count(email) as rowcount from  employess where email=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt("rowcount");
		}
		return count;

	}

}
