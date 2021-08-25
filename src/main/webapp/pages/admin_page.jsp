<%@page import="entities.User"%>
<%@page import="java.util.List"%>
<%@page import="main.DatabaseAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>MobileShop - Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/functions.js"></script>
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

	<%
	String role = (String) session.getAttribute("role");
	if (role != null && role.equals("admin")) {
	%>
	<!--Glavni container-->
    <div class="container">
        <div id="header">
            <!--Navbar-->
            <nav class="mt-2 navbar sticky-top navbar-expand-lg navbar-dark bg-dark rounded">
                <a class="navbar-brand btn btn-danger" href="../index.jsp">MOBILESHOP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                    <a class="nav-item nav-link" href="../index.jsp">POCETNA</a>
                    <a class="nav-item nav-link" href="all.jsp">MOBILNI TELEFONI</a>
                    <a class="nav-item nav-link" href="about_us.jsp">O NAMA</a>
                    <a class="nav-tem nav-link" href="contact.jsp">KONTAKT</a>
                    <%
	                    role = (String) session.getAttribute("role");
	                	if (role != null && role.equals("admin")) {
	                %>
	                	<a class="nav-item nav-link" href="admin_page.jsp">ADMIN</a>
	                <% } %>
                    <%
	                    String id = (String) session.getAttribute("id");
	                	if (id != null) {
                    %>
                    <a class="nav-item nav-link" href="chat.jsp">CHAT</a>
                    <a class="nav-item nav-link" href="attempt_logout.jsp" onclick="closeSocket()" >LOGOUT</a>
                    <% } else { %>
                    <a class="nav-item nav-link" href="login.jsp">LOGIN</a>
					<% } %>
                  </div>
                </div>
                
                <a href="help.jsp"><button type="button" class="btn btn-primary">?</button></a>
              </nav>
        </div>
        
        <c:set var="date" value="<%= new java.util.Date() %>"/>
        <!--Main-->
        <div class="stories shadow-sm p-3 mb-5 bg-white rounded">
            <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Admin strana</h1>
            <fmt:formatDate value="${date}" type="both" timeStyle="long" dateStyle="long"/>
            <hr class="mt-2 mb-5">
            <div class="card-deck">
            		<div class="card" style="width: 18rem;">
		                	<div class="card-header">
						    	Dodaj telefon
						  	</div>
						  	<div class="card-body p-3">
			                  <form method="post" action="${pageContext.request.contextPath}/add_phone" enctype="multipart/form-data">
									<div class="form-group">
									    <label for="name">Ime telefona</label>
									    <input type="text" class="form-control" name="name" size="50" placeholder="Ime telefona">
									 </div>
									 <div class="form-group">
									    <label for="image">Slika telefona</label> <br>
									    <input type="file" class="form-control" name="image" size="50"/>
									 </div>
									 <div class="form-group">
									    <label for="description">Opis telefona</label>
									    <textarea class="form-control" name="description" rows="3"></textarea>
									 </div>
									 <div class="form-group">
									    <label for="price">Cena telefona</label>
									    <input type="text" class="form-control" name="price" size="10" placeholder="Cena telefona">
									 </div>
									 <div class="form-group">
										<button type="submit" class="btn btn-success mt-2 btn-sm">Dodaj</button>
									</div>
								</form>
		                </div>
	              	</div>
	              	<div class="card" style="width: 18rem;">
					  <div class="card-header">
					    Kupci
					  </div>
					  <ul class="list-group list-group-flush">
					  <% 
					  	List<User> users = DatabaseAccess.getUsers();
					  	for(User user : users){
					  		if(user.getId() == Integer.valueOf((String) session.getAttribute("id"))) continue;
					  	
					  %>
					    <li class="list-group-item"><%= user.getFirstname() + " " + user.getLastname()%>, <%= user.getAddress() %></li>
					  <% } %>
					  </ul>
					</div>
              </div>
        </div>
        <!-- Main -->
        
        <div id="footer">
            <div class="shadow-sm p-3 mb-5 bg-white rounded mt-2">
                <p class="text-center">Copyright &copy; <a href="https://imi.pmf.kg.ac.rs/">imi</a> 2021</p>
            </div>
        </div>
    </div>
    <% } else {%>
    <!--Main-->
        <div class="stories shadow-sm p-3 mb-5 bg-white rounded">
            <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Greska</h1>
            <hr class="mt-2 mb-5">
            <div class="card-deck">
            		<div class="card">
		                <div class="card-body">
		                  <p class="card-text text-danger">Nemate pristup ovoj strani.</p>
		                </div>
	              	</div>
              </div>
        </div>
        <!-- Main -->
    
    <% } %>
</body>
</html>