<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">

	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
				 <a href="${pageContext.request.contextPath}/event" title="이벤트 메인 페이지로 이동">이벤트</a>
				 <a href="{pageContext.request.contextPath}/event/winner" title="당첨자발표 페이지로 이동">당첨자발표</a>
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
						<p class="tit">${eventlist.EVENT_SUBJECT}</p>
					</div>

					<div class="info">
						<p>
							<span class="txt" id="startdate">${eventlist.EVENT_STARTDATE}</span> ~
							<span class="txt" id="enddate">${eventlist.EVENT_ENDDATE}</span>
						</p>
					</div>


					<div class="cont">
					${eventlist.EVENT_RESULT}<br>
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
								<td class="xl69" style="background-color:#f8cbad; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap; width:186px"><span style="font-size:13px"><strong style="font-weight:700"><span style="color:black"><span style="font-style:normal"><span style="text-decoration:none">
									<span>당첨극장</span></span></span></span></strong></span>
								</td>
							</tr>
							<c:forEach var="eventwinner" items="${eventwinner}" varStatus="loop" >
							<tr>
								<td class="xl67" style="border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:18px; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="color:black"><span style="font-weight:400"><span style="font-style:normal"><span style="text-decoration:none">
									<span id="memberId">${eventwinner.MEMBER_ID}</span></span></span></span></span></span>
								</td>
								<td class="xl67" style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; padding-left:1px; padding-right:1px; padding-top:1px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:13px"><span style="color:black"><span style="font-weight:400"><span style="font-style:normal"><span style="text-decoration:none">
									<span>#</span></span></span></span></span></span>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

					</div>
				</div>
			</div>

					<div class="btn-group border pt40">
						<a href="${pageContext.request.contextPath}/event/winner"  class="button large winnerlist" title="목록 페이지로 이동">목록</a>
					</div>

		</div>
		<!--// inner-wrap -->
	</div>
</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
<script>
	
	//날짜형식 변경
	var start = $('#startdate');
	var end = $('#enddate');
	var startdate = start.text();
	var newstartdate = formatdate(startdate);
	
	var enddate = end.text();
	var newenddate = formatdate(enddate);
	
	start.text(newstartdate);
	end.text(newenddate);
	
	function formatdate(dateString) {
		var year = dateString.substring(0, 4);
	    var month = dateString.substring(4, 6);
	    var day = dateString.substring(6, 8);
	    
		   return year + "." + month + "." + day;
	}
	
	//아이디 형식
	var id = $('#memberId');
	var memberid = id.text();
	
	id.text();
	
	function formatid(idString){
		
	}

</script>	
	
	
</body>
</html>