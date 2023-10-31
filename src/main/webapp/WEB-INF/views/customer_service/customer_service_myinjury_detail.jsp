<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역&nbsp;(세부)</title>

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
			<div id="contents" class="location-fixed"
				style="float: none; width: 100%;">
				<h2 class="tit">나의 문의내역</h2>

				<ul class="dot-list">
					<li id="tabDesc">고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.</li>
				</ul>

				<div class="table-wrap mt20">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit">${MyInjuryDetail.CUSTOMER_TITLE}</p>
						</div>

						<div class="info">

							<p>
								<span class="tit">문의지점</span> <span class="txt">${MyInjuryDetail.CUSTOMER_SELECT_REGION}
									${MyInjuryDetail.CUSTOMER_SELECT_CENEMA}</span>
							</p>


							<p>
								<span class="tit">문의유형</span> <span class="txt">${MyInjuryDetail.CUSTOMER_TYPE}</span>
							</p>

							<p>
								<span class="tit">답변상태</span> <span class="txt">${MyInjuryDetail.CUSTOMER_ANSWERSITUATION}</span>
							</p>
							<div class="mt10">

								<p>
									<span class="txt">${MyInjuryDetail.CUSTOMER_REGISTRATIONDATE}</span>
								</p>
							</div>
						</div>



						<div class="cont">
							<textarea rows="5" cols="30" readonly=""
								class="input-textarea view" style="border: none;" id="inqCn">${MyInjuryDetail.CUSTOMER_CONTENT}</textarea>
						</div>

					</div>
				</div>

				<div class="btn-group pt40">
					<a
						href="${pageContext.request.contextPath}/customer_service/myinjury"
						class="button large listBtn" title="목록">목록</a> <a
						href="${pageContext.request.contextPath}/customer_service/myinjurydelete?deletenum=${MyInjuryDetail.CUSTOMER_NUM}"
						class="button large deleteBtn inq-delete" title="삭제">삭제</a>
				</div>
				<!--// container -->
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>