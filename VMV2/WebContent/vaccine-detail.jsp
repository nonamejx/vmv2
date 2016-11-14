<%@page import="utils.DateUtils"%>
<%@page import="utils.StringUtils"%>
<%@page import="model.bean.News"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="/templates/guest-template.jsp" >

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
					String idV=request.getParameter("idV");
				%>
					<input type="text" hidden="true" name="vaccineId" value="<% if(idV!=null){out.print(idV);} %>">
					<h4><i class="fa fa-eraser"></i> Thông tin vắc xin</h4>
					<br>
					<div class="row" style="padding: 10px;">
						<div id="idVaccineDetail_P1" class="col-md-4 text-center">
							<img src="<%=request.getContextPath()%>/resources/images/vaccine-default.jpg" style="width: 100%;">
							<h4><b>PriorixTM</b></h4>
							<p><i>Giá: 50 000 VND</i></p>
						</div>
						<div id="idVaccineDetail_P2" class="col-md-8" style="padding-left: 30px;">
							<h5><b>Chỉ định:</b></h5>
							<p id="indication">PriorixTM được chỉ định để gây miễn dịch chủ động chống sởi, quai bị và rubella.</p>
							<br>
							<h5><b>Số mũi:</b></h5>
							<p id="numberOfDoses">1</p>
							<br>
							<h5><b>Liều lượng và cách sử dụng:</b></h5>
							<p id="dosageAndUsage">Liều đề nghị là một liều 0,5 ml vaccine hoàn nguyên. Lịch tiêm chủng ở mỗi nước một khác, do vậy nên theo lịch tiêm chủng được khuyến cáo ở quốc gia đó. Cách dùng: PriorixTM nên tiêm dưới da mặc dù có thể dùng để tiêm bắp.</p>
							<br>
							<h5><b>Phòng bệnh:</b></h5>
							<ul id="vaccineDisease">
								
							</ul>
							<br>
							<h5><b>Chống chỉ định:</b></h5>
							<p id="contraindication">Không nên dùng PriorixTM cho những người suy giảm đáp ứng miễn dịch, bao gồm những bệnh nhân suy giảm miễn dịch tiên phát hoặc thứ phát. Tuy nhiên, có thể dùng vaccine kết hợp sởi, quai bị và rubella cho những người nhiễm HIV không triệu chứng mà không gây những ảnh hưởng bất lợi đến tình trạng bệnh của họ và có thể cân nhắc sử dụng cho những người nhiễm HIV có triệu chứng.</p>
							<br>
							<h5><b>Tác dụng phụ:</b></h5>
							<p id="sideEffects">Rất phổ biến: đỏ tại chỗ tiêm, sốt ≥ 38oC (trực tràng), hoặc ≥ 37.5oC (nách/miệng) Phổ biến: sưng và đau tại chỗ tiêm, sốt > 39.5oC (trực tràng) hay > 39oC (nách/miệng). Nhìn chung, phân loại tần suất các tác dụng phụ là tương tự như nhau khi tiêm liều đầu tiên hoặc liều thứ hai vaccine. Chỉ có một khác biệt là tác dụng phụ đau tại chỗ tiêm là “Phổ biến” sau khi tiêm liều đầu tiên và “Rất phổ biến” sau khi tiêm liều thứ hai.</p>
						</div>
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
        
        <script src="<%=request.getContextPath() %>/resources/js/vaccine-detail.js"></script>
	  	
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