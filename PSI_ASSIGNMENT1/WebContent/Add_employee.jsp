
<form class="well form-horizontal" action="add_employee" method="post"
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
						class="glyphicon glyphicon-user"></i></span> <input id="first_name"
						name="first_name" placeholder="First Name" class="form-control"
						type="text">
				</div>
			</div>
		</div>

		<!-- Text input-->

		<div class="form-group">
			<label class="col-md-4 control-label">Last Name</label>
			<div class="col-md-4 inputGroupContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="last_name"
						name="last_name" placeholder="Last Name" class="form-control"
						type="text">
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-4 control-label">Goc </label>
			<div class="col-md-4 selectContainer">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-list"></i></span> <select name="goc"
						class="form-control selectpicker">
						<option value=""></option>
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
						class="glyphicon glyphicon-envelope"></i></span>
					<c:if test="${email_exist != null}">
						<p style="background-color: red;">
							<c:out value="${email_exist}" />
						</p>
						<br />
						<br />
						<br />
						            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        </c:if>
					<input id="email" name="email" placeholder="E-Mail Address"
						class="form-control" type="text">
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

		<input type="hidden" name="add_employee" value="add_employee" /> <input
			type="hidden" value="" name="searched_employee"
			id="searched_employee" /> <input type="hidden" value=""
			name="delete_button_value" id="delete_button_value" />
		<div class="form-group">
			<label class="col-md-4 control-label"></label>
			<div class="col-md-4">
				<br>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<button type="submit" class="btn btn-warning"
					id="submit_contant_form">
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span
						class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				</button>
			</div>
		</div>

	</fieldset>
</form>
</div>
