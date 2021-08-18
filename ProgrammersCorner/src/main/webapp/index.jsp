<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <%@ page import ="com.codegeek.helper.*" %>
    <%@ page import ="com.codegeek.dao.*" %>
     <%@ page import = "java.util.ArrayList" %>
     <%@ page import ="com.codegeek.entities.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CodeGeek</title>
	<!-- css -->	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style type="text/css">
	body{
	background-color: #F5FFFA;
	background-image: url("image/minimal.jpeg");
	}
	
	</style>
</head>
<body>

	<!-- Navbar -->
	<%@ include file ="normal_navbar.jsp" %>
		<!-- banner -->
		<div class="container-fluid p-2 m-2">
			<!-- <div class="jumbotron"style="background-color: #F5FFFA;"> -->
			<div class="container"> 
			<h3 class="display-3">Bonjour Geeks.!</h3>
			<h3>Introducing CodeGeek An Independent Platform Which Allows Teachers As Well As Students To Share Their Knowledge.</h3>
			<p> Paragraph Space For Rest Of The Shit..!!</p>
			<p>Post Your Ideas Here, CodeGeek</p>
			<button class="btn btn-outline-dark"><span class="fa fa-keyboard-o"></span>&emsp;Get Started</button>&emsp;
			<a href="sign-in.jsp" class="btn btn-outline-dark"><span class="fa fa-lock fa-spin"></span>&emsp;Login</a>
			</div>
			</div>	
	
							<!-- cards -->
							
		<div class="container">
			<div class="row mb-2">
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div><div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div>
				
			
			</div>
			<br>
		<div class="row">
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div><div class="col-md-4">
					<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">Java Programming Language </h5>
							    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							    <a href="#" class="btn btn-primary"style="background-color: #004d40;">Explore</a>
							  </div>
							</div>
				
				</div>
				
			
			</div>
			<br>
		</div>					
		
		
		
		
		
		<hr class="text-100 mb-0">
		<div class="row justify-content-md-between justify-content-evenly py-3">
            <div class="col-12 col-sm-8 col-md-6 col-lg-auto text-center text-md-start">
              <p class="fs--1 my-2 fw-bold text-white"style="margin-left: 10px;">CodeGeek © By Adnan Ghori, 2021</p>
            </div>
            <div class="col-12 col-sm-8 col-md-6"style="margin-right: 10px;">
              <p class="fs--1 my-2 text-center text-md-end text-white" > Made with&nbsp;
                <svg class="bi bi-suit-heart-fill" xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#EB6453" viewBox="0 0 16 16">
                  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
                </svg>&nbsp;by&nbsp;<a class="fw-bold text-500" href="https://www.facebook.com/dustin2050" target="_blank">Adnan Ghori </a>
              </p>
            </div>
          </div>
		
		
		
		
		
		
		
		
		
		
		
						
	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/javascript.js"type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
	
	<script>
	
	</script>
</body>
</html>