<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><!--<![endif]--><head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_find.js"></script>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>

<body class="bg-member">
    <div class="body-wrap">

	<div class="member-wrap">
		<h1 style="text-align:center;padding-bottom:30px;">
			<a href="/movieplus/main" title="메인 페이지로 이동"><img src="${pageContext.request.contextPath}/image/header-logo.png" style="width: 140px; height: 47px;">
			</a>
		</h1>

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member">비밀번호 재설정<!--비밀번호 재설정--></p>

				<ul class="dot-list gblue">
					 <li class="font-gblue">이메일 인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.<!--보안인증이 완료되었습니다. 새로 사용하실 비밀번호를 입력해주세요.--></li>
				</ul>

				<div class="table-wrap mt15">
				 <form id="findPassResetform" action="${pageContext.request.contextPath}/member/modifypass" method="post">
				   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<table class="board-form">
						<caption>아이디, 새 비밀번호, 새 비밀번호 확인 항목을 가진 아이디 등록 표<!--아이디, 새 비밀번호, 새 비밀번호 확인 항목을 가진 아이디 등록 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
									<tr>
										<th scope="row">아이디<!--아이디--></th>
										<td>
											${memberInfo.MEMBER_ID}
											<input type="hidden" name="MEMBER_ID" value="${memberInfo.MEMBER_ID}">
										</td>
									</tr>
								
							
							<tr id="pwdReSet" style="">
								<th scope="row"><label for="ResetLoginPass">새 비밀번호<!--새 비밀번호--></label></th>
								<td>
									<input name="MEMBER_PASS" id="ResetLoginPass" maxlength="16" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w300px"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
								</td>
							</tr>
							<tr id="pwdReSetConfirm" style="">
								<th scope="row"><label for="ResetLoginPassConfirm">새 비밀번호 확인<!--새 비밀번호 확인--></label></th>
								<td>
									<input id="ResetLoginPassConfirm" maxlength="16" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w300px"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
									<!--
										오류메시지가 업을때는 tag 자체가 나오지 않아야 합니다.
									 -->
									<div id="pwdReSet-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>
				

				<ul class="dot-list gblue mt20">
					<li>비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합 10자리 이상으로 설정해주세요.</li><li>생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해주세요.</li><li>비밀번호는 3개월마다 변경해주세요.</li><li>비밀번호 변경시 로그인된 모든 디바이스에서 로그아웃됩니다. 변경한 비밀번호로 다시 로그인 후 이용해주세요.</li><li>비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</li><!--<li>비밀번호는 영문, 숫자, 특수문자 중 2가지 이상 조합 10자리 이상으로 설정해주세요.</li><li>생년월일, 휴대폰번호 등 개인정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 사용을 자제해주세요.</li><li>비밀번호는 3개월마다 변경해주세요.</li><li>비밀번호 변경시 로그인된 모든 디바이스에서 로그아웃됩니다. 변경한 비밀번호로 다시 로그인 후 이용해주세요.</li>-->
				</ul>

				<div class="btn-member-bottom">
					<button id="btnPwdResetButton" type="submit" class="button purple large" style="background:#792828;">확인<!--확인--></button>
				</div>
			   </form>
			  </div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
</div>
</html>