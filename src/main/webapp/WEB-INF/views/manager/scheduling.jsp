<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>
.main__table {
	min-width: 0px;
}

.theater-room-name {
	display: flex;
	font-size: 15pt;
	color: white;
}

.room-container {
	margin-bottom: 50px;
}
</style>

<body>

	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	<script src="${pageContext.request.contextPath}/resources/js/scheduling.js"></script>

	<main class="main">
		<!-- main title -->	
		<div class="col-12">
			<div class="main__title">
				<h2>상영 스케줄 관리</h2>

				<div class="main__title-wrap">
					<!-- filter sort -->
					<input type="date" style="margin-right:50px; width:200px;" />
					<div class="filter" id="filter__sort">
						<span class="filter__item-label">조회</span>

						<div class="filter__item-btn dropdown-toggle" role="navigation"
							id="filter-sort" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<input type="button" value="${theaterName}"> <span></span>
						</div>

						<ul class="filter__item-menu dropdown-menu scrollbar-dropdown"
							aria-labelledby="filter-sort">
							<li>${theaterName}</li>
							<c:forEach var="room" items="${roomList}">
								<li>${room.THEATER_ROOM_NAME}</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end filter sort -->
				</div>
			</div>


		</div>
		<!-- end main title -->
		<c:forEach var="room" items="${roomList}">
			<div class="col-7 room-container" id="theaterRoom-${room.THEATER_ROOM_ID}">
				<div class="theater-room-name">
					${room.THEATER_ROOM_NAME} <a href="#"
						class="main__table-btn main__table-btn--banned"> <i
						class="icon ion-ios-film feature__icon"></i>
					</a>
				</div>
				<div class="main__table-text">상영 등록된 영화가 없습니다.</div>
			</div>	
		</c:forEach>


		<div class="col-7">
			<div class="theater-room-name">
				1관 <a href="#" class="main__table-btn main__table-btn--banned">
					<i class="icon ion-ios-film feature__icon"></i>
				</a>
			</div>
			<table class="main__table">
				<thead>
					<tr>
						<th>상영 순서</th>
						<th>영화 제목</th>
						<th>좌석 수</th>
						<th>상영 시간</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>
							<div class="main__table-text">1</div>
						</td>
						<td>
							<div class="main__table-text">
								<a href="#">I Dream in Another Language</a>
							</div>
						</td>
						<td>
							<div class="main__table-text main__table-text--rate">1/250
							</div>
						</td>
						<td>
							<div class="main__table-text">12:30 ~ 14:00</div>
						</td>
						<td>
							<div class="main__table-btns">
								<a href="#" class="main__table-btn main__table-btn--edit"> <i
									class="icon ion-ios-create"></i>
								</a> <a href="#modal-delete"
									class="main__table-btn main__table-btn--delete open-modal">
									<i class="icon ion-ios-trash"></i>
								</a>
							</div>
						</td>
					</tr>


				</tbody>
			</table>
		</div>





	</main>
</body>

<style>
#theater-schedule-table {
	background: gray;
	text-align: center;
	border: 1px solid white;
	margin-bottom: 5px;
}

#theater-schedule-table tr {
	border: 0.5px solid b
}

#theater-schedule-table th {
	width: 200px;
}

#theater-schedule-table th:first-child {
	width: 50px;
}

#theater-schedule-table tr>td {
	height: 100px;
}
</style>
</html>