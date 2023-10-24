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
<title>MoviePlus 이벤트 당첨자 관리 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>

	
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>이벤트 당첨자 관리</h2>

						<span class="main__title-stat">총 <b>${eventapplycount}</b>건</span>

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
				
						<table class="main__table">
							<thead>
								<tr>
									<th></th>
									<th>이벤트 분류</th><!--(영화|극장|제휴할인|시사회/무대인사)  -->
									<th>이벤트 제목</th>
									<th>참여 아이디</th>
									<th>상태</th><!-- (당첨/미당첨) -->
									<th>이벤트 발표일</th>
								</tr>
							</thead>
							
							<tbody>
							  <c:forEach var="event" items="${eventapply}">
								<tr>
									<td>
										<div class="main__table-text">${event.RNUM}</div><!-- 이벤트 번호 -->
									</td>
									<td>
										<div class="main__user">
											<div class="main__meta">
												<h3>${event.EVENT_TYPE}</h3><!-- 이벤트 분류 -->
											</div>
										</div>
									</td>
									<td>
										<div class="main__table-text">
										<%-- <a href="${pageContext.request.contextPath}/event/detail?num=${event.EVENT_NUM}">${event.EVENT_SUBJECT}
											<input type="hidden" name="EVENT_NUM" value="${event.EVENT_NUM}">
										</a> --%>
										${event.EVENT_SUBJECT}
										</div><!-- 이벤트 제목 / 클릭시 이벤트 뷰 페이지로 이동 -->
									</td>
									<td>
										<div class="main__table-text">${event.MEMBER_ID}</div><!-- 참여 아이디 -->
									</td>
									<td>
										<div class="main__table-text main__table-text--green">${event.EVENT_DRAW}</div><!-- 당첨 여부 -->
									</td>
									<td>
										<div class="main__table-text"><span class="resultdate">${event.EVENT_RESULTDATE}</span></div><!-- 이벤트 발표일 -->
									</td>
								</tr>
								<input type="hidden" name="EVENT_NUM" id="EVENT_NUM" value="${event.EVENT_NUM}">
							  </c:forEach>	
							</tbody>
						</table>
					
					<c:if test="${eventlistcount == 0 }">
			         <h3 style="text-align: center">참여한 회원이 없습니다.</h3>
			      	</c:if>
			      	
				</div>
				<!-- end users -->
				<a href="#" class="main__title-link" id="pickwinnerbtn" >당첨자 추첨</a>
			</div>
		</div>
		
			<!-- modal status -->
	<div id="modal-status" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 당첨 상태 변경</h6>

		<p class="modal__text">이벤트 당첨 상태를 변경하시겠습니까? (당첨Y/미당첨N)</p>

		<div class="modal__btns">
			<button id="change-status-modal-btn" class="modal__btn modal__btn--apply" type="button">확인</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal status -->

	<!-- modal delete -->
	<div id="modal-delete" class="zoom-anim-dialog mfp-hide modal">
		<h6 class="modal__title">이벤트 신청 삭제</h6>

		<p class="modal__text">신청한 회원을 삭제하시겠습니까?</p>

		<div class="modal__btns">
			<button id="delete-event-modal-btn" class="modal__btn modal__btn--apply" type="button">삭제</button>
			<button class="modal__btn modal__btn--dismiss" type="button">취소</button>
		</div>
	</div>
	<!-- end modal delete -->
	</main>
<script>
	
	$('#pickwinnerbtn').click(function(){
		const num = $('#EVENT_NUM').val();
		
		$.ajax({
			url : "pickWinner",
			data : {"num" : num },
			success : function(data){
				$('#EVENT_NUM').val(data);
				alert('당첨자 추첨이 완료되었습니다.');
				location.reload();
			},
			error: function(){
				console.log();
			}
		})
		
	})
	
	
	//이벤트 발표일 형식 변경
$('.resultdate').each(function() {
	var result = $(this);
	var resultdate = result.text();
	var newresultdate = formatdate(resultdate);
	
	result.text(newresultdate);
	
	function formatdate(dateString) {
		var year = dateString.substring(0, 4);
	    var month = dateString.substring(4, 6);
	    var day = dateString.substring(6, 8);
	    
		   return year + "." + month + "." + day;
	}
})



</script>	
</body>
</html>