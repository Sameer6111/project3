<%@page import="in.co.raystech.controller.UserListCtl"%>
<%@page import="in.co.raystech.utility.HTMLUtility"%>
<%@page import="in.co.raystech.model.RoleModelInt"%>
<%@page import="in.co.raystech.model.ModelFactory"%>
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
<title>User List</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
<style>
.hm-gradient { /
	background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
	/
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/bg.png');
}

.p1 {
	padding: 4px;
	width: 200px;
	font-size: bold;
}

.text {
	text-align: center;
}
</style>
</head>
<%@include file="Header.jsp"%>
<body style="background-color: rgb(240, 240, 240);">
	<div>
		<form class="pb-5" action="<%=ORSView.USER_LIST_CTL%>" method="post">
			<jsp:useBean id="dto" class="in.co.raystech.dto.UserDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("roleList");
			%>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				RoleDTO rdto = new RoleDTO();
				RoleModelInt rmodel = ModelFactory.getInstance().getRoleModel();

				List list = ServletUtility.getList(request);

				if (list.size() != 0) {
			%>
			<center>
				<h1 class="text-primary font-weight-bold pt-3">User List</h1>
			</center>
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
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
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
					<input type="text" name="firstName" placeholder="Enter FirstName"
						class="form-control"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
				</div>
				&emsp;
				<div class="col-sm-2">
					<input type="text" name="login" placeholder="Enter Login Id"
						class="form-control"
						value="<%=ServletUtility.getParameter("login", request)%>">
				</div>
				&emsp;
				<div class="col-sm-2"><%=HTMLUtility.getList("Role", String.valueOf(dto.getRoleId()), list1)%></div>

				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 15px" name="operation"
						value="<%=UserListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-dark btn-md" style="font-size: 15px"
						name="operation" value="<%=UserListCtl.OP_RESET%>">
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
							<th width="5%" class="text">S.NO</th>
							<th width="15%" class="text">FirstName</th>
							<th width="15%" class="text">LastName</th>
							<th width="20%" class="text">LoginId</th>
							<th width="10%" class="text">Gender</th>
							<th width="10%" class="text">Role</th>
							<th width="10%" class="text">DOB</th>
							<th width="5%" class="text">Edit</th>
						</tr>
					</thead>
					<%
						Iterator<UserDTO> it = list.iterator();
							while (it.hasNext()) {
								dto = it.next();
								System.out.println(dto.getRoleId() + "%");
								rdto = rmodel.findByPK(dto.getRoleId());
								System.out.println(rdto.getName() + "--------");
					%>
					<tbody>
						<tr style="background-color: white;color:black;">
							<td align="center"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"
								<%if (dto.getRoleId() == 1) {%> <%="disabled"%> <%}%>></td>
							<td class="text"><%=index++%></td>
							<td class="text"><%=dto.getFirstName()%></td>
							<td class="text"><%=dto.getLastName()%></td>
							<td class="text"><%=dto.getLogin()%></td>
							<td class="text"><%=dto.getGender()%></td>
							<td class="text"><%=rdto.getName()%></td>
							<td class="text"><%=DataUtility.getDateString(dto.getDob())%></td>
							<td class="text"><a href="UserCtl?id=<%=dto.getId()%>"
								<%if (dto.getRoleId() == 1) {%> "
						onclick="return false;"
								<%}%>>Edit</a></td>
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
						value="<%=UserListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=UserListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=UserListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=UserListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>

			<%
				}
				if (list.size() == 0) {
					System.out.println("user list view list.size==0");
			%>
			<center>
				<h1 style="font-size: 40px; color: #162390;">User List</h1>
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
				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
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
					style="font-size: 17px" value="<%=UserListCtl.OP_BACK%>">
			</div>


			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>


	</div>


</body>
<%@include file="FooterView.jsp"%>
</html>