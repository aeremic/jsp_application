<%@page import="entities.Phone"%>
<%@page import="main.DatabaseAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/functions.js"></script>
</head>
<%
	String firstlast = DatabaseAccess.getName(Integer.valueOf((String) session.getAttribute("id")));
%>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

	<input type="hidden" id="firstlast" value="<%=firstlast%>">

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
						<a class="nav-item nav-link" href="../index.jsp">POCETNA</a> <a class="nav-item nav-link"
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
						<a class="nav-item nav-link active" href="chat.jsp">
							<span class="sr-only">(current)</span>CHAT</a>
						<a class="nav-item nav-link" href="attempt_logout.jsp" onclick="closeSocket();" >LOGOUT</a>
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
			<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Chat prodavnice</h1>
			<hr class="mt-2 mb-5">
			<div class="card-deck">
				<div class="card">
					<div class="card-body">
						<!--  
						<div class="card-header">Featured</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Cras justo odio</li>
					    	<li class="list-group-item">Dapibus ac facilisis in</li>
					    	<li class="list-group-item">Vestibulum at eros</li>
	  					</ul> -->
	  					<div class="form-group">
						    <textarea class="form-control" id="messagesTextArea" readonly="readonly"  rows="13"></textarea>
						 </div>
	  				</div>
					<div class="card-footer">
						<div class="publisher bt-1 border-light">
							<form method="get" onsubmit="if (true) return false;">
								<div class="form-group">
								    <label for="content">Poruka</label>
								    <input type="text" class="form-control" name="content" id="messageText" size="50" placeholder="Recite nesto">
								 </div>
								 <div class="form-group">
									<button type="submit" onclick="sendMessage();" class="btn btn-primary mt-2 btn-sm">Posalji</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>