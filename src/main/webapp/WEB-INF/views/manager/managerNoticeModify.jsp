<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-grid.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
	
	
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
		<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>공지사항 수정</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="${pageContext.request.contextPath}/manager/noticemodify" class="form" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div class="row row--form">
							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
									<input type="hidden" name="CUSTOMER_NOTICE_NUM" VALUE="${ManagerNotice.CUSTOMER_NOTICE_NUM}"> <!-- notice는 키값 -->
									<div class="col-12">
										<input type="text" name="CUSTOMER_NOTICE_SUBJECT" class="form__input" placeholder="Title" value="${ManagerNotice.CUSTOMER_NOTICE_SUBJECT}">
									</div>

									<div class="col-12">
										<textarea id="text" name="CUSTOMER_NOTICE_CONTENT" style= "height: 500px;" name="text" class="form__textarea" placeholder="Description">${ManagerNotice.CUSTOMER_NOTICE_CONTENT}</textarea>
									</div>


									<div class="col-12" style="display:flex; margin-left: 75%;">
										<a href="${pageContext.request.contextPath}/manger/noticelist">
										<button type="button" class="form__btn" style="margin-right:20px;">뒤로</button>
										</a>
										<button type="submit"class="form__btn">수정</button> <!-- form 안의 name 값만 넘어감 name값이 같은 input 타입이 넘어감 -->
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>
	
</body>
</html>