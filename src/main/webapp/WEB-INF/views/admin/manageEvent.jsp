<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
	
	
<head>	
<meta charset="UTF-8">
<title>MoviePlus 이벤트 관리 페이지</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>
	<script src="${pageContext.request.contextPath}/resources/js/event_list.js"></script>

	
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>이벤트 관리</h2>

						<span class="main__title-stat">총 <b>${eventlistcount}</b>개</span>

						<div class="main__title-wrap">
						 
							<!-- filter sort -->
							<div class="filter" id="filter__sort">
								<span class="filter__item-label">정렬 순서</span>

								<div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<input type="button" value="생성 순">
									<span></span>
								</div>

								<ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-sort">
									<li>마감 임박순</li>
									<li>최신순</li>
									<li>탭 별</li>
								</ul>
							</div>
							<!-- end filter sort -->

							<!-- search -->
							<form action="#" class="main__title-form">
								<input type="text" placeholder="이벤트 이름 검색">
								<button type="button">
									<i class="icon ion-ios-search"></i>
								</button>
							</form>
							<!-- end search -->
						</div>
					</div>
				</div>
				<!-- end main title -->

				<!-- users -->
				<div class="col-12">
				<c:if test="${eventlistcount > 0}">
						<table class="main__table">
							<thead>
								<tr>
									<th></th>
									<th>이벤트 분류</th><!--(영화|극장|제휴할인|시사회/무대인사)  -->
									<th>이벤트 제목</th>
									<th>이벤트 기간</th>
									<th>상태</th><!-- (진행중/종료) -->
									<th>관리</th>
								</tr>
							</thead>

							<tbody>
							  <c:forEach var="event" items="${eventlist}">
								<tr>
									<td>
										<div class="main__table-text">${event.RNUM}</div><!-- 이벤트 번호 -->
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3><c:out value="${event.EVENT_TYPE}" /></h3><!-- 이벤트 분류 -->
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">
										<a href="${pageContext.request.contextPath}/event/detail?num=${event.EVENT_NUM}">${event.EVENT_SUBJECT}
											<input type="hidden" name="EVENT_NUM" value="${event.EVENT_NUM}">
										</a>
										</div><!-- 이벤트 제목 / 클릭시 이벤트 뷰 페이지로 이동 -->
									</td>
									<td>
										<div class="main__table-text">${event.EVENT_STARTDATE} - ${event.EVENT_ENDDATE}</div><!-- 이벤트 기간 -->
									</td>
									<td>
										<div class="main__table-text main__table-text--green">${event.EVENT_STATUS}</div><!-- 이벤트 상태 -->
									</td>
									<td>
										<div class="main__table-btns">
										 <input type="hidden" id="eventnum" name="EVENT_NUM" value="${event.EVENT_NUM}">
											<a href="#" class="main__table-btn main__table-btn move-to-manager-menu">
												<i class="icon ion-ios-log-out" title="당첨자 관리"></i>
											</a>
											<a href="#modal-status" class="main__table-btn main__table-btn--banned open-modal">
												<i class="icon ion-ios-lock" title="상태 관리"></i>
										 		<input type="hidden" id="eventstatus" name="EVENT_STATUS" value="${event.EVENT_STATUS}">
											</a>
											<a href="${pageContext.request.contextPath}/admin/modifyEvent?num=${event.EVENT_NUM}" id="event-modify-btn" class="main__table-btn main__table-btn--edit">
												<i class="icon ion-ios-create" title="수정"></i>
											</a>
											<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal">
												<i class="icon ion-ios-trash" title="삭제"></i>
											</a>
										</div>
									</td>
								</tr>
							  </c:forEach>	
							</tbody>
						</table>
					</c:if>	
					
					<c:if test="${eventlistcount == 0 }">
			         <h3 style="text-align: center">등록된 글이 없습니다.</h3>
			      	</c:if>
			      	
				</div>
				<!-- end users -->
				<a href="${pageContext.request.contextPath}/admin/addEvent" class="main__title-link">이벤트 추가</a>
				<!-- paginator -->
				<div class="col-12">
					<div class="paginator-wrap">
						<span style="display:none;"></span>

						<ul class="paginator">
							<li class="paginator__item paginator__item--prev" ${page <= 1 ? 'style="pointer-events: none;"' : ''}>
							    <a href="manageEvent?page=${page-1}"><i class="icon ion-ios-arrow-back"></i></a>
							</li>
			
							<c:forEach var="a" begin="${startpage}" end="${endpage}">
									<c:if test="${a == page }">
										<li class="paginator__item paginator__item--active" ><a href="#">${a }</a></li>
									</c:if>
								<c:if test="${a != page }">
									<li class="paginator__item"><a href="manageEvent?page=${a }">${a}</a></li>
								</c:if>
							</c:forEach>
							
							<li class="paginator__item paginator__item--next" ${page >= maxpage ? 'style="pointer-events: none;"' : ''}>
								<a href="manageEvent?page=${page+1}"><i class="icon ion-ios-arrow-forward"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end paginator -->
			</div>
		</div>
		
			<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 상태 변경</h6>

		<p class="modal__text">이벤트 상태를 변경하시겠습니까? (진행중/종료)</p>

		<div class="modal__btns">
			<button id="change-status-modal-btn" class="modal__btn modal__btn--apply" type="button">확인</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 삭제</h6>

		<p class="modal__text">정말로 이벤트를 삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-event-modal-btn" class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
	
</body>
</html>