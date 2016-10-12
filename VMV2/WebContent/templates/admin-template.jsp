<%@page import="utils.MyUtils"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Quản lý tiêm chủng</title>
	
	<!-- Bootstrap core CSS -->

	<link href="<%=request.getContextPath() %>/resources/production/css/bootstrap.min.css" rel="stylesheet">
	
	<link href="<%=request.getContextPath() %>/resources/production/fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/production/css/animate.min.css" rel="stylesheet">
	
	<!-- Custom styling plus plugins -->
	<link href="<%=request.getContextPath() %>/resources/production/css/custom.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/production/css/icheck/flat/green.css" rel="stylesheet">
	
	<link href="<%=request.getContextPath() %>/resources/css/custom.css" rel="stylesheet">
	
	<script src="<%=request.getContextPath() %>/resources/production/js/jquery.min.js"></script>
	
	
</head>
<body class="nav-md">

	<div class="container body">


		<div class="main_container">

			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-plus-square"></i>
							<span>VacxinTeam</span></a>
					</div>
					<div class="clearfix"></div>

					<!-- menu prile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<img src="<%=request.getContextPath() %>/resources/images/avatar.png" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Chào,</span>
							<% 
							User userLogin=(User)MyUtils.getInstance(request).getSessionLogin();
								if(userLogin!=null){
							%>
								<h2>Admin <%=userLogin.getFullName()%></h2>
								<input type="text" hidden="true" name="userId">
							<%
								}
							%>
							
						</div>
					</div>
					<!-- /menu prile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">

						<div class="menu_section">
							<h3>&nbsp;</h3>
							<ul class="nav side-menu">
								<li class="">
									<a href=""><i class="fa fa-home"></i> Trang chủ</a>
								</li>
								<li class="vaccination-record-management-menu-item">
									<a href="<%=request.getContextPath() %>/admin/vaccination-record-management.jsp"><i class="fa fa-eyedropper"></i> Tiêm phòng</a>
								</li>
								<li class="user-management-menu-item">
									<a href="<%=request.getContextPath() %>/admin/user-management.jsp"><i class="fa fa-male"></i> Khách tiêm</a>
								</li>
								<li class="vaccine-management-menu-item">
									<a href="<%=request.getContextPath() %>/admin/vaccine-management.jsp"><i class="fa fa-eraser"></i> Vắc xin</a>
								</li>
								<li class="disease-management-menu-item">
									<a href="<%=request.getContextPath() %>/admin/disease-management.jsp"><i class="fa fa-heartbeat"></i> Bệnh</a>
								</li>
								<li class="news-management-menu-item">
									<a href="<%=request.getContextPath() %>/admin/news-management.jsp"><i class="fa fa-newspaper-o"></i> Tin tức</a>
								</li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Cài đặt</h3>
							<ul class="nav side-menu">
								<li>
									<a>
										<i class="fa fa-user" aria-hidden="true"></i> Cá nhân 
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="#">Thông tin cá nhân</a></li>
										<li><a href="<%=request.getContextPath()%>/LogoutServlet">Đăng xuất</a></li>
									</ul>
								</li>
							</ul>
						</div>

					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Trang chủ">
							<span class="fa fa-home" aria-hidden="true"></span>
						</a>
						<a data-toggle="tooltip" data-placement="top" title="Trang cá nhân"> 
							<span class="fa fa-user	" aria-hidden="true"></span>
						</a>
						<a data-toggle="tooltip" data-placement="top" title="Cài đặt">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> 
						<a data-toggle="tooltip" data-placement="top" title="Đăng xuất">
							<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">

				<div class="nav_menu">
					<nav class="" role="navigation">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>

					<ul class="nav navbar-nav navbar-right">
						<li class=""><a href="javascript:;"
							class="user-profile dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"> <img src="<%=request.getContextPath() %>/resources/images/avatar.png" alt="">VacxinTeam <span class=" fa fa-angle-down"></span>
						</a>
							<ul
								class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
								<li><a href="javascript:;"><i class="fa fa-user pull-right"></i> Thông tin cá nhân</a></li>
								<li><a href="javascript:;"><i class="fa fa-cog pull-right"></i> <span>Cài đặt</span> </a></li>
								<li><a href="javascript:;"><i class="fa fa-question-circle pull-right"></i>Trợ giúp</a></li>
								<li><a href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a></li>
							</ul></li>


					</ul>
					</nav>
				</div>

			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- main content -->
				<tiles:insertAttribute name="content"></tiles:insertAttribute>

				<!-- footer content -->
				<footer>
					<div class="copyright-info">
						<p class="pull-right">
							VacxinM Template by <a
								href="http://fb.com/me" target="blank">VacxinTeam</a>
						</p>
					</div>
					<div class="clearfix"></div>
					</footer>
				<!-- /footer content -->

			</div>
			<!-- /page content -->
		</div>
		</div>
		
	  <script src="<%=request.getContextPath() %>/resources/production/js/bootstrap.min.js"></script>

	  <!-- bootstrap progress js -->
	  <script src="<%=request.getContextPath() %>/resources/production/js/progressbar/bootstrap-progressbar.min.js"></script>
	  <script src="<%=request.getContextPath() %>/resources/production/js/nicescroll/jquery.nicescroll.min.js"></script>
	  <!-- icheck -->
	  <script src="<%=request.getContextPath() %>/resources/production/js/icheck/icheck.min.js"></script>
	
	  <script src="<%=request.getContextPath() %>/resources/production/js/custom.js"></script>
	
	  <!-- pace -->
	  <script src="<%=request.getContextPath() %>/resources/production/js/pace/pace.min.js"></script>
	  
	  <!-- javascript source -->
	  <tiles:insertAttribute name="javascript-source"></tiles:insertAttribute>
</body>
</html>