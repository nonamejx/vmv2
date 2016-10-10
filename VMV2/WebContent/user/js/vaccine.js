var currentPage=1;
var listVaccine,dataDisplay;
var lenV;
var quantum=4;
var numberPage;
$(document).ready(function() {
	setMenuItemActive();
	getAllVaccine();
  //move page
    $( ".pagi " ).on( "click", "a", function(){
        var page=$(this).text();
        displayVaccine(page) ;
        setCurrent();
    });
  //search
    $("#search").keyup(function(){
        searchVaccine();
        createPage();
        displayByindex(1);
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
		dataDisplay=data;
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
    if(index.indexOf('Trước')>-1){
        currentPage--;
        if(currentPage>=1){
            displayByindex(currentPage);    
        }
       
    }else if(index.indexOf('Tiếp')>-1){
        currentPage++;
        if(currentPage<=numberPage){
            displayByindex(currentPage);    
        }
    }else{
    	currentPage=index;
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
    	if (dataDisplay[i]["image"] != null && dataDisplay[i]["image"].trim() != ""){
    		image = contextPath + "/uploads/" + dataDisplay[i]["image"];
    	}else{
    		image = contextPath + "/resources/images/image-null.jpg";
    	}	
        code ="<div class='col-sm-6'>"+
        			"<div class='part'>"+
        				"<div class='part-image'>"+
        					"<img class='part-image' alt='' src='"+image+"'>"+
        				"</div>"+
							"<div class='part-detail'>"+
        						"<p style='font-size: 16px'><b>"+dataDisplay[i]["vaccineName"]+"</b></p>"+
								"<p>"+dataDisplay[i]["indication"]+"</p>"+
								"<a href='vaccine-detail.jsp?idV="+dataDisplay[i]["vaccineId"]+"'><i>Chi tiết >></i></a>"+
							"</div></div></div>"  ;
        $(".list-vaccines").append(code);
    }
};

function searchVaccine(){
	dataDisplay=listVaccine;
    var input, keySearch,i;
    var arSearch=[];
    input = document.getElementById('search');
    keySearch = input.value.toUpperCase();
    if(keySearch!=""){
        for (i = 0; i <dataDisplay.length; i++) {
            if(dataDisplay[i]["vaccineName"].toUpperCase().indexOf(keySearch) > -1){
                arSearch.push(dataDisplay[i]);
            } else  if(dataDisplay[i]["indication"].toUpperCase().indexOf(keySearch) > -1){
                        arSearch.push(dataDisplay[i]);
            } else  if(dataDisplay[i]["contraindication"].toUpperCase().indexOf(keySearch) > -1){
                        arSearch.push(dataDisplay[i]);
            } 
        }
        dataDisplay=arSearch;
    }   
    lenV=dataDisplay.length;
}

function createPage(){
    currentPage=1;
    $(".pagi").empty(); 
    numberPage=Math.ceil(lenV/quantum);
    var code="<li><a href='javascript:void(0)' class='not-active'  id='prev'>&#10094; Trước</a></li>"
                       +" <li><a class='active' href='javascript:void(0)'>1</a></li> ";
    if(numberPage>1){
        for(i=2;i<=numberPage;i++){
            code +="<li><a  href='javascript:void(0)'>"+i+"</a></li>";
        }
        code+="<li><a id='next' href='javascript:void(0)'>Tiếp &#10095;</a></li>";
    }else{
    	code+="<li><a id='next' class='not-active' href='javascript:void(0)'>Tiếp &#10095;</a></li>";
    }
   
    $(".pagi").append(code);
}

function setCurrent(){
    if(currentPage>=numberPage){
    	$('.pagi li a').removeClass("not-active");	
        $('#next').addClass("not-active");
        currentPage=numberPage;
    }else if(currentPage<=1){
    	$('.pagi li a').removeClass("not-active");	
    	$('#prev').addClass("not-active");
        currentPage=1;
    }else{
    	 $('.pagi li a').removeClass("not-active");	
    }
   
	$('.pagi li a').removeClass("active");
	$(".pagi li:nth-child("+(currentPage+1)+") a").addClass("active");
    
}

function setMenuItemActive() {
	$(".vaccine-management-menu-item").addClass("current-page");
}
	
