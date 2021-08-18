<%@page import="com.codegeek.dao.PostDao"%>
<%@page import="com.codegeek.helper.ConnectionProvider"%>
<%@ page import = "java.util.List" %>
<%@ page import = "com.codegeek.entities.Post" %>
<%@ page import ="com.codegeek.dao.LikeDao" %>
<%@ page import = "com.codegeek.entities.User" %>
<!-- css -->	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">


<style>
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
	margin-bottom: 20px;
}
body{
	background-color: #F5FFFA;
	}
</style>

<div class="container">
<div class="row mb-4">
<%
	//Thread.sleep(1000);
PostDao postdao = new PostDao(ConnectionProvider.getConnection());

int category_id = Integer.parseInt(request.getParameter("category_id"));
List<Post> post =null;
if(category_id==0){
	 post = postdao.getAllPosts();
	 }else{
		 post=postdao.getPostByCatId(category_id);
	 }
	if(post.size()==0){
		out.println("<h3 class='display-3 text-center'>No Post Available</h3>");
		out.newLine();%>
		<br>
		<center>
		<a href="#" class="btn btn-primary"data-toggle="modal"data-target="#add-post-modal"><span class="fa fa-keyboard-o"></span>&emsp;Post Now At CodeGeek</a>
		</center>
		<% 
		return;
	}%>
<% 
	for(Post p:post)
	{	
	%>	
	<div class="card col-md-4 "> <!-- style="width: 15rem;" --> 
  <img src="postimages/<%= p.getpPic() %>" class="card-img-top" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%=p.getpTitle() %></h5>
    <p class="card-text"><%= p.getpContent() %></p>
    <%-- <pre><%= p.getpCode() %></pre> --%>
    <!-- <a href="#" class="btn btn-primary">Explore</a> -->
  </div>
  
  	<div class="class-footer text-center">
  	<a href="showpost.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm"><span class="fa fa-paw"></span>&ensp;Explore</a>
  	<% LikeDao likedao  = new LikeDao(ConnectionProvider.getConnection()); 
  		User user = (User)session.getAttribute("current");
  		Post posts = new Post();
  	%>
	<a href="#" onclick="doLike(<%= posts.getPid() %>,<%= user.getId() %>)"class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= likedao.countLikeOnPost(posts.getPid()) %></span></i></a>
  	<a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>

  	</div>
</div>
	
<% 
	}

	%>
</div>
</div>



<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="js/javascript.js"type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src = js/myjs.js></script>
	
	<script>
	
	</script>


<!-- <div class="container">
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


 -->
		