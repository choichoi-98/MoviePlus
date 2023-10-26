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
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp" />

	<input type="hidden" name="currentPage" value="1">

	<div id="myLoactionInfo" style="display: none;">
		<div class="location">
			<span>Home</span> <a href="https://megabox.co.kr/mypage"
				title="나의 메가박스 페이지로 이동">나의 메가박스</a> <a
				href="https://megabox.co.kr/mypage/myinquiry"
				title="나의 문의내역 페이지로 이동">나의 문의내역</a>
		</div>
	</div>

	<div id="contents">
		<h2 class="tit">나의 문의내역</h2>
		<div class="mypage-infomation mt20">
			<ul class="dot-list mb20">
				<li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
				<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
			</ul>

			<div class="btn-group right">
				<a
					href="${pageContext.request.contextPath}/customer_service/oneonone"
					class="button" id="inqBtn" title="1:1 문의하기">1:1 문의하기</a>
			</div>
		</div>

		<div class="board-list-util mb10">

			<div class="dropdown bootstrap-select bs3">
				<select id="custInqStatCd"
					onchange="javascript:$(&#39;#searchBtn&#39;).click();" class=""
					tabindex="-98">
					<option value="">전체</option>


					<option value="INQST1">미답변</option>

					<option value="INQST2">답변완료</option>

				</select>
				<button type="button"
					class="btn dropdown-toggle btn-default bs-placeholder"
					data-toggle="dropdown" role="button" data-id="custInqStatCd"
					title="전체">
					<div class="filter-option">
						<div class="filter-option-inner">
							<div class="filter-option-inner-inner">전체</div>
						</div>
					</div>
					<span class="bs-caret"><span class="caret"></span></span>
				</button>
				<div class="dropdown-menu open" role="combobox">
					<div class="inner open" role="listbox" aria-expanded="false"
						tabindex="-1">
						<ul class="dropdown-menu inner "></ul>
					</div>
				</div>
			</div>

			<div class="board-search ml07">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요."
					class="input-text" id="searchTxt" value="">
				<button type="button" class="btn-search-input" id="searchBtn">검색</button>
			</div>
		</div>

		<div class="table-wrap">
			<table class="board-list a-c">
				<colgroup>
					<col style="width: 80px">
					<col style="width: 140px;">
					<col style="width: 120px;">
					<col>
					<col style="width: 160px;">
					<col style="width: 100px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">극장</th>
						<th scope="col">유형</th>
						<th scope="col">제목</th>
						<th scope="col">답변상태</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="myinjury" items="${MyInjury}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${myinjury.CUSTOMER_SELECT_CENEMA}</td>
						<td>${myinjury.CUSTOMER_TYPE}</td>
						<td><a href="myinjurydetail?detailnum=${myinjury.CUSTOMER_NUM}" title="문의내역 상세보기">${myinjury.CUSTOMER_TITLE}
						</a></td>
						<td>${myinjury.CUSTOMER_ANSWERSITUATION}</td>
						<td>${myinjury.CUSTOMER_REGISTRATIONDATE}</td>
					</tr>
					</c:forEach>
				</tbody>
				<!-- <tr>
				<td colspan="6">목록이 없습니다.</td></tr> -->
			</table>
		</div>
		<!-- pagination -->
		<nav class="pagination"></nav>
		<!--// pagination -->
	</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>