<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:forEach var="p" items="${AprPayList}">
	<div>결제 번호: <span>${p.PAY_NUM}</span></div>
    <div>결제 상품: <span>${p.PAY_NAME}</span></div>
 <!--   <em id="payNum" data-paynum="${p.PAY_NUM}"></em> --> 
    <div>결제 총 금액: <span>${p.PAY_AMOUNT}</span></div> 
</c:forEach>

</body>
</html>