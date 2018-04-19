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

		<c:if test="${employeess != null}">
			<a href="home.jsp">GO to Home Page</a>
			<br />
			<br />
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">Employee Id</th>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${employeess}" var="element">
						<tr>
							<td><input type="checkbox" id="checkItem"
								name="delete_checkbox" value="${element.employee_id}"
								onclick="myfun(${element.employee_id})"></td>
							<td scope="row">${element.employee_id}</td>
							<td>${element.first_name}</td>
							<td>${element.last_name}</td>
							<td>${element.email}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form class="well form-horizontal" action="Add_employee"
				method="post" id="delete_form" style="margin-left: 11%;">
				<input type="hidden" value="" name="delete_button_value"
					id="delete_button_value" /> <input type="hidden" value=""
					name="searched_employee" id="searched_employee" /> <input
					type="hidden" value="" name="add_employee" id="add_employee" />
				<button class="button" name="delete_button" value="delete_button">Delete</button>
			</form>
			<br />
			<br />
			<form class="well form-horizontal" action="Add_employee"
				method="post" id="update_form" style="margin-left: 11%;">
				<input type="hidden" value="" name="update_button_value"
					id="update_button_value" /> <input type="hidden" value=""
					name="searched_employee" id="searched_employee" /> <input
					type="hidden" value="" name="add_employee" id="add_employee" />
				<button class="button" name="delete_button" value="update_button">Update</button>
			</form>
			<br />
			<br />
			<br />
		</c:if>
		<script>
   
       function  myfun(val){
           $("#delete_button_value").val(val);  
           $("#update_button_value").val(val);
       }
 

</script>
	</div>
</body>

</html>
