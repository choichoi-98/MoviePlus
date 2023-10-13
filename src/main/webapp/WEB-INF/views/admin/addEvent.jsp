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
	<script src="${pageContext.request.contextPath}/resources/js/admin_theater.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>이벤트 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form enctype="multipart/form-data" id="eventadd" action="" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div class="row row--form">

							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<div class="col-12">
										<input type="text" name="THEATER_NAME" class="form__input"
											placeholder="이벤트 제목" required>
									</div>

									<div class="col-12">
										<textarea id="text" name="THEATER_INTRO1"
											class="form__textarea" placeholder="극장 소개(큰 글)" required></textarea>
									</div>
									
									<div class="col-12">
										<input type="file" id="eventupfile" name="uploadfile" accept=".jpg, .png" value="">
                                </div>

									<div class="col-6">
										<select class="js-example-basic-single" id="country"
											name="THEATER_LOCATION" required>
											<c:forEach var="loc" items="${locationList}">
												<option value="${loc.value}">${loc.value}</option>
											</c:forEach>
										</select>
									</div>

								</div>
							</div>

						</div>

						<div class="col-6">
							<input type="text" name="MEMBER_ID" class="form__input" placeholder="매니저 ID" value="${managerId}" readOnly>
						</div>
						<div class="col-6">
							<input type="password" name="MEMBER_PASS" class="form__input" placeholder="비밀번호" required>
						</div>


						<div class="col-12">
							<button type="submit" class="form__btn">등록</button>
						</div>


					</form>



				</div>

				<!-- end form -->
			</div>
		</div>
	</main>
</body>
</html>