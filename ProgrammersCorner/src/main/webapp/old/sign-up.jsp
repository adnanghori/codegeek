<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CodeGeek Sign-Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="register-form"action="RegisterServlet">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="user_name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="user_email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="user_password" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="user_repassword" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            
                            <div class="form-group form-button">
                             <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="sign-in.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
<!-- JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script>

	$(document).ready(function(){
		console.log("Loaded..")
		$('#register-form').on('submit',function(event){
			event.preventDefault();
			let form=new FormData(this);
			// Sending It To Register Servlet
			$.ajax({
				url:"RegisterServlet",
				type:'POST',
				data: form,
				success: function (data,textStatus,jqXHR){
					console.log(data)
					
					swal({
				  title: "Geek Registered!",
				  text: "Redirecting You To Sign-In Page!",
				  icon: "success",
				  button: "Aww yiss!",
				}).then((value) =>{
						window.location="sign-in.jsp"
							
				});
					
				},
				error: function(jqXHR, textStatus, errorThrown){
					swal({
						  title: "Error Encountered!",
						  text: "Please Check Entries!",
						  icon: "warning",
						  button: "I'll Check!",
						});
					console.log(jqXHR)
					
				},
				processData: false,
				contentType: false
			});
		});
	});
</script>
</body>
</html>