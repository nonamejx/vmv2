<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tiles:insertTemplate template="admin-template.jsp" >

	<tiles:putAttribute name="content">
		<!-- Custom styling plus plugins -->
		<link href="css/custom.css" rel="stylesheet">
		<link href="css/icheck/flat/green.css" rel="stylesheet">
		
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath() %>/resources/production/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
		<!-- /Custom styling plus plugins -->
		
		<div class="">
			<div class="page-title" style="margin-bottom: 50px">
				<div class="title_left">
					<h3>Demo-Table Page</h3>
				</div>

				<div class="title_right">
					
				</div>
			</div>
			<div class="clearfix"></div>

			<div class="row">

				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>
							<div class="clearfix"></div>
						</div>
						
						<!-- modals -->
						<div class="x_content">
		                    <!-- Small modal -->
			                <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button> -->
			
			                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
			                  <div class="modal-dialog modal-sm">
			                    <div class="modal-content">
			
			                      <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
			                        </button>
			                        <h4 class="modal-title" id="myModalLabel2">Thông báo</h4>
			                      </div>
			                      <div class="modal-body">
			                        <h4>Bạn có chắc muốn xóa thông tin này?</h4>
			                      </div>
			                      <div class="modal-footer">
			                      	<button type="button" class="btn btn-sm btn-primary">Xóa</button>
			                        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Đóng</button>
			                      </div>
			
			                    </div>
			                  </div>
			                </div>
				            <!-- /modals -->
	                    </div>
						
						<table id="datatable" class="table table-striped table-bordered">
		                    <thead>
		                      <tr>
		                        <th>Name</th>
		                        <th>Position</th>
		                        <th>Office</th>
		                        <th>Age</th>
		                        <th>Start date</th>
		                        <th>Salary</th>
		                        <th>Action</th>
		                      </tr>
		                    </thead>
		
		
		                    <tbody>
		                    <% for (int i = 0; i < 1000; i++) { %>
		                      <tr>
		                        <td>Tiger Nixon <%=i %></td>
		                        <td>System Architect</td>
		                        <td>Edinburgh</td>
		                        <td>61</td>
		                        <td>2011/04/25</td>
		                        <td>$320,800</td>
		                        <td>
		                        	<input type="button" class="btn btn-primary btn-xs" value="View" />
		                        	<input type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target=".bs-example-modal-sm" value="Delete" />
		                        </td>
		                      </tr>
		                    <% } %>  
		                    </tbody>
		                  </table>
						
					</div>
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


        <!-- pace -->
        <script src="js/pace/pace.min.js"></script>
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
        <script type="text/javascript">
          $(document).ready(function() {
            $('#datatable').dataTable({
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
          });
          TableManageButtons.init();
        </script>
		
	</tiles:putAttribute>

</tiles:insertTemplate>