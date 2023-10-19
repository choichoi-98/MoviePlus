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
<title>재개봉 관리 리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	
	
	<script> /* 리스트에서 삭제기능 */
		$(document).ready(function () {
			var selected_delete_notice_num;

			$('.main__table-btn--delete').click(function() {
				selected_delete_notice_num = $(this).attr('data-noticenum');
			})

			$('#delete-modal-ok').click(function() {
				location.href = '/movieplus/admin/noticedelete?noticenum=' + selected_delete_notice_num;
			})
		})
		/* 리스트 개수를 확인하는 기능 */
		  $(document).ready(function () {
        // 글의 개수를 가져오는 부분
        var total = ; // list2는 CUSTOMER_NOTICE_TYPE컬럼의 값이 string(전체)인 데이터의 수
        // "글 개수"란 아래에 출력${list2.size()}
        var countElement = document.createElement("span"); //변수설정 countElement는 HTML전체문서에서 SPAN요소를 추가함
        countElement.textContent = "총 작성글 " + total + " 개" ; //
        document.querySelector('.main__title-stat').appendChild(countElement);
    });
		
	</script>

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>재개봉 영화 List</h2>

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
									<th style="display: flex; justify-content: center;">관 리</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="m" items="${list2}" varStatus="loop">
									<tr>
										<td>
											<div class="main__table-text">${loop.index + 1}</div> <!-- 1부터 순차적으로 커지는 숫자 -->
										</td>
										<td>
											<div class="main__table-text">
												<a href="${pageContext.request.contextPath}/admin/gonoticemodify?noticemodify=${m.CUSTOMER_NOTICE_NUM}">${m.CUSTOMER_NOTICE_SUBJECT}</a>
											</div>
										</td>
										<td>
											<div class="main__table-text">${m.CUSTOMER_NOTICE_TYPE}</div>
										</td>
										<td>
											<div class="main__table-text">${m.CUSTOMER_NOTICE_SYSDATE}</div>
										</td>
										<td>
											<div class="main__table-btns"
												style="display: flex; justify-content: center;">
												<a href="#modal-delete"
													data-noticenum="${m.CUSTOMER_NOTICE_NUM}"
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
				<a href="${pageContext.request.contextPath}/admin/gonoticewrite"
					class="main__title-link">등록하기</a>
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