$(document).ready(function(){
	
	$('.tab-block .btn').click(function(){
		$('.moviestory_tab').css('display', 'none');
		
		var selectedTab = '#' + $(this).attr('data-tab');
		console.log(selectedTab);
		$(selectedTab).css('display', 'block');
	})
	

}) //ready end