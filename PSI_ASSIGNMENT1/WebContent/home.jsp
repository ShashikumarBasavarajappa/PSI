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
<script src="js/jquery.validate.min.js"></script>
<script src="js/additional-methods.min.js"></script>
<script>
	$(document).ready(function() {

		$("#contact_form").hide();
		$("#update_form").hide();
		$('td[id="hide_td_data"]').hide();
		$('td[id="hide_td_data1"]').hide();
		$('td[id="hide_td_data2"]').hide();
		$("#add_button").click(function() {
			$("#contact_form").show();
			$("#search_form").hide();
			$(".table-bordered").hide();
		});
		$("#search_form").hide();
		$("#search_button").click(function() {
			$("#contact_form").hide();
			$("#search_form").show();
			$(".table-bordered").hide();
		});
		$("#submit_contant_form").click(function() {

			var name = $('#first_name').val();

			if (name.length == 0) {
				$('#first_name').css('border-color', 'red');
				return false;
			}

			var last_name = $('#last_name').val();
			if (last_name.length == 0) {

				$('#last_name').css('border-color', 'red');
				return false;
			}

			var email = $('#email').val();
			if (email.length == 0) {

				$('#email').css('border-color', 'red');
				return false;
			}

			return true;

		});
	});
</script>

</head>
<body>
	<c:if test="${email_exist != null}">
		<script>
			$(document).ready(function() {
				$("#contact_form").show();
			});
		</script>
	</c:if>
	<div class="container">
		<br />
		<h4>PSI ASSIGNMENT 1</h4>

		<br /> <br />

		<div class="jumbotron">
			<button type="button" class="btn btn-primary" id="add_button">Add
				Employee</button>
			<button type="button" class="btn btn-info" id="search_button">Search
				Employee</button>
		</div>

		<%@ include file="Add_employee.jsp"%>
		<%@ include file="list_employess.jsp"%>

		<div class="col-md-3" style="margin-left: 20%;">
			<form class="well form-horizontal" action="Add_employee"
				method="post" id="search_form">
				<h3>Search Data...</h3>
				<label> First Name</label> <input type="text" name="search"
					placeholder="Search.."> <label> Last Name </label> <input
					type="text" name="search2" placeholder="Search.."> <input
					type="hidden" name="searched_employee" value="searched_employee" />
				<br /> <br /> <input type="hidden" name="add_employee" value="" />
				<button type="submit" class="btn btn-warning">
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span
						class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</button>
			</form>
		</div>
		<%@ include file="update_form.jsp"%>
	</div>

</body>
</html>