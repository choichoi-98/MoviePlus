<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="utf-8">
<title>친구목록</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/chatList.css" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script>
	function openChat(memberId) {
		
		var chatRoomUrl = "${pageContext.request.contextPath}/chat/chatRoom?obejctId="
				+ memberId;

		// 페이지 이동
		window.location.href = chatRoomUrl;
	}
	document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("friendList").addEventListener("click", function() {
    // 페이지 이동
    window.location.href = "../chat/friendList";
  });
})

$(document).ready(function() {
    processChatListDates();
});//
function processChatListDates() {
    $('.divFriendTr').each(function() {
        var $container = $(this);
        var chatListDate = new Date($container.find('#date').text());
        var chatListTime = $container.find('#time').val();
        console.log("시간" + chatListTime)
        var today = new Date(); // 현재 날짜와 시간

        if (isSameDay(chatListDate, today)) {
            // date가 오늘 날짜와 같으면 시간을 나타냅니다.
            $container.find('#date').text(chatListTime);
        } else if (isYesterday(chatListDate, today)) {
            // date가 어제와 같으면 "(어제)"를 나타냅니다.
            $container.find('#date').text('(어제)');
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

</script>
</head>
<body style="margin: 0px">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo" />
		<input type="hidden" value="${pinfo.MEMBER_ID}" id="loginId">
	</sec:authorize>
	<div
		style="width: 100%; display: inline-block; height: 797px; padding: 0px; margin: 0px; position: relative; left: 0px; top: 0px;"
		id="MAIN">
		<div
			style="width: 20%; display: inline-block; height: 797px; background-color: #ececed; padding: 0px; margin: 0px; padding-top: 10px; text-align: center; float: left;">
			<i id = "friendList" class="fas fa-user" style="font-size: 28px; color: #909297;"></i>
			
			<i id = "chatList" class="fas fa-comment" style="font-size: 28px; color: #909297;"></i>
		</div>
		<div
			style="width: 80%; display: inline-block; height: 100%; background-color: #ffffff; padding: 0px; margin: 0px;  float: left;">
			<!--  
			<div
				style="width: 100%; height: 30px; padding: 0px; margin: 0px; color: black; padding-left: 14px;">
				친구</div>
				-->
			<div
				style="width: 100%; height: calc(100% - 30px); padding: 0px; margin: 0px; margin-bottom: -30px; color: black; overflow-y: auto"
				id="divMemberList">
				<c:forEach var="chatList" items="${chatList }">

					<div class="divFriendTr">
						<div style="float: left;" onclick="openChat('${chatList.relative_id}');">
              <span id="chatRoomName">${chatList.member_name}</span>
              <span id="recentText">${chatList.content}</span>
              <span id ="date">${chatList.date}</span>
              
              <input id="time" type="hidden" value="${chatList.time}">
              <input type="hidden" value="${cahtList.relative_id}">
						</div>
						<div style="float: left; margin-left: 7px;" >
							
							
						</div>
					</div>
				</c:forEach>

			</div>

		</div>
	</div>
	<div
		style="width: 0%; height: 0px; padding: 0px; margin: 0px; position: relative; left: 0px; top: 0px;"
		id="BACKGROUND"></div>
</body>
</html>