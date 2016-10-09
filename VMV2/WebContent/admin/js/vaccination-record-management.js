
var vaccinationrecordDatatable;
var listFullNameOfUser;
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
	$('#text-user').focus(function(){
		$.ajax({
			type: "POST",
			url: contextPath+"/GetListUserServlet",
			data:{
				fullname:$(this).val(),
			},
			success: function(data){
				listFullNameOfUser = data
			}
			});
	});
	$(function() {
		$("#text-user").autocomplete({
			source: listFullNameOfUser,
			focus: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox
				$(this).val(ui.item.fullName);
				console.log(ui.item.fullName);
			},
			select: function(event, ui) {
				// prevent autocomplete from updating the textbox
				event.preventDefault();
				// manually update the textbox and hidden field
				$(this).val(ui.item.label);
				$("#text-user-id").val(ui.item.userId);
			}
			
		});
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
				showMsg($(".msg-success"));
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
				showMsg($(".msg-success"));
				vaccinationrecordDatatable.ajax.reload();
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
	$(".vaccination-record-management-menu-item").addClass("current-page");
}
