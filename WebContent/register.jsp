<%
HttpServletResponse httpResponse = (HttpServletResponse) response;
httpResponse.setHeader("Cache-Control", "max-age=0, no-cache, no-store, must-revalidate"); // HTTP 1.1
httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
httpResponse.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Fuji Film</title>
<meta charset="UTF-8">
<meta name="description" content=" Fuji Film">
<meta name="keywords" content="fujifilm, eCommerce, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>

   window.onpageshow = function(event) {
        if (event.persisted) {
           window.location.reload() 
        }
    };


   function comparePasswords() {
		if ($('#password').val() == $('#confirm_password').val()) {
			$('#message').html('').css('color', 'green');
		} else {
			$('#message').html('Passwords are not matching').css('color', 'red');
		}
	}
</script>

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
    <jsp:include page="header.jsp" />

	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>Register</h4>
			<div class="site-pagination">
				<a href="index.jsp">Home</a> / <a href="register.jsp">Register</a>
			</div>
		</div>
	</div>
	<!-- Page info end -->


	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%" align="center">
			<h4>Please use this form to register yourself. If you're
				registering as an employee then please provide your employee id.</h4>
			<br />
			<form action="handleregister" method="post">
				<table style="margin: 0; background:#ADD8E6 !important; border-collapse: separate; border-spacing: 10px; border-radius: 10px !important;">
					<tr>
						<td>First Name*</td>
						<td><input type="text" name="first_name" id="first_name"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Last Name*</td>
						<td><input type="text" name="last_name" id="last_name"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Email*</td>
						<td><input type="text" name="emailid" id="emailid"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Address*</td>
						<td><input type="text" name="address" id="address"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Phone*</td>
						<td><input type="text" name="contact" id="contact"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Employee ID</td>
						<td><input type="text" name="employee_id" id="employee_id"
							style="width: 200px !important; border-radius:10px;" placeholder="If applicable" /></td>
					</tr>
					<tr>
						<td>UserName*</td>
						<td><input type="text" name="username" id="username"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Password*</td>
						<td><input type="password" name="password" id="password"
							style="width: 200px !important; border-radius:10px;" required onkeyup="comparePasswords()"/></td>
					</tr>
					<tr>
						<td>Confirm Password*</td>
						<td><input type="password" name="confirm_password"
							id="confirm_password" style="width: 200px !important; border-radius:10px;" required  onkeyup="comparePasswords()"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td id="message"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit"
							style="width: 200px !important;" class="site-btn sb-white"/></td>
						<td></td>
					</tr>
				</table>
				<br />
			</form>
		</div>
	</section>
	<!-- Register section end -->


	<!-- Related product section -->
	<section class="related-product-section spad">
		<div class="container">
			<div class="section-title">
				<h2>Your Favorites</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<div class="tag-new">New</div>
							<img src="./img/product/4.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$999.00</h6>
							<p>FUJIFILM X-T30</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/2.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$4,499.00</h6>
							<p>FUJIFILM GFX 50S</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/3.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$3,999.00</h6>
							<p>FUJIFILM GFX 50R</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/1.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$9,999.95</h6>
							<p>Fujifilm GFX 100</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related product section end -->

    <!-- Included footer section -->
	<jsp:include page="footer.jsp" />

	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
