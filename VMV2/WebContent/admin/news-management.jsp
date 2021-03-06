<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="../templates/admin-template.jsp" >

	<tiles:putAttribute name="content">
	
		<!-- Custom styling plus plugins -->
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/css/datepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
		<!-- /Custom styling plus plugins -->

		<div class="page-title" style="margin-bottom: 50px">
			<div class="title_left">
				<h3>Quản lý tin tức</h3>
			</div>
			<div class="title_right"></div>		
		</div>
		<div class="clearfix"></div>
		<%-- <img alt="" src="<%=request.getContextPath() %>/uploads/image.jpg"> --%>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<a class="btn btn-success btn-sm" href="" data-toggle="modal" data-target=".add-news-modal"><i class="fa fa-plus"></i> Thêm mới</a>
						<div class="clearfix"></div>
					</div>
					<p class="msg msg-success">Thao tác thành công!</p>
					<p class="msg msg-fail">Thao tác thất bại!</p>
					<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
									<th>#Mã</th>
									<th>Tiêu đề</th>
									<th>Ngày tạo</th>
									<th>Ngày hết hạn</th>
									<th></th>
									
								</tr>
								</thead>
								<tbody></tbody>
							</table>
					</div>
				</div>	
				
				<!-- modals -->
				<div class="x_content">
	      
		        	<div class="modal fade bs-example-modal-sm delete-news-modal" tabindex="-1" role="dialog" aria-hidden="true">
		            	<div class="modal-dialog modal-sm">
		                	<div class="modal-content">
		
		                      	<div class="modal-header">
		                        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
		                        	</button>
		                        	<h4 class="modal-title" id="myModalLabel2">Thông báo</h4>
		                      	</div>
		                      	<div class="modal-body">
		                      		<div class="loading-bar"> Đang xử lý...</div>
		                        	<h4>Bạn có chắc muốn xóa thông tin này?</h4>
		                        	<input type="text" hidden="true" name="newsId">
		                      	</div>
		                      	<div class="modal-header">
			                      	<div style="float:right">
			                      		<button type="button" class="btn btn-sm btn-danger btn-delete-user">Xóa</button>
			                        	<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Đóng</button>
			                      	</div>
		                      	</div>
		
		                    </div>
		                 </div>
		       		</div>
		                
		            <div class="modal fade add-news-modal" tabindex="-1" role="dialog" aria-hidden="true">
		            	<div class="modal-dialog">
		                    <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
			                        </button>
			                        <h4 class="modal-title">Thêm tin tức</h4>
			                    </div>
			                    <div class="modal-body">
			                        <div class="x_content">
			                        	<div class="loading-bar"> Đang xử lý...</div>
										<form id="form-add-news" class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="name">Tiêu đề <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
														name="title" placeholder="" type="text">
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="birthday"> Nội dung <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<textarea rows="5" name="content" class="form-control col-md-7 col-xs-12" 
													></textarea>
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="name">Ngày hết hạn <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control col-md-7 col-xs-12" 
														name="end_date" type="text">
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="textarea">Hình ảnh </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control col-md-7 col-xs-12"
														data-validate-length-range="6" name="image" type="file">
												</div>
											</div>
											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-md-offset-3">
													<button type="submit" class="btn btn-success">Thêm</button>
													<a class="btn btn-default btn-cancel">Hủy</a>
												</div>
											</div>
										</form>
									</div>
			                     </div>
		                     <div class="clearfix"></div>
		                    </div>
		                </div>
		        	</div>
		        	
		        	<div class="modal fade update-news-modal" tabindex="-1" role="dialog" aria-hidden="true">
		            	<div class="modal-dialog">
		                    <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
			                        </button>
			                        <h4 class="modal-title">Xem nội dung tin tức</h4>
			                    </div>
			                    <div class="modal-body">
			                        <div class="x_content">
			                        	<div class="loading-bar"> Đang xử lý...</div>
										<form id="form-update-news" class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
											<input type="text" hidden="true" name="newsId">
											<div class="image-view">
												<img alt=""
													src="<%=request.getContextPath()%>/resources/images/image-null.jpg">
												<input class="form-control" data-validate-length-range="6" name="image" type="file">
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="">Tiêu đề <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control col-md-7 col-xs-12" data-validate-length-range="6"
														name="title" placeholder="" type="text" value="anc">
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for=""> Nội dung <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<textarea rows="5" name="content" class="form-control col-md-7 col-xs-12" 
													></textarea>
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
													for="name">Ngày hết hạn <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input class="form-control col-md-7 col-xs-12" 
														name="end_date" type="text">
												</div>
											</div>
											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-md-offset-3">
													<button type="submit" class="btn btn-success">Cập nhật</button>
													<a class="btn btn-default btn-cancel">Hủy</a>
												</div>
											</div>
										</form>
									</div>
			                     </div>
		                     <div class="clearfix"></div>
		                    </div>
		                </div>
		        	</div>
			        <!-- /modals -->
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
        
        <!-- form jquery -->
        <script src="<%=request.getContextPath() %>/resources/production/js/jquery.form.js"></script> 
        
        <!-- datepicker -->
		<script src="<%=request.getContextPath() %>/resources/production/js/datepicker/moment.min.js"></script>
       <script src="<%=request.getContextPath() %>/resources/production/js/datepicker/daterangepicker.js"></script>
        <!-- pace --> 
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
        </script>
        
        <script src="<%=request.getContextPath() %>/admin/js/news-management.js"></script>
	  	
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