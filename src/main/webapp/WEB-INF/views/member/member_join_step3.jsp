<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MoviePlus</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_join.js"></script>
</head>

<body class="bg-member">
    <div class="body-wrap">
        
	<!-- member-wrap -->
	<div class="member-wrap">
		<h1 style="text-align:center;padding-bottom:30px;">
			<a href="/movieplus/main" title="메인 페이지로 이동"><img src="${pageContext.request.contextPath}/image/header-logo.png" style="width: 140px; height: 47px;">
			</a>
		</h1>

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">
				<!-- step-member -->
				<div class="step-member" title=""><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step3 정보입력 단계-->
					<ol>
						<li>
							<p class="step">
								<em>STEP1.</em> <span>본인인증<!--본인인증--></span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP2.</em> <span>약관동의<!--약관동의--></span>
							</p>
						</li>
						<li>
							<p class="step on">
								<em>STEP3.</em> <span>정보입력<!--정보입력--></span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP4.</em> <span>가입완료<!--가입완료--></span>
							</p>
						</li>
					</ol>
				</div>
				<!--// step-member -->

				<p class="page-info-txt">
					<strong>회원정보를 입력해주세요.<!--님 안녕하세요.--></strong>
					<span><!--회원정보를 입력해주세요.--></span>
				</p>

				<div class="table-wrap">
				<form action="${pageContext.request.contextPath}/member/joinProcess" id="joinstep3form" method="post">
					<table class="board-form">
						<caption>생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표<!--생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="MEMBER_NAME">이름<!--이메일 주소--></label></th>
								<td>
									<input name="MEMBER_NAME" maxlength="30" id="MEMBER_NAME" type="text" placeholder="이름을 입력해 주세요" class="input-text w260px" required><!--이름을 입력해 주세요-->
									<div id="JoinInfoRegEmail-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="MEMBER_ID">아이디<!--아이디--></label></th>
								<td>
									<input name="MEMBER_ID" maxlength="12" id="MEMBER_ID" type="text" placeholder="영문,숫자 조합(5~12자)" class="input-text w260px" required><!--영문,숫자 조합(6~12자)-->
									<button id="btnIdCheck" type="button" class="button gray-line small w75px ml08 disabled">중복확인<!--중복확인--></button>
									<div id="JoinInfoRegLoginId-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일<!--생년월일--></th>
								<td>
									<input name="MEMBER_BIRTH" maxlength="8" id="MEMBER_BIRTH" placeholder="생년월일을 8자리로 입력해 주세요" class="input-text w260px" required>
									<div id="JoinInfoRegLoginBirth-error-text" class="alert"></div>
								</td>
							</tr>

							<!-- 휴대폰 번호 -->
							<tr id="trMblpTelno"><th scope="row">휴대폰 번호 <!--휴대폰 번호 --></th>
								<td>
									<input name="MEMBER_PHONENO" maxlength="11" id="MEMBER_PHONENO" placeholder="&#39;-&#39;를 제외하고 입력해 주세요" class="input-text w260px" required>
									<div id="JoinInfoRegLoginPhone-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="MEMBER_PASS">비밀번호<!--비밀번호--></label></th>
								<td>
									<input name="MEMBER_PASS" id="MEMBER_PASS" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px" required><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ! @ # % + = \ - ? _ 입니다.</span>
									<div id="JoinInfoRegLoginPwd-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="MEMBER_PASS_Confirm">비밀번호 확인<!--비밀번호 확인--></label></th>
								<td>
									<input id="MEMBER_PASS_Confirm" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px" required><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ! @ # % + = \ - ? _ 입니다.</span>
									<div id="JoinInfoRegLoginPwdConfirm-error-text" class="alert"></div>
								</td>
							</tr>
							
							<tr> <!-- 이메일 값은 앞에서 인증해서 가져오기 -->
								<th scope="row"><label for="MEMBER_EMAIL">이메일 주소<!--이메일 주소--></label></th>
								<td>
									<input name="MEMBER_EMAIL" id="MEMBER_EMAIL" type="text" class="input-text w260px" value="${MEMBER_EMAIL}" readOnly><!--이메일주소를 입력해 주세요-->
									<div id="JoinInfoRegEmail-error-text" class="alert"></div>
								</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn-member-bottom">
						<button id="btnJoinInfoRegButton" type="submit" class="button purple large disabled">회원가입<!--회원가입--></button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>

				
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->
</div>
</body>
</html>