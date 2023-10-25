$(document).ready(function(){


//날짜형식변경
	var start = $('.startdate');
	var end = $('.enddate');
	var startdate = start.text();
	var newstartdate = formatdate(startdate);
	
	var enddate = end.text();
	var newenddate = formatdate(enddate);
	
	start.text(newstartdate);
	end.text(newenddate);
	
	function formatdate(dateString) {
		var year = dateString.substring(0, 4);
	    var month = dateString.substring(4, 6);
	    var day = dateString.substring(6, 8);
	    
		   return year + "." + month + "." + day;
	}
	

	
})