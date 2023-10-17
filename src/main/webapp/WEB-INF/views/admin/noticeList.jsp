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
<title>공지사항 목록</title>
<style>
	.paginator-wrap {
    display: flex;
    justify-content: right;
}
</style>
</head>
<body>
	<div class="sidebar">
	<sec:authentication property="principal" var="pinfo" />
		<!-- sidebar logo -->
		<a href="#" class="sidebar__logo">
			<img src="${pageContext.request.contextPath}/resources/image/admin/admin_logo.png" alt="" style="width:100%;">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
			</div>

			<div class="sidebar__user-title">
				<span>사이트 관리자</span>
				<p>${memberInfo.MEMBER_NAME}님</p>
			</div>

			<button class="sidebar__user-btn" type="button" onclick="location='/movieplus/'">
				<i class="icon ion-ios-log-out"></i>
			</button>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item">
					<a href="/movieplus/admin/" class="sidebar__nav-link"><span>대쉬보드</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>회원 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="/movieplus/admin/managetheater" class="sidebar__nav-link"><span>극장 관리</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="/movieplus/movie/movieAdd" class="sidebar__nav-link"><span>상영 영화 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>스토어 관리</span></a>
				</li>
								
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>무비포스트 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>감상평 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>공지사항 등록</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>1:1문의 답변</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>자주 묻는 질문 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>이벤트 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>재개봉 관리</span></a>
				</li>
				
				
			</ul>
			
		</div>
		<div class="sidebar__copyright">총 관리자 메뉴</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.mousewheel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.mCustomScrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
	
		<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>공지사항 List</h2>

						<span class="main__title-stat">카운트숫자 Total</span>

						<div class="main__title-wrap">
							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- comments -->
				<div class="col-12">
					<div class="main__table-wrap">
						<table class="main__table">
							<thead>
								<tr>
									<th> 글 번 호</th>
									<th> 제 목 </th>
									<th> 유 형 </th>
									<th> 작 성 일</th>
									<th style="display: flex; justify-content: center;"> 관 리 </th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="main__table-text"> ex) 1</div>
									</td>
									<td>
										<div class="main__table-text"><a href="#">ex) 제목 예정</a></div>
									</td>
									<td>
										<div class="main__table-text">ex) 유형 예정</div>
									</td>
									<td>
										<div class="main__table-text">ex) 작성일 예정</div>
									</td>
									<td>
										<div class="main__table-btns" style = "display: flex; justify-content: center;">
											<a href="#" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create"></i>
											</a>&nbsp;
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash"></i>
											</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- end comments -->
				<a href="/admin/noticewrite" class="main__title-link">작성하기</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev">
								<a href="#"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
							<li class="paginator__item"><a href="#">1</a></li>
							<li class="paginator__item paginator__item--active"><a href="#">2</a></li>
							<li class="paginator__item"><a href="#">3</a></li>
							<li class="paginator__item"><a href="#">4</a></li>
							<li class="paginator__item paginator__item--next">
								<a href="#"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
	</main>
	<!-- end main content -->
	
</body>
</html>