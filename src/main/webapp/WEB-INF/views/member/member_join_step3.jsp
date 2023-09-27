<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0035)https://www.megabox.co.kr/user-find -->
<html lang="ko"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>MoviePlus</title>

<!-- Global site tag (gtag.js) - Google Analytics -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css" media="all">

</head>
<!-- SNS 라이브러리 -->



<body class="bg-member">
    <div class="body-wrap">
        

<!--// header -->
<!-- 		<div id="bodyContent"> -->
        


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
					<table class="board-form">
						<caption>생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표<!--생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegEmail">이름<!--이메일 주소--></label></th>
								<td>
									<input maxlength="50" id="ibxJoinInfoRegEmail" type="text" placeholder="이름을 입력해 주세요" class="input-text w260px"><!--이름을 입력해 주세요-->
									<div id="JoinInfoRegEmail-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginId">아이디<!--아이디--></label></th>
								<td>
									<input maxlength="12" id="ibxJoinInfoRegLoginId" type="text" placeholder="영문,숫자 조합(6~12자)" class="input-text w260px"><!--영문,숫자 조합(6~12자)-->
									<button id="btnMbLoginIdDupCnfm" type="button" class="button gray-line small w75px ml08 disabled">중복확인<!--중복확인--></button>
									<div id="JoinInfoRegLoginId-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일<!--생년월일--></th>
								<td>
								<input maxlength="8" id="ibxMbJoinInfoRegBirthDe" placeholder="생년월일을 8자리로 입력해 주세요" class="input-text w260px"></td>
							</tr>

							<!-- 휴대폰 번호 불러올때 -->
							<tr id="trMblpTelno"><th scope="row">휴대폰 번호 <!--휴대폰 번호 --></th>
								<td>
									<input maxlength="11" id="ibxMbJoinInfoRegTelno" placeholder="휴대폰 번호를 입력해 주세요" class="input-text w260px"></td></tr>

							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginPwd">비밀번호<!--비밀번호--></label></th>
								<td>
									<input maxlength="16" id="ibxJoinInfoRegLoginPwd" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
									<div id="JoinInfoRegLoginPwd-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginPwdConfirm">비밀번호 확인<!--비밀번호 확인--></label></th>
								<td>
									<input maxlength="16" id="ibxJoinInfoRegLoginPwdConfirm" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
									<div id="JoinInfoRegLoginPwdConfirm-error-text" class="alert"></div>
								</td>
							</tr>
							
							<tr> <!-- 이메일 값은 앞에서 인증해서 가져오기 -->
								<th scope="row"><label for="ibxJoinInfoRegEmail">이메일 주소<!--이메일 주소--></label></th>
								<td>
									<input maxlength="50" id="ibxJoinInfoRegEmail" type="text" placeholder="이메일주소를 입력해 주세요" class="input-text w260px"><!--이메일주소를 입력해 주세요-->
									<div id="JoinInfoRegEmail-error-text" class="alert"></div>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>

				<!-- marketing-agree -->
				<div class="marketing-agree mt40">
					<p class="tit">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)<!--마케팅 활용을 위한 개인정보 수집 이용 안내(선택)--></p>

					<div class="cont">
						<dl>
							<dt>수집목적</dt><dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd><dt>수집항목</dt><dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd><dt>보유기간</dt><dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd><!--<dt>수집목적</dt>
													   <dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd>
													   <dt>수집항목</dt>
													   <dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd>
													   <dt>보유기간</dt>
													   <dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd>-->
						</dl>

						<div class="radio-agree">
							<input type="radio" id="agree" name="marketing_agree">
							<label for="agree">동의<!--동의--></label>

							<input type="radio" id="notagree" name="marketing_agree" class="ml20">
							<label for="notagree">미동의<!--미동의--></label>
						</div>

						<p class="mt30">혜택 수신설정<!--혜택 수신설정--></p>

						<div class="benefit-agree">
							<input type="checkbox" id="push">
							<label for="push">알림<!--알림--></label>

							<input type="checkbox" id="sms" class="ml20">
							<label for="sms">SMS</label>

							<input type="checkbox" id="email" class="ml20">
							<label for="email">이메일<!--이메일--></label>
						</div>

						<p class="mt20">
							※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br>(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)<!--※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br />
														(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)-->
						</p>

					</div>
				</div>
				<!--// marketing-agree -->


				<div class="btn-member-bottom">
					<button id="btnJoinInfoRegButton" type="button" class="button purple large disabled">회원가입<!--회원가입--></button>

				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->

</html>