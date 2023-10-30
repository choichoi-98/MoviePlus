<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="/customer_service" title="고객센터 페이지로 이동">고객센터</a>
				</div>
			</div>
		</div>


		<div id="contents" class="" style="padding-left: 250px;">
			<h2 class="tit">공지사항</h2>

			<div class="tab-block mb30" style="width: 70%">
				<ul>
					<li class="tabBtn"><a
						href="${pageContext.request.contextPath}/customer_service">
							<button type="button" class="btn tabBtn" data-no=""
								title="전체공지 보기">전체</button>
					</a></li>

					<li class="tabBtn"><a
						href="${pageContext.request.contextPath}/customer_service/adminnotice">
							<button type="button" class="btn" data-no="81"
								title="무비플러스 공지 보기">무비플러스 공지</button>
					</a></li>

					<li class="tabBtn on"><a
						href="${pageContext.request.contextPath}/customer_service/regionnotice">
							<button type="button" class="btn" data-no="82" title="지점 공지 보기">지점
								공지</button>
					</a></li>

				</ul>
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
						<c:forEach var="notice" items="${RegionNotice}">
							<tr>
								<td>페이지네이션</td>
								<td>${notice.CUSTOMER_NOTICE_THEATER}</td>
								<td><a href ="${pageContext.request.contextPath}/customer_service/getnoticedetail?noticedetailnum=${notice.CUSTOMER_NOTICE_NUM}">
								${notice.CUSTOMER_NOTICE_SUBJECT}</td>
								<td>${notice.CUSTOMER_NOTICE_REGION}</td>
								<td>${notice.CUSTOMER_NOTICE_SYSDATE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- pagination -->
			<nav class="pagination">
				<strong class="active">1</strong> <a title="2페이지보기"
					href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기"
					href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기"
					href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기"
					href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기"
					href="javascript:void(0)" pagenum="6">6</a> <a title="7페이지보기"
					href="javascript:void(0)" pagenum="7">7</a> <a title="8페이지보기"
					href="javascript:void(0)" pagenum="8">8</a> <a title="9페이지보기"
					href="javascript:void(0)" pagenum="9">9</a> <a title="10페이지보기"
					href="javascript:void(0)" pagenum="10">10</a> <a
					title="이후 10페이지 보기" href="javascript:void(0)" class="control next"
					pagenum="11">next</a> <a title="마지막 페이지 보기"
					href="javascript:void(0)" class="control last" pagenum="551">last</a>
			</nav>
			<!--// pagination -->
		</div>
	</div>

	<div class="normalStyle"
		style="display: none; position: fixed; top: 0; left: 0; background: #000; opacity: 0.7; text-indent: -9999px; width: 100%; height: 100%; z-index: 100;">닫기</div>
	<div class="alertStyle"
		style="display: none; position: fixed; top: 0px; left: 0px; background: #000; opacity: 0.7; width: 100%; height: 100%; z-index: 5005;"></div>
</body>
</html>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>