<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<title>MoviePlus: 모두를 위한 영화관 </title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

<form action="${pageContext.request.contextPath}/member/logincheck" id="moveFrm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div id="myLoactionInfo" style="display: none;">
		<div class="location">
			<span>Home</span>
			<a href="https://www.megabox.co.kr/mypage" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
			<a href="https://www.megabox.co.kr/mypage/myinfo?returnURL=info" title="회원정보 페이지로 이동">회원정보</a>
		</div>
	</div>
	<div id="contents" class="">
		<h2 class="tit">회원정보</h2>

		<div class="member-wrap">
			<strong>회원님의 개인정보 보호를 위해 비밀번호 확인을 하셔야 합니다.</strong>
				<div class="table-wrap">
					<table class="board-form">
						<caption>비밀번호 로그인 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<input name="MEMBER_ID" id="LogincheckId" type="hidden" value="${memberInfo.MEMBER_ID}"><!--아이디-->
							<tr>
								<th scope="row"><label for="ibxSchPwdMblpTelno">비밀번호 입력<!--비밀번호--></label></th>
								<td>
									<input name="MEMBER_PASS" type="password" class="input-text w260px" >
									
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>

		<div class="btn-group">
			<button class="button large" id="cancelBtn" title="취소">취소</button>
			<button type="submit" class="button large purple" id="ckBtn" title="확인">확인</button>
		</div>
		
	</div>
</form>

   </div>
</div>
        
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

