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
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />


	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>회원 관리</h2>

						<span class="main__title-stat">총 ${memberCount}개</span>

						<div class="main__title-wrap">
							<form action="${pageContext.request.contextPath}/admin/manageMember" class="main__title-form"> 
								<input name="keyword" type="text" placeholder="ID 검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<table class="main__table">
						<thead>
							<tr>
								<th>ID</th>
								<th>이름</th>
								<th>이메일</th>
								<th>멤버쉽</th>
								<th>포인트</th>
								<th>로그인 타입</th>
								<th>관리</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="membermanage" items="${memberList}">
								<tr>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>${membermanage.MEMBER_ID}</h3>
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">${membermanage.MEMBER_NAME}</div>
									</td>
									<td>
										<div class="main__table-text">${membermanage.MEMBER_EMAIL}</div>
									</td>
									<td>
										<div class="main__table-text">${membermanage.MEMBER_MEMBERSHIP}</div>
									</td>
									<td>
										<div class="main__table-text">${membermanage.MEMBER_POINT}</div>
									</td>
									<td>
										<div class="main__table-text">로그인타입</div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#modal-delete" data-memberNum="${membermanage.MEMBER_NUM}"
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
				<div class="col-12">
					<div class="paginator-wrap">
						<span>${memberCount}개 중 10개</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev"
								${page <= 1 ? 'style="pointer-events: none;"' : ''}><a
								href="manageMember?page=${page-1}"><i
									class="icon ion-ios-arrow-back"></i></a></li>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="paginator__item paginator__item--active"><a
										href="#">${a }</a></li>
								</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a
										href="manageMember?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>

							<li class="paginator__item paginator__item--next"
								${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="manageMember?page=${page+1}"><i
									class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>


		<!-- modal delete -->
		<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
			<h6 class="modal__title">회원 삭제</h6>

			<p class="modal__text">정말로 삭제하시겠습니까?</p>

			<div class="modal__btns">
				<button id="delete-member-modal-btn"
					class="modal__btn modal__btn--apply" type="button">삭제</button>
				<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
			</div>
		</div>
		<!-- end modal delete -->
	</main>
	
	<script>
		var selectedMember;
		$(document).ready(function() {
			
			$('.main__table-btn--delete').click(function(){
				selectedMember = $(this).attr('data-memberNum');
			})
			
			$('#delete-member-modal-btn').click(function(e) {
				location.href = "deleteMember?memberNum=" + selectedMember;
			})
			
		})
	</script>
</body>
</html>