var userDatatable;
var listUserName=$("#datatable tr td:nth-child(4)");
var checksubmit=true;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	userDatatable=$('#datatable').dataTable({
    	ajax: {
    		"type"   : "POST",
    		"url": contextPath + "/ListUserServlet",
    		"dataSrc": ""
    	},
        "columns": [
	        { "data": "userId" },
	        { "data": "fullName" },
	        { "data": "birthday",
	        	"render": function ( data, type, full, meta ) {
	        		return convertSDate(data); 
				},
	        }, 
	        { "data": "username" },
	        null
	    ],
		"columnDefs": [ {
			"targets": -1,
			"data": "userId",
			"render": function ( data, type, full, meta ) {
			  return '<a class="btn btn-primary btn-xs btn-update-user" value="'+ data +'" data-toggle="modal" data-target=".update-user-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-user" value="'+ data +'" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
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
    $("#form-add-user").validate({
		rules: {
				name: {
					required: true,
				},
				dateOfBirth: {
					required: true
				},
				phoneNumber: {
					required: true,
					number: true
				},
				address: {
					required: true
				},
				username: {
					required: true,
					maxlength: 50,
					minlength: 6,
					notSpecialRegex: true
				},
				password: {
					required: true,
					maxlength: 50,
					minlength: 6
				}
			},
			messages: {
			},
			submitHandler: function(form) {
				$(".loading-bar").slideDown(100);
				addUser();
				$("#form-add-user")[0].reset();
			}		
	});
    $("#form-update-user").validate({
		rules: {
				name: {
					required: true,
				},
				dateOfBirth: {
					required: true
				},
				phoneNumber: {
					required: true,
					number: true
				},
				address: {
					required: true
				},
				username: {
					required: true,
					maxlength: 50,
					minlength: 6,
					notSpecialRegex: true
				},
				password: {
					required: true,
					maxlength: 50,
					minlength: 6
				}
			},
			messages: {
			},
			submitHandler: function(form) {
				$(".loading-bar").slideDown(100);
				updateUser();
        	}		
	});
    $(".modal").on("hidden.bs.modal", function() {
    	$(".loading-bar").hide();
    	
    });
    $(".btn-cancel").click(function() {
    	$(".modal").modal("hide");
    	$("#form-add-user")[0].reset();
    });
    $('input[name="dateOfBirth"]').daterangepicker({
    	singleDatePicker: true,
        showDropdowns: true,
        format: 'DD/MM/YYYY'
    });
    $(".btn-delete-user").click(function() {
    	$(".loading-bar").slideDown(100);
    });
    //==========================
    $("#datatable").on("click", ".btn-update-user", function() {
    	var userId = $(this).attr("value");
    	getUserById(userId);
    });
    $("#datatable").on("click", ".btn-delete-user", function() {
    	var userId = $(this).attr("value");
    	$(".modal-delete-user input[name='userId']").val(userId);
    });
    $(".btn-delete-user").click(function() {
    	$(".loading-bar").slideDown(1000);
    	deleteUser();
    });
    $("#form-add-user").on("keyup", "#unAdd",function(){
    	validateUserName(null);
    });
    $("#form-update-user").on("keyup", "#unUpdate",function(){
    	validateUserName($("#form-update-user input[name='userId']").val());
    });
    $("#form-update-user").on("change", "#unUpdate",function(){
    	validateUserName($("#form-update-user input[name='userId']").val());
    });
    $("#form-update-user .image-view input[name='image']").change(function(){
    	readURL(this);
	}); 
    //=========================
});
function setMenuItemActive() {
	$(".user-management-menu-item").addClass("current-page");
}
/*addUser*/
function addUser() {
	var formData = new FormData($("#form-add-user")[0]);
	$.ajax({
		url: contextPath + "/CreateUserServlet",
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
			userDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
/*addUser*/
/*DeleteUser*/
function deleteUser() {
	var userId=$(".modal-delete-user input").val();
	$.ajax({
		url: contextPath + "/DeleteUserServlet",
    	type: "POST",
	    data: {
	    	userId: userId
	    },
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
			userDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
/*DeleteUser*/
/*getUserById*/
function getUserById(userId) {
	$.ajax({
		url: contextPath + "/ShowUserServlet",
    	type: "POST",
	    data: {
	    	userId: userId
	    },
    	dataType: 'json'
	}).done(function(data) {
		showUser(data);
	}).fail(function(err) {
	});
}
/*getUserById*/
/*showUser*/
function showUser(user) {
	var image = "";
	if (user["avatar"] != null && user["avatar"].trim() != ""){
		image = contextPath + "/uploads/" + user["avatar"];
	}else{
		image = contextPath + "/resources/images/image-null.jpg";
	}	
	$("#form-update-user .image-view img").attr("src", image);
	$("#form-update-user input[name='name']").val(user["fullName"]);
	$("#form-update-user input[name='userId']").val(user["userId"]);
	$("#form-update-user input[name='nameImage']").val(user["avatar"]);
	$("#form-update-user input[name='dateOfBirth']").val(convertSDate(user["birthday"]));
	$("#form-update-user  select").val(user["gender"]);
	$("#form-update-user input[name='phoneNumber']").val(user["phoneNumber"]);
	$("#form-update-user textarea[name='address']").val(user["address"]);
	$("#form-update-user input[name='username']").val(user["username"]);
	$("#form-update-user input[name='password']").val(user["password"]);
	var role=user["role"];
	if(role){
		$("#form-update-user input[name='isAdmin']").attr('checked','checked');
	}else{
		$("#form-update-user input[name='isAdmin']").removeAttr('checked');
	}
}
function updateUser() {
	var formData = new FormData($("#form-update-user")[0]);
	$.ajax({
		url: contextPath + "/UpdateUserServlet",
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
			userDatatable.api().ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$("#form-update-user .image-view img").attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function showMsg(msgElem) {
	$(".msg").hide();
	msgElem.fadeIn(1000);
}
function validateUserName(userId){
	listUserName=$("#datatable tr td:nth-child(4)");
	if(userId==null){
		var userCreate=$("#unAdd").val();
		for(var i=1;i<=listUserName.length;i++){
			if($("#datatable tr:nth-child("+i+") td:nth-child(4)").text() == userCreate){
				$(".failUserAdd").fadeIn();
				 $("#addUser").attr("disabled","disabled");
				return;
			}
		}
		$(".failUserAdd").fadeOut();
		$("#addUser").removeAttr("disabled");
	}else{
		var userCreate=$("#unUpdate").val();
		for(var i=1;i<=listUserName.length;i++){
			var valUserName=$("#datatable tr:nth-child("+i+") td:nth-child(4)").text();
			var valUserId=$("#datatable tr:nth-child("+i+") td:nth-child(1)").text();
			if( valUserName== userCreate&&valUserId!=userId){
				$(".failUserUpdate").fadeIn();
				$("#updateUser").attr("disabled","disabled");
				return;
			}
		}
		$(".failUserUpdate").fadeOut();
		$("#updateUser").removeAttr("disabled");
	}
}
function convertSDate(date){
	var date =new Date(Date.parse(date));
	var sDate=(date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear(); 
	return sDate;
}
