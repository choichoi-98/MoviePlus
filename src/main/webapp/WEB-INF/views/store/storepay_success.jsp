<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="pinfo" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<title>MoviePlus: 모두를 위한 영화관</title>
    <style>
        .container {
            margin: 0;
            padding: 0;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/storepay_success.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    <jsp:include page="/WEB-INF/views/mypage_sidebar.jsp" />
    <div class="container">
        <div id="storePay">
            <form name="payForm" id="payForm" method="post">
                <input type="hidden" name="completeYn" id="completeYn" value="">
                <input type="hidden" name="prepareYn" id="prepareYn" value="Y">
                <input type="hidden" name="lastPayMethod" id="lastPayMethod">
                <input type="hidden" name="preDisc" id="preDisc" value="">
                <input type="hidden" name="discType" id="discType" value="">
            </form>
            <form name="ifrm" method="GET" target="FD_PAY_FRAME" action="https://www.megabox.co.kr/on/oh/ohz/PayStore/applyCreditCard.do">
                <input type="hidden" name="transNo" id="ifrm_transNo">
                <input type="hidden" name="useAmt" id="ifrm_useAmt">
                <input type="hidden" name="methodName" id="ifrm_methodName">
                <input type="hidden" name="selectCard" id="ifrm_selectCard">
                <input type="hidden" name="pointDmode" id="ifrm_pointDmode">
            </form>
            <div id="contents">
                <div class="inner-wrap">
                    <div class="store-payment">
                        <h2 class="tit">구매내역</h2>
                        <div class="table-wrap" style="width: 80%">
                            <table class="board-list">
                                <caption>주문상품정보 목록 표</caption>
                                <colgroup>
                                    <col style="width: 120px;">
                                    <col>
                                    <col style="width: 150px;">
                                    <col style="width: 80px;">
                                    <col style="width: 200px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="colgroup" colspan="2">상품명</th>
                                        <th scope="col">결제금액</th>
                                        <th scope="col">상태</th>
                                        <th scope="col">구매취소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${AprPayList}" varStatus="loop">
                                        <c:if test="${pinfo.MEMBER_ID eq p.MEMBER_ID or pinfo.MEMBER_ID=='admin'}">
                                            <tr>
                                                <td class="a-c">${p.PAY_DATE}
                                                    <!-- <div class="goods-info">
                                                        <p class="img">
                                                            <a href="javascript:fn_storeDetail();" title="일반관람권(2D)">
                                                                <img src="" alt="" onerror="noImg(this);">
                                                            </a>
                                                        </p>
                                                    </div> -->
                                                </td>
                                                <th scope="row">
                                                    <div class="goods-info">
                                                        <p class="name">
                                                            <a href="javascript:fn_storeDetail();" title="일반관람권(2D)">${p.PAY_NAME}</a>
                                                        </p>
                                                        <p class="bundle"></p>
                                                    </div>
                                                    <div class="mt10">
                                                        <span id="acptBrchView" class="font-gblue"></span>
                                                        <em id="acptBrchChoiValView"></em>
                                                    </div>
                                                </th>
                                                <td>
                                                    <div class="goods-info">
                                                        <em id="prdtSumAmtView" class="price" style="color: black">${p.PAY_AMOUNT}</em>원
                                                    </div>
                                                </td>
                                                <td><em id="purcQtyView">결제완료</em></td>
                                                <td>
                                                    <a href="http://localhost:9000/movieplus/store/cart?ITEM_CODE=" class="a-link delbtn" style="color: #792828" name="brchList" title="삭제" data-paynum="${p.PAY_NUM}">취소</a>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty AprPayList}">
                                        <tr>
                                            <td colspan="5">결제내역이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>
