var vaccinationrecordDatatable;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	vaccinationrecordDatatable=$('#datatable').dataTable({
		ajax: {
    		"type"   : "POST",
    		"url": contextPath + "/ListVaccinationRecordServlet",
    		"dataSrc": ""
    	},
    	"columns": [
    	              { "data": "newsId" },
    	              { "data": "title" },
    	              { "data": "createdDate" },
    	              null
    	            ],
        "columnDefs": [ {
            "targets": -1,
            "data": "newsId",
            "render": function ( data, type, full, meta ) {
                return '<a class="btn btn-primary btn-xs btn-update-news" value="'+ data +'" data-toggle="modal" data-target=".update-news-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-news" value="'+ data +'" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
              }
        } ],
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
    
    $("#form-add-vaccination-record").validate({
		rules: {
				user: {
					required: true,
				},
				vaccine: {
					required: true
				},
				dose: {
					required: true
				},
				nextDoseDate: {
					required: true
				}
			},
			messages: {
				
			},
			submitHandler: function(form) {
				$(".loading-bar").slideDown(100);
        	}		
	});
    
    $("#form-update-vaccination-record").validate({
		rules: {
			user: {
				required: true,
			},
			vaccine: {
				required: true
			},
			dose: {
				required: true
			},
			nextDoseDate: {
				required: true
			}
		},
		messages: {
			
		},
		submitHandler: function(form) {
			$(".loading-bar").slideDown(100);
    	}		
	});
    
    $(".modal").on("hidden.bs.modal", function() {
    	$(".loading-bar").hide();
    });
    $(".btn-cancel").click(function() {
    	$(".modal").modal("hide");
    });
    $('input[name="nextDoseDate"]').daterangepicker({
    	singleDatePicker: true,
        showDropdowns: true,
        format: 'DD/MM/YYYY'
    });
    $(".btn-delete-disease").click(function() {
    	$(".loading-bar").slideDown(100);
    });
    //==========================    
    
    //code here..
    
    //=========================
});

function setMenuItemActive() {
	$(".vaccination-record-management-menu-item").addClass("current-page");
}
