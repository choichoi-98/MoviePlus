<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">

	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
				 <a href="${pageContext.request.contextPath}/event" title="이벤트 메인 페이지로 이동">이벤트</a>
				 <a href="https://www.megabox.co.kr/event/winner/list" title="당첨자발표 페이지로 이동">당첨자발표</a>
			</div>
		</div>
	</div>

	<div id="contents">

		<!-- inner-wrap -->
		<div class="inner-wrap">

			<h2 class="tit">당첨자발표</h2>

			<div class="table-wrap">
				<div class="board-view">
					<div class="tit-area">
						<p class="tit">&lt;소년들&gt; 메가박스 회원 시사회 </p>
					</div>

					<div class="info">
						<p>
							<span class="txt">2023.10.16 ~ 2023.10.19</span>
						</p>
					</div>


					<div class="cont">
    					<strong>안녕하세요.&nbsp;</strong><strong>메가박스입니다.</strong><br>
					<br>
					<strong>&lt;소년들&gt; 회원시사 이벤트에 참여해 주신 여러분께 진심으로 감사 드립니다.</strong><br>
					<strong>아래 명단을 확인하신 후,&nbsp;당첨된 고객님께서는 당일 본인 확인 후 티켓을 수령해주시기 바랍니다.</strong><br>
					<br>
					<strong>*&nbsp;상영일시: 2023년 10월 23일(월) 20시&nbsp;<br>
					*&nbsp;수령장소<em>: 코엑스, 성수, 이수, 금정AK플라자, 수원AK플라자, 고양스타필드, 상암월드컵경기장, 백석벨라시타, 대전신세계 아트앤사이언스, 대구이시아, 사상</em></strong><br>
					<strong>*&nbsp;</strong><strong>수령방법:&nbsp;시사회 당일 현장 티켓 배부처에서 신분 확인 후 티켓 수령(1인&nbsp;2매,&nbsp;신분증 지참 필수)</strong><br>
					<strong>-&nbsp;개인정보(신분증)로 본인 확인 후 배부 진행하며, 티켓 수령인과 당첨자 정보가 불일치할 경우엔 티켓 수령이 불가합니다.</strong><br>
					<br>
					<strong>*&nbsp;시사회 당일 19시 부터 당첨 지점에서 티켓 수령이 가능합니다.<br>
					*&nbsp;응모하신 극장에서만 관람이 가능하오니 장소 확인을 부탁드립니다. (당첨 극장 변경 불가)</strong><br>
					<strong>*&nbsp;</strong><strong>당첨된 티켓은 양도 불가능하며,&nbsp;개인정보(신분증)로 본인 확인 후 배부합니다.</strong><br>
					<strong>*&nbsp;좌석 선택은 불가한 점 양해 부탁드립니다.<br>
					*&nbsp;선착순 배포로 시사회 티켓이 소진되어 수령하지 못하는 경우에 한해, 당첨자 기준 1인 2매의 해당 영화 전용 관람권이 지급됩니다.</strong><br>
					&nbsp;
					<table cellspacing="0" style="border-collapse:collapse; width:417px">
						<colgroup>
							<col style="width:74pt" width="99">
							<col style="width:99pt" width="132">
							<col style="width:140pt" width="186">
						</colgroup>
						<tbody>
							<tr>
								<td class="xl69" style="background-color:#f8cbad; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:18px; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap; width:99px"><span style="font-size:13px"><strong style="font-weight:700"><span style="color:black"><span style="font-style:normal"><span style="text-decoration:none">
									<span>ID</span></span></span></span></strong></span>
								</td>
								<td class="xl69" style="background-color:#f8cbad; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap; width:132px"><span style="font-size:13px"><strong style="font-weight:700"><span style="color:black"><span style="font-style:normal"><span style="text-decoration:none">
									<span>이름</span></span></span></span></strong></span>
								</td>
								<td class="xl69" style="background-color:#f8cbad; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap; width:186px"><span style="font-size:13px"><strong style="font-weight:700"><span style="color:black"><span style="font-style:normal"><span style="text-decoration:none">
									<span>당첨극장</span></span></span></span></strong></span>
								</td>
							</tr>
							<tr>
								<td class="xl67" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:18px; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="color:black"><span style="font-weight:400"><span style="font-style:normal"><span style="text-decoration:none">
									<span>na**e3231</span></span></span></span></span></span>
								</td>
								<td class="xl67" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="color:black"><span style="font-weight:400"><span style="font-style:normal"><span style="text-decoration:none">
									<span>강*래</span></span></span></span></span></span>
								</td>
								<td class="xl67" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="color:black"><span style="font-weight:400"><span style="font-style:normal"><span style="text-decoration:none">
									<span>코엑스</span></span></span></span></span></span>
								</td>
							</tr>
						</tbody>
					</table>

					</div>
				</div>
			</div>

					<div class="btn-group border pt40">
						<a href="https://www.megabox.co.kr/event/winner/detail?eventNo=14271&amp;callBackPage=&amp;searchText=&amp;currPage=1#" onclick="hisBack()" class="button large winnerlist" title="목록 페이지로 이동">목록</a>
					</div>

		</div>
		<!--// inner-wrap -->
	</div>
</div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>