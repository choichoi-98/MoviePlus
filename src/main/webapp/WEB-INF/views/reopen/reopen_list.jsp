<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="이벤트 메인 페이지로 이동">이벤트</a> <a
						href="https://www.megabox.co.kr/event" title="진행중 이벤트 페이지로 이동">진행중
						이벤트</a>
				</div>


			</div>
		</div>

		<div id="contents" class="">

			<div class="inner-wrap">

				<h2 class="tit">진행중인 이벤트</h2>

				<div class="tab-list fixed">
					<ul>
						<li class="" id="eventTab_"><a
							href="#" title="전체">전체</a></li>

						<li id="eventTab_CED03" class="on"><a
							href="#"
							title="메가Pick 탭으로 이동">메가Pick</a></li>

						<li id="eventTab_CED01" class=""><a
							href="#"
							title="영화 탭으로 이동">영화</a></li>

						<li id="eventTab_CED02" class=""><a
							href="#"
							title="극장 탭으로 이동">극장</a></li>

						<li id="eventTab_CED05" class=""><a
							href="#"
							title="제휴/할인 탭으로 이동">제휴/할인</a></li>

						<li id="eventTab_CED04" class=""><a
							href="#"
							title="시사회/무대인사 탭으로 이동">시사회/무대인사</a></li>

					</ul>
				</div>


			</div>

			<div id="boardSearch" class="inner-wrap" style="">

				<div class="board-list-util mt40">


					<p class="result-count">
						<strong>전체 <b>22</b>건
						</strong>
					</p>

					<div class="board-search">
						<input type="text" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text">
						<button type="button" class="btn-search-input">검색</button>
					</div>
				</div>
			</div>

			<div id="event-list-wrap">


				<div class="inner-wrap">


					<div class="event-list ">


						<input type="hidden" id="totCount" name="totCount" value="22">
						<ul>

							<li><a href="#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[재개봉] 해리포터</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
									<p class="date">현재 동의 수 : 100</p>
							</a></li>

							<li><a href="#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[재개봉] 해리포터</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
									<p class="date">현재 동의 수 : 100</p>
							</a></li>

							<li><a href="#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[재개봉] 해리포터</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
									<p class="date">현재 동의 수 : 100</p>
							</a></li>

							<li><a href="#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[재개봉] 해리포터</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
									<p class="date">현재 동의 수 : 100</p>
							</a></li>

							<li><a href="#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[재개봉] 해리포터</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
									<p class="date">현재 동의 수 : 100</p>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>