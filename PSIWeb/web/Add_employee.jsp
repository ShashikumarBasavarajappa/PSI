<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Calculator</title>
       <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"> 
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="container">     

          <a href="form.jsp">GO to Home Page</a>    
<form class="well form-horizontal" action="Result.jsp" method="post"
	id="contact_form">
	<fieldset>

		<!-- Form Name -->
		<legend>
			<center>
				<h2>
					<b>Employee Registration Form</b>
				</h2>
			</center>
		</legend>
		<br>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">First Name</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input name="first_name"
						placeholder="First Name" class="form-control" type="text">
				</div>
			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Last Name</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input name="last_name"
						placeholder="Last Name" class="form-control" type="text">
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">Goc</label>
			<div class="col-md-4 selectContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-list"></i></span> 
						<select name="goc"
						class="form-control selectpicker">
                                                <option value=""> </option>    
						<option value="Liaison">Liaison</option>
						<option>PSI</option>
						<option>HoneyWel</option>
						<option>Elusion</option>
					</select>
				</div>
			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Username</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input name="username"
						placeholder="Username" class="form-control" type="text">
				</div>
			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Password</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input name="password"
						placeholder="Password" class="form-control" type="password">
				</div>
			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Confirm Password</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input
						name="confirm_password" placeholder="Confirm Password"
						class="form-control" type="password">
				</div>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label">E-Mail</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-envelope"></i></span> <input name="email"
						placeholder="E-Mail Address" class="form-control" type="text">
				</div>
			</div>
		</div>


		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Contact No.</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-earphone"></i></span> <input name="contact_no"
						placeholder="(639)" class="form-control" type="numeric">
				</div>
			</div>
		</div>
                <input type="hidden" value="add_employee" name="add_employee" />  
		
		<div class="form-group">
			<label class="col-md-4 control-label"></label>
			<div class="col-md-4">
				<br>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<button type="submit" class="btn btn-warning">
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span
						class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</button>
			</div>
		</div>

	</fieldset>
</form>
</div>

    </body>
</html>