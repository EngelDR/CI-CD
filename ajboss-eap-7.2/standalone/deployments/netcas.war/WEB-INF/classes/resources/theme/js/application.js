var bar = true;
$('#n-toggle-button').click(function(){	
    $('.sidenav ul.nav').toggleClass('n-active');
    $('.n-top-content ul.nav').toggleClass('n-active');
    if(bar){
        $('#n-toggle-button').removeClass('fa-bars');
        $('#n-toggle-button').addClass('fa-times'); 
    }else{
        $('#n-toggle-button').removeClass('fa-times'); 
        $('#n-toggle-button').addClass('fa-bars');        
    } 
    bar = !bar;
});


var nPage = 6;
$(document).ready(function(){
	activePageSideMenu();    
});
function activePageSideMenu(){
	for(var i = 1; i <= nPage; i++){        
        var page = "#page"+i;
        if($(page).length > 0 ){
            var menu = "#menu"+i;
            $(menu).addClass("n-activo");
        }
    }
}
function changeWidthModalChossenSelect(){
	var s = $(".modal-body div.chosen-container");
	s.css("width","100%");
}