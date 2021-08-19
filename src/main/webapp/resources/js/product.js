$(function(){
// 	이미지 클릭시 해당 이미지 모달
	$(".imgC").click(function(){
		$(".modal1").fadeIn(300);
		// 해당 이미지 가겨오기
		var imgSrc = $(this).children("img").attr("src");
		var imgAlt = $(this).children("img").attr("alt");
		$(".modalBox img").attr("src", imgSrc);
		$(".modalBox img").attr("alt", imgAlt);
	});
	
	//.modal안에 button을 클릭하면 .modal닫기
	$(".modal1 button").click(function(){
		$(".modal1").fadeOut(300);
	});
	
	//.modal밖에 클릭시 닫힘
	$(".modal1").click(function (e) {
    if (e.target.className != "modal1") {
      return false;
    } else {
      $(".modal1").fadeOut(300);
    }
  });
});


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
