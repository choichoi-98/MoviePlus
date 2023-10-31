<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/movie_add.js"></script>
<script>
	var playImagePath="${pageContext.request.contextPath}/resources/image/movie/play.png";
	var pauseImagePath="${pageContext.request.contextPath}/resources/image/movie/pause.png";
	
	function openPop(){
		var popup = window.open('${pageContext.request.contextPath}/chat/chatList',
							'채팅팝업','width=672px, height=640px');
							//chat/room
							//chat/friendList
	}
</script>
<style>
#modal-view > div{
width:100%;
}
#modal-view > div > div{
width:100%;
}
#chatBtn{
    height: 80px;
    position: fixed;
    bottom: 50px;
    right: 75px;
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
						<p id="movieAllCount"></p>
						<i class="icon ion-ios-stats"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>상영 중인 영화</span>
						<p id="moviePlayingCount"></p></p>
						<i class="icon ion-ios-film"></i>
					</div>
				</div>
				<!-- end stats -->

				<!-- stats -->
				<div class="col-12 col-sm-6 col-lg-3">
					<div class="stats">
						<span>상영 종료 영화</span>
						<p id="movieEndedCount"></p>
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
								<a id="movieListPlayingModal" class="main__table-btn main__table-btn--view open-modal" href="#modal-view-playing">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash" id="movieListNowPlaying">
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
				<!-- end dashbox -->
				<!-- modal view -->
					<div id="modal-view-playing" class="mfp-hide movieListPlayingModal" style="width:800px;margin-left: 450px;">
						<div class="col-12 col-xl-6" style="width:800px">
									<div class="dashbox" style="width:800px">
										<div class="dashbox__title">
											<h3><i class="icon ion-ios-trophy"></i>상영 중인 영화</h3>
				
											<div class="dashbox__wrap">
											</div>
										</div>
				
										<div class="dashbox__table-wrap">
											<table class="main__table main__table--dash" id="movieListPlayingTableModal">
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
					</div>
					<!-- end modal view -->
	

				<!-- dashbox -->
				<div class="col-12 col-xl-6">
					<div class="dashbox">
						<div class="dashbox__title">
							<h3><i class="icon ion-ios-star-half"></i> 상영 종료 영화</h3>

							<div class="dashbox__wrap">
								<a class="dashbox__refresh" href="#"><i class="icon ion-ios-refresh"></i></a>
								<a id="movieListEndedModal" class="main__table-btn main__table-btn--view open-modal" href="#modal-view-ended">View All</a>
							</div>
						</div>

						<div class="dashbox__table-wrap">
							<table class="main__table main__table--dash" id="movieListEnded">
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
				<!-- modal view -->
					<div id="modal-view-ended" class="mfp-hide movieListEndedTableModal" style="width:800px;margin-left: 450px;">
						<div class="col-12 col-xl-6" style="width:800px">
									<div class="dashbox" style="width:800px">
										<div class="dashbox__title">
											<h3><i class="icon ion-ios-trophy"></i>상영 종료 영화</h3>
				
											<div class="dashbox__wrap">
											</div>
										</div>
				
										<div class="dashbox__table-wrap">
											<table class="main__table main__table--dash" id="movieListEndedTableModal">
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
					</div>
				<!-- end modal view -->
			</div>
		</div>
		
		<!-- 채팅 open btn -->
		<!-- <div>
			<a herf="#none" onclick="openPop()">
				<img id="chatBtn"
				  src="${pageContext.request.contextPath}/resources/image/chat/wechat.png">
			</a>
		</div> -->
	</main>
</body>
</html>