<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
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
					<a href="${pageContext.request.contextPath}/event/winner" title="당첨자발표 페이지로 이동">당첨자발표</a>
			</div>

		</div>
	</div>

	<div id="contents">

		<!-- inner-wrap -->
		<div class="inner-wrap">

			<h2 class="tit">당첨자발표</h2>

			<div class="text-util">
				<div class="left pt05">
					<ul class="dot-list">
						<li>응모하신 이벤트의 당첨 여부는 나의 응모결과 확인을 통해  확인하실 수 있습니다.</li>
						<li>개인정보 처리방침에 따라 당첨자 발표일로 부터 6개월간 당첨자 발표내역을 확인할 수 있습니다.</li>
					</ul>
				</div>

				<div class="right">
						
							<sec:authorize access="isAnonymous()">
							<a href="#" id="myeventbtn" class="button" title="나의 이벤트 응모내역 페이지로 이동">나의 응모결과확인</a>
							</sec:authorize>
							
							<!-- 로그인 후 -->
							<sec:authorize access="isAuthenticated()">
							<a href="${pageContext.request.contextPath}/member/myevent" class="button" title="나의 이벤트 응모내역 페이지로 이동">나의 응모결과확인</a>
							</sec:authorize>
				</div>
			</div>
			
			<c:if test="${eventlistcount > 0}">
			<div class="board-list-util">
				<p class="result-count"><strong>전체 ${eventlistcount}건</strong></p>

				<div class="board-search">
					<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
					<button type="button" class="btn-search-input">검색</button>
				</div>
			</div>

			<div class="table-wrap">
				<table class="board-list">
					<caption>게시판 목록 제목</caption>
					<colgroup>
						<col style="width:80px;">
						<col style="width:130px;">
						<col>
						<col style="width:100px;">
						<col style="width:110px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">이벤트명</th>
							<th scope="col">발표일</th>
							<th scope="col">당첨자발표</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="event" items="${eventlist}">
						<tr>
							<td>${event.RNUM}</td>	<!-- Rownum  -->
							<td>${event.EVENT_TYPE}</td>		<!-- 이벤트 타입 -->
							<th scope="row">
								<a href="${pageContext.request.contextPath}/event/detail?num=${event.EVENT_NUM}" data-no="14078" data-netfunnel="N" class="eventBtn" title="">
								${event.EVENT_SUBJECT}</a>		<!-- 이벤트명 -->
							</th>
							<td><span class="resultdate">${event.EVENT_RESULTDATE}</span></td>		<!-- 발표일 -->
							<!-- 당첨자발표 현황(준비중/결과확인) -->
							<td>
								<!-- <button type="button" class="button gray x-small w70px" disabled="disabled">준비중</button>  -->
							 <a href="${pageContext.request.contextPath}/event/winnerdetail?num=${event.EVENT_NUM}" class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a> 
							</td>
						</tr>
					</c:forEach>		
					</tbody>
				</table>
			</div>
			</c:if>
			<!-- pagination -->
			<nav class="pagination">
			<strong class="active" style="background-color:#792828; border-color:#792828;">1</strong> 
				<a title="2페이지보기" href="winner?page=${page-1}" pagenum="2">2</a> 
				<a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a> 
				<a title="마지막 페이지 보기" href="javascript:void(0)" class="control last" pagenum="65">last</a> 
			</nav>
			
			<!--// pagination -->

		</div>
		<!--// inner-wrap -->
	</div>
</div>
<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />

<script>
//날짜형식 변경
$('.resultdate').each(function() {
	var result = $(this);
	var resultdate = result.text();
	var newresultdate = formatdate(resultdate);
	
	result.text(newresultdate);
	
	function formatdate(dateString) {
		var year = dateString.substring(0, 4);
	    var month = dateString.substring(4, 6);
	    var day = dateString.substring(6, 8);
	    
		   return year + "." + month + "." + day;
	}
})

//비회원 접근시 로그인 페이지로 이동
$('#myeventbtn').click(function(e){
	e.preventDefault();
	$('#header-login-btn').click();
})
</script>		
	
</body>
</html>