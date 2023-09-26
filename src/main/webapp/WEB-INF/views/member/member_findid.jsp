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
		<h1 style="text-align:center;padding-bottom:30px;"><img src="${pageContext.request.contextPath}/image/header-logo.png" style="width: 140px; height: 47px;"><a href="https://www.megabox.co.kr/main" title="메인 페이지로 이동"></a></h1>

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">

				<p class="tit-member" style="color:#1a191f;">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

				<div class="tab-list">
					<ul>
						<li class="on"><a href="javaScript:void(0);" title="아이디찾기 선택" style="color:#1a191f;">아이디 찾기<!--아이디찾기--></a></li>
						<li><a href="" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>

				<div class="table-wrap">
					<table class="board-form">
						<caption>이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표<!--이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="ibxSchIdMbNm">이름<!--이름--></label></th>
								<td>
									<input id="ibxSchIdMbNm" maxlength="20" type="text" placeholder="이름" class="input-text w230px" wfd-id="id3"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdBirthDe">생년월일<!--생년월일--></label></th>
								<td>
									<input id="ibxSchIdBirthDe" maxlength="8" type="text" placeholder="생년월일 앞8자리" class="input-text w230px" wfd-id="id4"><!--생년월일 8자리-->
									<div id="schIdBirthDe-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxSchIdMblpTelno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input id="ibxSchIdMblpTelno" maxlength="11" type="text" placeholder="&#39;-&#39; 없이 입력" class="input-text w230px" wfd-id="id5"><!--'-' 없이 입력-->
									<div id="schIdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="mt20 font-size-14">
					※(변경하기) 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 아이디찾기를 진행해주시기 바랍니다.<!--※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 아이디찾기를 진행해주시기 바랍니다.-->
				</div>

				<div class="btn-member-bottom v1" style="border-bottom: 0px;">
					<button id="btnSchId" type="button" class="button purple large" disabled="disabled">아이디 찾기<!--아이디 찾기--></button>
				</div>
		

			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->

</html>