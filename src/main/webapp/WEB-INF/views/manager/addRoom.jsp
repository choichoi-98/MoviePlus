<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager_seat.css">
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
							<span style="color: #999;">※ 좌석 생성</span> <input type="number"
								class="seat-xy" id="seat-x" min='8' max='20' value='8'>
							<input type="number" class="seat-xy" id="seat-y" min='4' max='13'
								value='4'>
							<button type="button" id="create-btn"
								style="width: 60px; height: 25px; background: gray;">생성</button>
						</div>

						<div class="col-12">
							<table id="seat-table">
								<tr class='seat-column' data-columm-alp='A'>
									<td class="seat-column-td"><button class="seat-column-btn">A</button></td>
									<td><button data-columm-line='A' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='A' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='A' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='A' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='A' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='A' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='A' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='A' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='A' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='A' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='A' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='A' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='A' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='A' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='A' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='A' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='A' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='A' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='A' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='A' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='B'>
									<td class="seat-column-td"><button class="seat-column-btn">B</button></td>
									<td><button data-columm-line='B' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='B' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='B' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='B' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='B' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='B' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='B' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='B' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='B' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='B' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='B' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='B' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='B' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='B' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='B' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='B' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='B' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='B' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='B' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='B' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='C'>
									<td class="seat-column-td"><button class="seat-column-btn">C</button></td>
									<td><button data-columm-line='C' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='C' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='C' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='C' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='C' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='C' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='C' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='C' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='C' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='C' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='C' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='C' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='C' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='C' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='C' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='C' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='C' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='C' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='C' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='C' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='D'>
									<td class="seat-column-td"><button class="seat-column-btn">D</button></td>
									<td><button data-columm-line='D' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='D' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='D' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='D' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='D' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='D' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='D' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='D' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='D' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='D' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='D' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='D' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='D' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='D' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='D' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='D' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='D' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='D' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='D' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='D' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='E'>
									<td class="seat-column-td"><button class="seat-column-btn">E</button></td>
									<td><button data-columm-line='E' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='E' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='E' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='E' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='E' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='E' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='E' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='E' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='E' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='E' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='E' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='E' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='E' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='E' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='E' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='E' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='E' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='E' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='E' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='E' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='D'>
									<td class="seat-column-td"><button class="seat-column-btn">D</button></td>
									<td><button data-columm-line='D' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='D' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='D' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='D' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='D' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='D' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='D' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='D' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='D' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='D' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='D' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='D' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='D' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='D' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='D' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='D' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='D' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='D' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='D' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='D' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='F'>
									<td class="seat-column-td"><button class="seat-column-btn">F</button></td>
									<td><button data-columm-line='F' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='F' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='F' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='F' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='F' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='F' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='F' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='F' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='F' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='F' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='F' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='F' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='F' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='F' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='F' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='F' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='F' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='F' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='F' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='F' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='G'>
									<td class="seat-column-td"><button class="seat-column-btn">G</button></td>
									<td><button data-columm-line='G' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='G' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='G' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='G' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='G' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='G' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='G' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='G' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='G' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='G' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='G' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='G' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='G' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='G' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='G' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='G' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='G' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='G' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='G' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='G' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='H'>
									<td class="seat-column-td"><button class="seat-column-btn">H</button></td>
									<td><button data-columm-line='H' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='H' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='H' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='H' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='H' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='H' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='H' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='H' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='H' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='H' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='H' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='H' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='H' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='H' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='H' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='H' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='H' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='H' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='H' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='H' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='J'>
									<td class="seat-column-td"><button class="seat-column-btn">J</button></td>
									<td><button data-columm-line='J' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='J' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='J' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='J' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='J' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='J' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='J' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='J' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='J' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='J' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='J' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='J' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='J' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='J' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='J' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='J' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='J' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='J' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='J' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='J' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='K'>
									<td class="seat-column-td"><button class="seat-column-btn">K</button></td>
									<td><button data-columm-line='K' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='K' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='K' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='K' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='K' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='K' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='K' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='K' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='K' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='K' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='K' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='K' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='K' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='K' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='K' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='K' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='K' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='K' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='K' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='K' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='L'>
									<td class="seat-column-td"><button class="seat-column-btn">L</button></td>
									<td><button data-columm-line='L' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='L' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='L' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='L' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='L' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='L' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='L' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='L' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='L' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='L' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='L' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='L' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='L' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='L' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='L' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='L' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='L' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='L' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='L' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='L' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>
								<tr class='seat-column' data-columm-alp='M'>
									<td class="seat-column-td"><button class="seat-column-btn">M</button></td>
									<td><button data-columm-line='M' data-seatnum='1'
											class='seat hide'>1</button></td>
									<td><button data-columm-line='M' data-seatnum='2'
											class='seat hide'>2</button></td>
									<td><button data-columm-line='M' data-seatnum='3'
											class='seat hide'>3</button></td>
									<td><button data-columm-line='M' data-seatnum='4'
											class='seat hide'>4</button></td>
									<td><button data-columm-line='M' data-seatnum='5'
											class='seat hide'>5</button></td>
									<td><button data-columm-line='M' data-seatnum='6'
											class='seat hide'>6</button></td>
									<td><button data-columm-line='M' data-seatnum='7'
											class='seat hide'>7</button></td>
									<td><button data-columm-line='M' data-seatnum='8'
											class='seat hide'>8</button></td>
									<td><button data-columm-line='M' data-seatnum='9'
											class='seat hide'>9</button></td>
									<td><button data-columm-line='M' data-seatnum='10'
											class='seat hide'>10</button></td>
									<td><button data-columm-line='M' data-seatnum='11'
											class='seat hide'>11</button></td>
									<td><button data-columm-line='M' data-seatnum='12'
											class='seat hide'>12</button></td>
									<td><button data-columm-line='M' data-seatnum='13'
											class='seat hide'>13</button></td>
									<td><button data-columm-line='M' data-seatnum='14'
											class='seat hide'>14</button></td>
									<td><button data-columm-line='M' data-seatnum='15'
											class='seat hide'>15</button></td>
									<td><button data-columm-line='M' data-seatnum='16'
											class='seat hide'>16</button></td>
									<td><button data-columm-line='M' data-seatnum='17'
											class='seat hide'>17</button></td>
									<td><button data-columm-line='M' data-seatnum='18'
											class='seat hide'>18</button></td>
									<td><button data-columm-line='M' data-seatnum='19'
											class='seat hide'>19</button></td>
									<td><button data-columm-line='M' data-seatnum='20'
											class='seat hide'>20</button></td>
								</tr>


							</table>
						</div>

						<input type="hidden" id="seat-value" name="THEATER_ROOM_SEAT"
							value="">
						<div class="col-12">
							<button type="button" id="delete-seat" class="form__btn">지우기</button>
							<button type="button" id="reset-seat" class="form__btn">초기화</button>
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