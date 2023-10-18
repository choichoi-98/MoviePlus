$(document).ready(function(){

function go(page){
   //const limit = $('#viewcount').val();
   const limit = 10;
   const state = "ajax";
   const data ={limit:limit, state:state, page:page};
   ajax(data);
   
} //go(page) end


function ajax(data){
	console.log(data)
	
	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
	output = "";
	
	$.ajax({
		type : "post",
		data : data,
		url : "/event/list_ajax",
		dataType : "json",
		cache : false,
		beforeSend : function(xhr)
		{
			xhr.setRequestHeader(header, token);
		},
		success : function(data){
			
		  if(data.listcount > 0){ //총 갯수가 0보다 큰 경우
			$("tbody").remove();
			let num = data.listcount - (data.page - 1) * data.limit;
			console.log(num)
			let output = "<tbody>";
			$(data.eventlist).each(function(index, item){
				output += '<tr><td><div class="main__user"><div class="main__meta"><h3>' 
				output += item.EVENT_TYPE + '</h3></div></div></td>'
				output += '<td><div class="main__table-text"><a href="detail?num=' + item.EVENT_NUM + '">'
				output += item.EVENT_SUBJECT + '</a></div></td>'
				output += '<td><div class="main__table-text">' + item.EVENT_STARTDATE + ' - ' + item.EVENT_ENDDATE + '</div></td>'
				output += '<td><div class="main__table-text">' + item.EVENT_DATE + '</div></td>'
				output += '<td><div class="main__table-text main__table-text--green">' 
				output += item.EVENT_STATUS + '</td></div>'
				output += '<td><div class="main__table-btns">'
				output += '<a href="' + '#' + '" class="main__table-btn main__table-btn move-to-manager-menu">'
				output += '<i class="icon ion-ios-log-out" title="당첨자 관리"></i></a>'
				output += '<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">'
				output += '<i class="icon ion-ios-lock" title="상태 관리"></i></a>'
				output += '<a href="#" id="theater-modify-btn" class="main__table-btn main__table-btn--edit">'
				output += '<i class="icon ion-ios-create" title="수정"></i></a>'
				output += '<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">'
				output += '<i class="icon ion-ios-trash" title="삭제"></i></a>'
				output += '</div></td></tr>'
				output += '<input type ="hidden" value="'+ item.EVENT_NUM +'" name= "EVENT_NUM">';
				output += '<input type ="hidden" value="'+ item.EVENT_SUBJECT +'" name= "EVENT_SUBJECT">';
				output += '<input type ="hidden" value="'+ item.EVENT_TYPE +'" name= "EVENT_TYPE">';
				output += '<input type ="hidden" value="'+ item.EVENT_STARTDATE +'" name= "EVENT_STARTDATE">';
				output += '<input type ="hidden" value="'+ item.EVENT_ENDDATE +'" name= "EVENT_ENDDATE">';
				output += '<input type ="hidden" value="'+ item.EVENT_DATE +'" name= "EVENT_DATE">';
				
				})//each end
				output += '</tbody>'
				$('table').append(output)
			
		} //success end
      }  
	
	})//ajax end

}//ajax(data)end


})//ready end