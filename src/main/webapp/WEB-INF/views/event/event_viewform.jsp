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

	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                    <a href="${pageContext.request.contextPath}/event" title="진행중 이벤트 페이지로 이동">이벤트</a>
					<a href="#" title="이벤트 상세">이벤트 상세</a>
			</div>
		</div>
	</div>
	
	<div id="contents" class="location-fixed" style="padding-top:40px;">
	<form id="eventform" action="" method="">
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
		</div> <!-- event detail end -->
		
		<div class="table-wrap mb40" style=" margin: 0 auto; display: flex; justify-content: center; width:1100px;">
              <table class="board-list" >
                  <caption>구분, 연동정보, 연결 항목을 가진 간편 로그인 계정연동 표</caption>
                  <colgroup>
                      <col style="width:130px;">
                      <col>
                      <col style="width:120px;">
                  </colgroup>
                  <thead>
                      <tr>
                          <th scope="col">영화관</th>
                          <th scope="col">상영시간</th>
                          <th scope="col">응모</th>
                      </tr>
                  </thead>
                  <tbody id="lnkgInfoTbody">
                      <tr>
                          <th scope="row" class="a-c">코엑스</th>
                                  <td class="a-l">연결된 계정정보가 없습니다.</td>
                                  <td><button type="button" class="button small gray" style="background:#792828">신청하기</button></td>
                      </tr>
                  </tbody>
              </table>
          </div>
		
		
		
			
			<%-- <!-- 시사회/무대인사 이벤트 신청 inner-wrap -->
			<c:if test='${eventDetail.EVENT_TYPE == "시사회/무대인사"}'>
				<div class="inner-wrap">
					<!-- event-button-type -->
					<div class="event-button-type">
						<button id="reopen-admit-btn" data-movieCode="${reopenMovie.movie_Code}" type="button" class="btn" style="background:#792828">신청하기</button>
					</div>
					<!--// event-button-type -->
				</div>
			<!--// 이벤트 신청 inner-wrap end -->
			</c:if> --%>
		</form>
		
    </div>
</div><!-- container end -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>