<%@page import="java.util.Date"%>
<%@page import="utils.DateUtils"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="../templates/admin-template.jsp">

	<tiles:putAttribute name="content">

		<!-- Custom styling plus plugins -->
		<link
			href="<%=request.getContextPath()%>/resources/production/js/datatables/jquery.dataTables.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/js/datatables/buttons.bootstrap.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/js/datatables/fixedHeader.bootstrap.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/js/datatables/responsive.bootstrap.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/js/datatables/scroller.bootstrap.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/css/datepicker/daterangepicker.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/css/multiple-select/multiple-select.css"
			rel="stylesheet" type="text/css" />
		<link
			href="<%=request.getContextPath()%>/resources/production/css/autocomplete/jquery-ui.css"
			rel="stylesheet">
		<!-- /Custom styling plus plugins -->

		<div class="page-title" style="margin-bottom: 50px">
			<div class="title_left">
				<h3>Quản lý tiêm chủng</h3>
			</div>
			<div class="title_right"></div>
		</div>
		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<a id="btn_open_add_vr" class="btn btn-success btn-sm" href="" data-toggle="modal"
							data-target=".add-vaccination-record-modal"><i
							class="fa fa-plus"></i> Thêm mới</a>
						<div class="clearfix"></div>
					</div>
					<p class="msg msg-success msg-notification ">Quý khách đã tiêm
						đủ liều cho loại vắc xin này!</p>
					<p class="msg msg-success msg-show-success">Thao tác thành
						công!</p>
					<p class="msg msg-fail">Thao tác thất bại!</p>
					<div class="x_content">
						<!-- Put your code here -->
						<form method="post">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Khách tiêm</th>
										<th>Vắc xin</th>
										<th>Mũi</th>
										<th>Ngày tiêm</th>
										<th>Ngày kế</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</form>
					</div>
				</div>
				<!-- modals -->
				<div class="x_content">

					<div
						class="modal fade bs-example-modal-sm delete-vaccination-record-modal"
						tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="myModalLabel2">Thông báo</h4>
								</div>
								<div class="modal-body">
									<div class="loading-bar">Đang xử lý...</div>
									<h4>Bạn có chắc muốn xóa thông tin này?</h4>
									<input type="text" hidden="true" name="vaccinationRecordId">
								</div>
								<div class="modal-header">
									<div style="float: right">
										<button type="button"
											class="btn btn-sm btn-danger btn-delete-disease">Xóa</button>
										<button type="button" class="btn btn-sm btn-default"
											data-dismiss="modal">Đóng</button>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="modal fade add-vaccination-record-modal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">Tiêm</h4>
								</div>
								<div class="modal-body">
									<div class="x_content">
										<div class="loading-bar">Đang xử lý...</div>
										<!-- Put your code here -->
										<form id="form-add-vaccination-record"
												class="form-label-left" method="post">
										<div
											style="display: inline-block; width: 49%; float: left; margin-right: 2%">
											
												<div class="item form-group">
													<label class="control-label" for="name">Khách tiêm<span
														class="required">*</span></label>
													<div>
														<input class="form-control" data-validate-length-range="6"
															name="user" placeholder="" type="text" id="addUser">
														<input id="addUserId" type="hidden" name="idUser">
													</div>
												</div>
												<div class="item form-group">
													<div>
														<div class="more_info user_info" style="display: none">
															<p class="user_id"></p>
															<p class="user_dob"></p>
															<p class="user_address"></p>
														</div>
													</div>
												</div>

												<div class="item form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="name">Mũi<span class="required">*</span></label>
													<div>
														<input class="form-control" data-validate-length-range="6"
															name="dose" placeholder=""
															id="NumberofDose" readonly>
													</div>
												</div>
										</div>
										<div style="display: inline-block; width: 49%">
											<div class="item form-group">
												<label class="control-label" for="name">Vắc xin<span
													class="required">*</span></label>
												<div>
													<input class="form-control" data-validate-length-range="6"
														name="vaccine" placeholder="" type="text" id="addVaccine">
													<input id="addVaccineId" type="hidden" name="idVaccine">
												</div>
											</div>
											<div class="item form-group">
												<div>
													<div class="more_info vaccine_info" style="display: none">
														<p class="vaccine_nsx"></p>
														<p class="vaccine_dose"></p>
														<p class="vaccine_sideEffects"></p>
													</div>
												</div>
											</div>
											<div class="item form-group">
												<label class="control-label" for="birthday"> Ngày
													tiêm kế<span class="required">*</span>
												</label>
												<div>
													<input name="nextDoseDate" type="text" class="form-control"
														value="<%=DateUtils.formatDate(new Date()) %>" readonly="readonly">
												</div>
											</div>
										</div>
										<div class="clearfix"></div>
										<div class="ln_solid"></div>
										<div class="form-group text-center">
											<div>
												<button type="submit" class="btn btn-success" id="btn_add_vr">Thêm</button>
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

					<div class="modal fade update-vaccination-record-modal"
						tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">Xem thông tin tiêm chủng</h4>
								</div>
								<div class="modal-body">
									<div class="x_content">
										<div class="loading-bar">Đang xử lý...</div>
										<!-- Put your code here -->
										<form id="form-update-vaccination-record"
											class="form-label-left" method="post">
											<div
											style="display: inline-block; width: 49%; float: left; margin-right: 2%">
												<div class="item form-group">
													<label class="control-label"
														for="name">Khách tiêm<span class="required">*</span></label>
													<div>
														<input class="form-control"
															data-validate-length-range="6" name="user" placeholder=""
															type="text" value="Nguyễn A" id="updateUser" readonly>
														<input type="hidden" name="idUser" id="updateUserId">
													</div>
												</div>
												<div class="item form-group">
													<div>
														<div class="more_info update_user_info">
															<p class="user_id">fdghdfg</p>
															<p class="user_dob">dfhgh</p>
															<p class="user_address">dfhdfh</p>
														</div>
													</div>
												</div>
												
												<div class="item form-group">
													<label class="control-label"
														for="name">Mũi<span class="required">*</span></label>
													<div>
														<input class="form-control"
															data-validate-length-range="6" name="dose" placeholder=""
															type="number" value="1" readonly id="updateNumberofDose">
													</div>
												</div>
											</div>
											<div style="display: inline-block; width: 49%">
												<div class="item form-group">
													<label class="control-label"
														for="name">Vắc xin<span class="required">*</span></label>
													<div>
														<input class="form-control"
															data-validate-length-range="6" name="vaccine"
															placeholder="" type="text" value="Axit clohydric" readonly
															id="updateVaccine"> <input name="idVaccine"
															type="hidden" id="updateVaccineId">
													</div>
												</div>
												<div class="item form-group">
													<div>
														<div class="more_info update_vaccine_info">
															<p class="vaccine_nsx"></p>
															<p class="vaccine_dose"></p>
															<p class="vaccine_sideEffects"></p>
														</div>
													</div>
												</div>
												<div class="item form-group">
													<label class="control-label"
														for="birthday"> Ngày tiêm kế<span class="required">*</span></label>
													<div>
														<input name="nextDoseDate" type="text"
															class="form-control col-md-7 col-xs-12 up_nextDoseDate" value="10/10/2016"
															readonly="readonly">
													</div>
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="ln_solid"></div>
											<div class="form-group text-center">
												<div>
													<button type="submit" class="btn btn-success">Cập
														nhật</button>
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
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/jquery.dataTables.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.bootstrap.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.buttons.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/buttons.bootstrap.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/jszip.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/pdfmake.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/vfs_fonts.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/buttons.html5.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/buttons.print.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.fixedHeader.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.keyTable.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.responsive.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/responsive.bootstrap.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datatables/dataTables.scroller.min.js"></script>

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

		<!-- datepicker -->
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datepicker/moment.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/production/js/datepicker/daterangepicker.js"></script>

		<!-- variable -->
		<script>
        	var contextPath = "<%=request.getContextPath()%>";
		</script>

		<script
			src="<%=request.getContextPath()%>/admin/js/vaccination-record-management.js"></script>

		<!-- prepare form validation -->
		<script
			src="<%=request.getContextPath()%>/resources/production/js/validate/jquery.validate.js"></script>
		<script>
			jQuery
					.extend(
							jQuery.validator.messages,
							{
								required : "Không được bỏ trống trường này.",
								email : "Email không hợp lệ.",
								date : "Định dạng ngày không hợp lệ.",
								number : "Vui lòng nhập vào ký tự số.",
								equalTo : "Please enter the same value again.",
								accept : "Please enter a value with a valid extension.",
								maxlength : jQuery.validator
										.format("Vui lòng nhập ít hơn {0} ký tự."),
								minlength : jQuery.validator
										.format("Vui lòng nhập nhiều hơn {0} ký tự."),
								rangelength : jQuery.validator
										.format("Please enter a value between {0} and {1} characters long."),
								range : jQuery.validator
										.format("Please enter a value between {0} and {1}."),
							});
			$.validator.addMethod("notSpecialRegex", function(value, element) {
				return this.optional(element) || /^[a-z0-9\-]+$/i.test(value);
			}, "Vui lòng không nhập ký tự đặc biệt.");
			$.validator.addMethod("mynumber", function(value, element) {
				return this.optional(element)
						|| /^(\d+|\d+.\d{1,2})$/.test(value);
			}, "Vui lòng nhập đúng định dạng giá.");
		</script>
		<!-- /form validation -->
	</tiles:putAttribute>

</tiles:insertTemplate>