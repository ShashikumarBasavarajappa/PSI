<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.dev.psi.OperationsSessionBeanRemote"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.dev.psi.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"> 
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE glassfish-web-app PUBLIC "-//GlassFish.org//DTD
GlassFish Application Server 3.1 Servlet 3.0//EN"
    "http://glassfish.org/dtds/glassfish-web-app_3_0-1.dtd">

<%!
    private OperationsSessionBeanRemote ops = null;
    float result = 0;
    ArrayList<Employee> search_data =  new ArrayList();
    List<Employee> updated_data =  new ArrayList();
    public void jspInit() {
        try {

            InitialContext ic = new InitialContext();
            ops = (OperationsSessionBeanRemote)ic.lookup(OperationsSessionBeanRemote.class.getName());
            

            System.out.println("Loaded Calculator Bean");


        } catch (Exception ex) {
            System.out.println("Error:"
                    + ex.getMessage());
        }
    }

    public void jspDestroy() {
        ops = null;
    }
%>



<%

    try {
        
        
        
            if( request.getParameter("add_employee")!=null && !request.getParameter("add_employee").isEmpty()){ 
                if(request.getParameter("add_employee").equals("add_employee")){
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                String goc = request.getParameter("goc");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Double contact_no = Double.parseDouble((request.getParameter("contact_no")));
                
                String email = request.getParameter("email");
                result = ops.add(first_name, last_name,goc,username,password,contact_no,email);
                request.setAttribute("msgList", "Account Was Succeusfully Created Thank you for Registering");
                request.setAttribute("Registered", "test");
                }
            }
            if(request.getParameter("search_portal")!=null && !request.getParameter("search_portal").isEmpty()){
            if(request.getParameter("search_portal").equals("search_portal")  ){
                System.out.println("==************search result===========");
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");
                 search_data = ops.search(first_name, last_name);
                 request.setAttribute("Search_result", search_data);
                 request.setAttribute("Search_data", "You Search results");
            }
            }
            
            if(request.getParameter("delete_button_value") !=null && !request.getParameter("delete_button_value").isEmpty()){
                System.out.println("==************search result===========" + request.getParameter("delete_button_value"));
                int delete_value = Integer.parseInt(request.getParameter("delete_button_value"));
                ops.delete(delete_value);
                request.setAttribute("delete_data", "Employee delete");
            }
            
            if(request.getParameter("update_button_value") !=null && !request.getParameter("update_button_value").isEmpty()){
                int updated_value = Integer.parseInt(request.getParameter("update_button_value"));
                updated_data = ops.update_data_get(updated_value);
                
                request.setAttribute("update_data_value", updated_data);
            }
            if(request.getParameter("update_employee_data") !=null && !request.getParameter("update_employee_data").isEmpty()){
                String first_name = request.getParameter("first_name");
                String last_name = request.getParameter("last_name");                
                String username = request.getParameter("username");
                String password = request.getParameter("password");                              
                String email = request.getParameter("email");
                int employee_id = Integer.parseInt(request.getParameter("employee_id"));
                ops.update_employee_form_data(first_name,last_name,username,password,email,employee_id);
                request.setAttribute("update_data_or_not", "You Data Was saved..");   
            }

%>
<div class="container">       
<p>
      <a href="form.jsp">GO to Home Page</a>    
      
        <c:if test="${Registered != null}">
            <h1> <c:out value = "${msgList}"/> </h1>
        </c:if>
        <c:if test="${update_data_or_not != null}">
            <h1> <c:out value = "${update_data_or_not}"/> </h1>
        </c:if>
        <c:if test="${delete_data != null}">
            <h1> <c:out value = "${delete_data}"/> </h1>
        </c:if>
        <c:if test="${update_data_value != null}">
            <c:forEach items="${update_data_value}" var="element">
                
                    <form class="orm-horizontal" action="Result.jsp" method="post"
	id="update_data_form">
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="first_name">First Name </label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="first_name" placeholder="Enter first_name" name="first_name" value="${element.first_name}">
                    </div>
                  </div>
                    <div class="form-group">
                    <label class="control-label col-sm-2" for="last_name">Last Name </label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="last_name" placeholder="Enter last_name" name="last_name" value="${element.last_name}">
                    </div>
                  </div>
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email </label>
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${element.email}">
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label class="control-label col-sm-2" for="last_name">User Name </label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username" value="${element.username}">
                    </div>
                  </div>
                    
                    <div class="form-group">
                    <label class="control-label col-sm-2" for="last_name">Password </label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="last_name" placeholder="Enter password" name="password" value="${element.password}">
                    </div>
                  </div>                
                    <input type="hidden" name="employee_id" value="${element.employee_id}" /> 
                    <input type="hidden" name="update_employee_data" value="update_employee_data" /> 
                    <br />
                    <br />
                  <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Update</button>
                    </div>
                  </div>
                </form>                          				
		</c:forEach>
        </c:if>
        <c:if test="${Search_result != null}">
            <h1> <c:out value = "${Search_data}"/> </h1>
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
		<c:forEach items="${Search_result}" var="element">
			<tr>
                            <th><input type="checkbox" id="checkItem" name="delete_checkbox" value="${element.employee_id}" onclick="myfun(${element.employee_id})"></th>
				<th scope="row">${element.employee_id}</th>
				<td>${element.first_name}</td>
				<td>${element.last_name}</td>
				<td>${element.email}</td>				
			</tr>
		</c:forEach>
	</tbody>
</table>
         <form class="well form-horizontal" action="Result.jsp" method="post"
	id="delete_form">
            <input type="hidden"  value="" name="delete_button_value" id="delete_button_value" />
            <button class="button" name="delete_button" value="delete_button">Delete</button>  
         </form>
         <form class="well form-horizontal" action="Result.jsp" method="post"
	id="update_form">
            <input type="hidden"  value="" name="update_button_value" id="update_button_value" />
            <button class="button" name="delete_button" value="update_button">Update</button>  
         </form>   
        </c:if>
    <br />
    <br />
   

</h3>
<p>
    <script>
   
       function  myfun(val){
           $("#delete_button_value").val(val);  
           $("#update_button_value").val(val);
       }
    /*   
    $('#checkItem input[name="delete_checkbox"]').on("click", function() {
        alert("====================");
        var my_val = $(this).val();
        $("#delete_button_value").val(my_val);        
    });
    */

</script>
</div>

    <%
            
        }// end of try
        catch (Exception e) {
            e.printStackTrace();
            //result = "Not valid";
        }
    %>