<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="../templates/user-template.jsp" >

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
					<h4><i class="fa fa-list"></i> Lịch sử tiêm chủng</h4>
					<br>
					<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
									<th>Ngày tiêm</th>
									<th>Vắc xin</th>
									<th>Mũi</th>
									<th>Ngày tiêm kế</th>
								</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="javascript-source">
		<!-- Datatables-->
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.bootstrap.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.buttons.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/jszip.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/pdfmake.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/vfs_fonts.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.html5.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.print.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.fixedHeader.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.keyTable.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.responsive.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/responsive.bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/production/js/datatables/dataTables.scroller.min.js"></script>
		
        <!-- datepicker -->
		<script src="<%=request.getContextPath() %>/resources/production/js/datepicker/moment.min.js"></script>
       <script src="<%=request.getContextPath() %>/resources/production/js/datepicker/daterangepicker.js"></script>
        
        <!--  vaccination history js -->
        <script>
        var handleDataTableButtons = function() {
            "use strict";
            0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [{
                extend: "copy",
                className: "btn-sm"
              }, {
                extend: "csv",
                className: "btn-sm"
              }, {
                extend: "excel",
                className: "btn-sm"
              }, {
                extend: "pdf",
                className: "btn-sm"
              }, {
                extend: "print",
                className: "btn-sm"
              }],
              responsive: !0
            })
          },
          TableManageButtons = function() {
            "use strict";
            return {
              init: function() {
                handleDataTableButtons()
              }
            }
          }();
        </script> 
        <!-- variable -->
        <script>
        	var contextPath = "<%=request.getContextPath() %>";
        	var vaccinationRecordDatatable;
        	$(".vaccination-history-item").addClass("current-page");
        	TableManageButtons.init();
        	vaccinationRecordDatatable = $('#datatable').dataTable({
        		ajax: {
            		"type"   : "POST",
            		"url": contextPath + "/ListVaccinationHistoryServlet",
            		"dataSrc": ""
            	},
            	"columns": [
            	              { "data": "injectionDate" },
            	              { "data": "vaccineName" },
            	              { "data": "dose" },
            	              { "data": "nextDoseDate" },
            	            ],
                "order": [[ 2, "desc" ]],
            	responsive : true,
        		language : {
        			"sProcessing" : "Đang xử lý...",
        			"sLengthMenu" : "Xem _MENU_ mục",
        			"sZeroRecords" : "Không tìm thấy dòng nào phù hợp",
        			"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
        			"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
        			"sInfoFiltered" : "(được lọc từ _MAX_ mục)",
        			"sInfoPostFix" : "",
        			"sSearch" : "Tìm:",
        			"sUrl" : "",
        			"oPaginate" : {
        				"sFirst" : "Đầu",
        				"sPrevious" : "Trước",
        				"sNext" : "Tiếp",
        				"sLast" : "Cuối"
        			}
        		}
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