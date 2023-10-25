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
<style>
		*{
			margin:0;
			padding:0;
		}
/* 		.container{ */
/* 			width: 500px; */
/* 			margin: 0 auto; */
/* 			padding: 25px */
/* 		} */
/* 		.container h1{ */
/* 			text-align: left; */
/* 			padding: 5px 5px 5px 15px; */
/* 			color: #FFBB00; */
/* 			border-left: 3px solid #FFBB00; */
/* 			margin-bottom: 20px; */
/* 		} */
		
/* 		input{ */
/* 			width: 330px; */
/* 			height: 25px; */
/* 		} */
 		#yourMsg{ 
 			display: block; 
 		} 
		/* =------------------------------------------------------------ */
		#chatHeader{
			width: 100%; 
			clear: both; 
			display: inline-block; 
			height: 45px; 
			line-height: 45px; 
			background-color: #a9bdce; 
			padding: 0px; 
			padding-left: 10px; 
			margin: 0px;
		}
		#MAIN_CONTENTS{
			width: 100%; 
			clear: both; 
			display: inline-block; 
			
			background-color: #b2c7d9; 
			padding: 0px; 
			padding-left: 0px; 
			margin: 0px; 
			overflow-y: auto;
		}
		#textArea{
			width: 100%; 
			clear: both; 
			display: inline-block; 
			height: 50px; 
			background-color: white; 
			padding: 0px; 
			padding-left: 0px; 
			margin: 0px;
		}
		#inputP{
			width: 90%; 
			height: 100%; 
			padding: 0px; 
			margin: 0px; 
			float: left;
		}
		input{
			width: 100%; height: 100%; border: 2px solid black;
		}
		#sendP{
			width: 10%;
			height: 100%; 
			background-color: yellow; 
			padding: 0px; 
			margin: 0px; 
			float: left;
		}
		.divMy{
			float: right;
			padding-top: 3px; 
			padding-bottom: 3px; 
			padding-left: 8px; 
			padding-right: 8px; 
			background-color: #ffeb33; 
			border-radius: 7px;
			margin-right: 20px;
			margin-top: 20px;
		}
		.clear{
		  clear:both;
		}
		.divOther{
			float: left;
			padding-top: 3px; 
			padding-bottom: 3px; 
			padding-left: 8px; 
			padding-right: 8px; 
			background-color: white; 
			border-radius: 7px;
			margin-left: 20px;
			margin-bottom: 10px;
		}
		img{
			width: 33px; 
			height: 33px;
			margin-left:10px;
		}
		.chating{
			background-color: #b2c7d9;
			width: 100%;
			height: 500px;
			overflow: auto;
		}
		.chating .me{
			color: black;
			text-align: right;
		}
		.chating .others{
			color: black;
			text-align: left;
		}
		.fa-arrow-left{
			font-size: 16px; color: black; margin-right: 5px; margin-left: 5px;
		}
	</style>
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
	document.getElementById("goBackButton").addEventListener("click", goBack);

</script>
</head>
<body style="height:100%; width:100%">
	<div id="chatHeader" class="chatHeader">
	<i class="fas fa-arrow-left"
		id="goBackButton"></i>
		<span id="spanChatName">${chatObject }의 채팅방</span>
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
			<button onclick="send()" id="sendBtn" style="background-color: yellow;width: 100%;">
			<i class="fas fa-angle-right"
				style="font-size: 44px; color: #666666; vertical-align: middle; line-height: 44px; margin-top: 3px; margin-left: 10px;"></i>
			</button>
			</div>
		</div>
		<input type="hidden" id="userName" name="userName" value="${userName}">

	</div>
</body>
</html>