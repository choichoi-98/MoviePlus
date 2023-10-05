<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html lang="ko">
<!--<![endif]-->
<head>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="https://www.megabox.co.kr/store"
						title="스토어">스토어</a> <a
						href="https://www.megabox.co.kr/store/detail?prdtClCd=CPC02&amp;prdtNo=1747#"
						title="스토어상세">스토어상세</a>
				</div>
			</div>
		</div>
		<div id="storeDtl">
			<script type="text/javascript">
				var loginPopupCallScn = "StoreDtlV"; //로그인 레이어 팝업 띄울때 필요한 PARAM

				$(function() {
					var prdtPurc1OneLmtQty = 8; // 상품_구매_1_회당_제한_수량

					$(".line .cont button")
							.click(
									function() {
										var btn_name = $(this).attr("class");
										var input_d = $(".line .cont input[type='text']");
										var input_num = Number(input_d.val());

										if (btn_name == "btn minus") {
											if (input_num > 1) {
												input_d.val(input_num - 1);
											}
										} else if (btn_name == "btn plus") {
											if (input_num < prdtPurc1OneLmtQty)
												input_d.val(input_num + 1);
											else if (Number(prdtPurc1OneLmtQty) == -1)
												input_d.val(input_num + 1);
										}

										var tot_amt2 = String(
												Number($('#prdtExpoAmt').val())
														* Number(input_d.val()))
												.maskNumber();

										$('#prdtSumAmt').html(tot_amt2);
									});

					//동적으로 변경되는 구매/선물등 버튼그룹 클릭핸들러
					$("div.btn-group a")
							.click(
									function() {
										var thisClass = $(this).attr("class");

										var btnId = $(this).attr("id");

										$('#btnId').val(btnId);

										if (thisClass.indexOf("btn-modal-open") > -1) {
											return;
										}

										$
												.ajax({
													url : "/on/oh/oha/Movie/loginChk.do",
													type : "POST",
													contentType : "application/json;charset=UTF-8",
													dataType : "json",
													success : function(data,
															textStatus, jqXHR) {
														var resultMap = data.resultMap;

														if (resultMap.msg == "sessionFail") {
															gfn_confirmMsgBox({
																msg : '로그인 후 이용가능한 서비스입니다.\n로그인 하시겠습니까?',
																confirmFn : fn_moveLoginPage
															});

															return;
														}

														//결제 처리 체크
														if (!fn_payProcChk()) {
															return;
														}

														// 제한 수량 체크
														fn_LmtQtyChk();

														//취소 불가 체크
														//fn_cancelUnableChk();

														//취소 불가 체크
														//fn_cancelUnableChk();
													},
													error : function(xhr,
															status, error) {
														var err = JSON
																.parse(xhr.responseText);
														alert(xhr.status);
														alert(err.message);
													}
												});
									});
					// 사용가능극장 팝업
					$('#contents [name=brchList]').on('click', function(e) {
						e.preventDefault();
						gfn_storeBrchListPV('20002410');
					});

					//탭메뉴 설정
					setTab();
				});
				//로그인 페이지 이동
				function fn_moveLoginPage() {
					/*
					 $('[name=menuId]').val('StoreDtlV');
					 $('[name=mappingId]').val(location.pathname);

					 var form = $('#loginForm');
					 form.attr('action', '/on/oh/ohg/MbLogin/viewMbLoginMainPage.rest');
					 form.submit();
					 */
					//fn_viewLoginPopup('StoreDtlV','pc');
					//fn_viewLoginPopup('default','pc');
					fn_viewLoginPopup('default', 'pc', '', '', 'N');
				}
				//결제페이지 이동
				function fn_storePay() {
					// 뒤로가기 이후 결제페이지 이동시 배열로 잡혀서 수정
					$('#storeDtlForm input').each(function() {
						if ('btnId' != $(this).attr('name')) {
							$(this).remove();
						}
					});
					var contentUrl = "/store/payment";
					$("#storeDtlForm")
							.append(
									"<input type='hidden' name='prdtNo' value='" + 1747 + "' />");
					$("#storeDtlForm")
							.append(
									"<input type='hidden' name='cmbndKindNo' value='" + 20002410 + "' />");
					$("#storeDtlForm").append(
							"<input type='hidden' name='purcQty' value='"
									+ $(".line .cont input[type='text']").val()
									+ "' />");
					$("#storeDtlForm").append(
							"<input type='hidden' name='prdtSumAmt' value='"
									+ $('#prdtSumAmt').html() + "' />");
					// 2019.08.12 hjchoi 상품분류코드 & 상품명
					$("#storeDtlForm")
							.append(
									"<input type='hidden' name='prdtClCd' value='CPC02' />");
					$("#storeDtlForm")
							.append(
									"<input type='hidden' name='prdtNm' value='일반관람권&#40;2D&#41;' />");
					$("#storeDtlForm")
							.append(
									"<input type='hidden' name='prdtCompsDesc' value='일반 관람권' />");

					if ($("#acptBrchChoi").length > 0) {
						$("#storeDtlForm").append(
								"<input type='hidden' name='acptBrchChoiVal' value='"
										+ $("#acptBrchChoi").val() + "' />");
					} else {
						$("#storeDtlForm")
								.append(
										"<input type='hidden' name='acptBrchChoiVal' value='' />");
					}

					$("#storeDtlForm").attr("method", "post");
					$("#storeDtlForm").attr("action", contentUrl);
					$("#storeDtlForm").submit();
				}
			</script>
			<form id="loginForm" method="post">
				<input type="hidden" name="menuId"> <input type="hidden"
					name="mappingId"> <input type="hidden" name="rtnParam"
					value="prdtNo:1747">
			</form>
			<form id="storeDtlForm" method="post">
				<input type="hidden" name="btnId" id="btnId">
			</form>
			<input type="hidden" name="prdtExpoAmt" id="prdtExpoAmt"
				value="12000"> <input type="hidden"
				name="prdtPurcCancelAbleAt" id="prdtPurcCancelAbleAt" value="Y">

			<!-- 2019.08.12 hjchoi 수량제한 체크 -->
			<input type="hidden" id="prdtTotSellLmtQty" name="prdtTotSellLmtQty"
				value="-1">
			<!-- contents -->
			<div id="contents">
				<div class="inner-wrap">
					<!-- store-view -->
					<div class="store-view">
						<h2 class="tit">일반관람권(2D)</h2>
						<div class="sub-info">
							<p class="bundle">일반 관람권</p>
						</div>
						<!-- box-store-view -->
						<div class="box-store-view">
							<div class="left">
								<div class="img">
									<p>
										<img
											src="./(일반관람권(2D)) 상세3 _ 스토어 _ MEET PLAY SHARE, 메가박스_files/OzjTPmOIAocfyQnas3x8Vo9JDRRnHeKf_280.png"
											alt="일반관람권(2D)" onerror="noImg(this);">
									</p>
								</div>
								<p class="origin"></p>
							</div>
							<!-- right -->
							<div class="right">
								<!-- goods-info -->
								<div class="goods-info">
									<div class="line">
										<p class="tit">
											<span class="line32">사용극장</span>
										</p>
										<div class="cont">
											<a
												href="https://www.megabox.co.kr/store/detail?prdtClCd=CPC02&amp;prdtNo=1747#"
												class="a-link" name="brchList">사용가능극장</a>
										</div>
									</div>
									<div class="line">
										<p class="tit">유효기간</p>
										<div class="cont">
											<p class="txt">구매일로부터 24개월 이내 사용 가능</p>
											<p class="txt min">예매 가능 유효기간은 구매일로부터 2년입니다.</p>
											<p></p>
										</div>
									</div>
									<div class="line">
										<p class="tit">판매수량</p>
										<div class="cont">
											<div class="sale-count">
												<span> - </span>
											</div>
										</div>
									</div>
									<div class="line">
										<p class="tit">구매 후 취소</p>
										<div class="cont">
											<p class="txt">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
											<p class="txt min">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
										</div>
									</div>
								</div>
								<!-- type -->
								<div class="type">
									<!-- 수량 금액 일 때 -->
									<!--// 수량 금액 일 때 -->
									<!-- 기프트카드  -->
									<div class="receipt">
										<div class="line">
											<p class="tit">
												<span class="line32">수량/금액</span>
											</p>
											<div class="cont">
												<button type="button" class="btn minus" title="수량감소">
													<i class="iconset ico-minus"></i>
												</button>
												<input type="text" title="수량 입력" class="input-text"
													readonly="readonly" value="1">
												<button type="button" class="btn plus" title="수량증가">
													<i class="iconset ico-plus"></i>
												</button>
												<div class="money">
													<em id="prdtSumAmt">12,000</em> <span>원</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="btn-group">
									<a
										href="https://www.megabox.co.kr/store/detail?prdtClCd=CPC02&amp;prdtNo=1747#"
										id="btnGift" class="button large" w-data="500" h-data="410"
										title="장바구니">장바구니</a> <a
										href="https://www.megabox.co.kr/store/detail?prdtClCd=CPC02&amp;prdtNo=1747#"
										id="btnPurc" class="button purple large" w-data="500"
										h-data="410" title="구매">구매</a>
								</div>
							</div>
							<!--// right -->
						</div>
						<!--// box-store-view -->
					</div>
					<!--// store-view -->
					<!-- 레이어 : 극장확인 -->
					<section id="layer_chk01" class="modal-layer"></section>
					<!--// 레이어 : 극장확인 -->
					<!-- 레이어 : 지점확인 -->
					<section id="layer_chk02" class="modal-layer"></section>
					<!--// 레이어 : 지점확인 -->
					<!-- 레이어 : 취소불가 -->
					<section id="layer_chk03" class="modal-layer"></section>
					<!--// 레이어 : 지점확인 -->
					<!-- box-pulldown -->
					<div class="box-pulldown">
						<div class="tit">
							<button type="button" class="btn-toggle">
								구매 후 취소 <i class="iconset ico-arr-toggle-down"></i>
							</button>
						</div>
					</div>
					<!--// box-pulldown -->
					<!-- box-pulldown -->
					<div class="box-pulldown">
						<div class="tit">
							<button type="button" class="btn-toggle">
								상품이용안내 <i class="iconset ico-arr-toggle-down"></i>
							</button>
						</div>
					</div>
					<!--// box-pulldown -->
				</div>
			</div>
			<!--// contents -->
		</div>
	</div>
	<!--// container -->
</body>
</html>