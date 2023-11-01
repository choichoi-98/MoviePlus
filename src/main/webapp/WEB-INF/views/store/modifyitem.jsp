<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

	<title></title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>

</head>
<body>
	<!-- sidebar -->
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<!-- end sidebar -->

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>상품 수정</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="modifyitempro" method="post" class="form" enctype="multipart/form-data"
						  name="modifyitemform">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="row row--form">
							<div class="col-12 col-md-5 form__cover">
								<div class="row row--form">
									<div class="col-12 col-sm-6 col-md-12">
										<div class="form__img">
											<label for="form__img-upload"></label>
											<input id="form__img-upload" name="pic" type="file" accept=".png, .jpg, .jpeg">
											<img id="form__img" src="${pageContext.request.contextPath}/upload/${i.ITEM_FILE}" alt="상품 사진 (270 x 400)">
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<div class="col-12">
										<input type="text" class="form__input" value="${get1item.ITEM_NAME}" placeholder="상품 이름" name="ITEM_NAME">
									</div>

									<div class="col-12">
										<textarea id="text" name="text" class="form__textarea" placeholder="상품 설명"></textarea>
									</div>
									
									<div class="col-12 col-sm-6 col-lg-3">
										<select class="js-example-basic-single" id="quality">
											<option value="ticket">ticket</option>
											<option value="snack">snack</option>
											<option value="voucher">voucher</option>
											<option value="point">point</option>
										</select>
									</div>

									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" value="${get1item.ITEM_PRICE}" placeholder="가격" name="ITEM_PRICE">
									</div>

									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" placeholder="수량">
									</div>

									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" value="${get1item.ITEM_CODE}" placeholder="상품코드" name="ITEM_CODE" readonly>
									</div>

									<!-- <div class="col-12">
										<div class="form__gallery">
											<label id="gallery1" for="form__gallery-upload">상품 사진 등록</label>
											<input data-name="#gallery1" id="form__gallery-upload" name="gallery" class="form__gallery-upload" type="file" accept=".png, .jpg, .jpeg" multiple>
										</div>
									</div> -->
								</div>
							</div>

							<div class="col-lg-1.5">
   	 							<div class="row row--form">
 	      							<div class="col-12">
            							<button type="submit" class="form__btn" onClick="location.href='itemlist'">상품 수정</button>
        							</div>
    							</div>
							</div>
							<div class="col-lg-1">
    							<div class="row row--form">
       					 			<div class="col-12">
            							<button type="button" class="form__btn" onClick="location.href='itemlist'">취소</button>
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
	<!-- end main content -->
</body>
</html>