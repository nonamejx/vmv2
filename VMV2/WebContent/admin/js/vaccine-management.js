var vaccineDatatable ;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	vaccineDatatable = $('#datatable').dataTable({
    	ajax: {
    		"type"   : "POST",
    		"url": contextPath + "/ListVaccineServlet",
    		"dataSrc": ""
    	},
    	"columns": [
    	              { "data": "vaccineId" },
    	              { "data": "vaccineName" },
    	              { "data": "indication"},
    	              null
    	            ],
        "columnDefs": [ {
            "targets": -1,
            "data": "vaccineId",
            "render": function ( data, type, full, meta ) {
                return '<a class="btn btn-primary btn-xs btn-update-vaccine" value="'+ data +'" data-toggle="modal" data-target=".update-vaccine-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-vaccine" value="'+ data +'" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
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
    
    $("#form-add-vaccine").validate({
		rules: {
			vaccineName: {
				required: true
			},
			price: {
				required: true,
				mynumber:true
			},
			numberOfDoses: {
				required: true,
				number: true
			}
		},
		messages: {
		},
		submitHandler: function(form) {
			$(".loading-bar").slideDown(100);
			addVaccine();
			$("#form-add-vaccine")[0].reset();
		}		
	});
    
    $("#form-update-vaccine").validate({
		rules: {
			vaccineName: {
				required: true
			},
			price: {
				required: true,
				mynumber:true
			},
			numberOfDoses: {
				required: true,
				number: true
			}
		},
		messages: {
		},
		submitHandler: function(form) {
			$(".loading-bar").slideDown(100);
			updateVaccine();
		}		
	});
    
    $(".modal").on("hidden.bs.modal", function() {
    	$(".loading-bar").hide();
    });
    $(".btn-cancel").click(function() {
    	$(".modal").modal("hide");
    });
    $(".btn-delete-vaccine").click(function() {
    	$(".loading-bar").slideDown(100);
    	deleteVaccine();
    });
    $(".add-vaccine").click(function() {
    	setDisease() ;
    });
    $("#datatable").on("click", ".btn-delete-vaccine", function() {
    	var vaccineId = $(this).attr("value");
    	$(".modal-delete-vaccine input[name='vaccineId']").val(vaccineId);
    });
    $("#datatable").on("click", ".btn-update-vaccine", function() {
    	var vaccineId = $(this).attr("value");
    	getVaccineById(vaccineId);
    });
    $("#form-update-vaccine .image-view input[name='image']").change(function(){
    	readURL(this);
	}); 
    //==========================    
    
    //code here...
    
    //=========================
});
/*addVaccine*/
function addVaccine() {
	var formData = new FormData($("#form-add-vaccine")[0]);
	$.ajax({
		url: contextPath + "/CreateVaccineServlet",
    	type: "POST",
	    data: formData,
	    async : false,
        cache : false,
        contentType : false,
        processData : false,
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
			vaccineDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
/*addVaccine*/
/*DeleteVaccine*/
function deleteVaccine() {
	var vaccineId=$(".modal-delete-vaccine input").val();
	$.ajax({
		url: contextPath + "/DeleteVaccineServlet",
    	type: "POST",
	    data: {
	    	vaccineId: vaccineId,
	    },
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
			vaccineDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
/*DeleteVaccine*/
/*getVaccineById*/
function getVaccineById(vaccineId) {
	$.ajax({
		url: contextPath + "/ShowVaccineServlet",
    	type: "POST",
	    data: {
	    	vaccineId: vaccineId,
	    },
    	dataType: 'json'
	}).done(function(data) {
		showVaccine(data);
	}).fail(function(err) {
	});
}
/*getVaccineById*/
/*showVaccine*/
function showVaccine(vaccine) {
	var image = "";
	if (vaccine["image"] != null && vaccine["image"].trim() != ""){
		image = contextPath + "/uploads/" + vaccine["image"];
	}else{
		image = contextPath + "/resources/images/image-null.jpg";
	}	
	
	$("#form-update-vaccine .image-view img").attr("src", image);
	$("#form-update-vaccine input[name='vaccineId']").val(vaccine["vaccineId"]);
	$("#form-update-vaccine input[name='nameImage']").val(vaccine["image"]);
	$("#form-update-vaccine input[name='vaccineName']").val(vaccine["vaccineName"]);
	$("#form-update-vaccine input[name='manufacturer']").val(vaccine["manufacturer"]);
	$("#form-update-vaccine input[name='price']").val(vaccine["price"]);
	$("#form-update-vaccine input[name='numberOfDoses']").val(vaccine["numberOfDoses"]);
	$("#form-update-vaccine textarea[name='indication']").val(vaccine["indication"]);
	$("#form-update-vaccine textarea[name='contraindication']").val(vaccine["contraindication"]);
	$("#form-update-vaccine textarea[name='sideEffects']").val(vaccine["sideEffects"]);
	$("#form-update-vaccine textarea[name='dosageAndUsage']").val(vaccine["dosageAndUsage"]);
	var len= vaccine["vaccineDisease"].split(",");
	$("#diseaseSelect").val(len);
	$("#diseaseSelect").multipleSelect("refresh");
}
function updateVaccine() {
	var formData = new FormData($("#form-update-vaccine")[0]);
	$.ajax({
		url: contextPath + "/UpdateVaccineServlet",
    	type: "POST",
	    data: formData,
	    async : false,
        cache : false,
        contentType : false,
        processData : false,
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
			vaccineDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
function setMenuItemActive() {
	$(".vaccine-management-menu-item").addClass("current-page");
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$("#form-update-vaccine .image-view img").attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function showMsg(msgElem) {
	$(".msg").hide();
	msgElem.fadeIn(1000);
}
function setSelectDisease(vaccine){}
	







