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
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/manager/sidebar.jsp" />
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>공지사항 등록</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="${pageContext.request.contextPath}/manager/insertnotice" class="form" method="post">
						<div class="row row--form">

							<div class="col-12 col-md-8 form__content">
								<div class="row row--form">
									
									<div class="col-md-12">
										<input type="text" name="CUSTOMER_NOTICE_SUBJECT" class="form__input" placeholder="제목을 입력해주세요." required title="제목을 입력하세요">
									</div>

									<div class="col-md-12">
										<textarea id="text" name="CUSTOMER_NOTICE_CONTENT" class="form__textarea" placeholder="내용을 입력해주세요." style="height:500px;" required title ="내용을 입력하세요"></textarea>
									</div>
								</div>
							</div>
							<div class="col-12" style="display:flex; margin-left: 65%;">
								<a href="${pageContext.request.contextPath}/manager/noticelist"><button type="button" class="form__btn" style="margin-right:20px;">취소</button></a>
								<button type="submit"class="form__btn">확인</button>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>
</body>
</html>