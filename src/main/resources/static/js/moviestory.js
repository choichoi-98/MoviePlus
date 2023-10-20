$(document).ready(function(){
	
	$('.tab-block .btn').click(function(){
		$('.moviestory_tab').css('display', 'none');
		
		var selectedTab = '#' + $(this).attr('data-tab');
		console.log(selectedTab);
		$(selectedTab).css('display', 'block');
	})
	

	$('.review-delete').click(function(){
		if(confirm('정말 삭제하시겠습니까?')){
			location.href="deleteReview?review_num=" + $(this).attr('data-reviewnum');
		}	
	})

	$('.delete-like-btn').click(function(){
		if(confirm('정말 삭제하시겠습니까?')){
			location.href="deleteDibs?movieCode=" + $(this).attr('data-movieCode');
		}	
	})

}) //ready end