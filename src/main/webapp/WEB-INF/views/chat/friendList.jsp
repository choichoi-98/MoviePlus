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
<style>
.divFriendTr {
	height: 36px;
	display: inline-block;
	line-height: 33px;
	vertical-align: middle;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 14px;
	margin: 0px;
	width: calc(100% - 14px);
	clear: both;
    border-bottom: 1px solid #000; /* 하단 테두리 설정 */
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.1/mustache.min.js"></script>
<script>
	function openChat(memberId) {
		
		var chatRoomUrl = "${pageContext.request.contextPath}/chat/chatRoom?obejctId="
				+ memberId;

		// 페이지 이동
		window.location.href = chatRoomUrl;
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
			<i class="fas fa-user" style="font-size: 28px; color: #909297;"></i>
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
				<c:forEach var="memberlist" items="${memberList }">

					<div class="divFriendTr">
						<div style="float: left;">
						<c:if test="${empty memberlist.MEMBER_PROFILE}">
							<img src="${pageContext.request.contextPath}/resources/image/member/bg-profile.png"
								style="width: 33px; height: 33px;">
						</c:if>
						<c:if test="${!empty memberlist.MEMBER_PROFILE}">
							<img src="${pageContext.request.contextPath}/resources/image/member/${memberlist.MEMBER_PROFILE}"
								style="width: 33px; height: 33px;">
						</c:if>
						</div>
						<div style="float: left; margin-left: 7px;" onclick="openChat('${memberlist.MEMBER_ID}');">
							${memberlist.MEMBER_NAME } 
							<input type="hidden" value="${memberlist.MEMBER_ID}">
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