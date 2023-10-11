$(document).ready(function(){

	//hover 이벤트 발생시 줄거리 노출
	$("body").on("mouseover", ".poster", function(e) {
		e.preventDefault();
		
		$(this).closest('.first').find('.wrap').css('display', 'block');
		
	});//$("body").on("click", ".playBtn", function(e) {

   $("body").on("mouseleave", ".poster", function(e) {
		e.preventDefault();
		
		$(this).closest('.first').find('.wrap').css('display', 'none');
		
	});

});//$(document).ready(function(){
