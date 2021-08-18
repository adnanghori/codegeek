<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.codegeek.entities.*" %>
    <%@ page import = "com.codegeek.dao.*" %>
    <%@ page import = "com.codegeek.helper.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page  errorPage = "error.jsp" %>
    <%
    	User user= (User)session.getAttribute("current");
    	if(user==null){
    		response.sendRedirect("sign-in.jsp");
    	}
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CodeGeek's User Profile</title>
	<!-- css -->	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="css/modal.css">

	<style type="text/css">
	body{
	background-color: #F5FFFA;
	background-image: url("image/dust.jpg");
	}

	</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFF5EE	;">	<!--  -->
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><img src="image/icon.png" alt="" width="95" height="55" class="d-inline-block align-text-top">
      </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><span class="fa fa-codepen"></span>   CodeGeek</a>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="fa fa-cubes"></span>
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#"><span class="fa fa-code-fork"></span>  Programming Language</a></li>
            <li><a class="dropdown-item" href="#"><span class="fa fa-cogs"></span>  Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><span class="fa fa-database"></span>	Data Structure</a></li>
          </ul>
        </li>
        </li>
   			<li class="nav-item">
          <a class="nav-link" href="" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-cloud-upload"></span> CodeGeekPost</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp"><span class="fa fa-vcard"></span> Contact</a>
        </li>
       
      </ul>
       
        <form class="d-flex"style="margin-right: 40px;height: 40px;">
        <input class="form-control me-2 " type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" style="margin-left:0px"type="submit">Search</button>
      </form>
     
     <ul class="navbar-nav me-right mb-2 mb-lg-0">
     	<%-- <li class="nav-item">
          <a class="nav-link" href=""><span class="	fa fa-user"></span> <%= user.getUsername() %></a>
        </li> --%>
        <li>
        <!-- Profile Modal -->
        	<div class="container">
    <div class="email" onclick="this.classList.add('expand')">
      <div class="from">
      		
        <div class="from-contents">
          <div class="avatar me" style="background-image: url(image/user.png); background-size: cover;"></div>
          <div class="name" style="font-family:Monaco;font-weight:bold;" ><%= user.getUsername() %></div>
        </div>
      </div>
      <div class="to">
        <div class="to-contents">
          <div class="top">
            <div class="avatar-large me"style="background-image: url(image/user.png); background-size: cover;"></div>
            <div class="name-large"style="font-family:Monaco;font-weight:bold;"><%= user.getUsername() %></div>
            <div class="x-touch" onclick="document.querySelector('.email').classList.remove('expand');event.stopPropagation();">
              <div class="x">
                <div class="line1"></div>
                <div class="line2"></div>
              </div>
            </div>
          </div>
          <div class="bottom">
            <div class="row">
              
              <div class="link"style="font-family:Monaco;font-weight:bold;">ID:&emsp; <%= user.getId() %></div>
              
            </div> 
            
            <div class="row">
             
            <div class="row">
             
              <div class="link"style="font-family:Monaco;font-weight:bold;">Email:&emsp; <%= user.getEmail()%></div>
              
            </div>
            <div class="row">
             
              <div class="link"style="font-family:Monaco;font-weight:bold;">Registered On:&emsp; <%= user.getDateTime() %></div>
              
          </div>    
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  	<!-- End Of Profile Modal -->
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link"style="margin-top: 18px;" href="LogoutServlet"><span class="fa fa-sign-out"></span> Log Out</a>
        </li>
     </ul>
    </div>
  </div>
</nav>
	<!-- End Of NavBar -->
	
	 <!-- Post Modal -->
	 

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post@CodeGeek</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="AddPostServlet" method="post"id="add-post-form">
       	<div class="form-group">
       	<select class="form-control" name="catid">
       		<option selected disabled>--Select Category--</option>
       		<% 
       			PostDao postdao = new PostDao(ConnectionProvider.getConnection());
       			ArrayList<Category> list = postdao.getAllCategories();
       			for(Category c:list)
       			{
       		%>
       		
       		<option value=<%= c.getCategory_id() %>><%=c.getName() %></option>
       		
       		<%
       			}
       		%>
       	</select>
       	</div>
       	<div class="form-group">
       		<input name ="pTitle"type="text" placeholder="What's In Your Mind" class="form-control"/> 
       		
       	</div>
       	<div class="form-group">
       		<textarea class="form-control" name="pContent" placeholder="Post Your Ideas"></textarea>
		</div>
		<div class="form-group">
       		<textarea class="form-control" name="pCode" placeholder="Go CodeGeek"></textarea>
		</div>
		<div class="form-group" >
			<label>Upload Image At CodeGeek</label>
	
			<br>
       		<input type = "file" name="pPic"/>
       		
		</div>
       	<div class="modal-footer">
        <button type="button" class="btn btn-outline-dark" data-dismiss="modal" >Close</button>
        <button type="submit" class="btn btn-outline-dark">Post@CodeGeek</button>
      </div> 
       </form>
       
        </div>
      
    </div>
  </div>
</div>
	 
	 <!-- End Post Modal -->
	 
	 <!-- Main Body -->
	 	
	 	<main>
	 		<div class= "container">
	 			<div class="row">
	 			<!-- first Coloumn -->
	 			<div class="col-md-4">
	 				<!-- Categories -->
	 				<div class="list-group">
  <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">All Posts At CodeGeek</h5>
      <small>3 days ago</small>
    </div>
    <p class="mb-1">Some placeholder content in a paragraph.</p>
    <small>And some small print.</small>
  </a>
  <!-- Categories -->
  <%
  	//PostDao postDao = new PostDao(ConnectionProvider.getConnection());
  	postdao.getAllCategories();
  	list = postdao.getAllCategories();
  	for(Category c:list ){
  		%>
  		<a href="#" onclick="getPosts(<%= c.getCategory_id()%>,this)" class="c-link list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1"><%= c.getName() %></h5>
      <small class="text-muted">3 days ago</small>
    </div>
    <p class="mb-1">Some placeholder content in a paragraph.</p>
    <small class="text-muted">And some muted small print.</small>
  </a>
  		<%
  		
  	}
  %>
</div>
	 				
	 				</div>
	 			<!-- Second Column -->
	 			<div class="col-md-8">
	 			<!-- Post -->
	 			<div class="container"id="loader">
	 			<i class = "fa fa-circle-o-notch fa-spin fa-3x"></i>
	 			<h4 class="mt-2">Loading</h4>
	 			</div>
	 			<div class="container-fluid" id="post-container">
	 				
	 			</div>
	 				</div>
	 			</div>
	 		
	 		</div>
	 	</main> 
	 
	 <!-- End Main Body -->
	
	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/javascript.js"type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
	$(document).ready(function(){
		$('#edit-profile-button').click(function(){
			//alert("Button Clicked")
			$("#profile-details").hide()
			
		})
	});
		
	
	</script>
	
	<!-- Add Post JS -->
	<script>
		$(document).ready(function(e){
			//alert("loaded")
			$("#add-post-form").on("submit",function(event){
				/* This Code Gets Called When Form Is Submitted..! */
				event.preventDefault();
				console.log("Submitted")
				let form=new FormData(this);
				
				// Now Requesting To Server
				
				$.ajax({
					url:"AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data,textStatus,jqXHR){
						//	Success
					console.log(data);  
						if(data.trim()=='Done'){
							swal("Good job!", "You clicked the button!", "success");
						}
						else{
							swal("Error!", "Something Went Wrong!", "error");
						}
					},
					error:function(jqXHR,textStatus,errorThrown){
						// ERROR
						swal({
							  title: "Error Encountered!",
							  text: "Please Check Entries!",
							  icon: "warning",
							  button: "I'll Check!",
							});
					},
					processData:false,
					contentType: false
				})
			})
		})
	</script>
	<!-- Loading Post Using AJAX -->
	<script type="text/javascript">
	
			function getPosts(catId,temporary){
				$("#loader").show();
				$("#post-container").hide()
				$(".c-link").removeClass('active')
				
				$.ajax({
					url:"loadpost.jsp",
					data:{category_id:catId},
					success:function (data,textStatus,jqXHR){
						console.log(data);
						$("#loader").hide();
						$("#post-container").show();
						$('#post-container').html(data)
						$(temporary).addClass('active')
					}
				})
			}
	
		$(document).ready(function(e){
			let allPostReference=$('.c-link')[0]
			getPosts(0,allPostReference)
			
		})
	</script>
</body>
</html>