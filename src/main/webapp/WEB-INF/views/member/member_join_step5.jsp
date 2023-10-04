<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus</title>

<!-- Global site tag (gtag.js) - Google Analytics -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
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
				<div class="step-member" title="step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step2 약관동의 단계"><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step2 약관동의 단계-->
					<ol>
						<li>
							<p class="step">
								<em>STEP1.</em> <span>본인인증<!--본인인증--></span>
							</p>
						</li>
						<li>
							<p class="step on">
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
				<!--// step-member -->

				<p class="page-info-txt">
					<strong>약관동의 및 정보활용동의</strong><span>무비플러스 서비스 이용을 위한 약관에 동의해주세요.</span><!--<strong>약관동의 및 정보활용동의</strong><span>무비플러스 서비스 이용을 위한 약관에 동의해주세요.</span>-->
				</p>

				<!-- member-rule-agree -->
				<div class="member-rule-agree">
				 <form action="${pageContext.request.contextPath}/member/join3" method="post">
					<div class="all-chk">
						<input type="checkbox" id="chkAll">
						<label for="chkAll"> 전체동의<!--전체동의--></label>
					</div>

					<div class="block">
						<div class="chk">
							<input type="checkbox" id="chkUtilClau" class="chkbox">
							<label for="chkUtilClau" class="must">서비스 이용 약관 동의(필수)<!--서비스 이용약관(필수)--></label>
						</div>

						<div id="utilClau" class="scroll" tabindex="0"><div>
<style type="text/css">dl {
      counter-reset: my-counter;
      margin-left: 20px;
    }

    dt {
      font-weight: bold;
      margin-top: 20px;
    }

    dd {
      margin-left: 20px;
    
    }
</style>
					</div>

				<input type="hidden" name="email" value="${MEMBER_EMAIL}">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<div class="btn-member-bottom">
					<button id="btnClauAgree" type="submit" class="button purple large" style="background-color:#792828" >확인<!--확인--></button>
				</div>
			  </form>
			</div> <!--// member-rule-agree -->
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
	<!--// member-wrap -->
</div>


<script>
$(document).ready(function(){

	$('#chkAll').on("click", function(){ //전체동의 클릭시 전체 선택
		var checkedAll = $('#chkAll').is(':checked');
		
		if(checkedAll){
			$('.chkbox').prop("checked", true);
		}else {
			$('.chkbox').prop("checked", false);
		}
	}); //#chkAll end
	
	$("#btnClauAgree").click(function(e){	//확인 버튼 클릭시 step3로 이동
		let check1 = $('#chkUtilClau').is(":checked");
		let check2 = $('#chkPersonInfo').is(":checked");
		
		if(check1 && check2){
			return true;
		} else {
			alert("약관에 동의해주세요.");
			return false;
		}
	})
	
});

</script>
</body>
</html>