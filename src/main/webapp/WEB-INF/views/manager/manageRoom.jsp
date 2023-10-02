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
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />

	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>상영관 관리</h2>
						<span class="main__title-stat">총 ${roomCount}관</span>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<table class="main__table">
						<thead>
							<tr>
								<th>관</th>
								<th>좌석</th>
								<th>상태</th>
								<th>생성 날짜</th>
								<th>관리</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="roomList" items="${roomList}">
								<tr>
									<td>
										<div class="main__table-text">${roomList.THEATER_ROOM_NAME}</div>
									</td>
									<td>
										<div class="main__table-text">${roomList.THEATER_ROOM_SEAT_TYPE}</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">${roomList.THEATER_ROOM_STATUS}</div>
									</td>
									<td>
										<div class="main__table-text">${roomList.THEATER_ROOM_CREATED_DATE}</div>
									</td>
									<td>
										<div class="main__table-btns">
											<input type="hidden" class="selected-theater-id"
												value="${roomList.THEATER_ROOM_ID}" /> <a
												href="#modal-status"
												class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i> <input type="hidden"
												class="selected-theater-status"
												value="${roomList.THEATER_ROOM_STATUS}" />
											</a> <a href="#" id="theater-modify-btn"
												class="main__table-btn main__table-btn--edit"> <i
												class="icon ion-ios-create"></i>
											</a> <a href="#modal-delete"
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
				<!-- end users -->
				<a href="/movieplus/manager/addroom" class="main__title-link">상영관
					추가</a>
			</div>
		</div>

		<!-- modal status -->
		<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
			<h6 class="modal__title">상영관 상태 변경</h6>

			<p class="modal__text">상영관 상태를 변경하시겠습니까? (운영|대기)</p>

			<div class="modal__btns">
				<button id="change-status-modal-btn"
					class="modal__btn modal__btn--apply" type="button">확인</button>
				<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
			</div>
		</div>
		<!-- end modal status -->

		<!-- modal delete -->
		<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
			<h6 class="modal__title">상영관 삭제</h6>

			<p class="modal__text">정말로 삭제하시겠습니까?</p>

			<div class="modal__btns">
				<button id="delete-theater-modal-btn"
					class="modal__btn modal__btn--apply" type="button">삭제</button>
				<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
			</div>
		</div>
		<!-- end modal delete -->
	</main>
</body>
</html>