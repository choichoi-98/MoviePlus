<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	
<head>	
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/admin_movieReview.js"></script>

	
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>감상평 관리</h2>

						<span class="main__title-stat">${reviewCnt}개</span>

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
								<input type="text" placeholder="영화명 검색">
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
						<table class="main__table">
							<thead>
								<tr>
									<th>영화 제목</th>
									<th>회원 ID</th>
									<th>회원 이름</th>
									<th>관람평 내용</th>
									<th>등록일</th>
									<th>좋아요 수</th>
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="review" items="${reviewList}">
								<tr>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>${review.movie_Title}</h3>
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">${review.member_Id}</div>
									</td>
									<td>
										<div class="main__table-text">${review.member_Name}</div>
									</td>
									<td>
										<div class="main__table-text">${review.movie_Review_content}</div>
									</td>
									<td>
										<div class="main__table-text">${review.movie_Review_reg_date}</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">${review.movie_Review_like_cnt}</div>
									</td>
									<td>
										<div class="main__table-btns">
											
											
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
												<input type="hidden" class="delete-movie-review" value="${review.movie_Review_num }">
											</a>
										</div>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
				</div>
				<!-- end users -->
				
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${reviewCnt} 중 10개씩</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev" ${page <= 1 ? 'style="pointer-events: none;"' : ''}>
							    <a href="managetheater?page=${page-1}"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
			
							<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<c:if test="${a == page }">
										<li class="paginator__item paginator__item--active" ><a href="#">${a }</a></li>
									</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a href="manageMovieReview?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>
							
							<li class="paginator__item paginator__item--next" ${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="manageMovieReview?page=${page+1}"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
		


	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">관람평 삭제</h6>

		<p class="modal__text">정말로 삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-review-modal-btn" class="modal__btn modal__btn--apply" type="button">삭제</button>
			<input type="hidden" id="delete_review_num" value=>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
</body>
</html>