<%@page import="in.co.raystech.controller.FacultyListCtl"%>
<%@page import="in.co.raystech.utility.HTMLUtility"%>
<%@page import="in.co.raystech.dto.FacultyDTO"%>
<%@page import="in.co.raystech.utility.DataUtility"%>
<%@page import="in.co.raystech.utility.ServletUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Faculty List View</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
<style>
.p1 {
	padding: 8px;
}
</style>
</head>

<style>
.p1 {
	padding-top: 200px;
}

body {
	/* background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%); */
	background-image: url('img/1127097.jpg');
	background-size: 100%;
}
</style>
<body style="background-color: rgb(240, 240, 240);">
	<div>
		<%@include file="Header.jsp"%>
	</div>
	<div>
		<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">



			<jsp:useBean id="dto" class="in.co.raystech.dto.FacultyDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("collegeList");
				List list2 = (List) request.getAttribute("courseList");
			%>

			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				List list = ServletUtility.getList(request);
				Iterator<FacultyDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
			<center>
				<h1 class="text-primary font-weight-bold pt-3">Faculty List</h1>
			</center>
			</br>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>

				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">

				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="firstName"
						placeholder="Enter Name" class="p1"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="login"
						placeholder="Enter EmailId" class="p1"
						value="<%=ServletUtility.getParameter("login", request)%>">
				</div>
				<div class="col-sm-2"><%=HTMLUtility.getList("collegename", String.valueOf(dto.getCollegeId()), list1)%></div>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 17px" name="operation"
						value="<%=FacultyListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-warning btn-md"
						style="font-size: 17px" name="operation"
						value="<%=FacultyListCtl.OP_RESET%>">
				</div>

				<div class="col-sm-2"></div>
			</div>

			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table">
					<thead class="thead-dark">
						<tr class="table-dark text-dark">
				
							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th class="text">S.NO</th>
							<th class="text">FirstName</th>
							<th class="text">LastName</th>
							<th class="text">Email Id</th>
							<th class="text">Date Of Joining</th>

							<th class="text">College Name</th>
							<th class="text">Course Name</th>
							<th class="text">Subject Name</th>
							<th class="text">Edit</th>


						</tr>
					</thead>
					<%
						while (it.hasNext()) {
								dto = it.next();
					%>

					<tbody>
						<tr style="background-color: white;color:black;">
							<td align="center"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>
							<td align="center"><%=index++%></td>
							<td align="center"><%=dto.getFirstName()%></td>
							<td align="center"><%=dto.getLastName()%></td>
							<td align="center"><%=dto.getEmailId()%></td>
							<td align="center"><%=DataUtility.getDateString(dto.getdOJ())%></td>


							<td align="center"><%=dto.getCollegeName()%></td>
							<td align="center"><%=dto.getCourseName()%></td>
							<td align="center"><%=dto.getSubjectName()%></td>
							<td align="center"><a href="FacultyCtl?id=<%=dto.getId()%>">Edit</a></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>

			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						value="<%=FacultyListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=FacultyListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=FacultyListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=FacultyListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>
			</br>

			<%
				}
				if (list.size() == 0) {
					System.out.println("user list view list.size==0");
			%><center>
				<h1 class="text-primary font-weight-bold pt-3">Faculty List</h1>
			</center>
			</br>
			<div class="row">
				<div class="col-md-4"></div>
				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			</br>
			<div style="padding-left: 48%;">
				<input type="submit" name="operation" class="btn btn-primary btn-md"
					style="font-size: 17px" value="<%=FacultyListCtl.OP_BACK%>">
			</div>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>

	</div>
	</br>
	</br>
</body>
<%@include file="FooterView.jsp"%>

</html>