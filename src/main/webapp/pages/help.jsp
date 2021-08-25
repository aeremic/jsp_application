<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>MobileShop - Pomoc</title>
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
	                    String role = (String) session.getAttribute("role");
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
        
        <!--Main-->
        <div class="stories shadow-sm p-3 mb-5 bg-white rounded">
            <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Pomoc</h1>
            <hr class="mt-2 mb-5">
            <div class="card-deck">
            		<div class="card">
		                <div class="card-body">
		                  <p class="card-text">
		                  	JSP web aplikacija koja predstavlja online prodavnicu mobilnih telefona. <br>
		                  	Pojedine funkcije aplikacije (chat) rade samo na standardnim web pretrazivacima (Firefox, Chrome...). <br>
		                  	Aplikacija poseduje korisnike i administratora. <br>
		                  	Korisnici imaju mogucnost pregleda uredjaja, kupovinu istih (sama kupovina nije implementirana) i cetu aplikacije. <br>
		                  	Admini imaju mogucnost pregleda uredjaja, dodavanja novih, brisanja, pregleda kupaca i cetu aplikacije. <br>
		                  	Neulogovani korisnici imaju samo mogucnost pregleda uredjaja. 
		                  </p><hr> <br>
		                  Postojeci korisnici:
		                  <ul class="list-group list-group-flush">		 
							    <li class="list-group-item">username: admin; password: 123; role: admin</li>
							    <li class="list-group-item">username: pera; password: 123; role: user</li>
							    <li class="list-group-item">username: mika; password: 123; role: user</li>
                         </ul> <br>
		                  Tehnologije koriscene:
		                  <ul class="list-group list-group-flush">		 
							    <li class="list-group-item">Java, Javascript & Bootstrap</li>
							    <li class="list-group-item">JDBC, MySQL</li>
							    <li class="list-group-item">JSP, JSTL, Scriptlets, Beans</li>
							    <li class="list-group-item">Websockets</li>
							    <li class="list-group-item">Servlets</li>
                         </ul>
		                </div>
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
</body>
</html>