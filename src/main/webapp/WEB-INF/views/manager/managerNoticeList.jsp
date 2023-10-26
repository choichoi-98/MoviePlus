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
<title>공지사항 목록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	
	
	<script>
		$(document).ready(function () {
			var selected_manager_notice_num;

			$('.main__table-btn--delete').click(function() {
				selected_manager_notice_num = $(this).attr('data-managernoticenum');
			})

			$('#delete-modal-ok').click(function() {
				location.href = '/movieplus/manager/noticedelete?noticenum=' + selected_manager_notice_num;
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
						<h2>공지사항 List</h2>

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
									<th>유 형</th>
									<th>제 목</th>
									<th>작 성 일</th>
									<th style="display: flex; justify-content: center;">관 리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="noticelist" items="${NoticeList}" varStatus="loop">
									<tr>
										<td>
											<div class="main__table-text">1</div> <!-- 1부터 순차적으로 커지는 숫자 -->
										</td>
										<td>
											<div class="main__table-text">${noticelist.CUSTOMER_NOTICE_TYPE}</div>
										</td>
										<td>
											<div class="main__table-text">
												<a href = "${pageContext.request.contextPath}/manager/gonoticemodify?managernoticenum=${noticelist.CUSTOMER_NOTICE_NUM}">${noticelist.CUSTOMER_NOTICE_SUBJECT}</a>
											</div>
										</td>
										<td>
											<div class="main__table-text">${noticelist.CUSTOMER_NOTICE_SYSDATE}</div>
										</td>
										<td>
											<div class="main__table-btns"
												style="display: flex; justify-content: center;">
												<a href="#modal-delete"
													data-managernoticenum="${noticelist.CUSTOMER_NOTICE_NUM}"
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
				<a href="${pageContext.request.contextPath}/manager/noticeregist"
					class="main__title-link">작성하기</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"><a
								href="#"><i class="icon ion-ios-arrow-back"></i></a></li>
							<li class="paginator__item"><a href="#">1</a></li>
							<li class="paginator__item paginator__item--active"><a
								href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item paginator__item--next"><a
								href="#"><i class="icon ion-ios-arrow-forward"></i></a></li>
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