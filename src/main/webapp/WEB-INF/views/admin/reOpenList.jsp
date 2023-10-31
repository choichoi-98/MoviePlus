<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	
	
	<script> /* 리스트에서 삭제기능 */
		$(document).ready(function () {
			var selected_delete_expect_num;

			$('.main__table-btn--delete').click(function() {
				selected_delete_expect_num = $(this).attr('data-expect-num');
			})
			
			$('#delete-modal-ok').click(function() {
				location.href = '/movieplus/admin/cancelreopen?cancelcode=' + selected_delete_expect_num;
				
				
			})
		})
		
	</script>

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>재개봉예정 영화 List</h2>

						<span class="main__title-stat"> </span>

						<div class="main__title-wrap">
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- comments -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table">
							<thead>
								<tr>
									<th>글 번 호</th>
									<th>코 드 번 호</th>
									<th>제 목</th>
									<th>시 작 일</th>
									<th>종 료 일</th>
									<th style="display: flex; justify-content: center;">관 리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="expectmovie" items="${expectMovieList}" varStatus="loop">
									<tr>
										<td>
											<div class="main__table-text">${expectmovie.RNUM}</div> <!-- 1부터 순차적으로 커지는 숫자 -->
										</td>
										<td>
											<div class="main__table-text">${expectmovie.MOVIE_CODE}</div>
										</td>
										<td>
											<div class="main__table-text">${expectmovie.MOVIE_TITLE}</div>
										</td>
										<td>
											<div class="main__table-text">${expectmovie.REOPENING_STARTDATE}</div>
										</td>
										<td>
											<div class="main__table-text">${expectmovie.REOPENING_ENDDATE}</div>
										</td>
										<td>
											<div class="main__table-btns"
												style="display: flex; justify-content: center;">
												<a href="#modal-delete" data-expect-num = "${expectmovie.MOVIE_CODE}"
													class="main__table-btn main__table-btn--delete open-modal">
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
				<!-- end comments -->
				<a href="${pageContext.request.contextPath}/admin/goreopenwrite"
					class="main__title-link">등록</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${reopenCount}개 중 10개</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"
								${page <= 1 ? 'style="pointer-events: none;"' : ''}>
								<a href="reopenexpectlist?page=${page-1}">
								<i class="icon ion-ios-arrow-back"></i></a></li>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="paginator__item paginator__item--active"><a
										href="#">${a }</a></li>
								</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a
										href="reopenexpectlist?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>

							<li class="paginator__item paginator__item--next"
								${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="reopenexpectlist?page=${page+1}"><i
									class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
	</main>
	<!-- end main content -->
	<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<div class="modal__btns"></div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title"></h6>

		<p class="modal__text">삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-modal-ok" class="modal__btn modal__btn--apply"
				type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>

</body>
</html>