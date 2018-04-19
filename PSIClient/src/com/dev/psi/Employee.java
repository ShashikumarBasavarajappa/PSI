package com.dev.psi;

public class Employee {

	private String first_name;
    private String last_name;
    private int Employee_id;
    private String password;
    private String email;
    private String goc;
    private String username;
    private int contact_no;
    
    public void setContact_no(int contact_no) {
		this.contact_no = contact_no;
	}
    public int getContact_no() {
		return contact_no;
	}
    public String getUsername() {
		return username;
	}
    public void setUsername(String username) {
		this.username = username;
	}
    
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	
	public int getEmployee_id() {
		return Employee_id;
	}
	public void setEmployee_id(int employee_id) {
		Employee_id = employee_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGoc() {
		return goc;
	}
	public void setGoc(String goc) {
		this.goc = goc;
	}
	public void setEmployee_id(String parameter) {
		this.Employee_id = Integer.parseInt(parameter);
		
	}    
}
