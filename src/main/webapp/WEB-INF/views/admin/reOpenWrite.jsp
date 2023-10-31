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
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	
	
	<script>
		$(document).ready(function () {
			var selected_movieCode;

			$('.main__table-btn--banned').click(function() {
				selected_movieCode = $(this).attr('data-movieCode');
			})

			$('#reopen_regist_btn').click(function() {
				location.href = '/movieplus/admin/reopenexpect?movieCode=' + selected_movieCode;
			})
		});
	</script>

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>상영종료영화 list</h2>

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
									<th>영화코드번호</th>
									<th>영화제목</th>
									<th style="display: flex; justify-content: center;">재개봉 예정등록</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="endedmovie" items="${EndMovieList}" varStatus="loop">
									<tr>
										<td>
											<div class="main__table-text">${endedmovie.RNUM}</div> <!-- 1부터 순차적으로 커지는 숫자 -->
										</td>
										<td>
											<div class="main__table-text">
												<a>${endedmovie.movie_Code}</a>
											</div>
										</td>
										<td>
											<div class="main__table-text">${endedmovie.movie_Title}</div>
										</td>
										<td>
											<div class="main__table-btns"
												style="display: flex; justify-content: center;">
												<a href="#modal-status" data-movieCode="${endedmovie.movie_Code}" 
													class="main__table-btn main__table-btn--banned open-modal">
													<i class="icon ion-ios-create"></i>
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
				<a href="${pageContext.request.contextPath}/admin/reopenexpectlist"
					class="main__title-link">뒤로</a>
					
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${EndMovieCount}개 중 10개</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"
								${page <= 1 ? 'style="pointer-events: none;"' : ''}>
								<a href="reOpenWrite?page=${page-1}">
								<i class="icon ion-ios-arrow-back"></i></a></li>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="paginator__item paginator__item--active"><a
										href="#">${a }</a></li>
								</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a
										href="goreopenwrite?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>

							<li class="paginator__item paginator__item--next"
								${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="goreopenwrite?page=${page+1}"><i
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
	<!-- end modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">재개봉 등록</h6>

		<p class="modal__text">등록하시겠습니까?</p>

		<div class="modal__btns">
			<button id="reopen_regist_btn" class="modal__btn modal__btn--apply" type="button">등록</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	

</body>
</html>