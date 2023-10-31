<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	
		<main class="main">
		<div class="container-fluid">
			<div class="row row--grid">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>대쉬보드</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>일일 총 관객수</span>
						<p>${daySeatCount}</p>
						<i class="icon ion-ios-stats"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>일일 티켓 총 수익</span>
						<p>${dayTicketSales}</p>
						<i class="icon ion-ios-film"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>일일 상품 총 수익</span>
						<p>${dayGoodsSales}</p>
						<i class="icon ion-ios-chatbubbles"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>일일 티켓+상품 총 수익</span>
						<p>${dayTotalSales}</p>
						<i class="icon ion-ios-star-half"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-trophy"></i>실시간 예매율</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="${pageContext.request.contextPath}/admin/total">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>순위</th>
										<th>영화명</th>
										<th>예매율</th>
									</tr>
								</thead>
								<tbody>
								 	<c:forEach var="totallist" items="${totallist}" begin="0" end="4">
									<tr>
										<td>
											<div class="main__table-text">${totallist.RNUM}</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">${totallist.MOVIE_TITLE}</a></div>
										</td>
										<td>
											<div class="main__table-text">${totallist.ratio}</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- end dashbox -->

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-film"></i>당월 전체 영화 예매율</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="${pageContext.request.contextPath}/admin/monthtotalcount">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>순위</th>
										<th>영화명</th>
										<th>예매율</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="month" items="${monthReserveRate}" begin="0" end="4">
									<tr>
										<td>
											<div class="main__table-text">${month.RNUM}</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">${month.MOVIE_TITLE}</a></div>
										</td>
										<td>
											<div class="main__table-text">${month.ratio}</div>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- end dashbox -->

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-contacts"></i>일일 좌석 판매율</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="${pageContext.request.contextPath}/admin/ticketSalesRate">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>순위</th>
										<th>영화명</th>
										<th>판매율</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="TicketSalesRate" items="${dayTicketSalesRate}" begin="0" end="4">
									<tr>
										<td>
											<div class="main__table-text">${TicketSalesRate.RNUM}</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">${TicketSalesRate.MOVIE_TITLE}</a></div>
										</td>
										<td>
											<div class="main__table-text">${TicketSalesRate.ratio}</div>
										</td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- end dashbox -->

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-star-half"></i>영화별 누적 관객수</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="${pageContext.request.contextPath}/admin/totalcount">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>순위</th>
										<th>영화명</th>
										<th>관객수</th>
									</tr>
								</thead>
								<tbody>
								 <c:forEach var="dayMovieseatCount" items="${dayMovieseatCount}" begin="0" end="4">
									<tr>
										<td>
											<div class="main__table-text">${dayMovieseatCount.RNUM}</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">${dayMovieseatCount.MOVIE_TITLE}</a></div>
										</td>
										<td>
											<div class="main__table-text">${dayMovieseatCount.rate}</div>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- end dashbox -->
			</div>
		</div>
	</main>
</body>
</html>