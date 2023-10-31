$(document).ready(function() {
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");
  console.log("토큰 " + token)
  console.log("헤더 " + header)
  var today = new Date(); // 현재 날짜와 시간
    var selectedRoom;


function processChatListDates() {
console.log("시간 설정 메서드 ")
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
          //console.log("객체 내용: ", message)
					console.log("날짜" + message.date);
					var date = new Date(message.date);
					
					if (previousDate === null || !isSameDay(date, previousDate)) {
							// 이전 날짜가 없거나 현재 날짜와 다른 경우에만 <div class="date"> 추가
							if (isYesterday(date, today)) {
									$(".msg_history").append("<div class='date'>------(어제)-------</div>");
							} else if (isSameDay(date, today)){
								$(".msg_history").append("<div class='date'>------(오늘)-------</div>");
							} else {
									$(".msg_history").append("<div class='date'>------" + message.date + "-------</div>");
							}
					}
					
					// 다음 메시지를 위해 previousDate 갱신
					previousDate = date;

					if(message.message_from === chatFrom){
						
						$(".msg_history").append('<div class="outgoing_msg"> ' +
              '<div class="sent_msg"> ' +
              '<p>' + message.content + '</p>' +
              '<span class="time_date">' + message.time + ' | ' + message.date + '</span> ' +
              '</div>' +
              '</div>');
						$(".msg_history").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}else{
            
						$(".msg_history").append('<div class="incoming_msg"> ' +
            '<div class="incoming_msg_img"> ' +
            '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> ' 
            + message.member_name  +'</div>' +
            '<div class="received_msg">' +
            '<div class="received_withd_msg">' +
            '<p>' + message.content + '</p>' +
            '<span class="time_date">' + message.time + ' | ' + message.date + '</span>' +
            '</div>' +
            '</div>' +
            '</div>');
						$(".msg_history").append("<input type='hidden' id='date' value='" + message.date + "'</input>");
					}
				});//$(message).each(function(index,message){
			$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
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
              $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
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
            $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
            chatList();
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
			
		}//ws.onmessage = function(data) {
		
			
		ws.onerror = function(error){
			
			console.log("WebSocket 연결 실패:", error);
		};
		
	$(".msg_send_btn").off("click").on("click", function(event) {
	     var message = $("#chating").val().trim();
		    console.log("message" + message)
			if(message === ""){
				alert("메시지를 입력해주세요-click");
			}else{
				
	        send();
			}
	    event.stopPropagation(); 
	});
	
	// 입력란에서 Enter 키 눌림 이벤트 처리
	$("#chating").off("keyup").on("keyup", function(event) {
	    if (event.key === "Enter") {
	        var message = $("#chating").val().trim();
		    console.log("message" + message)
			if(message === ""){
				alert("메시지를 입력해주세요-keyup");
			}else{
	        send();
			}
	        event.stopPropagation(); 
	    }
	});

	}//function wsEvt() {
  //전송 메서드
  function send() {
	var message = $("#chating").val().trim();
    
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
			beforeSend : function(xhr)
	        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
	         xhr.setRequestHeader(header, token);
	        },
			data: {
				'chatFrom': chatFrom,
				'content': content,
				'roomNum': roomNum
			},
			success: function(result){
        if(result === "success"){
		
          console.log("message 저장 성공")
          chatList();
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
 $("#friendList").click(function(){
  console.log("친구 목록 function")
    $.ajax({
      type:'POST',
      url:'../chat/friendList',
      beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
        success: function (memberList) {
          console.log(memberList)
          $(".inbox_chat").empty();
          $(memberList).each(function (index, member) {
            var chatItem = '<div class="chat_list friendList">' +
              '<div class="chat_people">' +
              '<div class="chat_img">' +
              '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">' +
              '</div>' +
              '<div class="chat_ib">' +
              '<h5>' + member.member_NAME + '</h5>' +
              '<input class="memberId" type="hidden" value="' + member.member_ID + '">' +
              '</div>' +
              '</div>' +
              '</div>';
            $(".inbox_chat").append(chatItem);
          });
        },
      error: function(){
        console.log("친구 목록 불러오기 실패")
      }
    })

  });//$("#friendBtn").click(function(){*/
  //친구(연락처) 목록


  //------------대화 목록-------------------
  $("#chatList").click(function(){
      chatList();
  });

  function chatList() {
    console.log("대화목록 function")
  $.ajax({
    type: 'POST',
    url: '../chat/chatListAjax',
    beforeSend: function (xhr) {
      // 데이터를 전송하기 전에 헤더에 csrf값을 설정
      xhr.setRequestHeader(header, token);
    },
    success: function (chatList) {
      console.log(chatList)
      processChatListDates();
      $(".inbox_chat").empty();
      $(chatList).each(function (index, cl) {
		  console.log("chatList cl = "+cl)
          var $container = $('<div class="chat_list chatList" data-chat_roomNum ='+ cl.chat_Room_num+'></div>');
          var $chatPeople = $('<div class="chat_people"></div>');
          var $chatImg = $('<div class="chat_img"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>');
          var $chatIb = $('<div class="chat_ib"></div>');
          var $h5 = $('<h5></h5>');
          var $chatDate = $('<span class="chat_date"></span>');
          var $p = $('<p></p>');
          var $time = $('<input class="time" type="hidden" value="' + cl.time + '">');
          var $memberId = $('<input class="memberId" type="hidden" value="' + cl.relative_id + '">');

          if (isSameDay(new Date(cl.date), today)) {
            // date가 오늘 날짜와 같으면 시간을 나타냅니다.
            $chatDate.text(cl.time);
          } else if (isYesterday(new Date(cl.date), today)) {
            // date가 어제와 같으면 "(어제)"를 나타냅니다.
            $chatDate.text('(어제)');
          } else {
            // 그 외의 경우 date를 그대로 나타냅니다.
            $chatDate.text(cl.date);
          }

          $h5.text(cl.member_name);
          $p.text(cl.content);

          $h5.append($chatDate);
          $chatIb.append($h5);
          $chatIb.append($p);
          $chatIb.append($time);
          $chatIb.append($memberId);
          $chatPeople.append($chatImg);
          $chatPeople.append($chatIb);
          $container.append($chatPeople);

          $(".inbox_chat").append($container);
          
          $(".chat_list[data-chat_roomNum=" + selectedRoom +"]").addClass("active_chat");
        });
        
        
    },
    error: function () {
      console.log("친구 목록 불러오기 실패");
    }
  });
};//functino chatList() {

  //------- 대화방으로 이동--------
  //채팅방 열기 

$("body").on("click",".chat_list",function(){
	if ($(this).hasClass("friendList")) {//친구 목록 
        // friendList 클래스가 있는 경우의 처리
        // 이곳에 friendList 클릭 이벤트 처리를 추가합니다.
            $(".chat_list").removeClass("active_chat");
		    // 클릭 이벤트가 발생한 요소에 active_chat 클래스 추가
		    $(this).addClass("active_chat");
		    
		  var memberId = $(this).find(".memberId").val();
		  console.log("memberId = "+memberId)
		  $.ajax({
		    type:"POST",
		    url:"../chat/chatRoom",
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
    } else if ($(this).hasClass("chatList")) {//대화 방 목록 
            $(".chat_list").removeClass("active_chat");
		    // 클릭 이벤트가 발생한 요소에 active_chat 클래스 추가
		    $(this).addClass("active_chat");
		    
		    selectedRoom = $(this).attr("data-chat_roomNum");
		    console.log("선택된 방 "+selectedRoom)
		  var memberId = $(this).find(".memberId").val();
		  console.log("memberId = "+memberId)
		  $.ajax({
		    type:"POST",
		    url:"../chat/chatRoom",
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
		  });
    }



})//$(".chat_list").click(function(){

});//$(document).ready(function() {