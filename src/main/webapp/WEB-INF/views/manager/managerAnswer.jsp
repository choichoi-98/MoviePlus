<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/admin.css">

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>1대1 문의 답변</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="managersendanswer" class="form" METHOD="POST">
						<input type="hidden" name="CUSTOMER_NUM" VALUE="${VO.CUSTOMER_NUM}">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div class="row row--form">
							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									
									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" value="${VO.CUSTOMER_TYPE}" READONLY>
									</div>
									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" name = "CUSTOMER_EMAIL" value="${VO.CUSTOMER_EMAIL}" READONLY>
									</div>
									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" value="${VO.CUSTOMER_REGISTRATIONDATE}" READONLY>
									</div>
									<div class="col-12">
										<input type="text" class="form__input" value="${VO.CUSTOMER_TITLE}" READONLY>
									</div>

									<div class="col-12">
										<textarea id="text" style= "height: 250px;" class="form__textarea" READONLY>${VO.CUSTOMER_CONTENT}</textarea>
									</div>

									<div class="col-12">
										<textarea id="text" style= "height: 250px;" name="CUSTOMER_CONTENT" class="form__textarea" placeholder="답변 작성"></textarea>
									</div>

									<div class="col-12" style="display:flex; margin-left: 75%;">
										<a href="#"><button type="button" class="form__btn" style="margin-right:20px;">뒤로</button></a>
										<button type="submit"class="form__btn">수정

											
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>

</body>
</html>