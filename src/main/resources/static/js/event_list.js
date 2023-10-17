function go(page){
   //const limit = $('#viewcount').val();
   const data ={limit:10, state:"ajax", page:page}
   ajax(data);
}


function ajax(data){
	console.log(data)
	
	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
	output = "";
	
	$.ajax({
		type : "post",
		data : data,
		url : "list_ajax",
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
				output += ''
			
			)//each end
				
			}//if end
			
		}//success end
	
	})//ajax end


}