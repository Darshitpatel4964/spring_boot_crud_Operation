<%@ page import="com.customer.model.Customer"%>
<%@ page import="com.customer.controller.CustomerController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<title>Customer Data List</title>

		<!-- Common css and js files -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
		<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	</head>
	<body class="sb-nav-fixed">
		<div id="layoutSidenav">
			<div id="layoutSidenav_content">
				<main>
					<div class="container-fluid px-4">
						<h1 class="mt-4" style="text-align:center;">Customer List</h1>
						<div style="margin-bottom: 10px; margin-left: 82.8%">
							<a href="registration" ><button class="btn btn-primary">Add New Customer</button></a>
						</div>
						<div class="container">
							<div class="row justify-content-center">
								<div class="card mb-4">
									<div class="card-body">

										<!-- For display data coming from database -->
										<table id="datatablesSimple">
										
											<!-- For adjust column -->
											<colgroup>
												<col width="20%">
												<col width="10%">
												<col width="10%">
												<col width="30%">
												<col width="10%">
												<col width="20%">
											</colgroup>
											<thead style="border-top: 0px; border-top-color: inherit;">
												<tr>
													<th>Name</th>
													<th>Date of Birth</th>
													<th>Mobile</th>
													<th>Address</th>
													<th>Gender</th>
													<th>Action</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>Name</th>
													<th>Date of Birth</th>
													<th>Mobile</th>
													<th>Address</th>
													<th>Gender</th>
													<th>Action</th>
												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="customerData" items="${customerList}">
													<tr>
														<td>${customerData.getFirstName()} ${customerData.getLastName()}</td>
														<td><fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${customerData.getDateOfBirth()}" /></td>
														<td>${customerData.getMobileNumber()}</td>
														<td>${customerData.getAddress1()}, ${customerData.getAddress2()}</td>
														<td>
															<c:if test="${customerData.getGender() == 1}">
																<span>Male</span>
															</c:if>
															<c:if test="${customerData.getGender() == 2}">
																<span>Female</span>
															</c:if>
															<c:if test="${customerData.getGender() == 3}">
																<span>Other</span>
															</c:if>
														</td>
														<td>
															<div>
																<div style="display: inline-block; margin-left:10px;">
																	<div>
																		<a href="${pageContext.request.contextPath}/edit/${customerData.id}"><i class="btn btn-primary">Edit</i></a>
																	</div>
																</div>
																<div style="display: inline-block; margin-left:10px;">
																	<div>
																		<a href="${pageContext.request.contextPath}/delete/${customerData.id}" onclick="return confirm('Are you sure you want to delete this data?')"><i class="btn btn-danger" style = "align-self: right;">Delete</i></a>
																	</div>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
	</body>
</html>