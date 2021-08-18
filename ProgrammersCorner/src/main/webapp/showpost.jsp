<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp"%>
 <%@page import="com.codegeek.dao.LikeDao" %>
<%@page import="java.text.DateFormat"%>
<%@page import="com.codegeek.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.codegeek.entities.Category"%>
<%@page import="com.codegeek.entities.Category"%>
<%@page import="com.codegeek.helper.ConnectionProvider"%>
<%@page import="com.codegeek.dao.PostDao"%>
<%@page import="com.codegeek.entities.Post"%>
<%@page import="com.codegeek.entities.User"%>
<%

    User user = (User) session.getAttribute("current");
    if (user == null) {
        response.sendRedirect("sign-in.jsp");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao postdao = new PostDao(ConnectionProvider.getConnection());
	Post post = new Post();
     post = postdao.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= post.getpTitle()%> || CodeGeek By Adnan Ghori</title>
	<!-- css -->	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="css/modal.css">

	<style type="text/css">
	body{
	background-color: #F5FFFA;
	background-image: url("image/dusty.jpg");
	}
	.card{
    margin-left: 40px;
    margin-top: 20px;
    width: 45%;
   height: 400%;
}
.btn{
	width: 40%;
	height: 38px;
	margin-left: 20px;
	margin-bottom: 10px;
	
}
.card-title{
	font-weight: 100;
	font-size: 30px;
}
.card-content{
	font-weight: 100;
	font-size: 25px;
}
.card-date{
	font-style: italic;
	font-weight: bold;
}
.card-user-info{
	font-size: 20px;
	font-weight: 200;
}

	</style>
	<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v10.0&appId=104222489717590&autoLogAppEvents=1" nonce="I2u35WJH"></script>

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
          <a class="nav-link" href="#"data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-cloud-upload"></span> CodeGeekPost</a>
        </li>
   			<li class="nav-item">
          <a class="nav-link" href="profile.jsp" ><span class="	fa fa-user"></span> Profile</a>
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
       			 PostDao postDao = new PostDao(ConnectionProvider.getConnection());
       			ArrayList<Category> list = postDao.getAllCategories();
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
	
	<div class="container">
	<center>
	<div class="card" style="width: 25rem;">
  
  <div class="card-body">
    <h5 class="card-title"><%= post.getpTitle() %></h5>
    <img src="postimages/<%= post.getpPic() %>" class="card-img-top my-2" alt="Card image cap">
    
    <div class="row my-3">
    	<div class="col-md-8">
    	<%
    		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
    		
    		
    	%>
    	<p class="card-user-info"><a href="#"><%= userdao.getUserByUserId(post.getUserId()) %></a> Has Posted </p>	    	
    	</div>
    	<div class="col-md-4">
    	<p class="card-date"> <%= post.getpDate() %>
    	</div>
    </div>
    <p class="card-content"><%= post.getpContent() %></p>
    <br>
    <br>
    <div class="card-code">
    <pre><%= post.getpCode()%></pre>	
   </div>
  </div>
   <div class="class-footer text-center">
   
   <% LikeDao likedao  = new LikeDao(ConnectionProvider.getConnection()); %>
	<a href="#" onclick="doLike(<%= post.getPid() %>,<%= user.getId() %>)"class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= likedao.countLikeOnPost(post.getPid()) %></span></i></a>
  	<a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
	</div>
	<div class="card-footer">
	<div class="fb-comments" data-href="http://localhost:8080/ProgrammersCorner/showpost.jsp?post_id=<%= post.getPid() %>" data-width="" data-numposts="5"></div>	
	</div>
</div>
	
</center>
	</div>
	
	
	
	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/javascript.js"type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="js/myjs.js"type="text/javascript"></script>
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
</body>
</html>