var listUsers;
var lenU;
var listUserName=$("#datatable tr td:nth-child(4)");
var checksubmit=true;
$(document).ready(function() {
	$(".register-item").addClass("current-page");
	$('input[name="dateOfBirth"]').daterangepicker({
    	singleDatePicker: true,
        showDropdowns: true,
        format: 'DD/MM/YYYY'
    });
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
    $("#form-register").on("keyup", "#unAdd",function(){
    	
    	getListUsers() 
    	validateUserName();
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
/*getUserById*/
function getListUsers() {
	
	$.ajax({
		url: contextPath + "/ListUserServlet",
    	type: "POST",
	    data: {
	    	userId: null
	    },
    	dataType: 'json'
	}).done(function(data) {
		listUsers=data;
		lenU=listUsers.length;
	}).fail(function(err) {
	});
}
/*getUserById*/
function showMsg(msgElem) {
	$(".msg").hide();
	msgElem.fadeIn(1000);
}
function validateUserName(){
	var userCreate=$("#unAdd").val();
	for(j=0;j<lenU;j++){
		var str=listUsers[j]["username"];
		if(str==userCreate){
			$(".failUserAdd").fadeIn();
			$("#btnRegister").attr("disabled","disabled");
			return;
		}
	}
	$(".failUserAdd").fadeOut();
	$("#btnRegister").removeAttr("disabled");
	
}
function convertSDate(date){
	var date =new Date(Date.parse(date));
	var sDate=(date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear(); 
	return sDate;
}
