<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" media="all">
<style>
#header.main-header{
	top:0px;
}
</style>

</head>
<body>
<script>
$.ajax({
    url: 'apitest',
    type: 'GET',
    dataType: 'json', // JSON 데이터로 응답을 기대합니다.
    success: function(movieList) {
        // 데이터를 테이블에 삽입
        var table = $('#movieListAllTable');
        console.log(movieList.Data[0].Result[0].plots.plot[0].plotText)
        var result = movieList.Data[0].Result[0];
        var plotText = result.plots.plot[0].plotText
        var posterUrl = result.posters;
        var stillUrl = result.stlls;
        var codeNo = result.CommCodes.CommCode[0].CodeNo;
        
        console.log(plotText);
        console.log(posterUrl);
        console.log(stillUrl);
        console.log(codeNo);
        console.log("영화 목록 가져오기 성공");
        
        $.ajax({
        	url:'updatePosters',
        	data:{
        		'codeNo':codeNo,
        		posterUrl:posterUrl,
        		stillUrl:stillUrl,
        		plotText:plotText
        	},
        	success:function(data){
        		console.log(data);
        	}
        })
        
    },
    error: function() {
        console.log("영화 목록 가져오기 실패");
    }
});//$.ajax({
</script>	
</body>
</html>