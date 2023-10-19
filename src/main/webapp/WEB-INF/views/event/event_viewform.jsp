<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="container" id="schdlContainer">

	<div class="page-util fixed">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                    <a href="https://www.megabox.co.kr/event" title="진행중 이벤트 페이지로 이동">이벤트</a>
				<a href="javascript:void(0)" title="이벤트 상세">이벤트 상세</a>
			</div>
		</div>
	</div>

	<div id="contents" class="location-fixed">
	 <input type="hidden" id="EVENT_NUM" value="${eventDetail.EVENT_NUM}" name="EVENT_NUM">
		<!-- event-detail -->
		<div class="event-detail">
			<h2 class="tit">
				${eventDetail.EVENT_SUBJECT} <!--이벤트 제목 --> 
			</h2>
			<p class="event-detail-date">
				<span>기간</span>
				<em>${eventDetail.EVENT_STARTDATE} ~ 
					${eventDetail.EVENT_ENDDATE}
				</em>
			</p>

			<!--
				가로가 100% 일때
				<div class="event-html full">

				가로가 1100px 일때
				<div class="event-html">
			-->
				
			<div class="event-html">
						
			<table align="center" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td><img border="0" src="${pageContext.request.contextPath}/upload${eventDetail.EVENT_CONTENT}"></td>
					</tr>
				</tbody>
			</table>
			<map name="Map">
				<area coords="185,794,535,880" href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600" shape="rect" target="_blank"> 
				<area coords="565,794,915,880" href="https://m.megabox.co.kr/re/WebApp/booking/movie?movieNo=23069600" shape="rect" target="_blank">
			</map>
					
			</div>
				

			<!--// iframe 아닐 때  -->
		</div>
    </div>
</div><!-- container end -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>