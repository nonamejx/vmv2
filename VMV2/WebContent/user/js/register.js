var userDatatable;
var listUserName=$("#datatable tr td:nth-child(4)");
var checksubmit=true;
$(document).ready(function() {
	setMenuItemActive();
	
	 $("#form-register").validate({
			rules: {
					name: {
						required: true,
					},
					dateOfBirth: {
						required: true
					},
					phoneNumber: {
						required: true,
						number: true,
						maxlength: 11,
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
					},
					passwordf: {
						required: true,
						maxlength: 50,
						minlength: 6,
						equalTo: "#password"
					}
				},
				messages: {
					
				},
				submitHandler: function(form) {
					addUser();
	        	}		
		});
	
	
    $('input[name="dateOfBirth"]').daterangepicker({
    	singleDatePicker: true,
        showDropdowns: true,
        format: 'DD/MM/YYYY'
    });
   
    //==========================
    $("#form-add-user").on("keyup", "#unAdd",function(){
    	validateUserName(null);
    });
    //=========================
});
function setMenuItemActive() {
	$(".user-management-menu-item").addClass("current-page");
}
/*addUser*/
function addUser() {
	var formData = new FormData($("#form-register")[0]);
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
			showMsg($(".msg-success"));
			$("#form-register")[0].reset();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
/*addUser*/
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
