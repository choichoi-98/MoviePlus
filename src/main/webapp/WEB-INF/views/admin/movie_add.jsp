<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIEPLUS:관리자</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	<main class="main">
		<div class="container-fluid">
			<div class="row row--grid">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>상영 영화 관리</h2>

						<a href="add-item.html" class="main__title-link">DB 최신화</a>
					</div>
				</div>
				<!-- end main title -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>전체 영화 목록</span>
						<p>5 678</p>
						<i class="icon ion-ios-stats"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>상영 중인 영화</span>
						<p>172</p>
						<i class="icon ion-ios-film"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>상영 예정 영화</span>
						<p>2 573</p>
						<img src="${pageContext.request.contextPath}/resources/image/movie/movie_list.png"
						style="width:35px;">
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>상영 종료 영화</span>
						<p>1 021</p>
						<i class="icon ion-ios-star-half"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-trophy"></i> 전체 영화 목록</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="catalog.html">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>감독</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="main__table-text">321</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">I Dream in Another Language</a></div>
										</td>
										<td>
											<div class="main__table-text">Movie</div>
										</td>
										<td>
											<div class="main__table-text main__table-text--rate">
											<i class="icon ion-ios-star">
											</i> 9.2</div>
										</td>
									</tr>
										
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
							<h3><i class="icon ion-ios-film"></i> 상영 중인 영화</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="catalog.html">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>감독</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="main__table-text">26</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">I Dream in Another Language</a></div>
										</td>
										<td>
											<div class="main__table-text">Movie</div>
										</td>
										<td>
											<div class="main__table-text main__table-text--green">Visible</div>
										</td>
									</tr>
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
							<h3><i class="icon ion-ios-contacts"></i> 상영 예정 영화</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="users.html">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>감독</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="main__table-text">23</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">Brian Cranston</a></div>
										</td>
										<td>
											<div class="main__table-text main__table-text--grey">bcxwz@email.com</div>
										</td>
										<td>
											<div class="main__table-text">BrianXWZ</div>
										</td>
									</tr>
									
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
							<h3><i class="icon ion-ios-star-half"></i> 상영 종료 영화</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="reviews.html">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>감독</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="main__table-text">51</div>
										</td>
										<td>
											<div class="main__table-text"><a href="#">I Dream in Another Language</a></div>
										</td>
										<td>
											<div class="main__table-text">Jonathan Banks</div>
										</td>
										<td>
											<div class="main__table-text main__table-text--rate"><i class="icon ion-ios-star"></i> 7.2</div>
										</td>
									</tr>
									
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