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
						<a href="<%=request.getContextPath() %>/user/home" class="site_title"><i class="fa fa-plus-square"></i>
							<span>ABC</span></a>
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
								User userLogin=MyUtils.getSessionLogin(request);
								if(userLogin!=null){
							%>
								<h2><%=userLogin.getFullName()%></h2>
								<input type="text" hidden="true" name="userId" value="<%=userLogin.getUserId()%>">
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
								<li class="home-item">
									<a href="<%=request.getContextPath() %>/user/home"><i class="fa fa-home"></i> Trang chủ</a>
								</li>
								<li class="vaccine-item">
									<a href="<%=request.getContextPath() %>/user/vaccine"><i class="fa fa-eraser"></i> Vắc xin</a>
								</li>
								<li class="vaccination-history-item">
									<a href="<%=request.getContextPath() %>/user/vaccination-history"><i class="fa fa-list" aria-hidden="true"></i> Lịch sử tiêm chủng</a>
								</li>
								<li class="profile-item">
									<a href="<%=request.getContextPath() %>/user/profile"><i class="fa fa-user" aria-hidden="true"></i> Thông tin cá nhân</a>
								</li>
								<li class="">
									<a href="<%=request.getContextPath()%>/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Đăng xuất</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<%-- <div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Trang chủ">
							<span class="fa fa-home" aria-hidden="true"></span>
						</a>
						<a data-toggle="tooltip" data-placement="top" title="Trang cá nhân"> 
							<span class="fa fa-user	" aria-hidden="true"></span>
						</a>
						<a data-toggle="tooltip" data-placement="top" title="Cài đặt">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> 
						<a href="<%=request.getContextPath()%>/LogoutServlet" data-toggle="tooltip" data-placement="top" title="Đăng xuất">
							<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
						</a>
					</div> --%>
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