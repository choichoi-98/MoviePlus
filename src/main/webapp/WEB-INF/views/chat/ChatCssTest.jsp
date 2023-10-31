<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
  <title>MoviePlus: 모두를 위한 영화관</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="_csrf" content="${_csrf.token}">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script
   src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="${pageContext.request.contextPath}/resources/css/chatCssTest.css" rel="stylesheet">
 
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
            <h4 id="chatList" style="display: inline-block">대화목록</h4>
            <h4 id="friendList" style="display: inline-block">연락처</h4>
          </div>
          <div class="srch_bar">
            <div class="stylish-input-group">
            <input type="text" class="search-bar"  placeholder="Search" >
            </div>
        </div>
      </div>

      <div class="inbox_chat scroll">
        <c:forEach var="chatList" items="${chatList}">
        <div class="chat_list chatList" data-chat_roomNum ="${chatList.chat_Room_num}">
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
        <div id="none" style="
        text-align: center;
        color: lightgray;
        font-size: xxx-large;
    ">선택된 채팅방이 없습니다.</div>
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