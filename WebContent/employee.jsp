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
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0"> 

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

 <script>
	window.onpageshow = function(event) {
	    if (event.persisted) {
	        window.location.reload() 
	    }
	};
	</script>
	
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); %>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
    <jsp:include page="EmployeeView.jsp" />

	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>Employee</h4>
			<div class="site-pagination">
				<a href="index.jsp">Home</a> / <a href="employee.jsp">Employee</a>
			</div>
		</div>
	</div>
	<!-- Page info end -->


	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			
			
			
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
