function openModal(modalname){
  document.get
  $("#modal").fadeIn(300);
  $("."+modalname).fadeIn(300);

  $("#modal, .close").on('click',function(){
  $("#modal").fadeOut(300);
  $(".modal-con").fadeOut(300);
});
}


$(document).ready(function(){
	    $(window).scroll(function(){
	       
	        var section1 = $("#section1").offset().top;
	        var section2 = $("#section2").offset().top;
	        var height = $(document).scrollTop();
	        console.log(section1, height);
	          if(section1 >= height){                     
	              	$('.subMenu1').removeClass("clicked");
		          }
		          
	          if(section1 <= height){
        	  	$('.subMenu1').addClass("clicked");                      
              	$('.subMenu1').siblings().removeClass("clicked");
	          }
	          
  	          if(section2 <= height){
        	  	$('.subMenu2').addClass("clicked");                      
              	$('.subMenu2').siblings().removeClass("clicked");
	          }
	    })
	})
