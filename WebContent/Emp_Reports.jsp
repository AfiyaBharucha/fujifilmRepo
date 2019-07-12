<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="com.mysql.cj.exceptions.RSAException"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Fujifilm.Connection.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

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
		ResultSet resultset;
		Connection conn = ConnectionManager.getCustConnection();
		Statement statement = conn.createStatement();
		resultset = statement.executeQuery("select  * from inquiry_data ");

		ResultSet rs;
		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery("select  * from fujifilm.order where Order_Status='done'");

		ResultSet ret;
		Statement rstmt = conn.createStatement();
		ret = rstmt.executeQuery("select  * from fujifilm.order where Order_Status='return'");

		ResultSet res;
		PreparedStatement pss = null;
		String a = "select fujifilm.order.*,payment.* from fujifilm.order  JOIN payment ON fujifilm.order.Order_No=payment.Order_No where Order_Status='done'";
		pss = conn.prepareStatement(a);
		res = pss.executeQuery();

		ResultSet r;
		PreparedStatement p = null;
		String Q = "select product_master.product_id,product_master.quantity,sum(case when Order_Status='done' then Qty_Sold else 0 end),sum(case when Order_Status='return' then Qty_Sold else 0 end)  from fujifilm.order right join product_master on fujifilm.order.product_id=product_master.product_id group by product_id order by product_id";
		p = conn.prepareStatement(Q);
		r = p.executeQuery();
	%>

	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
	<jsp:include page="EmployeeView.jsp" />

	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">

			<h4>
				Employee(<%=session.getAttribute("who")%>)<br />

			</h4>
			<div class="site-pagination">
				<a href="EmployeeView.jsp">Employee</a> / <a href="Emp_Reports.jsp">Reports</a><br />

			</div>

		</div>
	</div>
	<!-- Page info end -->


	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 75%">
			<form action="" method="post" style="border: 2px solid red" id="f">

				<table class="table" id="dataTable">

					<tr align="center" bgcolor="Black">
						<td align="center" colspan="6"><h3>
								<font color="white">Reports</font>
							</h3></td>

					</tr>

					<tr align="center" bgcolor="pink">
						<td align="center" colspan="6"><h3>Inquiries Of
								Customers:</h3></td>
					</tr>


					<tr>
						<td><b>Inquiry Id</b></td>
						<td><b>Customer Id</b></td>
						<td><b>Product Id</b></td>
						<td><b>Quantity</b></td>
						<td><b>Date</b></td>
					</tr>


					<%
						while (resultset.next()) {
					%>
					<tr>

						<td><%=resultset.getInt("Inquiry_Id")%></td>
						<td><%=resultset.getInt("id")%></td>
						<td><%=resultset.getInt("product_id")%></td>
						<td><%=resultset.getInt("Qty")%></td>
						<td><%=resultset.getString("date")%></td>

					</tr>
					<%
						}
					%>




					<tr align="center" bgcolor="#F8C471">
						<td align="center" colspan="6"><h3>Purchased orders Of
								Customers:</h3></td>
					</tr>
					<tr>
						<td><b>Order No</b></td>
						<td><b>Customer Id</b></td>
						<td><b>Product Id</b></td>
						<td><b>Quantity</b></td>
						<td><b>Date</b></td>
					</tr>
					<%
						while (rs.next()) {
					%>
					<tr>

						<td><%=rs.getInt("Order_No")%></td>
						<td><%=rs.getInt("id")%></td>
						<td><%=rs.getInt("product_id")%></td>
						<td><%=rs.getInt("Qty_Sold")%></td>
						<td><%=rs.getString("Order_Date")%></td>

					</tr>
					<%} %>


					<tr align="center" bgcolor="gray">
						<td align="center" colspan="6"><h3>Returned orders Of
								Customers:</h3></td>
					</tr>
					<tr>
						<td><b>Order No</b></td>
						<td><b>Customer Id</b></td>
						<td><b>Product Id</b></td>
						<td><b>Quantity</b></td>
						<td><b>Date</b></td>
					</tr>
					<%
						while (ret.next()) {
					%>
					<tr>

						<td><%=ret.getInt("Order_No")%></td>
						<td><%=ret.getInt("id")%></td>
						<td><%=ret.getInt("product_id")%></td>
						<td><%=ret.getInt("Qty_Sold")%></td>
						<td><%=ret.getString("Order_Date")%></td>

					</tr>
					<%
						}
					%>

					<tr align="center" bgcolor="sky blue">
						<td align="center" colspan="6"><h3>Stock Status Reports:</h3></td>
					</tr>
					<tr>
						<td><b>Product No</b></td>
						<td><b>Qty In Stock</b></td>
						<td><b>Qty Sold</b></td>
						<td><b>Qty Return</b></td>
					</tr>
					<%
						while (r.next()) {
					%>
					<tr>


						<td><%=r.getInt(1)%></td>
						<td><%=r.getInt(2)%></td>
						<td><%=r.getInt(3)%></td>
						<td><%=r.getInt(4)%></td>




					</tr>
					<%
						}
					%>



				</table>

				<table class="table">


					<tr align="center" bgcolor="yellow">
						<td align="center" colspan="7"><h3>Account Receivable</h3></td>
					</tr>
					<tr>
						<td><h5>
								<b>Order No</b>
							</h5></td>
						<td><h5>
								<b>Customer Id</b>
							</h5></td>
						<td><h5>
								<b>Product Id</b>
							</h5></td>
						<td><h5>
								<b>Quantity</b>
							</h5></td>
						<td><h5>
								<b>Date</b>
							</h5></td>
						<td><h5>
								<b>Amount Due</b>
							</h5></td>
						<td><h5>
								<b>Amount paid</b>
							</h5></td>
					</tr>


					<%
						while (res.next()) {
					%>


					<tr>

						<td><%=res.getInt("Order_No")%></td>
						<td><%=res.getInt("id")%></td>
						<td><%=res.getInt("product_id")%></td>
						<td><%=res.getInt("Qty_Sold")%></td>
						<td><%=res.getString("Order_Date")%></td>
						<td><%=res.getInt("Pay_Due")%></td>
						<td><%=res.getInt("Pay_Received")%></td>

					</tr>
					<%
						}
					%>




				</table>

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
