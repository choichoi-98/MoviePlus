<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>친구목록</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style>
    .divFriendTr {
        height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-left: 14px;
        margin: 0px;
        width: calc(100% - 14px);
        clear: both;
    }

    .divChatTr {
        min-height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-left: 10px;
        margin: 0px;
        width: calc(100% - 10px);
        clear: both;
        font-size: 13px;
    }

    .divChatTrMy {
        min-height: 33px;
        display: inline-block;
        line-height: 33px;
        vertical-align: middle;
        padding-top: 6px;
        padding-bottom: 6px;
        padding-right: 30px;
        margin: 0px;
        width: calc(100% - 30px);
        clear: both;
        font-size: 13px;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script type="text/javascript">
	var ws;

	function wsOpen(){
		console.log("웹소켓 연결 요청 - wsOpen()")
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
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
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
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
</script>
</head>
<body style="margin: 0px">
<div
	style="width: 100%; clear: both; display: inline-block; height: 45px; line-height: 45px; background-color: #a9bdce; padding: 0px; padding-left: 10px; margin: 0px;">
	<i class="fas fa-arrow-left"
		style="font-size: 16px; color: black; margin-right: 5px;"></i><span
		id="spanChatName">슈퍼맨, 스파이더맨</span>
</div>
<div
	style="width: 100%; clear: both; display: inline-block; height: calc(100% - 95px); background-color: #b2c7d9; padding: 0px; padding-left: 0px; margin: 0px; overflow-y: auto;"
	id="MAIN_CONTENTS">
	<div class="divChatTrMy">
		<div style="float: right; width: 45%;"></div>
		<div
			style="width: 100%; padding-top: 3px; padding-bottom: 3px; padding-left: 8px; padding-right: 8px; background-color: #ffeb33; border-radius: 7px;">안녕</div>
	</div>

	<div class="divChatTr">
		<div style="float: left;">
			<img src="/kakaoimg/kakaoicon.png" style="width: 33px; height: 33px;">
		</div>
		<div style="float: left; margin-left: 7px; width: 45%">
			<div>스파이더맨</div>
			<div
				style="width: 100%; padding-top: 3px; padding-bottom: 3px; padding-left: 8px; padding-right: 8px; background-color: white; border-radius: 7px;">반가워</div>
		</div>

	</div>
	<div
		style="width: 100%; clear: both; display: inline-block; height: 50px; background-color: white; padding: 0px; padding-left: 0px; margin: 0px;">
		<div
			style="width: calc(100% - 50px); height: 100%; padding: 0px; margin: 0px; float: left;">
			<textarea style="width: 100%; height: 100%; border: 0px;"
				id="chat_message" name="chat_message"></textarea>
		</div>
		<div
			style="width: 50px; height: 100%; background-color: yellow; padding: 0px; margin: 0px; float: left;">
			<i class="fas fa-angle-right"
				style="font-size: 44px; color: #666666; vertical-align: middle; line-height: 44px; margin-top: 3px; margin-left: 16px;"></i>
		</div>
	</div>
</div>
<div style="width: 0%; height: 0px; padding: 0px; margin: 0px; position: relative; left: 0px; top: 0px;" id="BACKGROUND"></div>
</body>
</html>