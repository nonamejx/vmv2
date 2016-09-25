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
					<div class="x_content">
						<form id="form-register" class="form-horizontal form-label-left" method="post" style="">
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Tên <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="name" placeholder="Tên đầy đủ, ví dụ: Nguyễn Nam"
										 type="text">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="birthday"> Ngày sinh<span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="dateOfBirth" type="text" class="form-control col-md-7 col-xs-12" 
									value="10/10/2000" readonly="readonly">
								</div>
							</div>
							<div class="item form-group">
		                      	<label class="control-label col-md-3 col-sm-3 col-xs-12">Giới tính</label>
		                      	<div class="col-md-6 col-sm-6 col-xs-12">
		                        	<select class="form-control" name="gender">
		                          		<option value="1">Nam</option>
		                          		<option value="2">Nữ</option>
				                        <option value="3">Khác</option>
		                        	</select>
		                      	</div>
	                      	</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="number">Số điện thoại <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="number" name="phoneNumber"
										class="form-control col-md-7 col-xs-12">
								</div>
							</div>
							<div class="item form-group">
		                      	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Địa chỉ <span class="required">*</span></label>
		                      	<div class="col-md-6 col-sm-6 col-xs-12"	>
		                        	<textarea name="address" class="form-control col-md-7 col-xs-12"></textarea>
		                      	</div>
	                    	</div>
	                    	<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Tên đăng nhập <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="username" type="text">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Mật khẩu <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="password" class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="password" type="password">
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Xác nhận mật khẩu <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="passwordf" type="password">
								</div>
							</div>
							<div class="item form-group">
		                      	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Hình ảnh </label>
		                      	<div class="col-md-6 col-sm-6 col-xs-12"	>
		                        	<input id="ten" class="form-control col-md-7 col-xs-12"
										data-validate-length-range="6"
										name="image" type="file">
		                      	</div>
	                    	</div>
	                    	<div class="form-group">
								<div class="col-md-6 col-md-offset-3">
									<button type="submit" class="btn btn-success">Đăng ký</button>
								</div>
							</div>
						</form>
					</div>
					<div class="clearfix"></div>
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
        	$(document).ready(function() {
        		$(".register-item").addClass("current-page");
        		$('input[name="dateOfBirth"]').daterangepicker({
        	    	singleDatePicker: true,
        	        showDropdowns: true,
        	        format: 'DD/MM/YYYY'
        	    });
        		 $("#form-register").validate({
        				rules: {
        						name: {
        							required: true,
        						},
        						dateOfBirth: {
        							required: true
        						},
        						phoneNumber: {
        							required: true,
        							number: true
        						},
        						address: {
        							required: true
        						},
        						username: {
        							required: true,
        							maxlength: 50,
        							minlength: 6,
        							notSpecialRegex: true
        						},
        						password: {
        							required: true,
        							maxlength: 50,
        							minlength: 6
        						},
        						passwordf: {
        							required: true,
        							maxlength: 50,
        							minlength: 6,
        							equalTo: "#password"
        						}
        					},
        					messages: {
        						
        					},
        					submitHandler: function(form) {
        						form.submit();
        		        	}		
        			});
        	});
        </script>
	  	
		<!-- prepare form validation -->
		<script src="<%=request.getContextPath()%>/resources/production/js/validate/jquery.validate.js"></script>
		<script>
		jQuery.extend(jQuery.validator.messages, {
		    required: "Không được bỏ trống trường này.",
		    email: "Email không hợp lệ.",
		    date: "Định dạng ngày không hợp lệ.",
		    number: "Vui lòng nhập vào ký tự số.",
		    creditcard: "Please enter a valid credit card number.",
		    equalTo: "Dữ liệu không khớp.",
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