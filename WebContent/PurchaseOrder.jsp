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
	function valueChange() {
		var p = document.getElementById("price").value;
		var q = document.getElementById("qty").value;
		document.getElementById("tprice").value = p * q;
	}

	function Remove(img) {
		//Determine the reference of the Row using the Button.
		var row = img.parentNode.parentNode;
		var name = row.getElementsByTagName("TD")[0].innerHTML;
		if (confirm("Do you want to delete this row? ")) {

			//Get the reference of the Table.
			var table = document.getElementById("dataTable");

			//Delete the Table row using it's Index.
			table.deleteRow(row.rowIndex);
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
		int clicks;
		Random rand = new Random();
		clicks = rand.nextInt(90000) + 10000;
		session.getAttribute("cId");
		session.setAttribute("clicks", clicks);
		session.setAttribute("date", new java.util.Date().toLocaleString());
	%>
	<%
		Connection conn = ConnectionManager.getCustConnection();
		//for inquiry product
		ResultSet resultset;
		PreparedStatement pstmt = null;
		String Query = "SELECT * FROM inquiry_data WHERE Inquiry_Id IN (SELECT Inquiry_Id FROM inquiry_data WHERE  id=? and Status='confirmed') ORDER BY date";
		pstmt = conn.prepareStatement(Query);
		int id = (Integer) session.getAttribute("cId");
		pstmt.setInt(1, id);
		resultset = pstmt.executeQuery();

		//for inquiry id
		ResultSet rs;
		PreparedStatement p = null;
		String q = "SELECT * FROM inquiry_data WHERE Inquiry_Id IN (SELECT Inquiry_Id FROM inquiry_data where id=? and Status='confirmed' ORDER BY date ) LIMIT 1";
		p = conn.prepareStatement(q);
		p.setInt(1, id);
		rs = p.executeQuery();

		while (rs.next()) {
			rs.getInt("Inquiry_Id");

			int ID = rs.getInt("Inquiry_Id");
			session.setAttribute("No", ID);
		}

		//for customer info

		ResultSet c;
		PreparedStatement cust;
		String info = "select * from customer where id=?";
		cust = conn.prepareStatement(info);
		cust.setInt(1, id);
		c = cust.executeQuery();

		//product info

		ResultSet r;
		PreparedStatement pr;
		int I = (Integer) session.getAttribute("No");

		String Q = "SELECT * FROM product_master where product_id IN(SELECT product_id FROM inquiry_data WHERE Inquiry_Id in(select Inquiry_Id from inquiry_data where id=? and Status='confirmed' and Inquiry_Id=?)) ";

		pr = conn.prepareStatement(Q);
		pr.setInt(1, id);

		pr.setInt(2, I);
		r = pr.executeQuery();
	%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
	<jsp:include page="CustomerView.jsp" />

	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>
				Customer(<%=session.getAttribute("who")%>)<br />

			</h4>
			<div class="site-pagination">
				<a href="CustomerView.jsp">Customer</a> / <a
					href="PurchaseOrder.jsp">Purchase Order</a><br />

			</div>

		</div>
	</div>
	<!-- Page info end -->


	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			<form action="HandleOrder" method="post"
				style="border: 2px solid red" id="f" name="f">

				<table class="table" id="dataTable" onload="getValue('dataTable')">

					<tr align="center" bgcolor="Black">
						<td colspan="7"><h3>
								<font color="white">Purchase Order Form</font>
							</h3></td>
					</tr>
					<%
						while (c.next()) {
					%>
					<tr>

						<td><b>First name :</b></td>
						<td><input type="text" name="Username" required="required"
							value="<%=c.getString("first_name")%>" /></td>

						<td colspan="2"><b style="color: #CD5C5C">Date:</b> <b><%=(new java.util.Date()).toLocaleString()%>
						</b></td>
					</tr>

					<tr>

						<td><b>Last Name :</b></td>
						<td><input type="text" name="lastName" required="required"
							value="<%=c.getString("last_name")%>" /></td>
						<td><b style="color: #CD5C5C"> Order No:</b> <b>#PON<%=session.getAttribute("No")%></b>

						</td>

					</tr>
					<tr>
						<td><b>Address :</b></td>
						<td><input type="text" name="address" required="required"
							value="<%=c.getString("address")%>" /></td>
					</tr>
					<tr>
						<td><b>Mobile No :</b></td>
						<td><input type="text" name="mobile" required="required"
							value="<%=c.getString("contact")%>" /></td>
					</tr>
					<tr>
						<td><b>Email id :</b></td>
						<td><input type="email" name="email" required="required"
							value="<%=c.getString("emailid")%>" /></td>
					</tr>
					<%
						}
					%>

					<tr>
						<td><b style="color: #CD5C5C">S.No:</b></td>
						<td><b style="color: #CD5C5C">product Name:</b></td>
						<td><b style="color: #CD5C5C">Product No:</b></td>
						<td><b style="color: #CD5C5C">Quantity:</b></td>
						<td><b style="color: #CD5C5C"> Unit Price :</b></td>
						<td><b style="color: #CD5C5C"> Total Price:</b></td>

					</tr>

					<%
						while (resultset.next() && r.next()) {
					%>
					<tr>
						<td><input type="number" name="sno[0]" id="sno[0]"
							value="<%=r.getRow()%>" readonly="readonly" required="required"
							size="5"> <%
 	int row = r.getRow();
 		session.setAttribute("rows", row);
 %></td>
						<td><input type="text" name="pname[0]"
							value="<%=r.getString("product_name")%>" readonly="readonly" ></td>

						<td><input type="number" required="required" name="pno[0]"
							id="pno" value="<%=r.getInt("product_id")%>" readonly="readonly" ></td>

						<td><input type="number" name="qty[0]" id="qty"
							value="<%=resultset.getInt("Qty")%>" onchange="valueChange();"
							size="8"></td>

						<td><input type=number name="price[0]" id="price"
							value="<%=r.getInt("price")%>" size="8" readonly="readonly" ></td>

						<td><input type=text name="Tprice[0]" id="tprice"
							value="<%=(r.getInt("price")) * (resultset.getInt("Qty"))%>"
							size="8" readonly="readonly" ></td>

						<td><img alt="" src="img/small-delete-md.png"
							onclick="Remove(this);" height="25" width="25"></td>
						<%
							}
						%>
					</tr>

				</table>

				<div align="center">
					<button class="site-btn"
						onclick="alert('You have Placed Your Order..');">
						<b> Place Order </b>

					</button>
				</div>
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
