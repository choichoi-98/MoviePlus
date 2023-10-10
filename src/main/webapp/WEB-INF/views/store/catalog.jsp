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
		if(itemlistcount == 10) {
			var per1page = 10;
		} else {
			var per1page = itemlistcount % 10;
		}
	    // per1page 값을 <span> 요소 내에 동적으로 삽입
	    document.querySelector('div#per1page').textContent = per1page;
	})
	
	$(function() {
		let token = $("meta[name='_csrf']").attr("content");
		let header = $("meta[name='_csrf_header']").attr("content");
		
    	// "삭제" 버튼 클릭 이벤트 처리
    	$('#delitem').click(function() {
        	// 해당 행에서 ITEM_CODE
        	var secondTableRow = document.querySelector('table.main__table tbody tr');
			// 첫 번째 td 요소 선택
			var firstTableCell = secondTableRow.querySelector('td:first-child');
			// div 요소 내부의 값을 가져오기
			var ITEM_CODE = firstTableCell.querySelector('div').textContent;

        	// 서버로 삭제 요청 보내기 (AJAX를 사용하여 비동기 요청)
        	$.ajax({
    			url: 'delitem', // 서버의 삭제 요청 URL을 입력하세요.
    			method: 'POST', // 삭제 요청의 HTTP 메서드를 지정하세요.
    			data: { "ITEM_CODE":ITEM_CODE }, // itemCode 값을 보냅니다.
//    			dataType: "json",
            	beforeSend : function(xhr){
                	xhr.setRequestHeader(header, token);
            	},
    			success: function(response) {
        			// 삭제 요청이 성공하면 페이지를 새로 고침하거나 필요한 작업을 수행하세요.
        			location.reload(); // 예: 페이지 새로 고침
    			},
    			error: function() {
     	   		console.log('삭제 실패');
    			}
			});
    	});
	}); 
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
									<li>메뉴별</li>
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
										<div ID="thisItem" class="main__table-text">${i.ITEM_CODE}</div>
									</td>
									<td>
										<div class="main__table-text">
											<a href="modifyitem?ITEM_CODE=${i.ITEM_CODE}">${i.ITEM_NAME}</a>
										</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--rate">${i.ITEM_MENU}</div>
									</td>
									<td>
										<div class="main__table-text">${i.ITEM_PRICE}</div>
									</td>
									<td>
										<div class="main__table-text">1000</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">판매중</div>
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
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal" >
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
			<button id='delitem' class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
</body>
</html>
