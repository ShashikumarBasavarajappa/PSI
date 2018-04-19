
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
.table-bordered {
	padding-left: 10px;
	margin-left: 10%;
	width: 80%;
}
</style>
</head>
<body>
	<div class="container">

		<c:forEach items="${update_data_value}" var="element">
			<a href="home.jsp">GO to Home Page</a>

			<form class="orm-horizontal" action="Add_employee" method="post"
				id="update_data_form">
				<div class="form-group">
					<label class="control-label col-sm-2" for="first_name">First
						Name </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="first_name"
							placeholder="Enter first_name" name="first_name"
							value="${element.first_name}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="last_name">Last
						Name </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="last_name"
							placeholder="Enter last_name" name="last_name"
							value="${element.last_name}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email </label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email"
							placeholder="Enter email" name="email" value="${element.email}">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="last_name">User
						Name </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="username"
							placeholder="Enter Username" name="username"
							value="${element.username}">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="last_name">Password
					</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="last_name"
							placeholder="Enter password" name="password"
							value="${element.password}">
					</div>
				</div>

				<input type="hidden" name="update_employee_data"
					value="update_employee_data" /> <br /> <br /> <input
					type="hidden" value=${element.employee_id } name="employee_id"
					id="employee_id" /> <input type="hidden" value=""
					name="update_button_value" id="update_button_value" /> <input
					type="hidden" value="" name="searched_employee"
					id="searched_employee" /> <input type="hidden" value=""
					name="add_employee" id="add_employee" /> <input type="hidden"
					value=${element.employee_id } name="update_data_form"
					id="update_data_form" />
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Update</button>
					</div>
				</div>
			</form>
		</c:forEach>
	</div>
</body>
</html>
