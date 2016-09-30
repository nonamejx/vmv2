var deseasesDatatable;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	
    deseasesDatatable = $('#datatable').dataTable({
    	ajax: {
    		"type"   : "POST",
    		"url": contextPath + "/ListDiseasesServlet",
    		"dataSrc": ""
    	},
    	"columns": [
    	              { "data": "diseaseId" },
    	              { "data": "diseaseName" },
    	              { "data": "description" },
    	              null
    	            ],
        "columnDefs": [ {
            "targets": -1,
            "data": "diseaseId",
            "render": function ( data, type, full, meta ) {
                return '<a class="btn btn-primary btn-xs btn-update-diseases" value="'+ data +'" data-toggle="modal" data-target=".update-diseases-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-diseases" value="'+ data +'" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
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
    $("#datatable").on("click", ".btn-delete-diseases", function() {
    	var diseaseId = $(this).attr("value");
    	$(".delete-disease-modal input[name='diseaseId']").val(diseaseId);
    });
    
    $(".btn-delete-disease").click(function() {
    	$(".loading-bar").slideDown(100);
    	deleteDiseases($(".delete-disease-modal input[name='diseaseId']").val());
    });
    //==========================    
    
    //code here...
    
    
    function deleteDiseases(diseaseId) {
    	$.ajax({
    		url: contextPath + "/DeleteDiseasesServlet",
        	type: "POST",
    	    data: {
    	    	diseaseId: diseaseId
    	    },
        	dataType: 'json'
    	}).done(function(data) {
    		if (data["status"] == "success") {
    			$(".modal").modal("hide");
    			showMsg($(".msg-success"));
    			deseasesDatatable.api().ajax.reload();
    		} else {
    			showMsg($(".msg-fail"));
    		}
    	}).fail(function(err) {
    	});
    }
    
    
    
    
    function showMsg(msgElem) {
    	$(".msg").hide();
    	msgElem.fadeIn(1000);
    }
    
    //=========================
});

function setMenuItemActive() {
	$(".disease-management-menu-item").addClass("current-page");
}
