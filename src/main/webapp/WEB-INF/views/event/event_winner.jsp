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
					<a href="https://www.megabox.co.kr/event/winner/list" title="당첨자발표 페이지로 이동">당첨자발표</a>
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
						
						
							<!-- 로그인 후 -->
							<a href="javascript:fn_mySbscDtlsListPage()" class="button" title="나의 이벤트 응모내역 페이지로 이동">나의 응모결과확인</a>
						
					
				</div>
			</div>

			<div class="board-list-util">
				<p class="result-count"><strong>전체 648건</strong></p>

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
						<tr>
							<td>648</td>	<!-- Rownum  -->
							<td>영화</td>		<!-- 이벤트 타입 -->
							<th scope="row">
								<a href="#" data-no="14078" data-netfunnel="N" class="eventBtn" title="">
							[음반 증정 이벤트] 21세기 피아노의 거장 : 예프게니 키신</a>		<!-- 이벤트명 -->
							</th>
							<td>2023.11.16</td>		<!-- 발표일 -->
							<td><button type="button" class="button gray x-small w70px" disabled="disabled">준비중</button></td><!-- 당첨자발표 현황(준비중/결과확인) -->
						</tr>
						<tr>
							<td>647</td>
							<td>시사회/무대인사</td>
							<th scope="row">
								<a href="https://www.megabox.co.kr/event/winner/list?currPage=1&amp;searchText=&amp;#" data-no="14162" data-netfunnel="N" class="eventBtn" title="&lt;익스펜더블4&gt; 메가박스 회원 시사회 상세보기">&lt;익스펜더블4&gt; 메가박스 회원 시사회</a>
							</th>
							<td>2023.10.16</td>
							<td><a href="javascript:fn_moveDetail(14162)" class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a>
							</td>
						</tr>	
					</tbody>
				</table>
			</div>

			<!-- pagination -->
			<nav class="pagination"><strong class="active">1</strong> <a title="2페이지보기" href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기" href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기" href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기" href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기" href="javascript:void(0)" pagenum="6">6</a> <a title="7페이지보기" href="javascript:void(0)" pagenum="7">7</a> <a title="8페이지보기" href="javascript:void(0)" pagenum="8">8</a> <a title="9페이지보기" href="javascript:void(0)" pagenum="9">9</a> <a title="10페이지보기" href="javascript:void(0)" pagenum="10">10</a> <a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a> <a title="마지막 페이지 보기" href="javascript:void(0)" class="control last" pagenum="65">last</a> </nav>
			<!--// pagination -->

		</div>
		<!--// inner-wrap -->
	</div>
</div>
<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>