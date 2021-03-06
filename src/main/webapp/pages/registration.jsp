<%@page import="entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>MobileShop - Registracija</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	<!--Glavni container-->
	<div class="container">
	    <h3 class="text-center p-5 mt-5">Registracija</h3>
	
	    <div class="mx-auto w-50 mb-2">
	        <a href="login.jsp"><button type="button" class="btn btn-danger m-1" id="povratak">Povratak</button></a>
	    </div>
	
	    <!--Glavni border-->
	    <div class="border border-info rounded p-3 mx-auto my-auto w-50">
	        <!--Forma-->
	        <form method="post" action="attempt_register.jsp" class="mt-3">
	            <div class="form-group">
	                <label for="inputUsername">Korisnicko ime</label>
	                <input type="text" class="form-control" name="username" id="inputUsername" placeholder="Unesite korisnicko ime">
	            </div>
	            <div class="form-group">
	                <label for="inputPassword">Sifra</label>
	                <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Unesite sifru">           
	            </div>
	            <div class="form-group">
	                <label for="inputFirstname">Ime</label>
	                <input type="text" class="form-control" name="firstname" id="inputFirstname" placeholder="Unesite ime">           
	            </div>
	            <div class="form-group">
	                <label for="inputLastname">Prezime</label>
	                <input type="text" class="form-control" name="lastname" id="inputLastname" placeholder="Unesite prezime">           
	            </div>
	            <div class="form-group">
	                <label for="inputAddress">Adresa stanovanja</label>
	                <input type="text" class="form-control" name="address" id="inputAddress" placeholder="Unesite adresu">           
	            </div>
	            <div class="form-group mt-5">
	                <button type="submit" class="btn btn-primary btn-block mb-3 btn-lg">Registracija</button>
	            </div>
	        </form> <!--Forma-->
	    </div> <!--Glavni border-->
	
	    <footer class="page-footer font-small pt-4">
	        <div class="footer-copyright text-center py-3">? 2021 Copyright:
	            <a href="https://imi.pmf.kg.ac.rs/"> imi</a>
	        </div>
	    </footer>
	</div> 
	<!--Glavni container-->
</body>
</html>