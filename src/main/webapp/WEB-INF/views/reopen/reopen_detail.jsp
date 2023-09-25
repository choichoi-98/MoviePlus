<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>


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
				<h2 class="tit">[재개봉] 해리포터</h2>
				<p class="event-detail-date">
					<span>기간</span> <em>2023.09.27 ~ 2023.10.09</em> &nbsp; &nbsp; &nbsp; &nbsp;
					<span>현재 청원 수 : </span>
				</p>

				<!--
				가로가 100% 일때
				<div class="event-html full">

				가로가 1100px 일때
				<div class="event-html">
			-->




				<div class="event-html">





					<table border="0" cellpadding="0" cellspacing="0"
						style="width: 1100px">
						<tbody>
							<tr>
								<td><img alt="" border="0"
									src="${pageContext.request.contextPath}/resources/image/reopen_temp_image.jpg"
									style="width: 1100px" usemap="#Map"></td>
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
					<button type="button" class="btn" id="btnInsertEvt_1_" data-no1="1"
						data-no2="">재개봉 동의하기</button>
					<input type="hidden" name="eventCponOrd" value="1"> <input
						type="hidden" name="eventBrchOrd" value="">
				</div>
				<!--// event-button-type -->
			</div>
			<!--// inner-wrap -->
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>