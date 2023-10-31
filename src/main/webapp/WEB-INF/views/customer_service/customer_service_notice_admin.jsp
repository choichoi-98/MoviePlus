<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항&nbsp;(공통)</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="/customer_service" title="고객센터 페이지로 이동">공지사항</a>
				</div>
			</div>
		</div>


		<div id="contents" class="" style="margin-left:22%; float:none;">
			<h2 class="tit">공지사항</h2>

			<div class="tab-block mb30" style="width: 70%">
				<ul>
					<li class="tabBtn"><a
						href="${pageContext.request.contextPath}/customer_service">
							<button type="button" class="btn tabBtn" data-no=""
								title="전체공지 보기">전체</button>
					</a></li>

					<li class="tabBtn on"><a
						href="${pageContext.request.contextPath}/customer_service/adminnotice">
							<button type="button" class="btn" data-no="81"
								title="무비플러스 공지 보기">무비플러스 공지</button>
					</a></li>

					<li class="tabBtn"><a
						href="${pageContext.request.contextPath}/customer_service/regionnotice">
							<button type="button" class="btn" data-no="82" title="지점 공지 보기">지점
								공지</button>
					</a></li>

				</ul>
			</div>

			<div class="board-list-util" style="text-align: right; width: 70%">
				<p class="result-count">
					<strong>전체 <em class="font-gblue">${listCount}</em>건
					</strong>
				</p>
			</div>

			<div class="table-wrap" style="width: 70%;">
				<table class="board-list">
					<colgroup>
						<col style="width: 72px;">
						<col style="width: 200px;">
						<col style="width: auto;">
						<col style="width: 116px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">극장</th>
							<th scope="col">제목</th>
							<th scope="col">지역</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${AdminNotice}">
							<tr>
								<td>${notice.RNUM}</td>
								<td>${notice.CUSTOMER_NOTICE_THEATER}</td>
								<td><a
									href="${pageContext.request.contextPath}/customer_service/getnoticedetail?noticedetailnum=${notice.CUSTOMER_NOTICE_NUM}">
										${notice.CUSTOMER_NOTICE_SUBJECT}</a></td>
								<td>${notice.CUSTOMER_NOTICE_REGION}</td>
								<td>${notice.CUSTOMER_NOTICE_SYSDATE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- pagination -->
			<nav class="pagination" style="float: left; margin-left: 25%">
				<a title="처음 페이지 보기" href="adminnotice?page=1" class="control first">first</a>
				<a title="이전 페이지 보기" href="adminnotice?page=${page-1}"
					class="control prev"
					${page <= 1 ? 'style="pointer-events: none;"' : ''}></a>

				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page }">
						<strong class="active">${a}</strong>
					</c:if>
					<c:if test="${a != page }">
						<a title="${a} 페이지보기" href="adminnotice?page=${a}">${a}</a>
					</c:if>
				</c:forEach>

				<a title="이후 페이지 보기" href="adminnotice?page=${page+1}"
					class="control next"
					${page >= maxpage ? 'style="pointer-events: none;"' : ''}>next</a>

				<a title="마지막 페이지 보기" href="adminnotice?page=${maxpage}"
					class="control last">last</a>
			</nav>
			<!--// pagination -->
		</div>
	</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>