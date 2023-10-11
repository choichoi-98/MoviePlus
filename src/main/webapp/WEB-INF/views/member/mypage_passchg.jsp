<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<title>MoviePlus: 모두를 위한 영화관 </title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

	<!-- 알림 모달 -->
	<!-- 
	<div class="alertStyle" style="position: fixed; top: 0px; left: 0px; background: rgb(0, 0, 0); opacity: 0.7; width: 100%; height: 100%; z-index: 5005;"></div>
	<section class="alert-popup" style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 382px; left: 499px; width: 300px; opacity: 1;" id="layerId_05036578214461327">
		<div class="wrap">
		<header class="layer-header">
			<h3 class="tit">알림</h3>
		</header>
		<div class="layer-con" style="height:200px">
			<p class="txt-common">비밀번호가 수정되었습니다.</p>
			<div class="btn-group">
				<button type="button" class="button lyclose" style="display: none;"></button>
				<button type="button" class="button purple confirm">확인</button>
			</div>
		</div>
		<button type="button" class="btn-layer-close">레이어 닫기</button></div>
	</section>
 	-->
<!-- 컨텐츠 영역 -->
<div id="contents">
	<h2 class="tit">비밀번호 변경</h2>

	<ul class="dot-list mb10">
		<li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
	</ul>
	<div class="table-wrap mb20">
		<table class="board-form">
			<caption>현재 비밀번호, 새 비밀번호, 새 비밀번호 확인 항목을 가진 표</caption>
			<colgroup>
				<col style="width:180px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="pwnew">새 비밀번호</label></th>
					<td>
						<form id="changepassform" action="${pageContext.request.contextPath}/member/modifypass" method="post">
	  					    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="MEMBER_ID" value="${memberInfo.MEMBER_ID}" >
							<input name="MEMBER_PASS" type="password" id="pwnew" class="input-text w150px">
							<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
							<span class="ml10 font-size-14">※ 영문, 숫자, 특수문자 중 2가지 이상 조합하여 10자리 이상으로 입력 해 주세요.</span>
						</form>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="repwnew">새 비밀번호 재입력</label></th>
					<td>
						<input type="password" id="checkpwnew" class="input-text w150px">
						<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
						<span class="ml10 font-size-14">※ 비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<ul class="dot-list">
		<li>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해 주세요.</li>
		<li>비밀번호는 3-6개월마다 꼭 바꿔 주세요.</li>
		<li>비밀번호 변경시 모바일 기기와 홈페이지에서 모두 로그아웃됩니다. 변경한 비밀번호로 다시 로그인해주세요.</li>
		<li>비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</li>
	</ul>

	<div class="btn-group pt40">
		<button class="button large" style="border:1px solid #792828; color:black;" id="chgcancelBtn">취소</button>
		<button form="changepassform" type="submit" class="button purple large" data-key="login_d358254baad74d7a9913bf7100ea5c0a" id="updatepassBtn">수정</button>
	</div>
</div>

<!-- contents end -->
</div>
</div>  
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>

