<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>

</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<script>
	$(document).ready(function() {
		
		var token = $("meta[name='_csrf']").attr("content"); // csrf 토큰값 받아오기
		var header = $("meta[name='_csrf_header']").attr("content");
		
		function getTheaterListAjax(location){
			$.ajax({
	            type: "POST", // 메소드 타입
	            url: "getTheaterListAjax", // 컨트롤러 주소
	            data: { // 데이터 
					location : location // 키 : 밸류       
	            },
	            beforeSend : function(xhr){ // ajax에서 가장 먼저 실행되는거
	                xhr.setRequestHeader(header, token); // csrf를 보내주는거()
	            },
	            success: function (data) { // success : 주소로 가는게 성공했을때, data는 컨트롤러가 리턴해주는 데이터에요
	            	$('#theaterSelect').empty(); // 지역선택 할때마다 옵션에 쌓인 값들을 초기화해줘요
	            
	            	$(data).each(function(index, item){ // 데이터 리스트를 반복하는거 forEach랑 비슷
	            		var output = '<option value="'+item.theater_NAME+'">'+item.theater_NAME+'</option>'; // option 형태를 만들어줌
	            		$('#theaterSelect').append(output); // append가 선택한태그의 내부에 차곡차곡 쌓아주는 거에요. 
	            	})
	            },
	            error: function() { // 실패했으면 에러에 있는게 나와요	
	                
	                console.log('ajax 실패');
	            } 

	            
	        });
		}
		
		$('#regionSelect').change(function(){
			var location = $(this).val();
			
			getTheaterListAjax(location);
		})
		  

	})
</script>

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="고객센터 페이지로 이동">고객센터</a> <a
						href="#" title="1:1 문의 페이지로 이동">1:1 문의</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div id="contents" style="float: none; width: 100%">
				<h2 class="tit">1:1 문의</h2>
				<div class="mypage-infomation mb30">
					<ul class="dot-list">
						<li><span style="font-weight: bold;">고객님의 문의에 답변하는 직원은
								<span style="color: #EB323A;">고객 여러분의 가족 중 한 사람일 수 있습니다.</span>
						</span><br> 고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br> 관련
							법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br></li>
						<li>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</li>
					</ul>
					<div class="btn-group right">
						<a
							href="${pageContext.request.contextPath}/customer_service/myinjury"
							class="button purple" id="myQnaBtn" title="나의 문의내역 페이지로 이동">나의
							문의내역</a>
						<!-- btn-layer-open -->
					</div>
				</div>

				<div class="agree-box">
					<dl>
						<dt>
							<span class="bg-chk mr10"> <input type="checkbox" id="chk"
								required> <label for="chk"><strong>개인정보
										수집에 대한 동의</strong></label>
							</span> <span class="font-orange">[필수]</span>
						</dt>
						<dd style="font-size: 13px;">
							귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집·이용에 대한 본인동의가 필요한 항목입니다.<br>
							<br> [개인정보의 수집 및 이용목적]<br> 회사는 1:1 문의 내역의 확인, 요청사항 처리
							또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br>
							<br> [필수 수집하는 개인정보의 항목]<br> 이름, 휴대전화, 이메일, 문의내용<br>
							<br> [개인정보의 보유기간 및 이용기간]<br> <span class="ismsimp">문의
								접수 ~ 처리 완료 후 3년<br> (단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계
								법령에 따라 보존)<br> 자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.
							</span>
						</dd>
					</dl>
				</div>

				<p class="reset mt10">* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우
					서비스를 이용하실 수 없습니다</p>

				<p class="reset mt30 a-r font-orange">* 필수</p>

				<!-- 폼 시작 시점 JS 작성포함-->
				<script>
					function enableTheaterSelect() {
						document.getElementById("theaterSelect")
								.removeAttribute("disabled");
					}
					function disableRegionSelect() {
						document.getElementById("theaterSelect").setAttribute(
								"disabled", "disabled");
					}
				</script>

				<form name="regFrm" method="post" action="oneonone_process">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<div class="table-wrap mt10">
						<table class="board-form va-m">
							<colgroup>
								<col style="width: 150px;">
								<col>
								<col style="width: 150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="ask-select">극장선택</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><select name="CUSTOMER_SELECT_REGION"
										id="regionSelect" onchange="enableTheaterSelect();" size="1"
										style="width: 90px; height: 35px; border-radius: 5px;" required>
											<option value="">지역선택</option>
											<c:forEach var="loc" items="${locationList}">
												<option value="${loc.value}">${loc.value}</option>
											</c:forEach>

									</select>&nbsp;&nbsp; <select name="CUSTOMER_SELECT_CENEMA"
										id="theaterSelect" size="1"
										style="width: 90px; height: 35px; border-radius: 5px;"
										disabled>

									</select></td>
								</tr>
								<tr>
									<th scope="row"><label for="ask-type">문의유형</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><select name="CUSTOMER_TYPE" size="1"
										style="width: 120px; height: 35px; border-radius: 5px;"
										required>
											<option value="" disabled selected>문의유형 선택</option>
											<option value="일반">일반 문의</option>
											<option value="분실물">분실물 문의</option>
											<option value="단체/대관">단체/대관 문의</option>
									</select>
								</tr>
								<tr>
									<th scope="row"><label for="name">이름</label> 
									<em class="font-orange">*</em></th>
									<td><input type="text" id="name" name="CUSTOMER_NAME"
										class="input-text w150px" value="" maxlength="30" required>
									</td>
									<th scope="row"><label for="qnaRpstEmail">이메일</label> 
									<em class="font-orange">*</em></th>
									<td><input type="email" name="CUSTOMER_EMAIL"
										id="qnaRpstEmail" class="input-text" value="" maxlength="50"
										required></td>
								</tr>
								<tr>
									<th scope="row"><label for="hpNum1">휴대전화</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><input type="text"
										name="CUSTOMER_PHONNUM1" id="hpNum1"
										class="input-text w60px numType" maxlength="3"
										title="핸드폰번호 첫자리 입력" required> <span>-</span> <input
										type="text" name="CUSTOMER_PHONNUM2" id="hpNum2"
										class="input-text w70px numType" maxlength="4"
										title="핸드폰번호 중간자리 입력" required> <span>-</span> <input
										type="text" name="CUSTOMER_PHONNUM3" id="hpNum3"
										class="input-text w70px numType" maxlength="4"
										title="핸드폰번호 마지막자리 입력" required>
										<div id="qnaMblpNo-error-text" class="alert"></div></td>
								</tr>
								<tr>
									<th scope="row"><label for="qnaCustInqTitle">제목</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><input type="text" name="CUSTOMER_TITLE"
										id="qnaCustInqTitle" class="input-text" maxlength="100"
										required></td>
								</tr>
								<tr>
									<th scope="row"><label for="textarea">내용</label> <em
										class="font-orange">*</em></th>
									<td colspan="3">
										<div class="textarea">
											<div id="textarea-notice"
												style="color: #999999; margin-left: 10px;">
												<!-- <ul>- 문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.</ul>
												<ul style="font-weight: bold"> - 비회원 문의시 이메일로 답변내용이 발송되오니 정확하게 작성부탁드립니다.</ul>
												<ul> - 회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다.</ul> -->
											</div>
											<textarea id="textarea"
												placeholder="문의 내용을 작성해주세요 &#10;답변은 메일로도 전달됩니다. 메일주소를 확인해주세요."
												name="CUSTOMER_CONTENT" rows="5" cols="30" title="내용입력"
												class="input-textarea" required></textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn-group pt40">
						<button type="submit" class="button purple large">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--// container -->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>