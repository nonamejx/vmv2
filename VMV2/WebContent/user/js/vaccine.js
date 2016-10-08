var currentPage=1;
var listVaccine;
var lenV;
var quantum=4;
var numberPage;
$(document).ready(function() {
	setMenuItemActive();
	getAllVaccine();
  //move page
    $( ".pagination " ).on( "click", "a", function(){
        var page=$(this).text();
        displayVaccine(page) ;
        setCurrent();
    });
    $(".part-detail").on( "click", "a", function(){
    });
});
/*getVaccineById*/
function getAllVaccine() {
	$.ajax({
		url: contextPath + "/ListVaccineServlet",
    	type: "POST",
	    data: {
	    },
    	dataType: 'json'
	}).done(function(data) {
		listVaccine=data;
		lenV=listVaccine.length;
		createPage();
		displayByindex(1);
	}).fail(function(err) {
	});
}
/*getVaccineById*/
/*showVaccine*/
function showAllVaccine(listVaccine) {
	for(i=0;i<listVaccine.length;i++){
		
	}
}

function displayVaccine(index){
    if(index.indexOf('Prev')>-1){
        currentPage--;
        if(currentPage>=1){
            displayByindex(currentPage);    
        }
       
    }else if(index.indexOf('Next')>-1){
        currentPage++;
        if(currentPage<=numberPage){
            displayByindex(currentPage);    
        }
    }else{
        displayByindex(index);
    }
}

function displayByindex(index){
    var code="";
    $(".list-vaccines").empty();
    currentPage=parseInt(index);
    var offset=(currentPage-1)*quantum;
    var sum=offset+quantum;
    for(i=offset;i<(sum>lenV?lenV:sum);i++){
    var	image = contextPath + "/uploads/" +listVaccine[i]["image"];
        code ="<div class='col-sm-6'>"+
        			"<div class='part'>"+
        				"<div class='part-image'>"+
        					"<img class='part-image' alt='' src='"+image+"'>"+
        				"</div>"+
							"<div class='part-detail'>"+
        						"<p style='font-size: 16px'><b>"+listVaccine[i]["vaccineName"]+"</b></p>"+
								"<p>"+listVaccine[i]["indication"]+"</p>"+
								"<a href='vaccine-detail.jsp?idV="+listVaccine[i]["vaccineId"]+"'><i>Chi tiết >></i></a>"+
							"</div></div></div>"  ;
        $(".list-vaccines").append(code);
    }
};
function createPage(){
    currentPage=1;
    $(".pagination").empty(); 
    numberPage=Math.ceil(lenV/quantum);
    var code="<li><a href='javascript:void(0)' id='prev'>&#10094; Prev</a></li>"
                       +" <li><a class='current' href='javascript:void(0)'>1</a></li> ";
    if(numberPage>1){
        for(i=2;i<=numberPage;i++){
            code +="<li><a  href='javascript:void(0)'>"+i+"</a></li>";
        }
    }  
    code+="<li><a id='next' href='javascript:void(0)'>Next &#10095;</a></li>";
    $(".pagination").append(code);
}

function setCurrent(){
    if(currentPage>numberPage){
        $('#next').css("cursor","default");
        currentPage=numberPage;
    }
    if(currentPage<1){
        $('#prev').css("cursor","default");
        currentPage=1;
    }
}

function setMenuItemActive() {
	$(".vaccine-management-menu-item").addClass("current-page");
}
	
