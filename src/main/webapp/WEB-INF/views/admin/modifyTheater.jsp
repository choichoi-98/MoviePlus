<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script
	src="${pageContext.request.contextPath}/resources/js/.js"></script>

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
						<h2>극장 정보 수정</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="modifyTheaterAction" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<input type="hidden" name="THEATER_ID" value="${theater.THEATER_ID}">
						<div class="row row--form">

							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<div class="col-12">
										<input type="text" name="THEATER_NAME" class="form__input"
											value="${theater.THEATER_NAME }" placeholder="극장 명" required>
									</div>

									<div class="col-12">
										<textarea id="text" name="THEATER_INTRO1"
											class="form__textarea" placeholder="극장 소개(큰 글)" required>${theater.THEATER_INTRO1}</textarea>
									</div>

									<div class="col-12">
										<textarea id="text" name="THEATER_INTRO2"
											class="form__textarea" placeholder="극장 소개(작은 글)" required>${theater.THEATER_INTRO2}</textarea>

									</div>

									<div class="col-6">
										<select class="js-example-basic-single" id="country"
											name="THEATER_LOCATION" required>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
										</select>
									</div>

									<div class="col-8">
										<input id="theater_postcode" type="text" name="THEATER_POST" class="form__input" value="${theater.THEATER_POST}"readonly>
									</div>
									<div class="col-4" >
										<button type="button" id="post-id-btn" class="form__btn" style="margin-top:0px;">우편번호 찾기</button>
									</div>
									
											
									<div class="col-12">
										<input id="theater_roadAddress" type="text" name="THEATER_ADDRESS1" class="form__input" value="${theater.THEATER_ADDRESS1}" readonly>
										<input type="text" name="THEATER_ADDRESS2" class="form__input" placeholder="상세 주소" value="${theater.THEATER_ADDRESS2}" required>	
										
										
									</div>

								</div>
							</div>

							<div class="col-12">
								<ul class="form__radio">
									<li><span>보유 시설:</span></li>
									<li><input id="type1" type="checkbox"
										name="THEATER_DISABLED_SEAT" value="CHECKED" ${theater.THEATER_DISABLED_SEAT =='CHECKED' ? 'checked' : ''}> <label
										for="type1">장애인석</label></li>
									<li><input id="type2" type="checkbox"
										name="THEATER_SPECIAL_SEAT" value="CHECKED" ${theater.THEATER_SPECIAL_SEAT =='CHECKED' ? 'checked' : ''}> <label
										for="type2">스페셜석</label></li> 
								</ul>
							</div>

							<div class="col-12">
								<textarea id="text" name="THEATER_PARKING"
									class="form__textarea" placeholder="주차 안내">${theater.THEATER_PARKING }</textarea>
							</div>

						</div>

						<div class="col-6">
							<input type="text" name="THEATER_MANAGER_ID" class="form__input" placeholder="매니저 ID" value="${theater.THEATER_MANAGER_ID}" readOnly>
							<button id="reset-password-btn" type="button" style="background:gray; width:120px; height:30px;">비밀번호 초기화</button> <span style="color:#999;">movieplus0000으로 초기화</span>
							<input id="reset-pass-check" type="hidden" value="unchecked" name="resetPassCheck">
						</div>
						


						<div class="col-12">
							<button type="submit" class="form__btn">수정</button>
						</div>
						


					</form>



				</div>

				<!-- end form -->
			</div>
		</div>
	</main>
</body>
</html>