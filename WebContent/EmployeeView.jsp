<!-- Header section -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 text-center text-lg-left">
					<!-- logo -->
					<a href="./index.jsp" class="site-logo"> <img
						src="img/logo.png" alt="">
					</a>
				</div>
				<div class="col-xl-6 col-lg-5">
					<form class="header-search-form">
						<input type="text" placeholder="Search on Fujifilm ....">
						<button>
							<i class="flaticon-search"></i>
						</button>
					</form>
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="user-panel">
						<div class="up-item">
							<i class="flaticon-profile"></i>
							<%
								String who = null;
								if (session != null) {
									if (session.getAttribute("who") != null) {
										who = session.getAttribute("who").toString();
									}
								}
								if (who != null && who.length() > 0) {
							%>
							<a href="logout.jsp" style="color: red;">Sign Out, <%=who%></a>
							
							<%
								} else {
							%>
							<a href="login.jsp" style="color: green;">Sign In</a> or <a
								href="register.jsp">Create Account</a>
							<%
								}
							%>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="main-navbar">
		<div class="container" align="center">
			<!-- menu -->
			<ul class="main-menu" >
				<li ><a href="Emp_Inquiry.jsp">Inquiry</a></li>
				<li><a href="SalesOrder.jsp">Sales Order</a></li>
				<li><a href="contact.jsp">Delivery Order</a></li>
				<li><a href="contact.jsp">Goods Issue</a></li>
				<li><a href="Emp_Reports.jsp">Reports</a></li>
			</ul>
		</div>
	</nav>
</header>
<!-- Header section end -->
