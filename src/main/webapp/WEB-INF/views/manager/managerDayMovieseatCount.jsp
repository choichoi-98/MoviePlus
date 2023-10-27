<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
	
	
<head>	
<meta charset="UTF-8">
<title>MoviePlus</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp"/>

	
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>누적관객수 순위</h2>

						<span class="main__title-stat"> <b>${eventlistcount}</b></span>

						<div class="main__title-wrap">
						 
							<!-- filter sort -->
							<div class="filter" id="filter__sort">
								<span class="filter__item-label">정렬 순서</span>

								<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<input type="button" value="생성 순">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>마감 임박순</li>
									<li>최신순</li>
									<li>탭 별</li>
								</ul>
							</div>
							<!-- end filter sort -->

						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
						<table class="main__table">
							<thead>
								<tr>
									<th>순위</th>
									<th>영화코드</th>
									<th>영화명</th>
									<th>관객수</th>
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
							  <c:forEach var="seatCount" items="${dayMovieseatCount}">
								<tr>
									<td>
										<div class="main__table-text">${seatCount.RNUM}</div><!-- 이벤트 번호 -->
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>${seatCount.MOVIE_CODE}</h3><!-- 이벤트 분류 -->
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">
										<a href="#">${seatCount.MOVIE_TITLE}</a>
										</div><!-- 이벤트 제목 / 클릭시 이벤트 뷰 페이지로 이동 -->
									</td>
									<td>
										<div class="main__table-text">${seatCount.rate}</div><!-- 이벤트 기간 -->
									</td>
									<td>
										<div class="main__table-btns">
											<a href="" class="main__table-btn main__table-btn move-to-manager-menu">
												<i class="icon ion-ios-log-out" title=""></i>
											</a>
											<a href=""  class="main__table-btn main__table-btn move-to-manager-menu">
												<i class="icon ion-ios-eye" title=""></i>
											</a>
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock" title=""></i>
											</a>
											<a href="" id="event-modify-btn" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create" title=""></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash" title=""></i>
											</a>
										</div>
									</td>
								</tr>
							  </c:forEach>	
							</tbody>
						</table>
			      	
				</div>
				<!-- end users -->
			</div>
		</div>
		
			<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 상태 변경</h6>

		<p class="modal__text">이벤트 상태를 변경하시겠습니까? (진행중/종료)</p>

		<div class="modal__btns">
			<button id="change-status-modal-btn" class="modal__btn modal__btn--apply" type="button">확인</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 삭제</h6>

		<p class="modal__text">정말로 이벤트를 삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-event-modal-btn" class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
	
	
</body>
</html>