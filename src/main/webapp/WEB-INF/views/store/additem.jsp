<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">

	<title></title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $("#additem").click(function(e) {
        e.preventDefault(); // 버튼의 기본 동작을 막습니다.
        
        // 선택된 값을 가져옵니다.
        var selectedValue = $("#quality").val();
        
        // 폼 데이터에 선택된 값을 추가합니다.
        $("#quality").attr("name", "ITEM_MENU"); // 선택된 값의 이름을 폼 요소의 name 속성으로 설정합니다.
        $("#quality").val(selectedValue); // 선택된 값을 폼 요소의 값으로 설정합니다.

        // 폼을 서버로 제출합니다.
        document.additemform.submit();
    });
});
</script> 

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
						<h2>상품 등록</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="additempro" method="get" enctype="multipart/form-data" class="form" name="additemform">
						<div class="row row--form">
							<div class="col-12 col-md-5 form__cover">
								<div class="row row--form">
									<div class="col-12 col-sm-6 col-md-12">
										<div class="form__img">
											<label for="form__img-upload">상품 사진 (270 x 400)</label>
											<input id="form__img-upload" name="form__img-upload" type="file" accept=".png, .jpg, .jpeg">
											<img id="form__img" src="#" alt=" ">
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<div class="col-12">
										<input type="text" class="form__input" placeholder="상품 이름" name="ITEM_NAME">
									</div>

									<div class="col-12">
										<textarea id="text" class="form__textarea" placeholder="상품 설명"></textarea>
									</div>
									
									<div class="col-12 col-sm-6 col-lg-3">
										<select class="js-example-basic-single" id="quality" name="ITEM_MENU">
											<option value="ticket">ticket</option>
											<option value="snack">snack</option>
											<option value="voucher">voucher</option>
											<option value="point">point</option>
										</select> 
									</div> 
									
									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" placeholder="가격" name="ITEM_PRICE">
									</div>
									
									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" placeholder="수량">
									</div>

									<div class="col-12 col-sm-6 col-lg-3">
										<input type="text" class="form__input" placeholder="상품 코드" name="ITEM_CODE">
									</div>

									<div class="col-12">
										<div class="form__gallery">
											<label id="gallery1" for="form__gallery-upload">상품 사진 등록</label>
											<input data-name="#gallery1" id="form__gallery-upload" name="gallery" class="form__gallery-upload" type="file" accept=".png, .jpg, .jpeg" multiple>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-1.5">
   	 							<div class="row row--form">
 	      							<div class="col-12">
            							<button id="additem" type="submit" id="additem"class="form__btn">상품 등록</button>
            							
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