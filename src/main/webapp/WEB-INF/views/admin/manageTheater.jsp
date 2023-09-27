<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	
<head>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>극장 관리</h2>

						<span class="main__title-stat">100개</span>

						<div class="main__title-wrap">
							<!-- filter sort -->
							<div class="filter" id="filter__sort">
								<span class="filter__item-label">정렬 순서</span>

								<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<input type="button" value="Date created">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>지역</li>
									<li>매출</li>
									<li>이름</li>
								</ul>
							</div>
							<!-- end filter sort -->

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="극장 검색">
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
									<th>ID</th>
									<th>극장 명</th>
									<th>관리자 ID</th>
									<th>지역</th>
									<th>매출 순위</th>
									<th>관객 수(k)</th>
									<th>상태</th>
									<th>생성 날짜</th>
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>
										<div class="main__table-text">1</div>
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>강남</h3>
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">gangnam</div>
									</td>
									<td>
										<div class="main__table-text">서울</div>
									</td>
									<td>
										<div class="main__table-text">1</div>
									</td>
									<td>
										<div class="main__table-text">2k</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--green">운영 중</div>
									</td>
									<td>
										<div class="main__table-text">24 Oct 2021</div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#" class="main__table-btn main__table-btn open-modal">
												<i class="icon ion-ios-log-out"></i>
											</a>
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i>
											</a>
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<div class="main__table-text">2</div>
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>노원</h3>
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">nowon123</div>
									</td>
									<td>
										<div class="main__table-text">서울</div>
									</td>
									<td>
										<div class="main__table-text">2</div>
									</td>
									<td>
										<div class="main__table-text">3k</div>
									</td>
									<td>
										<div class="main__table-text main__table-text--red">대기</div>
									</td>
									<td>
										<div class="main__table-text">24 Oct 2021</div>
									</td>
									<td>
										<div class="main__table-btns">
											<a href="#" class="main__table-btn main__table-btn open-modal">
												<i class="icon ion-ios-log-out"></i>
											</a>
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock"></i>
											</a>
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- end users -->
				<a href="/movieplus/admin/addtheater" class="main__title-link">극장 추가</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span>10 from 3 702</span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev">
								<a href="#"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
							<li class="paginator__item"><a href="#">1</a></li>
							<li class="paginator__item paginator__item--active"><a href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item paginator__item--next">
								<a href="#"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
		
			<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">Status change</h6>

		<p class="modal__text">Are you sure about immediately change status?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button">Apply</button>
			<button class="modal__btn modal__btn--dismiss" type="button">Dismiss</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">User delete</h6>

		<p class="modal__text">Are you sure to permanently delete this user?</p>

		<div class="modal__btns">
			<button class="modal__btn modal__btn--apply" type="button">Delete</button>
			<button class="modal__btn modal__btn--dismiss" type="button">Dismiss</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
</body>
</html>