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
			<div class="col">

				<div class="step-member" title="step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step1 본인인증 단계"><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step1 본인인증 단계-->
					<ol>
						<li>
							<p class="step on">
								<em>STEP1.</em> <span>본인인증<!--본인인증--></span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP2.</em> <span>약관동의<!--약관동의--></span>
							</p>
						</li>
						<li>
							<p class="step">
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

				<p class="page-info-txt">
					<strong>회원가입을 위한 본인인증 단계입니다.<!--회원가입을 위한 본인인증 단계입니다.--></strong>
					<span>원하시는 인증방법을 선택해주세요.<!--원하시는 인증방법을 선택해주세요.--></span>
				</p>
				
					<div class="join-chk-me col-1">
						<a href="javascript:fn_kakaoCertSubmit();" class="kakoBtn">
							<div class="img"><img src="./1_files/kakaoBank.png" alt="카카오인증"></div>
							<span>카카오뱅크 인증</span>
						</a>
					</div>
				
				<div class="join-chk-me col-2">
					<a href="javaScript:fn_mblpCertSubmit()" title="휴대폰 인증 선택" id="btnMblpCert">
						<i class="iconset ico-member-phone"></i>
						<span>휴대폰 인증<!--휴대폰 인증--></span>
					</a>

					<a href="javaScript:fn_IpinCertSubmit()" title="아이핀 인증 선택" id="btnIpinCert">
						<i class="iconset ico-member-ipin"></i>
						<span>아이핀 인증<!--아이핀 인증--></span>
					</a>
				</div>

				<ul class="dot-list gray mt20">
					<li>14세 미만 어린이는 보호자 인증을 추가로 완료한 후 가입이 가능합니다.</li><li>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용  또는  저장되지 않습니다.</li><!--<li>14세 미만 어린이는 보호자 인증을 추가로 완료한 후 가입이 가능합니다.</li>
											<li>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용  또는  저장되지 않습니다.</li>-->
				</ul>
			</div>
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->

</html>