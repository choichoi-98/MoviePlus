<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/manager_room.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>극장 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="addRoomAction" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">

						<div class="col-12">
							<input type="text" name="THEATER_ROOM_NAME" class="form__input"
								placeholder="극장 명" value="${roomName }">
						</div>
						<div class="col-12">C
							<span style="color: #999;">※ 좌석 타입 선택 (선택 시 미리보기)</span>
						</div>

						<div class="row row--form">
							<div class="col-12">
								<ul class="form__radio">
									<li><span>좌석 타입 :</span></li>
									<li><input id="type1" type="radio"
										class="THEATER_SEAT_TYPE" name="THEATER_ROOM_SEAT_TYPE"
										value="TYPE-A"> <label for="type1">A타입</label></li>
									<li><input id="type2" type="radio"
										class="THEATER_SEAT_TYPE" name="THEATER_ROOM_SEAT_TYPE"
										value="TYPE-B"> <label for="type2">B타입</label></li>
									<li><input id="type3" type="radio"
										class="THEATER_SEAT_TYPE" name="THEATER_ROOM_SEAT_TYPE"
										value="TYPE-C"> <label for="type3">C타입</label></li>
								</ul>
							</div>
						</div>



						<div class="col-12">
							<button type="submit" class="form__btn">등록</button>
						</div>
					</form>


					<div id="div-type1" class="col-8 display-seat"
						style="display: none;">
						<img
							src="${pageContext.request.contextPath}/resources/image/seat/seat-A.png" />
					</div>
					<div id="div-type2" class="col-8 display-seat"
						style="display: none;">
						<img
							src="${pageContext.request.contextPath}/resources/image/seat/seat-B.png" />
					</div>

					<div id="div-type3" class="col-8 display-seat"
						style="display: none;">
						<img
							src="${pageContext.request.contextPath}/resources/image/seat/seat-C.png" />
					</div>


				</div>

				<!-- end form -->
			</div>
		</div>
	</main>

</body>

</html>