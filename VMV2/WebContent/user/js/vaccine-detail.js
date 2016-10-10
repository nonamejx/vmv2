$(document).ready(function() {
	setMenuItemActive();
    getVaccineById();
    getVaccineDiseaseById();
});

function getVaccineById() {
	var vaccineId=$("input[name='vaccineId']").val();
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

function getVaccineDiseaseById() {
	var vaccineId=$("input[name='vaccineId']").val();
	$.ajax({
		url: contextPath + "/ShowVaccineDiseaseByIdVaccineServlet",
    	type: "POST",
	    data: {
	    	vaccineId: vaccineId,
	    },
    	dataType: 'json'
	}).done(function(data) {
		showVaccineDisease(data);
	}).fail(function(err) {
	});
}

function showVaccine(vaccine) {
	var image = "";
	if (vaccine["image"] != null && vaccine["image"].trim() != ""){
		image = contextPath + "/uploads/" + vaccine["image"];
	}else{
		image = contextPath + "/resources/images/image-null.jpg";
	}	
	
	$("#idVaccineDetail_P1 img").attr("src", image);
	$("#idVaccineDetail_P1 h4 b").text(vaccine["manufacturer"]);
	$("#idVaccineDetail_P1 p i").text("Giá : "+vaccine["price"]);
	$("#idVaccineDetail_P2 #vaccineName").text(vaccine["vaccineName"]);
	$("#idVaccineDetail_P2 #manufacturer").text(vaccine["manufacturer"]);
	$("#idVaccineDetail_P2 #price").text(vaccine["price"]);
	$("#idVaccineDetail_P2 #numberOfDoses").text(vaccine["numberOfDoses"]);
	$("#idVaccineDetail_P2 #indication").text(vaccine["indication"]);
	$("#idVaccineDetail_P2 #contraindication").text(vaccine["contraindication"]);
	$("#idVaccineDetail_P2 #sideEffects").text(vaccine["sideEffects"]);
	$("#idVaccineDetail_P2 #dosageAndUsage").text(vaccine["dosageAndUsage"]);
}

function showVaccineDisease(data) {
	for(i=0;i<data.length;i++){
		var code="<li><p>"+data[i]["diseaseName"]+"</p></li>"
		$("#vaccineDisease").append(code);
	}
}

function setMenuItemActive() {
	$(".vaccine-management-menu-item").addClass("current-page");
}
