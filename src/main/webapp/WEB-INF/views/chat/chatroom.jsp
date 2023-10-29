<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Chating</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/chatRoom.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script type="text/javascript">
	var today = new Date();
		// 두 날짜가 같은 날인지 확인합니다.
		function isSameDay(date1, date2) {
			return date1.getFullYear() === date2.getFullYear() &&
						 date1.getMonth() === date2.getMonth() &&
						 date1.getDate() === date2.getDate();
	}
	
	// 두 날짜가 어제와 같은 날인지 확인합니다.
	function isYesterday(date1, date2) {
			var yesterday = new Date(date2);
			yesterday.setDate(date2.getDate() - 1);
			return isSameDay(date1, yesterday);
	}
	let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");
	var ws;
	
	window.addEventListener("load", function() {
	    console.log("chatroom에 입장하면 wsOpen() 메서드 실행");
	    wsOpen();
	});
	
	function wsOpen(){
		console.log("웹소켓 연결 요청 - wsOpen()")
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		var roomNumber = $("#roomNumber").val();
		console.log("wsOpen()-roomNumber = " + roomNumber);
		ws = new WebSocket("ws://"+ location.host +"/movieplus/chating/"+ $("#roomNumber").val());
		console.log(ws)
		wsEvt();
		showMessage();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			//현재 시간
			var currentTime = new Date();
			var hours = currentTime.getHours();
			var minutes = currentTime.getMinutes();
			if(hours < 10	){
				hours = "0" + hours;
			}
			if(minutes < 10){
				minutes = "0" + minutes;
			}
			var textTime = hours + ":" + minutes; 
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg!=null && msg.type != ''){
				console.log("메시지를 받은 경우")
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<div class='divMy'><p class='me'>" + d.msg + "</p></div><p class='mytime'>" + textTime+ "</p>><div class='clear'></div>");	
					}else{
						$("#chating").append(" <div class='icon'><img src='${pageContext.request.contextPath}/resources/image/member/bg-profile.png'>" + d.userName + "</div><div class='divOther'><p class='others'>" + d.msg + "</p><</div><div class='clear'>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
			
		}//ws.onmessage = function(data) {
		
			
		ws.onerror = function(error){
			
			console.log("WebSocket 연결 실패:", error);
		};
		
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	//전송 메서드
	function send() {
	var message = $("#chatting").val().trim();
	if(message === ""){
		alert("메시지를 입력해주세요");
	}else{

		saveMassage();
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	}//send() end
	
	//message 내용 저장 메서드
	function saveMassage(){
		var chatFrom = $("#chatFrom").val();
		var chatTo = $("#chatTo").val();
		//var chatTo = document.getElementById("spanChatName").textContent;
		var content = $("#chatting").val();
		var roomNum = $("#roomNumber").val();
		console.log("chatFrom=" + chatFrom + "/chatTo=" + chatTo + "/Content=" + content + "/roomN=" + roomNum)
		$.ajax({
			type: 'GET',
			url : '../chat/saveMessage',
			data: {
				'chatFrom': chatFrom,
				'content': content,
				'roomNum': roomNum
			},
			success: function(){
				console.log("message 저장 성공")
			},//success
			error: function(){
				console.log("message 저장 실패")
			}
			
		});//ajax end
	}//	function saveMassage(){

	//메시지 목록 show
	function showMessage(){
		var chatFrom = $("#chatFrom").val();
		var roomNum = $("#roomNumber").val();
		$.ajax({
			type: 'POST',
			url : '../chat/showMessage',
			beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
			data: {
				'roomNum': roomNum
			},
			success: function(message){
				var previousDate = null;
				console.log("message 불러오기 성공")
				$(message).each(function(index,message){
					console.log("날짜" + message.date);
					var date = new Date(message.date);
					
					if (previousDate === null || !isSameDay(date, previousDate)) {
							// 이전 날짜가 없거나 현재 날짜와 다른 경우에만 <div class="date"> 추가
							if (isYesterday(date, today)) {
									$("#chating").append("<div class='date'>------(어제)-------</div>");
							} else if (isSameDay(date, today)){
								$("#chating").append("<div class='date'>------(오늘)-------</div>");
							} else {
									$("#chating").append("<div class='date'>------" + message.date + "-------</div>");
							}
					}
					
					// 다음 메시지를 위해 previousDate 갱신
					previousDate = date;

					if(message.message_from === chatFrom){
						
						$("#chating").append("<div class='divMy'><p class='me'>" + message.content + "</p></div><p class='mytime'>" + message.time + "</p><div class='clear'></div>");
						$("#chating").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}else{
						$("#chating").append(" <div class='icon'><img src='${pageContext.request.contextPath}/resources/image/member/bg-profile.png'>" + message.message_from + "</div><div class='divOther'><p class='others'>" + message.content + "</p></div><p class='othertime'>" + message.time + "</p><div class='clear'>");
						$("#chating").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}
				});//$(message).each(function(index,message){

			},//success
			error: function(){
				console.log("message 불러오기 실패")
				console.log("XHR status: " + status);
    	 // console.log("Error: " + error);
			}
			
		});
	}
$(document).ready(function(){
	document.getElementById("goBackButton").addEventListener("click", goBack);
	function goBack() {
	     window.history.back(); 
	}

});//$(document).ready(function(){
</script>
</head>
<body style="height:100%; width:100%">
	<div id="chatHeader" class="chatHeader">
	<i class="fas fa-arrow-left"
		id="goBackButton"></i>
		<span id="spanChatName" >${chatRoomName }</span>
	</div>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${chatRoomNum}">
		
		<div id = "MAIN_CONTENTS">
			<div id="chating" class="chating">
			</div>
		</div>
		
		<div id="textArea">
			<div id="inputP">
				<input id="chatting" placeholder="보내실 메시지를 입력하세요.">
			</div>
			<div id="sendP">
			<button onclick="send()" id="sendBtn" style="background-color: #ffeb33;width: 100%; height:53px;">
			<i class="fas fa-angle-right"
				style="font-size: 44px; color: #666666; vertical-align: middle; line-height: 44px; margin-top: 3px; margin-left: 10px;"></i>
			</button>
			</div>
		</div>
		<input type="hidden" id="userName" name="userName" value="${userName}">
		<input type="hidden" id="chatFrom" name="chatFrom" value="${chatFrom}">
<!-- 		<div id = "fileSendArea"> -->
<!-- 			<input type="file" id="fileUpload"> -->
<!-- 			<button onclick="fileSend()" id="sendFileBtn">파일보내기</button> -->
<!-- 		</div> -->
	</div>
</body>
</html>