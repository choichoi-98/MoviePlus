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
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/admin_theater.js"></script>

	
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>극장 관리</h2>

						<span class="main__title-stat">${theaterCount}개</span>

						<div class="main__title-wrap">
							<!-- filter sort -->
							<div class="filter" id="filter__sort">
								<span class="filter__item-label">정렬 순서</span>

								<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<input type="button" value="생성 순">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>생성 순</li>
									<li>상태</li>
									<li>매출 순</li>
									<li>관객 순</li>
									<li>지역</li>
								</ul>
							</div>
							<!-- end filter sort -->

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="극장명 검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table">
							<thead>
								<tr>
									<th>ID</th>
									<th>극장 명</th>
									<th>관리자 ID</th>
									<th>지역</th>
									<th>매출 순위</th>
									<th>관객 수(k)</th>
									<th>상태</th>
									<th>생성 날짜</th>
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="theater" items="${theaterList}">
								<tr>
									<td>
										<div class="main__table-text">${theater.THEATER_ID}</div>
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>${theater.THEATER_NAME}</h3>
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">${theater.THEATER_MANAGER_ID}</div>
									</td>
									<td>
										<div class="main__table-text">${theater.THEATER_LOCATION}</div>
									</td>
									<td>
										<div class="main__table-text">임시</div>
									</td>
									<td>
										<div class="main__table-text">임시</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">${theater.THEATER_STATUS}</div>
									</td>
									<td>
										<div class="main__table-text">${theater.THEATER_CREATED_DATE}</div>
									</td>
									<td>
										<div class="main__table-btns">
											<input type="hidden" class="selected-theater-id" value="${theater.THEATER_ID}"/>
											<a href="#" class="main__table-btn main__table-btn open-modal">
												<i class="icon ion-ios-log-out"></i>
											</a>
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i>
												<input type="hidden" class="selected-theater-status" value="${theater.THEATER_STATUS}"/>
											</a>
											<a href="#" id="theater-modify-btn" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				<!-- end users -->
				<a href="/movieplus/admin/addtheater" class="main__title-link">극장 추가</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${theaterCount} 중 10개씩</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev">
								<a href="#"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
							<li class="paginator__item"><a href="#">1</a></li>
							<li class="paginator__item paginator__item--active"><a href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item paginator__item--next">
								<a href="#"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
		
			<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">극장 상태 변경</h6>

		<p class="modal__text">극장 상태를 변경하시겠습니까? (운영|대기)</p>

		<div class="modal__btns">
			<button id="change-status-modal-btn" class="modal__btn modal__btn--apply" type="button">확인</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">극장 삭제</h6>

		<p class="modal__text">정말로 삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-theater-modal-btn" class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
</body>
</html>