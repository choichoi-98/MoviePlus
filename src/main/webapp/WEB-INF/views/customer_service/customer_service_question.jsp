<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />


	<div id="layer_header_search" class="header-layer layer-header-search"></div>

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="https://megabox.co.kr/support"
						title="고객센터 페이지로 이동">고객센터</a> <a
						href="https://megabox.co.kr/support/faq" title="자주 묻는 질문 페이지로 이동">자주
						묻는 질문</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div class="lnb-area addchat">
				<nav id="lnb" class="ty2">
					<p class="tit">
						<a href="https://megabox.co.kr/support" title="고객센터">고객센터</a>
					</p>
					<ul>
						<li><a href="https://megabox.co.kr/support" title="고객센터 홈">고객센터
								홈</a></li>
						<li class="on"><a href="https://megabox.co.kr/support/faq"
							title="자주 묻는 질문">자주 묻는 질문</a></li>
						<li><a href="https://megabox.co.kr/support/notice"
							title="공지사항">공지사항</a></li>
						<li><a href="https://megabox.co.kr/support/inquiry"
							title="1:1문의">1:1문의</a></li>
						<li><a href="https://megabox.co.kr/support/rent"
							title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
						<li><a href="https://megabox.co.kr/support/lost"
							title="분실물 문의">분실물 문의</a></li>

						<li><a href="https://megabox.co.kr/support/terms"
							title="이용약관">이용약관</a></li>
						<li><a href="https://megabox.co.kr/support/lcinfo"
							title="위치기반서비스이용약관">위치기반서비스이용약관</a></li>
						<li><a href="https://megabox.co.kr/support/privacy"
							title="개인정보처리방침">개인정보처리방침</a></li>
						<li><a href="https://megabox.co.kr/support/screenrule"
							style="border-radius: 0 0 10px 10px;" title="스크린배정수에관한기준">스크린배정수에관한기준</a></li>
					</ul>

					<!-- 고객센터 메뉴일때만 출력 -->
					<div class="left-customer-info">
						<p class="tit">
							메가박스 고객센터 <span>Dream center</span>
						</p>
						<p class="time">
							<i class="iconset ico-clock"></i> 10:00~19:00
						</p>
					</div>
				</nav>
			</div>

			<div id="contents" class="">
				<h2 class="tit">자주 묻는 질문</h2>

				<!-- input-search-area -->
				<div class="input-search-area mb30">
					<div class="input-area">
						<label for="search01" class="label">빠른검색</label>

						<!-- 2019-01-21 검색 부분 변경 -->
						<div class="board-search w460px">
							<input type="search" id="searchTxt" title="검색어를 입력해 주세요."
								placeholder="검색어를 입력해 주세요." class="input-text" value=""
								maxlength="15">
							<button type="button" id="searchBtn" class="btn-search-input">검색</button>
						</div>
						<!--// 2019-01-21 검색 부분 변경 -->
					</div>

					<div class="btn-area"></div>
				</div>
				<!--// input-search-area -->

				<!-- 2019-01-15 : 마크업 변경 -->
				<div class="tab-block small mb30">
					<ul>
						<li class="on"><button type="button" class="btn tabBtn"
								id="totalTab" data-no="" title="전체">전체</button></li>




						<li><button type="button" class="btn tabBtn" data-no="88"
								data-nm="영화예매" title="영화예매">영화예매</button></li>
						<!-- (14) -->



						<li><button type="button" class="btn tabBtn" data-no="89"
								data-nm="할인혜택" title="할인혜택">할인혜택</button></li>
						<!-- (3) -->



						<li><button type="button" class="btn tabBtn" data-no="90"
								data-nm="결제수단/관람권" title="결제수단/관람권">결제수단/관람권</button></li>
						<!-- (6) -->



						<li><button type="button" class="btn tabBtn" data-no="91"
								data-nm="멤버십" title="멤버십">멤버십</button></li>
						<!-- (13) -->



						<li><button type="button" class="btn tabBtn" data-no="92"
								data-nm="VIP" title="VIP">VIP</button></li>
						<!-- (4) -->



						<li><button type="button" class="btn tabBtn" data-no="93"
								data-nm="극장/특별관" title="극장/특별관">극장/특별관</button></li>
						<!-- (8) -->



						<li><button type="button" class="btn tabBtn" data-no="95"
								data-nm="스토어" title="스토어">스토어</button></li>
						<!-- (6) -->



						<li><button type="button" class="btn tabBtn" data-no="96"
								data-nm="홈페이지/모바일" title="홈페이지/모바일">홈페이지/모바일</button></li>
						<!-- (11) -->



						<li><button type="button" class="btn tabBtn" data-no="8007"
								data-nm="기프트카드" title="기프트카드">기프트카드</button></li>
						<!-- (12) -->



					</ul>

					<input type="hidden" id="bbsTotalCnt" value="77">
				</div>
				<!--// 2019-01-15 : 마크업 변경 -->

				<!--// tab-block -->

				<div class="faq-list-box">
					<p class="reset mb10">
						<strong><span id="totalTitle">전체</span> <span
							class="font-green" id="totalCnt">77</span>건</strong>
					</p>

					<div class="faq-list">
						<ul>
							<li><div class="qut on">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">1. [기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>기<span class="font-green"></span>프<span
												class="font-green"></span>트<span class="font-green"></span>카<span
												class="font-green"></span>드<span class="font-green"></span>를<span
												class="font-green"></span> <span class="font-green"></span>보<span
												class="font-green"></span>냈<span class="font-green"></span>는<span
												class="font-green"></span>데<span class="font-green"></span>
											<span class="font-green"></span>상<span class="font-green"></span>대<span
												class="font-green"></span>방<span class="font-green"></span>이<span
												class="font-green"></span> <span class="font-green"></span>받<span
												class="font-green"></span>지<span class="font-green"></span>
											<span class="font-green"></span>못<span class="font-green"></span>한<span
												class="font-green"></span>다<span class="font-green"></span>고<span
												class="font-green"></span> <span class="font-green"></span>합<span
												class="font-green"></span>니<span class="font-green"></span>다<span
												class="font-green"></span>.<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">구매자분 통신사에 가입된 부가서비스로 인해 발신이
													차단된 경우가 있습니다. 통신사를 통하여 아래 부가서비스 해지 후 익일 재 구매를 부탁 드립니다.<br>
													<br> *부가서비스 명칭<br> - SKT &amp; KT: 번호도용 문자 차단서비스<br>
													- LG U+: 휴대폰번호 도용 방지서비스<br> <br> 이미 구매하신 기프트카드 결제
													취소는 기프트카드 거래 이력이 없고 계정 등록 전인 경우, 결제일로부터 최대 10일 내 나의 메가박스
													&gt; 예매/구매 내역 &gt; 구매내역에서 취소 가능합니다.
											</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">2. [기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>선<span class="font-green"></span>물<span
												class="font-green"></span>은<span class="font-green"></span>
											<span class="font-green"></span>어<span class="font-green"></span>떤<span
												class="font-green"></span> <span class="font-green"></span>경<span
												class="font-green"></span>로<span class="font-green"></span>로<span
												class="font-green"></span> <span class="font-green"></span>보<span
												class="font-green"></span>낼<span class="font-green"></span>
											<span class="font-green"></span>수<span class="font-green"></span>
											<span class="font-green"></span>있<span class="font-green"></span>나<span
												class="font-green"></span>요<span class="font-green"></span>?<span
												class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">받는 사람의 휴대폰 번호로 발송 가능하며, 선물한
													기프트카드는 알림톡으로 전송됩니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">3. [기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>신<span class="font-green"></span>용<span
												class="font-green"></span>카<span class="font-green"></span>드<span
												class="font-green"></span>의<span class="font-green"></span>
											<span class="font-green"></span>구<span class="font-green"></span>매<span
												class="font-green"></span> <span class="font-green"></span>한<span
												class="font-green"></span>도<span class="font-green"></span>는<span
												class="font-green"></span> <span class="font-green"></span>얼<span
												class="font-green"></span>마<span class="font-green"></span>이<span
												class="font-green"></span>며<span class="font-green"></span>,<span
												class="font-green"></span> <span class="font-green"></span>법<span
												class="font-green"></span>인<span class="font-green"></span>카<span
												class="font-green"></span>드<span class="font-green"></span>로<span
												class="font-green"></span> <span class="font-green"></span>결<span
												class="font-green"></span>제<span class="font-green"></span>가<span
												class="font-green"></span> <span class="font-green"></span>가<span
												class="font-green"></span>능<span class="font-green"></span>한<span
												class="font-green"></span>가<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																style="font-family:" 메가박스="" 라이프="" light""="">아래와
																	같이 구매가 가능합니다.</span></span></span></span></span></span></span><br> <span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																lang="EN-US" style="font-family:" 메가박스="" 라이프=""
																light""="">- </span><span style="font-family:" 메가박스=""
																라이프="" light""="">개인 신용카드 : 1개월간 상품권 구매 한도 100만원</span></span></span></span></span></span></span><br>
										<span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																lang="EN-US" style="font-family:" 메가박스="" 라이프=""
																light""="">- </span><span style="font-family:" 메가박스=""
																라이프="" light""="">법인카드 : 사업자별로 구매한도 상이 (각 사업자에
																	문의하시기 바랍니다.)</span></span></span></span></span></span></span><br> <span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																style="font-family:" 메가박스="" 라이프="" light""="">법인카드로
																	구매 가능하며, 청구서상 ‘상품권’ 유형으로 표시됩니다.</span></span></span></span></span></span></span><br> <span
											lang="EN-US" style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">(</span></span></span><span
											style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">개인 신용카드 동일 / 별도 상품권 가맹)</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">4. [기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>여<span class="font-green"></span>러<span
												class="font-green"></span> <span class="font-green"></span>명<span
												class="font-green"></span>에<span class="font-green"></span>게<span
												class="font-green"></span> <span class="font-green"></span>선<span
												class="font-green"></span>물<span class="font-green"></span>한<span
												class="font-green"></span> <span class="font-green"></span>후<span
												class="font-green"></span> <span class="font-green"></span>부<span
												class="font-green"></span>분<span class="font-green"></span>적<span
												class="font-green"></span>으<span class="font-green"></span>로<span
												class="font-green"></span> <span class="font-green"></span>취<span
												class="font-green"></span>소<span class="font-green"></span>가<span
												class="font-green"></span> <span class="font-green"></span>가<span
												class="font-green"></span>능<span class="font-green"></span>한<span
												class="font-green"></span>가<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																style="font-family:" 메가박스="" 라이프="" light""="">기프트카드는
																	부분환불은 불가하며, 전체 결제취소만 가능합니다.</span></span></span></span></span></span></span><br> <span
											style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">또한 다수의 사람에게 발송된 기프트카드 중 1명만
													사용 또는 본인 계정 내 등록 시에도 결제 취소는 불가합니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">5. [기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>예<span class="font-green"></span>약<span
												class="font-green"></span> <span class="font-green"></span>전<span
												class="font-green"></span>송<span class="font-green"></span>을<span
												class="font-green"></span> <span class="font-green"></span>할<span
												class="font-green"></span> <span class="font-green"></span>수<span
												class="font-green"></span> <span class="font-green"></span>있<span
												class="font-green"></span>나<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">예약 전송은 불가합니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">[기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>최<span class="font-green"></span>대<span
												class="font-green"></span> <span class="font-green"></span>몇<span
												class="font-green"></span> <span class="font-green"></span>명<span
												class="font-green"></span>에<span class="font-green"></span>게<span
												class="font-green"></span> <span class="font-green"></span>전<span
												class="font-green"></span>송<span class="font-green"></span>할<span
												class="font-green"></span> <span class="font-green"></span>수<span
												class="font-green"></span> <span class="font-green"></span>있<span
												class="font-green"></span>나<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">기프트카드는 1회 구매 시 최대 8명까지 전송
													가능합니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">[기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>메<span class="font-green"></span>가<span
												class="font-green"></span>박<span class="font-green"></span>스<span
												class="font-green"></span> <span class="font-green"></span>회<span
												class="font-green"></span>원<span class="font-green"></span>인<span
												class="font-green"></span> <span class="font-green"></span>경<span
												class="font-green"></span>우<span class="font-green"></span>,<span
												class="font-green"></span> <span class="font-green"></span>선<span
												class="font-green"></span>물<span class="font-green"></span>
											<span class="font-green"></span>받<span class="font-green"></span>은<span
												class="font-green"></span> <span class="font-green"></span>카<span
												class="font-green"></span>드<span class="font-green"></span>를<span
												class="font-green"></span> <span class="font-green"></span>계<span
												class="font-green"></span>정<span class="font-green"></span>에<span
												class="font-green"></span> <span class="font-green"></span>등<span
												class="font-green"></span>록<span class="font-green"></span>할<span
												class="font-green"></span> <span class="font-green"></span>수<span
												class="font-green"></span> <span class="font-green"></span>있<span
												class="font-green"></span>나<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">선물받은 기프트카드 메시지 내 ‘기프트카드
													등록하기’ 버튼 클릭 시, 기존 본인의 계정에 선물 받은 카드를 등록 할 수 있습니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">[기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>선<span class="font-green"></span>물<span
												class="font-green"></span> <span class="font-green"></span>받<span
												class="font-green"></span>은<span class="font-green"></span>
											<span class="font-green"></span>카<span class="font-green"></span>드<span
												class="font-green"></span>는<span class="font-green"></span>
											<span class="font-green"></span>어<span class="font-green"></span>떻<span
												class="font-green"></span>게<span class="font-green"></span>
											<span class="font-green"></span>사<span class="font-green"></span>용<span
												class="font-green"></span> <span class="font-green"></span>하<span
												class="font-green"></span>나<span class="font-green"></span>요<span
												class="font-green"></span>?<span class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																style="font-family:" 메가박스="" 라이프="" light""="">선물
																	받으신 기프트카드는 다음의 방법으로 사용하실 수 있습니다.</span></span></span></span></span></span></span><br> <span
											style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""="">-&nbsp;<span
																style="font-family:" 메가박스="" 라이프="" light""="">휴대폰으로
																	받은 기프트카드 바코드 제시</span></span></span></span></span></span></span><br> <span
											style="line-height: 107%">-&nbsp;<span
											style="font-family:" 메가박스="" 라이프="" light";=""
											font-size:10pt"="">메가박스 애플리케이션에 기프트카드를 등록하여 사용</span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">[기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>선<span class="font-green"></span>물<span
												class="font-green"></span>한<span class="font-green"></span>
											<span class="font-green"></span>카<span class="font-green"></span>드<span
												class="font-green"></span>가<span class="font-green"></span>
											<span class="font-green"></span>취<span class="font-green"></span>소<span
												class="font-green"></span>되<span class="font-green"></span>었<span
												class="font-green"></span>는<span class="font-green"></span>지<span
												class="font-green"></span> <span class="font-green"></span>어<span
												class="font-green"></span>떻<span class="font-green"></span>게<span
												class="font-green"></span> <span class="font-green"></span>확<span
												class="font-green"></span>인<span class="font-green"></span>할<span
												class="font-green"></span> <span class="font-green"></span>수<span
												class="font-green"></span> <span class="font-green"></span>있<span
												class="font-green"></span>을<span class="font-green"></span>까<span
												class="font-green"></span>요<span class="font-green"></span>?<span
												class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">보낸 사람과 받는 사람에게 선물한 내역이 취소
													되었다는 내용의 알림이 알림톡으로 전송됩니다.</span></span></span>
									</p>
								</div></li>
							<li><div class="qut">
									<a href="https://megabox.co.kr/support/faq#"><p class="tit">
											<span class="font-green">[기프트카드]</span>
										</p>
										<p class="txt">
											<span class="font-green"></span>선<span class="font-green"></span>물<span
												class="font-green"></span>한<span class="font-green"></span>
											<span class="font-green"></span>기<span class="font-green"></span>프<span
												class="font-green"></span>트<span class="font-green"></span>카<span
												class="font-green"></span>드<span class="font-green"></span>를<span
												class="font-green"></span> <span class="font-green"></span>수<span
												class="font-green"></span>신<span class="font-green"></span>자<span
												class="font-green"></span>가<span class="font-green"></span>
											<span class="font-green"></span>받<span class="font-green"></span>지<span
												class="font-green"></span> <span class="font-green"></span>못<span
												class="font-green"></span>했<span class="font-green"></span>을<span
												class="font-green"></span> <span class="font-green"></span>경<span
												class="font-green"></span>우<span class="font-green"></span>,<span
												class="font-green"></span> <span class="font-green"></span>재<span
												class="font-green"></span>전<span class="font-green"></span>송<span
												class="font-green"></span>할<span class="font-green"></span>
											<span class="font-green"></span>수<span class="font-green"></span>
											<span class="font-green"></span>있<span class="font-green"></span>나<span
												class="font-green"></span>요<span class="font-green"></span>?<span
												class="font-green"></span>
										</p></a>
								</div>
								<div class="awn">
									<p class="cont">
										<span style="font-size: 10pt"><span
											style="line-height: normal"><span
												style="text-autospace: ideograph-numeric ideograph-other"><span
													style="vertical-align: baseline"><span
														style="word-break: keep-all"><span
															style="font-family:" 맑은="" 고딕""=""><span
																style="font-family:" 메가박스="" 라이프="" light""="">재전송은
																	기프트카드 선물 시 입력한 동일번호로 1회만 발송 가능합니다.</span></span></span></span></span></span></span><br> <span
											style="font-size: 10.0pt"><span
											style="line-height: 107%"><span style="font-family:"
												메가박스="" 라이프="" light""="">재전송 방법 : 나의 메가박스 &gt; 예매/구매
													내역 &gt; 구매내역 &gt; 선물내역 상세 &gt; 재전송 버튼 선택</span></span></span>
									</p>
								</div></li>
						</ul>
					</div>
				</div>

				<!-- pagination -->
				<nav class="pagination">
					<strong class="active">1</strong> <a title="2페이지보기"
						href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기"
						href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기"
						href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기"
						href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기"
						href="javascript:void(0)" pagenum="6">6</a> <a title="7페이지보기"
						href="javascript:void(0)" pagenum="7">7</a>
				</nav>
				<!--// pagination -->
			</div>
		</div>
	</div>




	<section id="saw_movie_regi" class="modal-layer">
		<a href="https://megabox.co.kr/support/faq" class="focus">레이어로 포커스
			이동 됨</a> <input type="hidden" id="isLogin" value="Y">
		<div class="wrap">
			<header class="layer-header">
				<h3 class="tit">본 영화 등록</h3>
			</header>

			<div class="layer-con">
				<p class="reset">발권하신 티켓 하단의 거래번호 또는 예매번호를 입력해주세요.</p>

				<div class="pop-gray mt10 mb30">
					<label for="movie_regi" class="mr10">거래번호 또는 예매번호</label> <input
						type="text" id="movie_regi" class="input-text w280px numType"
						maxlength="20" placeholder="숫자만 입력해 주세요" title="티켓 거래번호 입력">
					<button class="button gray ml05" id="regBtn">등록</button>
				</div>

				<div class="box-border v1 mt30">
					<p class="tit-box">이용안내</p>

					<ul class="dot-list">
						<li>극장에서 예매하신 내역을 본 영화(관람이력)로 등록하실 수 있습니다.</li>
						<li>예매처를 통해 예매하신 고객님은 극장에서 발권하신 티켓 하단의 온라인 예매번호 <br>12자리를
							입력해주세요.(Yes24, 네이버, 인터파크, SKT, KT, 다음)
						</li>
						<li>본 영화 등록은 관람인원수 만큼 등록가능하며, 동일 계정에 중복등록은 불가합니다.</li>
						<li>상영시간 종료 이후 등록 가능합니다.</li>
						<li>본 영화로 수동 등록한 내역은 이벤트 참여 및 포인트 추후 적립이 불가합니다.</li>
					</ul>
				</div>
			</div>

			<div class="btn-group-fixed">
				<button type="button" class="button purple close-layer">닫기</button>
			</div>

			<button type="button" class="btn-modal-close">레이어 닫기</button>
		</div>
	</section>

	<div class="quick-area" style="display: none;">
		<a href="https://megabox.co.kr/support/faq" class="btn-go-top"
			title="top" style="position: fixed;">top</a>
	</div>

	<div id="layer_looking_theater" class="layer-looking-theater"></div>


	<div class="normalStyle"
		style="display: none; position: fixed; top: 0; left: 0; background: #000; opacity: 0.7; text-indent: -9999px; width: 100%; height: 100%; z-index: 100;">닫기</div>
	<div class="alertStyle"
		style="display: none; position: fixed; top: 0px; left: 0px; background: #000; opacity: 0.7; width: 100%; height: 100%; z-index: 5005;"></div>
</body>
</html>

<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>