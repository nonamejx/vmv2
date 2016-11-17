var vaccinationrecordDatatable;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	vaccinationrecordDatatable = $('#datatable').dataTable({
		ajax : {
			"type" : "POST",
			"url" : contextPath
					+ "/ListVaccinationRecordServlet",
			"dataSrc" : ""
		},
		"columns" : [ {
			"data" : "userName"
		}, {
			"data" : "vaccineName"
		}, {
			"data" : "dose"
		}, {
			"data" : "injectionDate"
		}, {
			"data" : "nextDoseDate"
		}, null ],
		"columnDefs" : [ {
			"targets" : -1,
			"data" : "vaccinationRecordHolderId",
			"render" : function(data, type,
					full, meta) {
				return '<a class="btn btn-primary btn-xs btn-update-vaccination-record" value="'
						+ data
						+ '" data-toggle="modal" data-target=".update-vaccination-record-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-vaccination-record" value="'
						+ data
						+ '" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
			}
		} ],
		"order" : [ [ 2, "desc" ] ],
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
		rules : {
			user : {
				required : true,
			},
			vaccine : {
				required : true
			},
			dose : {
				required : true
			},
			nextDoseDate : {
				required : true
			}
		},
		messages : {
		},
		submitHandler : function(form) {
			$(".loading-bar").slideDown(100);
			addVaccinationRecord();
		}
	});

	$("#form-update-vaccination-record").validate({
		rules : {
			user : {
				required : true,
			},
			vaccine : {
				required : true
			},
			dose : {
				required : true
			},
			nextDoseDate : {
				required : true
			}
		},
		messages : {

		},
		submitHandler : function(form) {
			$(".loading-bar").slideDown(100);
			updateVaccinationRecord();
		}
	});

	$(".modal").on("hidden.bs.modal", function() {
		$(".loading-bar").hide();
	});
	$(".btn-cancel").click(function() {
		$(".modal").modal("hide");
	});
	$('input[name="nextDoseDate"]').daterangepicker({
		singleDatePicker : true,
		showDropdowns : true,
		format : 'DD/MM/YYYY'
	});
	$("#datatable").on("click", ".btn-delete-vaccination-record", function() {
    	var vaccinationRecordId = $(this).attr("value");
    	$(".delete-vaccination-record-modal input[name='vaccinationRecordId']").val(vaccinationRecordId);
    });
	$(".btn-delete-disease").click(function() {
		$(".loading-bar").slideDown(100);
		deleteVaccinationRecord($(".delete-vaccination-record-modal input[name='vaccinationRecordId']").val());
	});
	$("#addUser").autocomplete({
	    source: function(request, response) {
	        $.ajax({
	            url: contextPath + "/SearchUserServlet",
	            dataType: "json",
	            type: "POST",
	            data: {
	                keywordUser: request.term
	            },
	            success: function(data){
	            	$("#ui-id-1").css("z-index","9999"),
	                response( $.map( data, function( item ) {
	                    return {
	                        label: item.fullName,
	                        value: item.userId 
	                    }
	                }));
	             }
	             
	        })
	    },
	    select: function(event, ui) {
	        $("#addUser").val(ui.item.label);
	        $("#addUserId").val(ui.item.value);
	        callGetDose();
	        return false;
	    }
	});
	
	$("#addVaccine").autocomplete({
	    source: function(request, response) {
	        $.ajax({
	            url: contextPath + "/SearchVaccineServlet",
	            dataType: "json",
	            type: "POST",
	            data: {
	                keywordVaccine: request.term
	            },
	            success: function(data){
	            	$("#ui-id-2").css("z-index","9999"),
	                response( $.map( data, function( item ) {
	                    return {
	                        label: item.vaccineName,
	                        value: item.vaccineId 
	                    }
	                }));
	             }
	             
	        })
	    },
	    select: function(event, ui) {
	        $("#addVaccine").val(ui.item.label);
	        $("#addVaccineId").val(ui.item.value);
	        
	        callGetDose();
	        return false;
	    }
	});
	
    $("#datatable").on("click", ".btn-update-vaccination-record", function() {
    	var vaccinationRecordId = $(this).attr("value");
    	getVaccinationRecordById(vaccinationRecordId);
    });
	// ==========================

	// code here..
	function deleteVaccinationRecord(vaccinationRecordId) {
		$.ajax({
			url: contextPath + "/DeleteVaccinationRecordServlet",
	    	type: "POST",
		    data: {
		    	vaccinationRecordId: vaccinationRecordId
		    },
	    	dataType: 'json'
		}).done(function(data) {
			if (data["status"] == "success") {
				$(".modal").modal("hide");
				showMsg($(".msg-show-success"));
				vaccinationrecordDatatable.api().ajax.reload();
			} else {
				showMsg($(".msg-fail"));
			}
		}).fail(function(err) {
		});
	}
	function addVaccinationRecord() {
		$.ajax({
			url: contextPath + "/CreateVaccinationRecordServlet",
	    	type: "POST",
	    	data: $("#form-add-vaccination-record").serialize(),
	    	dataType: 'json'
		}).done(function(data) {
			if (data["status"] == "success") {
				$(".modal").modal("hide");
				showMsg($(".msg-show-success"));
				vaccinationrecordDatatable.api().ajax.reload();
			} else {
				showMsg($(".msg-fail"));
			}
		}).fail(function(err) {
		});
	}
	function updateVaccinationRecord(){
		console.log("update here");
		$.ajax({
			url: contextPath + "/UpdateVaccinationRecordServlet",
	    	type: "POST",
	    	data: $("#form-update-vaccination-record").serialize(),
	    	dataType: 'json'
		}).done(function(data) {
			if (data["status"] == "success") {
				$(".modal").modal("hide");
				showMsg($(".msg-show-success"));
				vaccinationrecordDatatable.api().ajax.reload();
			} else {
				showMsg($(".msg-fail"));
			}
		}).fail(function(err) {
		});
	}
	function getDose(userId,vaccineId) {
		$.ajax({
			url: contextPath + "/GetDoseVaccineServlet",
	    	type: "POST",
	    	data: {
	    		userId:userId,
	    		vaccineId:vaccineId
	    	},
	    	dataType: 'json'
		}).done(function(data) {
			if(data["status"]=="fail"){
				$(".modal").modal("hide");
				showMsg($(".msg-notification"));
			}
			$("#NumberofDose").val(data["dose"])
		}).fail(function(err) {
		});
	}
	
	function callGetDose(){
		var idVaccine = $("#addVaccineId").val();
        var idUser = $("#addUserId").val();
        if(idUser>0 && idVaccine >0){
        	getDose(idUser,idVaccine);
        }
	}
	
	function getVaccinationRecordById(vaccinationRecordId) {
    	$.ajax({
    		url: contextPath + "/ShowVaccinationRecordServlet",
        	type: "POST",
    	    data: {
    	    	vaccinationRecordId: vaccinationRecordId
    	    },
        	dataType: 'json'
    	}).done(function(data) {
    		showVaccinationRecord(data);
    	}).fail(function(err) {
    	});
    }
	function showVaccinationRecord(vaccinationRecord) {
    	$("#form-update-vaccination-record input[name='user']").val(vaccinationRecord["userName"]);
    	$("#form-update-vaccination-record input[name='idUser']").val(vaccinationRecord["userId"]);
    	$("#form-update-vaccination-record input[name='vaccine']").val(vaccinationRecord["vaccineName"]);
    	$("#form-update-vaccination-record input[name='idVaccine']").val(vaccinationRecord["vaccineId"]);
    	$("#form-update-vaccination-record input[name='dose']").val(vaccinationRecord["dose"]);
    	$("#form-update-vaccination-record input[name='nextDoseDate']").val(convertSDate(vaccinationRecord["nextDoseDate"]));
    }
	
	function convertSDate(date){
		var date =new Date(Date.parse(date));
		var sDate=(date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear(); 
		return sDate;
	}
	
	function showMsg(msgElem) {
		$(".msg").hide();
		msgElem.fadeIn(1000);
	}
	//=========================
});

function setMenuItemActive() {
	$(".vaccination-record-management-menu-item").addClass("current-page");
}
