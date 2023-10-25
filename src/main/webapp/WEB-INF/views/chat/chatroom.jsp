<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>Chating</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/chatRoom.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script type="text/javascript">
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
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<div class='divMy'><p class='me'>" + d.msg + "</p></div><div class='clear'></div>");	
					}else{
						$("#chating").append(" <div class='icon'><img src='${pageContext.request.contextPath}/resources/image/member/bg-profile.png'>" + d.userName + "</div><div class='divOther'><p class='others'>" + d.msg + "</p></div><div class='clear'>");
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

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}
	

	function send() {
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
		<span id="spanChatName">${chatRoomName }</span>
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

	</div>
</body>
</html>