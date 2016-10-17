<%@page import="model.bean.User"%>
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
					<%
					User userRemember=(User)request.getAttribute("userRemember");
					String msg=request.getParameter("msg");
					if(msg!=null){ 
						if("1".equals(msg)){	
					%>
						<p style="display:inline-block" class="msg msg-fail col-md-12 col-sm-12 col-xs-12 ">Tên đăng nhập hoặc mật khẩu chưa đúng</p>
					<% 	
						}else if("2".equals(msg)){
					%>
						<p style="display:inline-block" class="msg msg-fail col-md-12 col-sm-12 col-xs-12 ">Không thể thực hiện chức năng Remember me</p>
					<% 		
						}
					}
					%>		
					<div class="x_content">
						<form id="form-login" action="<%=request.getContextPath()%>/login" class="form-horizontal form-label-left" method="post" style="padding-top: 70px;padding-bottom: 100px;">
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Tên đăng nhập <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="username" type="text" value=<%if(userRemember!=null){ out.print(userRemember.getUsername()) ;} %>>
								</div>
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Mật khẩu <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
										name="password" type="password" value=<%if(userRemember!=null){ out.print(userRemember.getPassword());} %>>
								</div>
								
							</div>
							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">Remember me<span class="required"></span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
										<input name="rememberMe" type="checkbox" style="width: 16px; height: 30px" <%if(userRemember!=null){ out.print("checked");} %>>
								</div>
							</div>
							  <div class="checkbox">
                               
                            </div>
							<div class="form-group">
								<div class="col-md-6 col-md-offset-3">
									<button name="login" type="submit" class="btn btn-success">Đăng nhập</button>
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
		
        <!-- variable -->
        <script>
        	var contextPath = "<%=request.getContextPath() %>";
        	
        	$(document).ready(function() {
        		$(".login-item").addClass("current-page");
        		
        		 $("#form-login").validate({
        				rules: {
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