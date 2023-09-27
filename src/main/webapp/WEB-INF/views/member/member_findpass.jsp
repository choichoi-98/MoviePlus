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

				<p class="tit-member" style="color:#1a191f;">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

				<div class="tab-list">
					<ul>
						<li><a href="/movieplus/member/findid" title="아이디찾기 선택">아이디찾기<!--아이디찾기--></a></li>
						<li class="on"><a href="javaScript:void(0);" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>

				<div class="table-wrap">
					<table class="board-form">
						<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxSchPwdLoginId">아이디<!--아이디--></label></th>
								<td>
									<input id="ibxSchPwdLoginId" maxlength="20" type="text" placeholder="아이디" class="input-text w230px"><!--아이디-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchPwdMbNm">이름<!--이름--></label></th>
								<td>
									<input id="ibxSchPwdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchPwdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input type="text" id="ibxSchPwdMblpTelno" maxlength="11" placeholder="&#39;-&#39; 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<button id="btnSchPwdMbCertNoSend" type="button" class="button gray w75px ml08 disabled" disabled="disabled">인증요청<!--인증요청--></button>
								</td>
							</tr>
							<tr id="schPwdMblpCertRow">
								<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input maxlength="4" type="text" id="ibxSchPwdMblpCharCertNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->

											<div class="time-limit" id="schPwdtimer">
												3:00
											</div>
										</div>
									</div>

									<button id="btnSchPwdMblpCharCert" type="button" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
									<div id="schPwdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="mt20 font-size-14">
					※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 비밀번호찾기를 진행해주시기 바랍니다.<!--※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 비밀번호찾기를 진행해주시기 바랍니다.-->
				</div>

				<div class="btn-member-bottom v1" style="border-bottom: 0px;">

					<button id="btnSchPwd" type="button" class="button purple large disabled" disabled="disabled">비밀번호 찾기<!--비밀번호 찾기--></button>
				</div>

				

			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->

</html>