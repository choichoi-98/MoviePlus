<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="_csrf" content="${_csrf.token}">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="${pageContext.request.contextPath}/resources/css/chatCssTest.css" rel="stylesheet">
  <script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
  crossorigin="anonymous"
></script>

<script>
$(document).ready(function() {
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");
  var today = new Date(); // 현재 날짜와 시간

    processChatListDates();

function processChatListDates() {
    $('.chat_list').each(function() {
        var $container = $(this);
        var chatListDate = new Date($container.find('.chat_date').text());
        var chatListTime = $container.find('.time').val();
        console.log("시간" + chatListTime)

        if (isSameDay(chatListDate, today)) {
            // date가 오늘 날짜와 같으면 시간을 나타냅니다.
            $container.find('.chat_date').text(chatListTime);
        } else if (isYesterday(chatListDate, today)) {
            // date가 어제와 같으면 "(어제)"를 나타냅니다.
            $container.find('.chat_date').text('(어제)');
        } else {
            // 그 외의 경우 date를 그대로 나타냅니다.
        }
    });
}

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

//채팅방 열기 
$(".chat_list").click(function(){
  var memberId = $(this).find(".memberId").val();
  console.log("memberId = "+memberId)
  $.ajax({
    type:"POST",
    url:"${pageContext.request.contextPath}/chat/chatRoom",
    data:{
      "memberId":memberId
    },
    beforeSend: function(xhr) {
      xhr.setRequestHeader(header, token);
    },
    success: function(rp){
      console.log(rp)
      var RoomNum = rp.chatRoomNum;
      console.log("채팅방 번호: " + RoomNum);
      var chatFrom = rp.chatFrom
      console.log("보낸 사람:  " + chatFrom)
      var userName = rp.userName
      console.log("보낸 사람 이름: " + userName)
      $("#chatFrom").val(chatFrom);
      $("#userName").val(userName);
      $("#roomNumber").val(RoomNum);
      wsOpen(RoomNum, chatFrom);
    },
    error: function(){
      console.log("ajax요청 실패")
    }
  });//$.ajax({

})//$(".chat_list").click(function(){

  //웹소켓 연결 open메서드
  function wsOpen(RoomNum, chatFrom){
    console.log("웹소켓 연결 요청 - wsOpen()")
    ws = new WebSocket("ws://"+ location.host +"/movieplus/chating/"+ RoomNum);
    wsEvt();
    showMessage(RoomNum,chatFrom);
  }

    //메시지 목록 show
    function showMessage(roomNum, chatFrom){
		// var chatFrom = $("#chatFrom").val();
		// var roomNum = $("#roomNumber").val();
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
        $(".msg_history").empty();
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
						
						$(".msg_history").append('<div class="outgoing_msg"> ' +
              '<div class="sent_msg"> ' +
              '<p>' + message.content + '</p>' +
              '<span class="time_date">' + message.time + '</span> ' +
              '</div>' +
              '</div>');
						$(".msg_history").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}else{
            console.log("보낸사람:"+message.message_from)
            
						$(".msg_history").append('<div class="incoming_msg"> ' +
            '<div class="incoming_msg_img"> ' +
            '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> ' +
            + message.message_from +'</div>' +
            '<div class="received_msg">' +
            '<div class="received_withd_msg">' +
            '<p>' + message.content + '</p>' +
            '<span class="time_date">' + message.time + '</span>' +
            '</div>' +
            '</div>' +
            '</div>');
						$(".msg_history").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}
				});//$(message).each(function(index,message){

			},//success
			error: function(){
				console.log("message 불러오기 실패")
				console.log("XHR status: " + status);
    	 // console.log("Error: " + error);
			}
			
		});
	}//  function showMessage(){

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
            $(".msg_history").append('<div class="outgoing_msg"> ' +
              '<div class="sent_msg"> ' +
              '<p>' + d.msg  + '</p>' +
              '<span class="time_date">' + textTime + '</span> ' +
              '</div>' +
              '</div>');
					}else{
              $(".msg_history").append('<div class="incoming_msg"> ' +
            '<div class="incoming_msg_img"> ' +
            '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> ' +
            d.userName + '</div>' +
            '<div class="received_msg">' +
            '<div class="received_withd_msg">' +
            '<p>' + d.msg + '</p>' +
            '<span class="time_date">' + textTime + '</span>' +
            '</div>' +
            '</div>' +
            '</div>');
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
			
		}//ws.onmessage = function(data) {
		
			
		ws.onerror = function(error){
			
			console.log("WebSocket 연결 실패:", error);
		};
		
		$(document).keypress(function(e) {
    if (e.which == 13) { // Enter key press
        send();
    }
    });

	}//function wsEvt() {
  //전송 메서드
  function send() {
	var message = $("#chating").val().trim();
	if(message === ""){
		alert("메시지를 입력해주세요");
	}else{
		saveMassage();
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chating").val()
		}
		ws.send(JSON.stringify(option))
		$('#chating').val("");
	}
	}//send() end

  //내용 저장 메서드
  function saveMassage(){
		var chatFrom = $("#chatFrom").val();
		//var chatTo = $("#chatTo").val();
		//var chatTo = document.getElementById("spanChatName").textContent;
		var content = $("#chating").val();
		var roomNum = $("#roomNumber").val();
		console.log("chatFrom=" + chatFrom + "/Content=" + content + "/roomN=" + roomNum)
		$.ajax({
			type: 'POST',
			url : '../chat/saveMessage',
			data: {
				'chatFrom': chatFrom,
				'content': content,
				'roomNum': roomNum
			},
			success: function(result){
        if(result === "success"){

          console.log("message 저장 성공")
        }
			},//success
      beforeSend: function(xhr) {
        xhr.setRequestHeader(header, token);
      },
			error: function(){
				console.log("message 저장 실패")
			}
			
		});//ajax end
	}//	function saveMassage(){

  //-----------친구(연락처) 목록------------------
 $("#friendBtn").click(function(){
    $.ajax({
      type:'POST',
      url:'../chat/friendList',
      beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
      success:function(memberList){
        var ul = $("ul.dropdown-menu"); // 이미 존재하는 ul 요소 가져오기
        
        $(memberList).each(function(index, member){
             $(".dropdown-menu").append('<li><div class="chat_people">' +
              '<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>' +
              '<div class="chat_ib" onclick="openChat(' + member.MEMBER_ID + ');">' +
              '<h5>' + member.MEMBER_NAME + '</h5>' +
              '<input type="hidden" value="' + member.MEMBER_ID + '">' +
              '</div>' +
              '</div></li>');
        });
      },
      error: function(){
        console.log("친구 목록 불러오기 실패")
      }
    })

  });//$("#friendBtn").click(function(){*/
  //친구(연락처) 목록

});//$(document).ready(function() {
var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
  return new bootstrap.Dropdown(dropdownToggleEl)
})
</script>
</head>
<body>
<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo" />
		<input type="hidden" value="${pinfo.MEMBER_ID}" id="loginId">
	</sec:authorize>
<div class="messaging">
  <d class="inbox_msg">
    <div class="inbox_people">
      <div class="headind_srch">
          <div class="recent_heading">
            <h4 style="display: inline-block">Recent</h4>
            <h4 style="display: inline-block">
              <div class="btn-group dropend">
                <button id="friendBtn" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" >
                  연락처
                </button>
                <ul class="dropdown-menu" style="position:sticky; position: -webkit-sticky; top: 0;">
                  
                </ul>
              </div>
            </h4>
          </div>
          <div class="srch_bar">
            <div class="stylish-input-group">
            <input type="text" class="search-bar"  placeholder="Search" >
            </div>
        </div>
      </div>

      <div class="inbox_chat scroll">
        <c:forEach var="chatList" items="${chatList}">
        <div class="chat_list active_chat">
          <div class="chat_people">
            <div class="chat_img"> 
              <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
            </div>
            <div class="chat_ib">
              <h5>${chatList.member_name} <span class="chat_date">${chatList.date}</span></h5>
              <p>${chatList.content}</p>
              <input class="time" type="hidden" value="${chatList.time}">
              <input class="memberId" type="hidden" value="${chatList.relative_id}">
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  
    <div class="mesgs">
      <input type="hidden" id="sessionId" value="">

      <div class="msg_history">

      </div>

        <div class="type_msg">
          <div class="input_msg_write">
            <input type="text" id="chating" class="write_msg" placeholder="Type a message" />
            <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
          </div>
        </div>
        <input type="hidden" id="roomNumber" value="">
        <input type="hidden" id="userName" value="">
        <input type="hidden" id="chatFrom" value="">
    </div>
    </div>

</div>
</body>
</html>