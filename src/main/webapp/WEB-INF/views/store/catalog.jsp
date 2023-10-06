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
	$(function(){
		var itemlistcount = ${itemlistcount};
	    var per1page = itemlistcount % 10;
	    // per1page 값을 <span> 요소 내에 동적으로 삽입
	    document.querySelector('div#per1page').textContent = per1page;
	})
	
<%-- function deleteItem(ITEM_CODE) {
    // AJAX 또는 폼을 사용하여 서버에 삭제 요청을 보냅니다.
    $.ajax({
        url: '/movieplus/store/admin/itemlist', // 삭제 요청을 처리할 서버의 URL
        type: 'GET', // 또는 다른 HTTP 메서드를 사용할 수 있습니다.
        data: { ITEM_CODE: ITEM_CODE }, // 삭제할 상품의 아이템 코드를 전달합니다.
        success: function(response) {
            // 서버에서의 응답을 처리합니다.
            if (response.success) {
                // 성공적으로 삭제되면 모달 창을 닫습니다.
                $('#modal-delete').modal('hide');
                // 페이지를 새로고침하거나 리스트에서 삭제된 상품을 갱신합니다.
                location.reload(); // 예시로 페이지를 새로고침합니다.
            } else {
                // 삭제 실패 시 오류 메시지를 표시합니다.
                alert('삭제 실패');
            }
        },
        error: function() {
            // AJAX 요청 실패 시 처리할 내용
            alert('요청 실패');
        }
    });
} --%>

function deleteItem(ITEM_CODE) {
    // 현재 페이지 URL을 가져옵니다.
    var currentUrl = window.location.href;
    
    // 선택한 상품 번호를 URL에 추가합니다.
    var updatedUrl = currentUrl + '?ITEM_CODE=' + ITEM_CODE;

    // 업데이트된 URL로 페이지를 리로드하거나 서버로 요청을 보냅니다.
    // 이 예제에서는 페이지를 리로드합니다.
    window.location.href = updatedUrl;
}

</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>상품 목록</h2>

						<span class="main__title-stat">${itemlistcount} Total</span>

						<div class="main__title-wrap">
							<!-- filter sort -->
							<div class="filter" id="filter__sort">
								<span class="filter__item-label">Sort by:</span>

								<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<input type="button" value="최신순">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>최신순</li>
									<li>오래된 순</li>
									<li>알파벳</li>
								</ul>
							</div>
							<!-- end filter sort -->

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="상품 검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table">
							<thead>
								<tr>
									<th>상품 코드</th>
									<th>상품 이름</th>
									<th>상품 메뉴</th>
									<th>상품 가격</th>
									<th>수량</th>
									<th>상품 표시</th>
									<th>등록 날짜</th>
									<th>옵션</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="i" items="${itemlist}">
								<tr>
									<td>
										<div class="main__table-text">${i.ITEM_CODE}</div>
									</td>
									<td>
										<div class="main__table-text">
											<a href="modifyitem?ITEM_CODE=${i.ITEM_CODE}">${i.ITEM_NAME}</a>
										</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate">snack</div>
									</td>
									<td>
										<div class="main__table-text">${i.ITEM_PRICE}</div>
									</td>
									<td>
										<div class="main__table-text">1000</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">표시</div>
									</td>
									<td>
										<div class="main__table-text">2023/10/05</div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i>
											</a>
											<a href="#" class="main__table-btn main__table-btn--view">
												<i class="icon ion-ios-eye"></i>
											</a>
											<a href="modifyitem?ITEM_CODE=${i.ITEM_CODE}" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" 
											onclick="deleteItem(${i.ITEM_CODE})">
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
				<!-- end users -->
				
            	<a href="additem" class="main__title-link">상품등록</a>

				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span><div id="per1page">${per1page}</div>/10</span>


						<ul class="paginator">
							<li class="paginator__item paginator__item--prev">
								<a href="#"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
							<li class="paginator__item paginator__item--active"><a href="#">1</a></li>
							<li class="paginator__item"><a href="#">2</a></li>
							<li class="paginator__item paginator__item--next">
								<a href="#"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
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
		<h6 class="modal__title">상태 변경</h6>

		<p class="modal__text">즉시 상태 변경을 원하십니까?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button">적용</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">상품 삭제</h6>

		<p class="modal__text">정말 등록된 해당 상품을 삭제하시겠습니까? </p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
</body>
</html>
