$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
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
    
    $("#form-add-disease").validate({
		rules: {
			diseaseName: {
				required: true,
				maxlength: 100
			},
			description: {
				maxlength: 500
			}
		},
		messages: {
		},
		submitHandler: function(form) {
			$(".loading-bar").slideDown(100);
    	}		
	});
    
    $("#form-update-disease").validate({
    	rules: {
			diseaseName: {
				required: true,
				maxlength: 100
			},
			description: {
				maxlength: 500
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
    $(".btn-delete-disease").click(function() {
    	$(".loading-bar").slideDown(100);
    });
    //==========================    
    
    //code here...
    
    //=========================
});

function setMenuItemActive() {
	$(".disease-management-menu-item").addClass("current-page");
}
