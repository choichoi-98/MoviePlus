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
<title>MoviePlus</title>
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

				<p class="tit-member" style="color:#1a191f;">아이디/비밀번호 찾기<!--아이디/비밀번호 찾기--></p>

				<div class="tab-list">
					<ul>
						<li><a href="/movieplus/member/findid" title="아이디찾기 선택">아이디찾기<!--아이디찾기--></a></li>
						<li class="on"><a href="javaScript:void(0);" title="비밀번호 찾기 선택" style="color:#1a191f;">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>

				<div class="table-wrap">
				 <form id="findpassform" action="${pageContext.request.contextPath}/member/findpassProcess" method="post">
				   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<table class="board-form">
						<caption>아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표<!--아이디이름, 휴대폰 번호, 인증번호 항목을 가진 비밀번호 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="findpassId">아이디<!--아이디--></label></th>
								<td>
									<input name="MEMBER_ID" id="findpassId" maxlength="20" type="text" placeholder="아이디" class="input-text w230px" required><!--아이디-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="findpassName">이름<!--이름--></label></th>
								<td>
									<input name="MEMBER_NAME" id="findpassName" maxlength="20" type="text" placeholder="이름" class="input-text w230px" required><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="findpassEmail">이메일 주소<!--이메일 주소--></label></th>
								<td>
									<input type="text" name="MEMBER_EMAIL" id="findpassEmail" maxlength="" placeholder="&#39;@&#39; 포함하여 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<button id="findVerifyNoSend" type="button" class="button gray w75px ml08">인증요청<!--인증요청--></button>
								</td>
							</tr>
							<tr id="schPwdMblpCertRow">
								<th scope="row"><label for="findpassVerifyNo">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input maxlength="6" type="text" id="findpassVerifyNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->
											<input type="hidden" class="verifycode" id="verifycode" name="verifycode" />
											<div class="time-limit" id="schPwdtimer">
												10:00
											</div>
										</div>
									</div>

									<button id="btnCheckVerify" type="submit" class="button gray-line w75px ml08 disabled" disabled="disabled">인증확인<!--인증확인--></button>
									<div id="schPwdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						</tbody>
					</table>

				<div class="mt20 font-size-14">
					※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 비밀번호찾기를 진행해주시기 바랍니다.<!--※ 휴대폰 번호가 변경된 경우 본인인증 찾기를 통하여 비밀번호찾기를 진행해주시기 바랍니다.-->
				</div>

				<div class="btn-member-bottom v1" style="border-bottom: 0px;">
					<button id="btnSchPwd" type="button" class="button purple large disabled" >비밀번호 찾기<!--비밀번호 찾기--></button>
				</div>
			  </form>
			 </div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->
</div>
</html>