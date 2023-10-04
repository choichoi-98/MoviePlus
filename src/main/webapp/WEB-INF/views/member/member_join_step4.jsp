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
				<div class="step-member" title="step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step4 가입완료 단계"><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step4 가입완료 단계-->
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
							<p class="step">
								<em>STEP3.</em> <span>정보입력<!--정보입력--></span>
							</p>
						</li>
						<li>
							<p class="step on">
								<em>STEP4.</em> <span>가입완료<!--가입완료--></span>
							</p>
						</li>
					</ol>
				</div>
				<!--// step-member -->

				<!-- join-complete -->
				<div class="join-complete">
					<i class="iconset ico-join-complete"></i>

					<p class="name" style="color:black">${member.MEMBER_NAME}님 무비플러스 가입을 환영합니다.<!--님 메가박스 가입을 환영합니다.--></p>

					<p class="txt">이제부터 무비플러스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.<!--이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.--></p>

					<!--
					<div class="link">
						<a href="/benefit/membership" title="멤버십 페이지로 이동">멤버십혜택 안내  <i class="iconset ico-arr-right-gray"></i></a>
					</div>
					-->
				</div>
				<!--// join-complete -->

				<div class="btn-member-bottom">
					<a href="/movieplus/benefit/membership/" title="신규회원 혜택 확인 이동" class="button purple large" style="background-color:#792828">신규회원 혜택 확인</a>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->

</html>