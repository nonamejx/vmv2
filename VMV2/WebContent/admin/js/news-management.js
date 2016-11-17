var newsDatatable;
$(document).ready(function() {
	setMenuItemActive();
	TableManageButtons.init();
	newsDatatable = $('#datatable').DataTable({  	
    	ajax: {
    		"type"   : "POST",
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
            "data": "newsId",
            "render": function ( data, type, full, meta ) {
                return '<a class="btn btn-primary btn-xs btn-update-news" value="'+ data +'" data-toggle="modal" data-target=".update-news-modal">Xem</a><a class="btn btn-danger btn-xs btn-delete-news" value="'+ data +'" data-toggle="modal" data-target=".bs-example-modal-sm">Xóa</a>';
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
			addNews();
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
			updateNews();
    	}		
	});
    
    $(".modal").on("hidden.bs.modal", function() {
    	$(".loading-bar").hide();
    });
    $(".btn-cancel").click(function() {
    	$(".modal").modal("hide");
    });

    //==========================    
    //code here...
    $("#datatable").on("click", ".btn-update-news", function() {
    	var newsId = $(this).attr("value");
    	getNewsById(newsId);
    });
    
    $("#datatable").on("click", ".btn-delete-news", function() {
    	var newsId = $(this).attr("value");
    	$(".delete-news-modal input[name='newsId']").val(newsId);
    });
    
    $(".btn-delete-user").click(function() {
    	$(".loading-bar").slideDown(100);
    	deleteNews($(".delete-news-modal input[name='newsId']").val());
    });
    
    $("#form-update-news .image-view input[name='image']").change(function(){
    	readURL(this);
	});   
    //=========================
});

function setMenuItemActive() {
	$(".news-management-menu-item").addClass("current-page");
}

function addNews() {
	var formData = new FormData($("#form-add-news")[0]);
	$.ajax({
		url: contextPath + "/CreateNewsServlet",
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
			newsDatatable.ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}

function updateNews() {
	var formData = new FormData($("#form-update-news")[0]);
	$.ajax({
		url: contextPath + "/UpdateNewsServlet",
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
			newsDatatable.ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}

function deleteNews(newsId) {
	$.ajax({
		url: contextPath + "/DeleteNewsServlet",
    	type: "POST",
	    data: {
	    	newsId: newsId
	    },
    	dataType: 'json'
	}).done(function(data) {
		if (data["status"] == "success") {
			$(".modal").modal("hide");
			showMsg($(".msg-success"));
			newsDatatable.ajax.reload();
		} else {
			showMsg($(".msg-fail"));
		}
	}).fail(function(err) {
	});
}

function getNewsById(newsId) {
	$.ajax({
		url: contextPath + "/ShowNewsServlet",
    	type: "POST",
	    data: {
	    	newsId: newsId
	    },
    	dataType: 'json'
	}).done(function(data) {
		showNews(data);
	}).fail(function(err) {
	});
}

function showNews(news) {
	var image = "";
	if (news["image"] != null && news["image"].trim() != "")
		image = contextPath + "/uploads/" + news["image"];
	else
		image = contextPath + "/resources/images/image-null.jpg";
	$("#form-update-news .image-view img").attr("src", image);
	
	$("#form-update-news input[name='newsId']").val(news["newsId"]);
	$("#form-update-news input[name='image']").val("");
	$("#form-update-news input[name='title']").val(news["title"]);
	$("#form-update-news textarea[name='content']").val(news["content"]);
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$("#form-update-news .image-view img").attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function showMsg(msgElem) {
	$(".msg").hide();
	msgElem.fadeIn(1000);
}
