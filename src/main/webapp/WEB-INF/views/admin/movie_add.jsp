<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVIEPLUS:관리자</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/movie_add.js"></script>
<style>
#modal-view > div{
width:100%;
}
#modal-view > div > div{
width:100%;
}
</style>
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

						<a href="#" class="main__title-link" id="updateDBButton">DB 최신화</a>
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
								<a id="movieListAllModal" class="main__table-btn main__table-btn--view open-modal" href="#modal-view">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash" id="movieListAllTable">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>상영상태</th>
										<th>관리</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<!-- end dashbox -->
				<!-- 전체 영화 목록 모달 modal -->
				<!-- modal view -->
	<div id="modal-view" class="mfp-hide movieListAllModal" style="width:800px;margin-left: 450px;">
		<div class="col-12 col-xl-6" style="width:800px">
					<div class="dashbox" style="width:800px">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-trophy"></i> 전체 영화 목록</h3>

							<div class="dashbox__wrap">
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash" id="movieListAllTableModal">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>상영상태</th>
										<th>관리</th>
									</tr>
								</thead>
									
							</table>
						</div>
				<!-- paginator -->
				<div class="col-12">
    <div class="paginator-wrap">
        <span>${theaterCount} 중 20개씩</span>

        <ul class="paginator">
            <li class="paginator__item paginator__item--prev" ${page <= 1 ? 'style="pointer-events: none;"' : ''}>
                <a href="#" onclick="changePage(${page-1})"><i class="icon ion-ios-arrow-back"></i></a>
            </li>

            <c:forEach var="a" begin="${startpage}" end="${endpage}">
                <c:if test="${a == page }">
                    <li class="paginator__item paginator__item--active" ><a href="#" onclick="changePage(${a })">${a }</a></li>
                </c:if>
                <c:if test="${a != page }">
                    <li class="paginator__item"><a href="#" onclick="changePage(${a })">${a}</a></li>
                </c:if>
            </c:forEach>
            
            <li class="paginator__item paginator__item--next" ${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
                <a href="#" onclick="changePage(${page+1})"><i class="icon ion-ios-arrow-forward"></i></a>
            </li>
        </ul>
    </div>
</div>

				<!-- end paginator -->
					</div>
				</div>
	</div>
	<!-- end modal view -->
				<!-- dashbox -->
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
										<th>상영상태</th>
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
				<!-- end dashbox -->


				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-star-half"></i> 상영 종료 영화</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a class="dashbox__more" href="#">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화제목</th>
										<th>상영상태</th>
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