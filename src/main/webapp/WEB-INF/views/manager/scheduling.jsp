<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />


	<main class="main">
		<div class="row row--grid">
			<!-- main title -->
			<div class="col-12">
				<div class="main__title">
					<h2>상영 스케줄 관리</h2>
				</div>
			</div>
			<!-- end main title -->
			<div class="main__table-wrap">
				<div class="col-12">
					<table id="theater-schedule-table">
						<thead>
							<tr>
								<th>관</th>
								<th>상영순서(1)</th>
								<th>상영순서(2)</th>
								<th>상영순서(3)</th>
								<th>상영순서(4)</th>
								<th>상영순서(5)</th>
								<th>상영순서(6)</th>
								<th>상영순서(7)</th>
								<th>상영순서(8)</th>
								<th>상영순서(9)</th>
								<th>상영순서(10)</th>
								<th>상영순서(11)</th>
								<th>상영순서(12)</th>
								<th>상영순서(13)</th>
								<th>상영순서(14)</th>


							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1관</td>
								<td>영화1번</td>
							</tr>
							<tr>
								<td>2관</td>
							</tr>
							<tr>
								<td>3관</td>
							</tr>
							<tr>
								<td>4관</td>
							</tr>
							<tr>
								<td>5관</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-12">
			<button type="submit" class="form__btn">스케줄 추가</button>
		</div>

	</main>
</body>

<style>
#theater-schedule-table {
	background: gray;
	text-align: center;
}

#theater-schedule-table th {
	width: 200px;
}

#theater-schedule-table th:first-child {
	width: 50px;
}
</style>
</html>