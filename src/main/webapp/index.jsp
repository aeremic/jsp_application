<%@page import="entities.Phone"%>
<%@page import="java.util.List"%>
<%@ page import="main.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>MobileShop - Pocetna</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/functions.js"></script>
</head>
<body>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!--Glavni container-->
    <div class="container">
        <div id="header">
            <!--Navbar-->
            <nav class="mt-2 navbar sticky-top navbar-expand-lg navbar-dark bg-dark rounded">
                <a class="navbar-brand btn btn-danger" href="index.jsp">MOBILESHOP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="index.jsp">POCETNA<span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="pages/all.jsp">MOBILNI TELEFONI</a>
                    <a class="nav-item nav-link" href="pages/about_us.jsp">O NAMA</a>
                    <a class="nav-item nav-link" href="pages/contact.jsp">KONTAKT</a>
                    <%
	                    String role = (String) session.getAttribute("role");
	                	if (role != null && role.equals("admin")) {
	                %>
	                	<a class="nav-item nav-link" href="pages/admin_page.jsp">ADMIN</a>
	                <% } %>
                    <%
	                    String id = (String) session.getAttribute("id");
	                	if (id != null) {
                    %>
                    <a class="nav-item nav-link" href="pages/chat.jsp">CHAT</a>
                    <a class="nav-item nav-link" href="pages/attempt_logout.jsp" onclick="closeSocket()" >LOGOUT</a>
                    <% } else { %>
                    <a class="nav-item nav-link" href="pages/login.jsp">LOGIN</a>
					<% } %>
                  </div>
                </div>
			    
                <a href="help"><button type="button" class="btn btn-primary">?</button></a>
              </nav>
        </div>
        
        <!--Main-->
        <div class="stories shadow-sm p-3 mb-5 bg-white rounded">
            <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Ponuda</h1>
            <hr class="mt-2 mb-5">
            <div class="card-deck">
            	<% 
            		List<Phone> phones = DatabaseAccess.getPhones();
            		for(Phone phone : phones){
            			if(phone.getName().contains("Samsung") || phone.getName().contains("Apple")){
            	%>
		            		<div class="card">
			                    <!--404 297-->
				                <img class="card-img-top" style="width: 250px;" src="<%= phone.getImage() %>" alt="Card image cap">
				                <div class="card-body">
				                  <h5 class="card-title"><%= phone.getName()%></h5>
				                  <p class="card-text"><%= phone.getDescription() %></p>
				                  <a href="pages/details.jsp?id=<%= phone.getId() %>" class="btn btn-primary stretched-link">Saznaj vise</a>
				                </div>
			              	</div>
            	
            	<%
            			}
            		}
            	%>
              </div>
        </div>
        <!-- Main -->
		        
        <div id="footer">
            <div class="shadow-sm p-3 mb-5 bg-white rounded mt-2">
                <p class="text-center">Copyright &copy; <a href="https://imi.pmf.kg.ac.rs/">imi</a> 2021</p>
            </div>
        </div>
    </div>
</body>
</html>