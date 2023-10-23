<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/reopenUser.js"></script>


<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container" id="schdlContainer">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="진행중 이벤트 페이지로 이동">이벤트</a> <a href="#"
						title="이벤트 상세">이벤트 상세</a>
				</div>






			</div>
		</div>
		<div id="contents" class="">

			<!-- event-detail -->
			<div class="event-detail">
				<h2 class="tit">[재개봉] ${reopenMovie.movie_Title}</h2>
				<p class="event-detail-date">
					<span>기간</span> <em>${reopenMovie.REOPENING_STARTDATE} ~ ${reopenMovie.REOPENING_ENDDATE}</em>
					<span style="margin-left: 20px">현재 동의 수 : </span><span style="font-weight:bold; margin-left:2px">${reopenMovie.REOPEN_COUNT}</span>
				</p>

				<!--
				가로가 100% 일때
				<div class="event-html full">

				가로가 1100px 일때
				<div class="event-html">
			-->




				<div class="event-html">





					<table 
						style="width: 1100px">
						<tbody>
							<tr>
								<td><img alt="" border="0"
									src="${reopenMovie.movie_Poster}"
									style="width: 700px"></td>
							</tr>
						</tbody>
					</table>
					<map name="Map">
						<area alt="이벤트" coords="58,1747,497,1879"
							href="#"
							shape="rect" target="_blank">
					</map>







				</div>



				<!--// iframe 아닐 때  -->
			</div>
			<!--// event-detail -->
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<!-- event-button-type -->
				<div class="event-button-type">
					<button id="reopen-admit-btn" data-movieCode="${reopenMovie.movie_Code}" type="button" class="btn" style="background:#792828">재개봉 동의하기</button>
				</div>
				<!--// event-button-type -->
			</div>
			<!--// inner-wrap -->
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>