<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$(function() {
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
    
    $(document).on('click', '.main__table-btn--delete', function(e) {
        e.preventDefault(); // 기본 동작인 링크 이동을 막습니다.
        
        const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾습니다.
        const itemCode = row.find('.item-code').data('icode');  // 해당 행의 ITEM_CODE 값을 추출합니다.
        
//      alert("itemCode: " + itemCode);
        $.ajax({
            url: "itemlist",
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "itemCode": itemCode },
            dataType: "text",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
				alert("삭제 성공, itemCode: " + itemCode);
                window.location.reload();
            },
            error: function(error) {
  				alert("삭제 하는중 오류, itemCode: " + itemCode);
                window.location.reload();
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
									<input type="button" value="상품">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>상품</li>
									<li>최신</li>
									<li>오래된</li>
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
    									<div class="main__table-text item-code" data-icode="${i.ITEM_CODE}">${i.ITEM_CODE}</div>
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
										<div class="main__table-text">-</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">판매중</div>
									</td>
									<td>
									<c:set var="ymd" value="<%=new java.util.Date()%>" />
									<fmt:formatDate var="fmtymd" value="${ymd}" pattern="yyyy-MM-dd" />
										<div class="main__table-text">${fmtymd}</div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i>
											</a>
											<a href="#" class="main__table-btn main__table-btn--view">
												<i class="icon ion-ios-eye"></i>
											</a>
											<a href="modifyitem?ITEM_CODE=${i.ITEM_CODE}" class="main__table-btn main__table-btn--edit"
											   id="forcode" data-code="${i.ITEM_CODE}">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#" id="deleteicon" class="main__table-btn main__table-btn--delete" >
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
    		<button class="modal__btn modal__btn--apply delete-item" type="button">삭제</button>
    		<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
</body>
</html>
