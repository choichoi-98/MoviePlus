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

<!-- container -->
<div class="container">

	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                <a href="${pageContext.request.contextPath}/event" title="이벤트 메인 페이지로 이동">이벤트</a>
				
					<a href="${pageContext.request.contextPath}/event/end" title="지난 이벤트 페이지로 이동">지난 이벤트</a>
			</div>

		</div>
	</div>

	<div id="contents">

		<div class="inner-wrap">
			
				<h2 class="tit">지난 이벤트</h2>
				<ul class="dot-list">
						
							<!-- 로그인 전 -->
							<li>
								응모하신 이벤트의 당첨 여부는 당첨자발표의
								<button type="button" class="reset tooltip click">
									<strong class="font-gblue">나의 응모결과 확인</strong>
									<span class="ir" data-width="235">
										<span class="cont-area">
											<span class="login-alert-tooltip">
												로그인이 필요한 서비스 입니다.<br>
												<a id="moveLogin" href="https://www.megabox.co.kr/event/end#layer_login_common" class="btn-modal-open" w-data="850" h-data="484" title="로그인 바로가기">로그인 바로가기 <i class="iconset ico-arr-right-green"></i></a>
											</span>
										</span>
									</span>
								</button>
								을 통해  확인하실 수 있습니다.
							</li>
							<!--// 로그인 전 -->
				</ul>
		</div>


		<div id="boardSearch" class="inner-wrap" style="">
			
				<div class="board-list-util mt0">

				<p class="result-count"><strong>전체 <b>10,714</b>건</strong></p>

				<div class="board-search">
					<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
					<button type="button" class="btn-search-input">검색</button>
				</div>
			</div>
		</div>

		<div id="event-list-wrap">


	<div class="inner-wrap">
			<div class="event-list finish ">
			
                <input type="hidden" id="totCount" name="totCount" value="10714">
				<ul>
				 	<c:forEach var="event" items="${eventlist}" varStatus="loop" >
					<c:if test='${event.EVENT_STATUS == "END"}'>				 	
					<li>
						<a href="${pageContext.request.contextPath}/event/detail?num=${event.EVENT_NUM}" data-no="12411" data-netfunnel="N" class="eventBtn" title="${event.EVENT_SUBJECT}">
							
								<p class="cate">${event.EVENT_TYPE}</p>
							

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> 
							<img src="${pageContext.request.contextPath}/upload${event.EVENT_FILE}" alt="${event.EVENT_SUBJECT}" onerror="noImg(this);"></p>

							<p class="tit">
								${event.EVENT_SUBJECT}
							</p>

							<p class="date">
								${event.EVENT_STARTDATE} ~ ${event.EVENT_ENDDATE}
							</p>
						</a>
					</li>
					</c:if>
				  </c:forEach>	
				</ul>
			</div>
		
	</div>

</div>

		
			<div class="btn-more v1" style="">
				<button type="button" class="btn">더보기 <i class="iconset ico-btn-more-arr"></i></button>
			</div>
		
	</div>
</div>
<!--// container -->



	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>