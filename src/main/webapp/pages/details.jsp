<%@page import="entities.Phone"%>
<%@page import="main.DatabaseAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalji</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/functions.js"></script>
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

	<!--Glavni container-->
	<div class="container">
		<div id="header">
			<!--Navbar-->
			<nav
				class="mt-2 navbar sticky-top navbar-expand-lg navbar-dark bg-dark rounded">
				<a class="navbar-brand btn btn-danger" href="../index.jsp">MOBILESHOP</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-item nav-link active" href="../index.jsp">POCETNA<span
							class="sr-only">(current)</span></a> <a class="nav-item nav-link"
							href="all.jsp">MOBILNI TELEFONI</a> <a class="nav-item nav-link"
							href="about_us.jsp">O NAMA</a> <a class="nav-item nav-link"
							href="contact.jsp">KONTAKT</a>
						<%
							String role = (String) session.getAttribute("role");
							if (role != null && role.equals("admin")) {
						%>
						<a class="nav-item nav-link" href="admin_page.jsp">ADMIN</a>
						<%
							}
						%>
						<%
							String id = (String) session.getAttribute("id");
							if (id != null) {
						%>
						<a class="nav-item nav-link" href="chat.jsp">CHAT</a>
						<a class="nav-item nav-link" href="attempt_logout.jsp" onclick="closeSocket()" >LOGOUT</a>
						<%
							} else {
						%>
						<a class="nav-item nav-link" href="login.jsp">LOGIN</a>
						<%
							}
						%>
					</div>
				</div>

                <a href="help.jsp"><button type="button" class="btn btn-primary">?</button></a>
			</nav>
		</div>

		<!--Main-->
		<div class="stories shadow-sm p-3 mb-5 bg-white rounded">
			<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Detalji</h1>
			<hr class="mt-2 mb-5">
			<div class="card-deck">
				<%
					int phoneId = Integer.valueOf((String) request.getParameter("id"));
					Phone phone = DatabaseAccess.getPhoneById(phoneId);
				%>
				<div class="card">
					<!--404 297-->
					<img class="card-img-top" style="width: 250px;"
						src="../<%=phone.getImage()%>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=phone.getName()%></h5>
						<p class="card-text"><%=phone.getDescription()%></p>
						<%
						role = (String) session.getAttribute("role");
	                    id = (String) session.getAttribute("id");
	                	if (id != null && (role != null && !role.equals("admin"))) {
                    	%>
                    	<p>Cena: <%= phone.getPrice() %></p>
						<a href="#"
							class="btn btn-success stretched-link disabled">Naruci</a>
						<% } else if(role != null && role.equals("admin")) { %>
						<a href="delete.jsp?id=<%= phoneId %>"
							class="btn btn-danger stretched-link">Izbrisi</a>
						<% } else { %>
						<p class="text-danger">Morate biti ulogovani kako bi kupili proizvod.</p>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>