<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
</sec:authorize>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/* $(function() {
	var payNum = $('#payNum').data('paynum');
	
	$.ajax({
        url: 'success',
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: { "payNum": payNum},
        dataType: 'json',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
            xhr.setRequestHeader("Accept-Charset", "UTF-8");
        },
        success: function(data) {
            var box = data.next_redirect_pc_url;
            window.open(box);
            alert("상품: "+ cartItemNames + " 총 가격: " + totalPrice);
        },
        error: function(error) {
            alert(JSON.stringify(error, null, 2));
        }
    });
}); */
</script>
</head>
<body>
<div>전체 예매내역</div>
<c:forEach var="b" items="${BookingList}">
	<c:if test="${pinfo.MEMBER_ID eq b.MEMBER_ID or pinfo.MEMBER_ID=='admin'}">
	<div>=================</div>
	<div>예약 번호: <span>${b.KPAY_NUM}</span></div>
	<div>예약자 ID: <span>${b.MEMBER_ID}</span></div>
    <div>예약 상품ID: <span>${b.THEATER_SCHEDULE_ID}</span></div>
    <div>예약 영화제목: <span>${b.MOVIE_TITLE}</span></div>
    <div>예약 영화ID: <span>${b.MOVIE_CODE}</span></div>
    <div>예약 영화 상영시간: <span>${b.MOVIE_RUNTIME}</span><span>분</span></div>
    <div>예약 영화장르: <span>${b.MOVIE_GENRE}</span></div>
    <div>예약 좌석: <span>${b.KPAY_OCCUPIED_SEAT}</span></div>
    <div>예약 좌석수: <span>${b.KPAY_SEAT_CNT}</span></div>
    <div>결제 총 금액: <span>${b.KPAY_AMOUNT}</span><span>원</span></div> 
    </c:if>
</c:forEach>
</body>
</html>