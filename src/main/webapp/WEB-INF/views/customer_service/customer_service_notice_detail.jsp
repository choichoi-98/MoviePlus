<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="고객센터 페이지로 이동">고객센터</a> <a
						href="#" title="1:1 문의 페이지로 이동">공지사항 확인</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div id="contents" class="location-fixed" style="float:none; width:100%;">
				<h2 class="tit">공지사항</h2>

				<ul class="dot-list">
					<li id="tabDesc">MoviePlus 에서 전달드린 공지사항입니다.</li>
				</ul>

				<div class="table-wrap mt20">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${getNoticeDetail.CUSTOMER_NOTICE_SUBJECT}</p>
						</div>

						<div class="info">

							<p>
								<span class="tit">공지지점</span> <span class="txt">${getNoticeDetail.CUSTOMER_NOTICE_THEATER}</span>
							</p>
							<div class="mt10">
								<p>
									<span class="txt">등록일 ${getNoticeDetail.CUSTOMER_NOTICE_SYSDATE}</span>
								</p>
							</div>
						</div>

						<div class="cont">
							<textarea rows="5" cols="30" readonly class="input-textarea view" 
							style="border: none;" id="inqCn">${getNoticeDetail.CUSTOMER_NOTICE_CONTENT}</textarea>
						</div>

					</div>
				</div>

				<div class="btn-group pt40">
					<a href="${pageContext.request.contextPath}/customer_service"
						class="button large listBtn" title="목록">목록</a> 
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