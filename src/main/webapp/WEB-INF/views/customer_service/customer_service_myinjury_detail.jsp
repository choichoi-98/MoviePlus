<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="고객센터 페이지로 이동">고객센터</a> <a
						href="#" title="1:1 문의 페이지로 이동">문의 내역 수정</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div id="contents" class="location-fixed">
	<h2 class="tit">나의 문의내역</h2>

	<div class="tab-block mb20">
		<ul>
			<li class="on"><a href="#" class="btn" data-cd="INQD01" title="1:1 문의내역 탭으로 이동">1:1 문의내역</a></li>
			<li><a href="#" class="btn" data-cd="INQD03" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관 문의내역</a></li>
			<li><a href="#" class="btn" data-cd="INQD02" title="분실물 문의내역 탭으로 이동">분실물 문의내역</a></li>
		</ul>
	</div>

	<ul class="dot-list">
		<li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
	</ul>

	<div class="table-wrap mt20">
		<div class="board-view">
			<div class="tit-area">
				<p class="tit">ㅅㄷㄴㅅ</p>
			</div>

			<div class="info">
				
				<p>
					<span class="tit">문의지점</span>
					<span class="txt">서울 - 센터</span>
				</p>
				

				<p>
					<span class="tit">문의유형</span>
					<span class="txt">영화정보문의</span>
				</p>

				<p>
					<span class="tit">답변상태</span>
					<span class="txt">
						
							
							
								<span class="txt">미답변</span>
							
						
					</span>
				</p>
				<div class="mt10">




					<p><span class="txt">2023.10.26 17:20:42</span></p>
				</div>
			</div>

			

			<div class="cont">
				<textarea rows="5" cols="30" readonly="" class="input-textarea view" style="border:none;" id="inqCn">ㅅㄷㄴㅅㄴㄷㅅㄴ</textarea>
			</div>
			
		</div>
	</div>

	<div class="btn-group pt40">
		<a href="#" class="button large listBtn" title="목록">목록</a>
		<a href="#" class="button large deleteBtn inq-delete" title="삭제">삭제</a>
	</div>
	<!--// container -->


	<div class="quick-area">
		<a href="https://megabox.co.kr/support/inquiry" class="btn-go-top"
			title="top">top</a>
	</div>

	<form id="mainForm"></form>

	<div class="normalStyle"
		style="display: none; position: fixed; top: 0; left: 0; background: #000; opacity: 0.7; text-indent: -9999px; width: 100%; height: 100%; z-index: 100;">닫기</div>
	<div class="alertStyle"
		style="display: none; position: fixed; top: 0px; left: 0px; background: #000; opacity: 0.7; width: 100%; height: 100%; z-index: 5005;"></div>
</body>
</html>
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>