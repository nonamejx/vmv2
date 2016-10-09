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
		<div class="head-info">
			<h1>Trung Tâm Y tế dự phòng <b>ABC</b></h1>
			<p>Địa chỉ: 54 Nguyễn Lương Bằng, Liên Chiểu, tp Đà Nẵng</p>
			<p>Điện thoại: 0511 222 333</p>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="content-page">
					<h4><i class="fa fa-eraser"></i> Vắc xin</h4>
					<br>
					<form id="search-vaccine" action="">
						<input class="form-control" placeholder="Nhập tên vắc xin .." style="width: 200px; display: inline-block;">
						<button type="submit" class="btn btn-success">Tiềm kiếm</button>
					</form><br>
					<div class="row list-vaccines">
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p style="font-size: 16px"><b>Axit clohydric</b></p>
									<p>Phòng bệnh ung thư da, Phòng bệnh ung thư da, Phòng bệnh ung thư da</p>
									<a><i>Chi tiết >></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p style="font-size: 16px"><b>Axit clohydric</b></p>
									<p>Phòng bệnh ung thư da, Phòng bệnh ung thư da, Phòng bệnh ung thư da</p>
									<a><i>Chi tiết >></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p style="font-size: 16px"><b>Axit clohydric</b></p>
									<p>Phòng bệnh ung thư da, Phòng bệnh ung thư da, Phòng bệnh ung thư da</p>
									<a><i>Chi tiết >></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p style="font-size: 16px"><b>Axit clohydric</b></p>
									<p>Phòng bệnh ung thư da, Phòng bệnh ung thư da, Phòng bệnh ung thư da</p>
									<a><i>Chi tiết >></i></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="part">
								<div class="part-image "></div>
								<div class="part-detail">
									<p style="font-size: 16px"><b>Axit clohydric</b></p>
									<p>Phòng bệnh ung thư da, Phòng bệnh ung thư da, Phòng bệnh ung thư da</p>
									<a><i>Chi tiết >></i></a>
								</div>
							</div>
						</div> 
					</div>
					<br>
					<div class="pagging">
						<ul class="pagination">
							<li><a class="not-active">Trước</a></li>
							<li><a class="active">1</a></li>
							<li><a>2</a></li>
							<li><a>Tiếp</a></li>
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
        	$(".vaccine-item").addClass("current-page");
        </script>
        
        <script src="<%=request.getContextPath() %>/user/js/vaccine.js"></script>
	  	
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