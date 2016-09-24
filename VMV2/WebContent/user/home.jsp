<%@page import="utils.StringUtils"%>
<%@page import="model.bean.News"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="../templates/guest-template.jsp" >

	<tiles:putAttribute name="content">
		<!-- Custom styling plus plugins -->
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/css/datepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
		<!-- /Custom styling plus plugins -->
		
		
		<%
		ArrayList<News> newsList = (ArrayList<News>) request.getAttribute("newsList");
		%>
		
		<div class="head-info">
			<h1>Trung Tâm Y tế dự phòng <b>ABC</b></h1>
			<p>Địa chỉ: 54 Nguyễn Lương Bằng, Liên Chiểu, tp Đà Nẵng</p>
			<p>Điện thoại: 0511 222 333</p>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="content-page">
					<h4><i class="fa fa-newspaper-o"></i> Tin mới</h4>
					<p><i>Thứ 3, ngày 21/9/2016</i></p>
					<br>
					<div class="row list-news">
					<%
						if (newsList != null)
							for (News news: newsList) {
					%>
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p><b><%=news.getTitle() %></b></p>
									<p><%=StringUtils.shorten(news.getContent(), 200) + " ..." %></p>
									<a href="<%=request.getContextPath()%>/NewsDetailServlet?id=<%=news.getNewsId()%>"><i>Đọc thêm >></i></a>
								</div>
							</div>
						</div>
					<%} %>
						
					</div>
					<hr>
					<div class="pagging">
						<ul>
							<c:choose>
								<c:when test="${currentPage == 1}">
									<li><a class="not-active">Trước</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="<%=request.getContextPath()%>/HomeServlet?page=${currentPage - 1 }">
									Trước</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="1" end="${noOfPages}" var="i">
								<c:choose>
									<c:when test="${currentPage eq i}">
										<li><a class="active">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="<%=request.getContextPath()%>/HomeServlet?page=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${currentPage lt noOfPages}">
									<li><a href="<%=request.getContextPath()%>/HomeServlet?page=${currentPage + 1 }">Tiếp</a></li>
								</c:when>
								<c:otherwise>
									<li><a class="not-active">Tiếp</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript-source">
		
        <!-- datepicker -->
		<script src="<%=request.getContextPath() %>/resources/production/js/datepicker/moment.min.js"></script>
       <script src="<%=request.getContextPath() %>/resources/production/js/datepicker/daterangepicker.js"></script>
             
        <!-- variable -->
        <script>
        	var contextPath = "<%=request.getContextPath() %>";
        	$(".home-item").addClass("current-page");
        </script>
        
        <script src="<%=request.getContextPath() %>/user/js/home.js"></script>
	  	
		<!-- prepare form validation -->
		<script src="<%=request.getContextPath()%>/resources/production/js/validate/jquery.validate.js"></script>
		<script>
		jQuery.extend(jQuery.validator.messages, {
		    required: "Không được bỏ trống trường này.",
		    email: "Email không hợp lệ.",
		    date: "Định dạng ngày không hợp lệ.",
		    number: "Vui lòng nhập vào ký tự số.",
		    creditcard: "Please enter a valid credit card number.",
		    equalTo: "Please enter the same value again.",
		    accept: "Please enter a value with a valid extension.",
		    maxlength: jQuery.validator.format("Vui lòng nhập ít hơn {0} ký tự."),
		    minlength: jQuery.validator.format("Vui lòng nhập nhiều hơn {0} ký tự."),
		    rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
		    range: jQuery.validator.format("Please enter a value between {0} and {1}."),
		});
		$.validator.addMethod("notSpecialRegex", function(value, element) {
	        return this.optional(element) || /^[a-z0-9\-]+$/i.test(value);
	    }, "Vui lòng không nhập ký tự đặc biệt.");
		</script>
		<!-- /form validation -->	
	</tiles:putAttribute>

</tiles:insertTemplate>