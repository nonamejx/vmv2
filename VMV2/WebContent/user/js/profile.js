var checksubmit=true;
var oldPass="";
$(document).ready(function() {
	setMenuItemActive();
	getUserById();
	setDefaulFormPass();
	$("#form-update-profile").validate({
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
					}
				},
				messages: {
					
				},
				submitHandler: function(form) {
					updateProfile();
	        	}		
		});
	
	
	$("#form-update-password").validate({
			rules: {
				oldPassword: {
					required: true,
					maxlength: 50,
					minlength: 6
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
				},
		},
			messages: {
				
			},
				submitHandler: function(form) {
					updatePasswordProfile();
	        	}		
		});

    $(".btn-delete-user").click(function() {
    	$(".loading-bar").slideDown(100);
    });
    //$("#form-update-password").on("click","#submit",updatePasswordProfile());
    //==========================
   
    $("#form-update-profile .image-view input[name='image']").change(function(){
    	readURL(this);
	});
    $("#form-update-password").on("keyup", "#oldPassword",function(){
    	setFormChangePassword();
    });
    //=========================
});
function setMenuItemActive() {
	$(".user-management-menu-item").addClass("current-page");
}


/*getUserById*/
function getUserById() {
	var userId = $("input[name='userId']").attr("value");
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
	oldPass= user["password"] ;
	if (user["avatar"] != null && user["avatar"].trim() != ""){
		image = contextPath + "/uploads/" + user["avatar"];
	}else{
		image = contextPath + "/resources/images/image-null.jpg";
	}	
	$("#form-update-profile .image-view img").attr("src", image);
	$("#form-update-profile input[name='name']").val(user["fullName"]);
	$("#form-update-profile input[name='idProfile']").val(user["userId"]);
	$("#form-update-profile input[name='nameImage']").val(user["avatar"]);
	$("#form-update-profile input[name='dateOfBirth']").val(convertSDate(user["birthday"]));
	$("#form-update-profile  select").val(user["gender"]);
	$("#form-update-profile input[name='phoneNumber']").val(user["phoneNumber"]);
	$("#form-update-profile textarea[name='address']").val(user["address"]);
	$("#form-update-profile input[name='username']").val(user["username"]);
	
}
function updateProfile() {
	var formData = new FormData($("#form-update-profile")[0]);
	$.ajax({
		url: contextPath + "/UpdateProfileServlet",
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
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}
function updatePasswordProfile() {
	
	var password=$("#password").val();
	var userId = $("input[name='userId']").attr("value");
	$.ajax({
		url: contextPath + "/UpdatePasswordProfileServlet",
    	type: "POST",
	    data:{
	    	password: password,
	    	userId: userId,
	    }, 
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
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
        	$("#form-update-profile .image-view img").attr("src", e.target.result);
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
	var sDate=date.getDate() + '/' + (date.getMonth() + 1) + '/' +   date.getFullYear(); 
	return sDate;
}
function setFormChangePassword(){
	var pass=$("#oldPassword").val();
	if(oldPass == pass){
		$("#confirmPassword").removeAttr('disabled');
		$("#password").removeAttr('disabled');
	}else{
		setDefaulFormPass();
	}
	
}
function setDefaulFormPass(){
	$("#confirmPassword").attr('disabled', 'disabled');
	$("#password").attr('disabled', 'disabled');
}

