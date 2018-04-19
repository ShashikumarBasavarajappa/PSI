<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>PST EJB ASSIGNMENT</title>
       <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"> 
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="container">       
        <h1>PSI EJB Assignment 2</h1>
        <a href="Add_employee.jsp">Add Employee</a>
              <button type="button" class="btn btn-link">Search Employee</button>
        <hr>
         <div class="row">
		<div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
      <div class="well">
      <h3 align="center">Search Employee</h3>
        <form class="form-horizontal" action="Result.jsp" method="post"
	id="search_form">
          <div class="form-group">
            <label for="location1" class="control-label">First Name</label>
            <input type="text" class="form-control" id="first_name" name="first_name" aria-describedby="basic-addon1">
          </div>
          <div class="form-group">
            <label for="priceto" class="control-label">Last Name</label>    
              <input type="text" class="form-control" id="last_name" name="last_name" aria-describedby="basic-addon1">    
          </div>
            <input type="hidden" name="search_portal" value="search_portal" /> 
            
          <button type="submit" class="btn btn-warning">
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSearch <span
						class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	  </button>
        </form>
      </div>
    </div>
	</div>
    </div>
    </body>
</html>     
</form>