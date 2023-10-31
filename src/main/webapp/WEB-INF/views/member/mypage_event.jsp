<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

<div id="contents">


            <h2 class="tit">나의 응모 내역</h2>

            <ul class="dot-list">
                <li>개인정보 처리방침에 따라 당첨자 발표일로 부터 6개월간 당첨자 발표내역을 확인할 수 있습니다. </li>
            </ul>
            <div class="board-list-util mt0">
                <p class="result-count"><strong>전체 (1건)</strong></p>

                <div class="board-search">
                    <input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
                    <button type="button" class="btn-search-input">검색</button>
                </div>
            </div>

            <div class="table-wrap">
                <table class="board-list">
                    <caption>게시판 목록 제목</caption>
                    <colgroup>
                        <col style="width:80px;">
                        <col style="width:130px;">
                        <col>
                        <col style="width:100px;">
                        <col style="width:110px;">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">분류</th>
                            <th scope="col">이벤트명</th>
                            <th scope="col">응모일</th>
                            <th scope="col">당첨자발표</th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${myEventlist}" var="event">
	                    <tr>
		                    <td>${event.RNUM}</td>
		                    <td>${event.EVENT_TYPE}</td>
		                    <th scope="row">
		                    	<a href="${pageContext.request.contextPath}/event/detail?num=${event.EVENT_NUM}" data-no="14293" data-netfunnel="N" class="eventBtn" title="회원 시사회 상세보기">
		                   		 ${event.EVENT_SUBJECT}</a>
		                   	</th>
		                    <td>${event.EVENT_APPLYDATE}</td>
		                    <td>
		                    	<a href="${pageContext.request.contextPath}/event/winnerdetail?num=${event.EVENT_NUM}" class="button x-small black-line w70px" title="당첨자발표 결과확인 상세보기">결과확인</a>
		                    </td>
	                    </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- pagination -->
            <nav class="pagination"><strong class="active">1</strong> </nav>
            <!--// pagination -->

    </div>



   </div>
</div>
        
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

