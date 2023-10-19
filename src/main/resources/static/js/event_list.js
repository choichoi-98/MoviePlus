$(document).ready(function(){

	function go(page){
	   //const limit = $('#viewcount').val();
	   const limit = 10;
	   const state = "ajax";
	   const data ={limit:limit, state:state, page:page};
	   ajax(data);
	   
	} //go(page) end
	
	
	let eventnum;
	let eventstatus;
	
	//이벤트 삭제
	$('.main__table-btn--delete').click(function() {
	       eventnum = $(this).parent().find('#eventnum').val();
	    });
	
	
	$('#delete-event-modal-btn').click(function() {
	    location.href="deleteEvent?num=" + eventnum;
	})
	
	//이벤트 상태 변경
	$('.main__table-btn--banned').click(function(){
		eventnum = $(this).parent().find('#eventnum').val();
		eventstatus = $(this).find('#eventstatus').val();
	})
	
	$('#change-status-modal-btn').click(function(){
		location.href="changeStatus?num=" + eventnum + "&status=" + eventstatus ;
	})
	

/*
	$('#event-modify-btn').click(function(){
		var modifyNum = $('#event_num).text();
		location.href="modifyEvent?num=" + modifyNum;
	})

*/


})//ready end