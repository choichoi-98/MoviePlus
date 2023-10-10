<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0035)https://www.megabox.co.kr/user-find -->
<html lang="ko"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>MoviePlus</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_find.js"></script>
</head>

<body class="bg-member">
    <div class="body-wrap">

<!-- 알림 모달창 -->
<div class="alertStyle" style="position: fixed; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; width: 100%; height: 100%; z-index: 5005; display: none;"></div>
<section class="alert-popup" style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 371px; left: 459.5px; width: 400px; opacity: 0;">
	<div class="wrap">
		<header class="layer-header">
			<h3 class="tit">알림</h3>
		</header>
		<div class="layer-con" style="height:250px">
			<p class="txt-common"><p class="txt-common">회원님의 아이디는 <span id="findIdresult"></span> 입니다.</p>
			<div class="btn-group">
				<button type="button" class="button lyclose" style="display: none;"></button>
				<button id="alertclose" type="button" class="button purple confirm">확인</button>
			</div>
		</div>
		<button type="button" class="btn-layer-close">레이어 닫기</button>
	</div>
</section>


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
						<li class="on"><a href="javaScript:void(0);" title="아이디찾기 선택" style="color:#1a191f;">아이디 찾기<!--아이디찾기--></a></li>
						<li><a href="/movieplus/member/findpass" title="비밀번호 찾기 선택">비밀번호 찾기<!--비밀번호 찾기--></a></li>
					</ul>
				</div>

				<h2 class="tit mt40">간편찾기<!--간편찾기--></h2>

				<div class="table-wrap">
				   <form id="findIdform" >
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<table class="board-form">
						<caption>이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표<!--이름, 생년월일, 휴대폰 번호 항목을 가진 아이디 찾기 입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="findIdName">이름<!--이름--></label></th>
								<td>
									<input name="MEMBER_NAME" id="findIdName" maxlength="20" type="text" placeholder="이름" class="input-text w230px"><!--이름-->
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="findIdBirth">생년월일<!--생년월일--></label></th>
								<td>
									<input name="MEMBER_BIRTH" id="findIdBirth" maxlength="8" type="text" placeholder="생년월일 앞8자리" class="input-text w230px" ><!--생년월일 8자리-->
									<div id="schIdBirthDe-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="findIdPhoneno">휴대폰 번호<!--휴대폰 번호--></label></th>
								<td>
									<input name="MEMBER_PHONENO" id="findIdPhoneno" maxlength="11" type="text" placeholder="&#39;-&#39; 없이 입력" class="input-text w230px"><!--'-' 없이 입력-->
									<div id="schIdMblpNo-error-text" class="alert"></div>
								</td>
							</tr>
						 </tbody>
					</table>
				   <div class="mt20 font-size-14">
				   </div>
	
				   <div class="btn-member-bottom v1" style="border-bottom: 0px;">
						<button id="btnSchId" type="submit" class="button purple large" style="background:#792828;">아이디 찾기<!--아이디 찾기--></button>
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
  
 <script>

</script> 
</body>
</html>