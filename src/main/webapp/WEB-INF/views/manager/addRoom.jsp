<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#seat-table button {
	margin-left: 2px;
}

#seat-table>tbody>tr>td:nth-child(2)>button {
	margin-left: 30px;
}

.seat {
	display: inline-block;
	border: 1px solid #999;
	color: #999;
	width: 32px;
	height: 32px;
}

.seat-column button {
	color: white;
	background-color: gray;
}

.seat-colmun {

}
.selected {
	background: orange;
}

.deleted {
	display: none;
}

.seat-xy{
	width:50px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/seatMaker.js"></script>
		

	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>극장 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="addRoomAction" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">

						<div class="col-12">
							<input type="text" name="THEATER_ROOM_NAME" class="form__input"
								placeholder="극장 명" value="${roomName }">
						</div>
						<div class="col-12">
							<span style="color: #999;">※ 좌석 생성</span>	
							<input type="number" class="seat-xy" id="seat-x" min='0' max='20' value='0'>
							<input type="number" class="seat-xy" id="seat-y" min='0' max='13' value='0'>
						</div>

						<div class="col-12">
							<table id="seat-table">
								<tr>
									<td class="seat-column"><button class="seat">A</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">B</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">C</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">D</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">E</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">F</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">G</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">H</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">I</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">J</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">K</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">L</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>
								<tr>
									<td class="seat-column"><button class="seat">M</button></td>
									<td><button class="seat">1</button></td>
									<td><button class="seat">2</button></td>
									<td><button class="seat">3</button></td>
									<td><button class="seat">4</button></td>
									<td><button class="seat">5</button></td>
									<td><button class="seat">6</button></td>
									<td><button class="seat">7</button></td>
									<td><button class="seat">8</button></td>
									<td><button class="seat">9</button></td>
									<td><button class="seat">10</button></td>
									<td><button class="seat">11</button></td>
									<td><button class="seat">12</button></td>
									<td><button class="seat">13</button></td>
									<td><button class="seat">14</button></td>
									<td><button class="seat">15</button></td>
									<td><button class="seat">16</button></td>
									<td><button class="seat">17</button></td>
									<td><button class="seat">18</button></td>
									<td><button class="seat">19</button></td>
									<td><button class="seat">20</button></td>
								</tr>

							</table>
						</div>

						<input type="hidden" id="seat-value" name="THEATER_ROOM_SEAT" value="">
						<div class="col-12">
							<button type="button" id="delete-seat" class="form__btn">지우기</button>
							<button type="button"id="reset-seat" class="form__btn">초기화</button>
							<button type="submit" class="form__btn">등록</button>
						</div>
					</form>





				</div>

				<!-- end form -->
			</div>
		</div>
	</main>

</body>

</html>