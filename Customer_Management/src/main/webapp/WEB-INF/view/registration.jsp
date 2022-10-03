<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<!-- Link for apply bootstrap -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

		<title>Customer Registration</title>

		<!-- Common css and js files -->
		<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
		<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		<script src="js/validation.js"></script>
		<link rel="stylesheet" href="css/styles.css" />
		
		<!-- Script tag for validation and date picker -->
		<script type="text/javascript">	
			$(document).ready(function(){
				$("#date").datepicker({
					dateFormat: 'dd/mm/yy',
					maxDate: new Date(),
					inline: true
				});
			});

			/* Validate number only for age */
			function isNumber(evt) {
				evt = (evt) ? evt : window.event;
				var charCode = (evt.which) ? evt.which : evt.keyCode;
				if (charCode > 31 && (charCode < 48 || charCode > 57)) {
					return false;
				}
				return true;
			}

			/* Validate number and space for mobile number */
			function isMobileNumber(evt) {
				evt = (evt) ? evt : window.event;
				var charCode = (evt.which) ? evt.which : evt.keyCode;
				if (charCode > 32 && (charCode < 48 || charCode > 57)) {
					return false;
				}
				return true;
			}

			/* Validate charecter only for first and last name */
			function isChar(evt) {
				evt = (evt) ? evt : window.event;
				var charCode = (evt.which) ? evt.which : evt.keyCode;
				if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body class="sb-nav-fixed">
		<div id="layoutSidenav">
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-5">
									<div class="card shadow-lg border-0 rounded-lg ">
										<div class="card-header">
											<c:if test="${customer.id == 0}">
												<h3 class="text-center font-weight-light my-4">Add Customer</h3>
											</c:if>
											<c:if test="${customer.id > 0}">
												<h3 class="text-center font-weight-light my-4">Update Customer</h3>
											</c:if>
										</div>
										<div class="card-body">

											<!-- Use of spring form for get input from user -->
											<form:form id="register-form" modelAttribute="customer" action="${pageContext.request.contextPath}/savedata" method="post">
												<form:hidden path="id"/>

												<div>
													<form:label path="firstName">First Name:</form:label>
													<form:input path="firstName" class="form-control" id="txt" onkeypress="return isChar(event)" required="required"/>
													<form:errors path="firstName" class="text-danger"></form:errors>
												</div>	

												<div>
													<form:label path="lastName">Last Name:</form:label>
													<form:input path="lastName" class="form-control" id="taxt" onkeypress="return isChar(event)" required="required" />
													<form:errors path="lastName" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="dateOfBirth">Date Of Birth:</form:label>
													<form:input path="dateOfBirth" class="form-control" id="date" required="required"></form:input>
													<form:errors path="dateOfBirth" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="mobileNumber">Mobile Number:</form:label>
													<form:input path="mobileNumber" class="form-control" id="phone" onkeypress="return isMobileNumber(event)" required="required"/>
													<form:errors path="mobileNumber" class="text-danger"></form:errors>
													<span class="text-danger">${numberError}</span>
												</div>

												<div>
													<form:label path="address1">Address1:</form:label>
													<form:input path="address1" class="form-control" required="required"/>
													<form:errors path="address1" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="address2">Address2:</form:label>
													<form:input path="address2" class="form-control" required="required"/>
													<form:errors path="address2" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="age">Age:</form:label>
													<form:input path="age" class="form-control" id="age" onkeypress="return isNumber(event)" required="required"/>
													<form:errors path="age" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="gender" class="required">Gender:</form:label>
													<form:radiobutton path="gender" value="1" class=" " name="gender" id="male" label="" />
													<form:label path="gender" class="" for="male">Male</form:label>
													<form:radiobutton path="gender" value="2" class=" " id= "female"/>
													<form:label path="gender" class="" for="female">Female</form:label>
													<form:radiobutton path="gender" value="3" class=" " id= "other"/>
													<form:label path="gender" class="" for="other">Other</form:label>
													<form:label path="gender" id="gender-error" class="error" style="display:none;" for="gender">Please select a gender!.</form:label>			
													<form:errors path="gender" class="text-danger"></form:errors>
												</div>

												<div>
													<form:label path="email">Email:</form:label>
													<form:input path="email" class="form-control" required="required"/>
													<form:errors path="email" class="text-danger"></form:errors>
													<span class="text-danger">${emailError}</span>
												</div>

												<div class="align-items-center justify-content-between mt-4 mb-0">
													<input type="submit" value="Save" class="btn btn-success">
													<input type="reset" value="Reset" class="btn btn-primary">
													<button type="button" class="btn btn-danger" name="back" onclick="history.back()">Back</button>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>

		<!-- Common js files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
		<script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
		<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	</body>
</html>