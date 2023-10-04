
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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_join.js"></script>
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
				</div> <!-- class step-member end -->

				<p class="page-info-txt">
					<strong>회원가입을 위한 본인인증 단계입니다.<!--회원가입을 위한 본인인증 단계입니다.--></strong>
					<span>이메일 주소를 입력해주세요.<!--이메일 주소를 입력해주세요.--></span>
				</p>
				
				<div class="join-chk-me col-1">
					  <div class="table-wrap"> 	<!-- 이메일 인증 테이블 -->
					   <form action="${pageContext.request.contextPath}/member/join2" id="joinstep1form" method="post">
							<table class="board-form">
								<caption>이메일 인증 입력 표<!--이메일 인증 입력 표--></caption>
								<colgroup>
									<col style="width:130px;"><col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="ibxSchPwdMblpEmail">이메일 주소<!--이메일 주소--></label></th>
										<td>
											<input type="text" id="JoinEmail" maxlength="" placeholder="&#39;@&#39; 포함하여 입력" class="input-text w230px"><!--'-' 없이 입력-->
											<button id="btnSendverify" type="button" class="button gray w75px ml08 ">인증요청<!--인증요청--></button>
										</td>
									</tr>
									<tr id="schPwdMblpCertRow">
										<th scope="row"><label for="ibxSchPwdMblpCharCertNo">인증번호<!--인증번호--></label></th>
										<td>
											<div class="chk-num">
												<div class="line">
													<input maxlength="6" type="text" id="JoinVerifyNo" class="input-text w180px" title="인증번호 입력" disabled="disabled"><!--인증번호 입력-->
		
													<div class="time-limit" id="schPwdtimer">
														10:00
													</div>
												</div>
											</div>
											<input type="hidden" class="verifycode" id="verifycode" name="verifycode" />
											<button id="btnCheckNo" type="button" class="button gray-line w75px ml08 " >인증확인<!--인증확인--></button>
										</td>
									</tr>
								</tbody>
							</table>
						<div class="btn-member-bottom v1" style="border-bottom: 0px;">
							<button id="Submitbtn" type="submit" class="button purple large" style="background-color:#792828" >다음<!--다음 단계로 이동--></button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					 </form>
				   </div><!-- 이메일 인증 테이블 -->
			</div> <!-- class="join-chk-me col-1" end -->
			
		</div> <!-- div clas="col" end -->
		
	</div><!--// col-wrap -->
  </div><!-- <div class="member-wrap"> end  -->
</div> <!-- <div class="body-wrap"> end -->
<script>

</script>
</body>
</html>
