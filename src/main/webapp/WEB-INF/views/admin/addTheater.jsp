<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2>극장 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="addTheaterAction" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
						<div class="row row--form">

							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<div class="col-12">
										<input type="text" name="THEATER_NAME" class="form__input" placeholder="극장 명" required>
									</div>

									<div class="col-12">
										<textarea id="text" name="THEATER_INTRO1" class="form__textarea"
											placeholder="극장 소개(큰 글)" required ></textarea>
									</div>

									<div class="col-12">
										<textarea id="text" name="THEATER_INTRO2" class="form__textarea"
											placeholder="극장 소개(작은 글)" required></textarea>

									</div>

									<div class="col-12 col-sm-6">
										<select class="js-example-basic-single" id="country"
											name="THEATER_LOCATION" required>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
										</select>
									</div>
									
									<div class="col-12">
										<input type="text" name="THEATER_ADDRESS" class="form__input" placeholder="주소" required>
									</div>

								</div>
							</div>

							<div class="col-12">
								<ul class="form__radio">
									<li><span>보유 시설:</span></li>
									<li><input id="type1" type="checkbox" name="THEATER_DISABLED_SEAT" value="CHECKED"> 
										<label for="type1">장애인석</label></li>
									<li><input id="type2" type="checkbox" name="THEATER_SPEICAL_SEAT" value="CHECKED">
										<label for="type2">스페셜석</label></li>
								</ul>
							</div>

							<div class="col-12">
								<textarea id="text" name="THEATER_PARKING" class="form__textarea"
									placeholder="주차 안내"></textarea>
							</div>

						</div>

						<div class="col-12">
							<span style="color:#999;">※ 극장 생성 시 관리자 아이디 및 비밀번호가 자동으로 생성되어 제공됩니다.</span>
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