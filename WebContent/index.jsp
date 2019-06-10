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
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Included header section -->
	<jsp:include page="header.jsp" />

	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/bg.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>the future of HISTORY</h2>
							<p>Fujifilm is one of the best regarded camera brands
								worldwide. With our award-winning range of cameras suited to
								Pros and enthusiasts alike, we're sure there's a camera in our
								range that will interest you.</p>
							<a href="login.jsp" class="site-btn sb-line">SIGN IN</a> <a
								href="register.jsp" class="site-btn sb-white">REGISTER</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>from</span>
						<h2>$999</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="img/bg-2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>the future of HISTORY</h2>
							<p>Fujifilm is one of the best regarded camera brands
								worldwide. With our award-winning range of cameras suited to
								Pros and enthusiasts alike, we're sure there's a camera in our
								range that will interest you.</p>
							<a href="login.jsp" class="site-btn sb-line">SIGN IN</a> <a
								href="register.jsp" class="site-btn sb-white">REGISTER</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>from</span>
						<h2>$859</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="slide-num-holder" id="snh-1"></div>
		</div>
	</section>
	<!-- Hero section end -->



	<!-- Features section -->
	<section class="features-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/1.png" alt="#">
						</div>
						<h2>Fast Secure Payments</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/2.png" alt="#">
						</div>
						<h2>Premium Products</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/3.png" alt="#">
						</div>
						<h2>Free & fast Delivery</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Features section end -->


	<!-- latest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>LATEST PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
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
				<div class="product-item">
					<div class="pi-pic">
						<div class="tag-new">New</div>
						<img src="./img/product/5.jpg" alt="">
						<div class="pi-links">
							<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
									TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
								class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$859.00</h6>
						<p>FUJIFILM X-PRO2</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- latest product section end -->



	<!-- Product filter section -->
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>BROWSE TOP SELLING PRODUCTS</h2>
			</div>
			<ul class="product-filter-menu">
				<li><a href="#">CAMERAS</a></li>
				<li><a href="#">STORAGE</a></li>
				<li><a href="#">X-RAY</a></li>
				<li><a href="#">FLATBED</a></li>
			</ul>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/6.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$145,000</h6>
							<p>FUJIFILM FDR GO PLUS 500</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/13.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$215,000</h6>
							<p>FUJIFILM FDR SMART-X</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/7.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$6.99</h6>
							<p>FUJIFILM SDHC 8GB</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/9.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$29.00</h6>
							<p>FUJIFILM SDHC 64GB</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<div class="tag-sale">ON SALE</div>
							<img src="./img/product/8.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$67.00</h6>
							<p>FUJIFILM LTO ULTRIUM 7</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/10.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$5,500.00</h6>
							<p>FUJIFILM PRIMA T2</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/11.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$699.00</h6>
							<p>Fujifilm XF 18-135mm f/3.5-5.6 R LM OIS WR Lens</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/12.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$3,999.00</h6>
							<p>FUJIFILM X-T1</p>
						</div>
					</div>
				</div>
			</div>
			<div class="text-center pt-5">
				<button class="site-btn sb-line sb-dark">LOAD MORE</button>
			</div>
		</div>
	</section>
	<!-- Product filter section end -->


	<!-- Banner section -->
	<section class="banner-section">
		<div class="container">
			<div class="banner set-bg" data-setbg="img/banner-bg.jpg">
				<div class="tag-new">NEW</div>
				<span>New Arrivals</span>
				<h2>GFX 100 | XCINEMA</h2>
				<a href="login.jsp" class="site-btn">SHOP NOW</a>
			</div>
		</div>
	</section>
	<!-- Banner section end  -->

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
