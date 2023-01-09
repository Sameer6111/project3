<%@page import="in.co.raystech.controller.CollegeListCtl"%>
<%@page import="in.co.raystech.utility.HTMLUtility"%>
<%@page import="in.co.raystech.utility.DataUtility"%>
<%@page import="in.co.raystech.dto.CollegeDTO"%>
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
<title>College List View</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
<style>
.p1{
padding: 8px;
}

</style>
</head>
<body>

<style>
.p1 {
	padding-top: 200px;
}
body{
	/* background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%); */
	background-image: url('img/1127097.jpg');	
	background-size: 100%;
	
} 


</style>
<body style="background-color: rgb(240, 240, 240);color:white;">
	<div>
		<%@include file="Header.jsp"%>
	</div>
	<div>
		<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="post">




			<jsp:useBean id="dto" class="in.co.raystech.dto.CollegeDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("collegeList");
			%>
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				List list = ServletUtility.getList(request);
				Iterator<CollegeDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
			<center>
					<h1 class="text-primary font-weight-bold pt-3">College List</h1>
				</center>
<div class="row">
				<div class="col-md-4"></div>
				
					<%
						if (!ServletUtility.getSuccessMessage(request).equals("")) {
					%>

					<div class="col-md-4 alert alert-success alert-dismissible" style="background-color: #80ff80">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4><font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font></h4>
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
					<h4><font color="red">	<%=ServletUtility.getErrorMessage(request)%></font></h4>
					</div>
					<%
						}
					%>
					<div class="col-md-4"></div>
			</div>
				</br>
			
			<div class="row">

						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<%=HTMLUtility.getList("name", String.valueOf(dto.getName()), list1)%>
						</div>
						<div class="col-sm-2">
							<input class="form-control"
							type="text" name="state" placeholder="Enter state" class="p1"
							value="<%=ServletUtility.getParameter("state", request)%>">
						</div>
						<div class="col-sm-2">
							<input
							type="text" class="form-control" name="city" class="p1" placeholder="Enter City"
							value="<%=ServletUtility.getParameter("city", request)%>">
						</div>

						<div class="col-sm-2">
							<input type="submit" class="btn btn-primary btn-md"
								style="font-size: 17px" name="operation"
								value="<%=CollegeListCtl.OP_SEARCH%>">&emsp;
								<input type="submit" class="btn btn-dark btn-md"
								style="font-size: 17px" name="operation"
								value="<%=CollegeListCtl.OP_RESET%>">
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
							<th class="text">Name</th>
							<th class="text">Address</th>
							<th class="text">State</th>
							<th class="text">City</th>
							<th class="text">Mobile No</th>
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
							<td align="center"><%=dto.getName()%></td>
							<td align="center"><%=dto.getAddress()%></td>
							<td align="center"><%=dto.getState()%></td>
							<td align="center"><%=dto.getCity()%></td>
							<td align="center"><%=dto.getPhoneNo()%></td>
							<td align="center"><a href="CollegeCtl?id=<%=dto.getId()%>">Edit</a></td>
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
							value="<%=CollegeListCtl.OP_PREVIOUS%>"
							<%=pageNo > 1 ? "" : "disabled"%>></td>
						<td><input type="submit" name="operation"
							class="btn btn-primary btn-md" style="font-size: 17px"
							value="<%=CollegeListCtl.OP_NEW%>"></td>
						<td><input type="submit" name="operation"
							class="btn btn-danger btn-md" style="font-size: 17px"
							value="<%=CollegeListCtl.OP_DELETE%>"></td>

						<td align="right"><input type="submit" name="operation"
							class="btn btn-secondary btn-md" style="font-size: 17px"
							style="padding: 5px;" value="<%=CollegeListCtl.OP_NEXT%>"
							<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
					</tr>
					<tr></tr>
				</table>
				</br>
			
			<%
				}
				if (list.size() == 0) {
					System.out.println("user list view list.size==0");
			%>
			<center>
					<h1  class="text-primary font-weight-bold pt-3">College
						List</h1>
				</center>
				</br>
				<div class="row">
				<div class="col-md-4"></div>
				
					<%
						if (!ServletUtility.getErrorMessage(request).equals("")) {
					%>
					<div class=" col-md-4 alert alert-danger alert-dismissible">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4><font color="red">	<%=ServletUtility.getErrorMessage(request)%></font></h4>
					</div>
					<%
						}
					%>
					<div class="col-md-4"></div>
			</div>
				</br>
				
				<div class="row">
				<div class="col-md-4"></div>
				
					<%
						if (!ServletUtility.getSuccessMessage(request).equals("")) {
					%>
					<div class="col-md-4 alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4><font color="red">	<%=ServletUtility.getSuccessMessage(request)%></font></h4>
					</div>
					<%
						}
					%>
					<div class="col-md-4"></div>
			</div>
			
			<div style="padding-left: 48%;">
				<input type="submit" name="operation" class="btn btn-primary btn-md"
					style="font-size: 17px" value="<%=CollegeListCtl.OP_BACK%>">
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