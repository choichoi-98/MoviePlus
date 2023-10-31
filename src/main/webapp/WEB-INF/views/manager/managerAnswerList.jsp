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
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	
	
	<script>
		$(document).ready(function () {
			var selected_delete_notice_num;

			$('.main__table-btn--delete').click(function() {
				selected_delete_notice_num = $(this).attr('data-noticenum');
			})

			$('#delete-modal-ok').click(function() {
				location.href = '/movieplus/admin/noticedelete?noticenum=' + selected_delete_notice_num;
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
						<h2>1 &nbsp;대&nbsp; 1 문의 List</h2>

						<span class="main__title-stat"> </span>

						<div class="main__title-wrap">
							<!-- search -->
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
									<th>유 형 </th>
									<th>제 목</th>
									<th>답변상태</th>
									<th>등록일</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="m" items="${oneononeList}" varStatus="loop">
									<tr>
										<td>
											<div class="main__table-text">${m.RNUM}</div> <!-- 1부터 순차적으로 커지는 숫자 -->
										</td>
										<td>
											<div class="main__table-text">${m.CUSTOMER_TYPE}</div>
										</td>
										<td>
											<div class="main__table-text">
												<a href="oneononeanswer?CUSTOMER_NUM=${m.CUSTOMER_NUM}" ${m.CUSTOMER_ANSWERSITUATION == '완료' ? 'style="pointer-events:none;"' : ''}>${m.CUSTOMER_TITLE}</a>
											</div>
										</td>
										<td>
											<div class="main__table-text">${m.CUSTOMER_ANSWERSITUATION}</div>
										</td>
										<td>
											<div class="main__table-text">${m.CUSTOMER_REGISTRATIONDATE}</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
					</div>
				</div>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${oneononeCount}개 중 10개</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"
								${page <= 1 ? 'style="pointer-events: none;"' : ''}>
								<a href="oneononelist?page=${page-1}">
								<i class="icon ion-ios-arrow-back"></i></a></li>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="paginator__item paginator__item--active"><a
										href="#">${a }</a></li>
								</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a
										href="oneononelist?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>

							<li class="paginator__item paginator__item--next"
								${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="oneononelist?page=${page+1}"><i
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