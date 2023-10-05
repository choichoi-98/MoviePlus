$(document).ready(function(){
	let token;
	let header;
	getScheduleList();
});

function getScheduleList() {
	token = $("meta[name='_csrf']").attr("content");
	header = $("meta[name='_csrf_header']").attr("content");

	$.ajax({
		type : "POST",
		url: "getScheduleList",
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			$('#theaterRoom-22').empty();
		},
		error: function() {
			console.log('ㅅㅍ');
		} 
	})
}