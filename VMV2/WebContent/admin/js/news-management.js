$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
    $('#datatable').dataTable({  	
    	"ajax": {
    		"url": contextPath + "/ListNewsServlet",
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
            "data": null,
            "defaultContent": '<a class="btn btn-primary btn-xs" data-toggle="modal" data-target=".update-news-modal">Xem</a><a class="btn btn-danger btn-xs" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>'
        } ],
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
    
    $("#form-add-news").validate({
		rules: {
			title: {
				required: true,
				maxlength: 100
			},
			content: {
				maxlength: 500
			}
		},
		messages: {
		},
		submitHandler: function(form) {
			$(".loading-bar").slideDown(100);
    	}		
	});
    
    $("#form-update-news").validate({
		rules: {
			title: {
				required: true,
				maxlength: 100
			},
			content: {
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
    $(".btn-delete-user").click(function() {
    	$(".loading-bar").slideDown(100);
    });
    //==========================    
    //code here...

    
    //=========================
});

function setMenuItemActive() {
	$(".news-management-menu-item").addClass("current-page");
}
