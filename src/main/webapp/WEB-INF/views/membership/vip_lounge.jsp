<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/membership.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="혜택 메인 페이지로 이동">혜택</a> <a
						href="#" title="멤버십안내 페이지로 이동">무비플러스 멤버십</a> <a href="#"
						title="VIP LOUNGE 페이지로 이동">VIP LOUNGE</a>
				</div>

			</div>
		</div>



		<!-- contents -->
		<div id="contents">
			<div class="inner-wrap">
				<h2 class="tit">무비플러스 멤버십</h2>

				<div class="tab-list">
					<ul id="membership-tab-ul">
						<li><a href="/movieplus/benefit/membership/"
							title="멤버십 안내 탭으로 이동">멤버십 안내</a></li>
						<li class="on"><a href="/movieplus/benefit/viplounge/"
							title="VIP LOUNGE 탭으로 이동">VIP LOUNGE</a></li>
					</ul>
				</div>

				<!-- benefit-vip-lounge -->


				<sec:authorize access="isAnonymous()">
					<div class="benefit-vip-lounge2 logout">
						<div class="title">
							MOVIEPLUS <span>VIP</span>
						</div>
						<div class="subtext">무비플러스의 더 많은 혜택을 누릴 수 있는 방법! 로그인 후 무비플러스
							등급을 확인하세요.</div>
						<a href="#" id="membership-login" class="btn">로그인</a>
					</div>
				</sec:authorize>
				<!-- 로그인 전 -->


				<!-- 로그인 후 -->
				<sec:authorize access="isAuthenticated()">
					<div class="benefit-vip-lounge2 normal">
						<div class="lt">
							<div class="mbimg">
								<img
									src="${pageContext.request.contextPath}/resources/image/membership/member_WELCOME_2.png"
									alt="WELCOME">
							</div>
							<div class="mb_name">
								안녕하세요!<br>
								<p>
									<span>${membership_member.MEMBER_NAME}</span>님
								</p>
							</div>
							<div class="period"></div>
						</div>

						<div class="rt">
							<div class="sect n1">
								<div class="tit">VIP선정포인트</div>
								<div class="point nowPoint">${membership_member.MEMBER_POINT} P</div>
								<input type="hidden" id="membershipPoint" value="${membership_member.MEMBER_POINT}">
							</div>

							<div class="sect n3 activityInfo">
								<ul>
									<li>서로다른 영화관람<span>0편</span></li>
									<li>티켓<span>0</span></li>
									<li>매점<span>0</span></li>
									<li>이벤트<span>0</span></li>
								</ul>
							</div>
						</div>


						<div class="graphBox mbClassInx0">
							<div class="inner">
								<div class="bar">
									<div class="inBar"></div>
								</div>
							</div>
							<ul class="list" id="pointFlag-list">
								<li class="on">Welcome <!-- on, act -->
									<div class="pointFlag">
										<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
									</div>
								</li>
								<li class="">Friends
									<div class="pointFlag">
										<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
									</div>
								</li>
								<li class="">VIP
									<div class="pointFlag">
										<span>다음 등급까지 6,000 P 남았어요!</span>
									</div>
								</li>
								<li class="">VVIP
									<div class="pointFlag">
										<span>다음 등급까지 6,000 P 남았어요!</span>
									</div>
								</li>
								<li class="">MVIP
								</li>
							</ul>
						</div>
					</div>
				</sec:authorize>
				<!-- 로그인 관련 종료 -->
			</div>

			<!--</div> -->

			<div class="inner-wrap">
				<div class="tit3">VIP 선정 및 유지 기준</div>
				<!-- benefit-vip-selection2 -->
				<div class="benefit-vip-selection2">
					<div class="box">
						<div class="row">
							<div class="col">선정기준</div>
							<div class="col">유지기준</div>
							<div class="col">쿠폰북 혜택</div>
						</div>
					</div>
					<div class="box">
						<div class="rightRowBox">
							<!-- row -->
							<div class="row mvip">
								<img
									src="${pageContext.request.contextPath}/resources/image/membership/member_MVIP_2.png"
									alt="mvip" class="icons">
								<div class="col">
									<div class="txt">
										VVIP 3년 연속 유지 회원 중 자격기간 내<br>18,000 포인트 이상 적립 시 <br>4년차에
										승급
									</div>
								</div>
								<div class="col">
									<div class="txt">
										MVIP 회원 중 자격기간 내<br>24,000 포인트 이상 적립
									</div>
								</div>
								<div class="col">
									<!-- giftArea -->
									<div class="giftArea">
										<ul class="item">
											<li><span>14</span>매</li>
											<li>영화관람권</li>
										</ul>
										<ul class="item">
											<li><span>100</span>머니</li>
											<li>DIY 쿠폰</li>
										</ul>
										<ul class="item">
											<li><span>13</span>매</li>
											<li>매점할인권</li>
										</ul>
									</div>
									<!--//giftArea end -->
								</div>
							</div>
							<!--//row end -->
							<!-- row -->
							<div class="row vvip">
								<img
									src="${pageContext.request.contextPath}/resources/image/membership/member_VVIP_2.png"
									alt="vvip" class="icons">
								<div class="col">
									<div class="txt">
										VIP 회원 중, 자격기간 내 <br>18,000 포인트 이상 적립 시<br>익월 승급
									</div>
								</div>
								<div class="col">
									<div class="txt">
										VVIP 1, 2년차 회원 중 자격기간 내<br>18,000 포인트 이상 적립
									</div>
								</div>
								<div class="col">
									<!-- giftArea -->
									<div class="giftArea">
										<ul class="item">
											<li><span>10</span>매</li>
											<li>영화관람권</li>
										</ul>
										<ul class="item">
											<li><span>70</span>머니</li>
											<li>DIY 쿠폰</li>
										</ul>
										<ul class="item">
											<li><span>7</span>매</li>
											<li>매점할인권</li>
										</ul>
									</div>
									<!--//giftArea end -->
								</div>
							</div>
							<!--//row end -->
							<!-- row -->
							<div class="row vip">
								<img
									src="${pageContext.request.contextPath}/resources/image/membership/member_VIP_2.png"
									alt="vip" class="icons">
								<div class="col">
									<div class="txt">
										Friends 회원 중, 자격기간 내<br>12,000 포인트 이상 적립 시 <br>익월 승급
									</div>
								</div>
								<div class="col center">
									<div class="txt">-</div>
								</div>
								<div class="col">
									<!-- giftArea -->
									<div class="giftArea">
										<ul class="item">
											<li><span>6</span>매</li>
											<li>영화관람권</li>
										</ul>
										<ul class="item">
											<li><span>45</span>머니</li>
											<li>DIY 쿠폰</li>
										</ul>
										<ul class="item">
											<li><span>5</span>매</li>
											<li>매점할인권</li>
										</ul>
									</div>
									<!--//giftArea end -->
								</div>
							</div>
							<!--//row end -->
						</div>

						<dl class="dotListv3">
							<dt>승급월로 부터 12개월 실적기준 (상영일) | 승급 포인트 적립 내역 기준</dt>
							<dd>회원의 VIP 선정 시점에 따라 쿠폰북 구성이 상이할 수 있습니다. 실제 발급 가능한 쿠폰북 내용은
								로그인 후, 쿠폰북 발급 페이지에서 확인 부탁드립니다.</dd>
							<dd>VIP 등급 유지 기간 중, 직접 쿠폰을 선택 및 발급 받은 후 쿠폰을 사용할 수 있습니다.</dd>
							<dd>VIP 쿠폰북은 영화와 매점 쿠폰으로 구성되어 있으며, 영화 쿠폰은 &lt;일반형(일반 영화
								관람권)&gt; 또는 &lt;DIY형 (선택형 머니)&gt; 중 선택 가능합니다.</dd>
							<dd>VIP 선정 시점에 따라 쿠폰별 유효기간이 상이합니다. 발급일에 따라 사용 가능한 쿠폰 수량에 차이가
								있을 수 있으니 확인 후 발급 바랍니다.</dd>
							<dd>자세한 내용은 쿠폰북 발급 페이지 내 유의 사항을 확인 바랍니다.</dd>
						</dl>
					</div>


				</div>
				<!--//benefit-vip-selection2 end -->
			</div>

			<!-- benefit-vip-selection3 -->
			<div class="benefit-vip-selection3">
				<div class="section">
					<div class="inner">
						<div class="imgs">
							<img
								src="${pageContext.request.contextPath}/resources/image/membership/viplounge_img01.png"
								alt="5년 VIP 쿠폰">
						</div>
						<div class="number">혜택 01</div>
						<div class="title">5년 VIP 쿠폰</div>
						<div class="sText">5년 연속 VIP 혜택 영화 관람 쿠폰 2매 증정!</div>
						<div class="mText">
							지난 VIP 등급 이력은 로그인 후 ‘ 나의 무비플러스 &gt; 지난 등급 조회 ’에서 확인 가능합니다.<br>
							5년 VIP 쿠폰은 2023년 3월말 순차적으로 지급됩니다.<br> 5년 VIP 쿠폰의 세부 사항은 쿠폰
							발급 후, 쿠폰 내 유의 사항을 참고해 주세요.
						</div>
					</div>
				</div>
				<div class="section rit">
					<div class="inner">
						<div class="imgs">
							<img
								src="${pageContext.request.contextPath}/resources/image/membership/viplounge_img02.png"
								alt="VIP 미션 이벤트">
						</div>
						<div class="number">혜택 02</div>
						<div class="title">VIP 미션 이벤트</div>
						<div class="sText">
							매월 서로 다른 영화 5회 이상 관람 시<br>영화 &amp; 콤보 할인, 무료관람권 증정!
						</div>
						<!-- 로그인 전 -->

						<!-- //로그인전 -->

						<!-- 로그인 후 -->

						<div class="linkArea">
							<a href="#" id="btnVipMission" class="btn" w-data="600"
								h-data="800" title="VIP미션 이벤트 보기">VIP 스탬프 미션 보러가기</a>
						</div>
						<!-- //로그인 후 -->



						<div class="mText">
							영화 유료 관람 후, 포인트 적립된 티켓 기준으로 서로 다른 영화 관람 편수가 책정됩니다.<br> 미션 달성
							시 제공되는 쿠폰은 매월 2주차 내에 제공됩니다.<br> 지급되는 쿠폰은 일부 제한 사항이 있을 수
							있습니다. 쿠폰 내 유의 사항을 참고 바랍니다.<br> 이벤트 진행 사항 및 경품 지급 내용은 사정에 따라
							변경될 수 있습니다.
						</div>
					</div>
				</div>
				<div class="section">
					<div class="inner">
						<div class="imgs">
							<img
								src="${pageContext.request.contextPath}/resources/image/membership/viplounge_img03.png"
								alt="VIP DAY">
						</div>
						<div class="number">혜택 03</div>
						<div class="title">VIP DAY</div>
						<div class="sText">기본 포인트에 VIP &amp; VIP DAY 포인트 까지!</div>
						<div class="mText">
							VIP 회원은 영화 관람 시, “기본 적립 포인트”만큼 추가 적립을 받을 수 있습니다.<br> 수요일 영화
							관람 시, “기본 적립 + VIP 추가 적립 포인트” 만큼 VIP DAY 포인트가 적립됩니다.<br> VIP
							추가 적립, VIP DAY 적립 포인트는 VIP 선정 포인트에서 제외됩니다.<br> VIP 추가 적립,
							VIP DAY 적립 포인트 관련 사항은 변경될 수 있습니다.
						</div>
					</div>
				</div>
				<div class="section rit">
					<div class="inner">
						<div class="imgs">
							<img
								src="${pageContext.request.contextPath}/resources/image/membership/viplounge_img04.png"
								alt="중앙멤버십 혜택">
						</div>
						<div class="number">혜택 04</div>
						<div class="title">중앙멤버십 혜택</div>
						<div class="sText">리조트 할인, CU 모바일 상품권 등 다양한 혜택!</div>
						>



						<div class="linkArea">
							<a href="#" id="btnBeforVIPJoinMbShip" class="btn">중앙멤버십 카드
								신청하기 </a>
						</div>





						<div class="mText">
							본 혜택은 아래 카드 신청하기에서 중앙멤버십을 별도 신청하신 고객에 한해 적용 됩니다.<br> 중앙멤버십
							카드는 VIP 기신청자의 경우 자동 연장되며 휴대폰 번호당 1개만 발급 가능합니다.<br> 제휴 혜택은
							사정에 따라 변경되거나 종료될 수 있습니다.
						</div>
					</div>
				</div>
				<section id="layer_card_request" class="modal-layer">
					<a href="#" class="focus">레이어로 포커스 이동 됨</a>
					<div class="wrap">
						<header class="layer-header">
							<h3 class="tit">중앙멤버십 신청하기</h3>
						</header>

						<div class="layer-con">
							<!-- layer-joins-membership-request -->
							<div class="layer-joins-membership-request">
								<div class="tit-box">
									<div class="tit">
										<span class="font-purple">MOVIEPLUS</span> <i
											class="iconset ico-x-big"></i> <span class="font-gblue">중앙멤버십</span>
									</div>

									<p class="txt">
										항상 무비플러스를 사랑해주시는 VIP 고객님들을 위하여 무비플러스와 중앙멤버십이 만나 VIP 멤버십 혜택을
										강화하였습니다.<br> VIP 고객님들을 위한 더욱 풍요롭고 다양한 할인 혜택을 만나보세요.
									</p>
								</div>

								<!-- box-chk -->
								<div class="box-chk mt30">
									<div class="tit">
										<span class="bg-chk"> <input type="checkbox"
											id="jggMembershipChk_1" value=""> <label
											for="jggMembershipChk_1"><span>중앙멤버십 혜택 신청</span> <em
												class="font-red">[필수]</em></label>
										</span>
									</div>

									<!-- cont -->
									<div class="cont">
										<p>
											최대 6가지의 더 다양하고 풍성한 VIP 혜택을 받으실 수 있습니다.<br> 혜택 적용 기간 : 년
											월 일까지
										</p>

										<p class="mt10 font-red font-size-14">
											※ 2022 VIP 중 중앙멤버십 기 신청자는 자동 연장됩니다.<br> ※ 중앙멤버십 카드는
											휴대전화번호당 1개만 발급 가능합니다. 다계정 보유 시 동일한 휴대전화번호로 신청하실 경우 이용에 제한이 있을
											수 있습니다.<br> ! 제휴사와의 사정에 따라 혜택이 변경 또는 종료될 수 있습니다.
										</p>
										<div class="benefit-jm-benefit">
											<table>
												<tbody>
													<tr>
														<td><i class="iconset ico-benefit-jm-resort"></i>

															<p>
																리조트회원<br>우대
															</p></td>
														<td><i class="iconset ico-plus-gray-big">더하기</i></td>
														<td><i class="iconset ico-benefit-jm-sale"></i>

															<p>
																무비플러스 최대<br>9,000원 할인
															</p></td>
														<td><i class="iconset ico-plus-gray-big">더하기</i></td>
														<td><i class="iconset ico-benefit-jm-health-chk"></i>

															<p>
																건강검진<br>우대
															</p></td>
														<td><i class="iconset ico-plus-gray-big">더하기</i></td>
														<td><i class="iconset ico-benefit-jm-cu"></i>

															<p>
																CU 모바일<br> 상품권 10% 할인
															</p></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!--// cont -->
								</div>
								<!--// box-chk -->

								<!-- box-chk -->

								<!--// box-chk -->

								<p class="tit-sub">VIP멤버십 혜택을 받으시기 위해 아래 개인정보 제공에 동의를 해주세요.</p>

								<!-- box-chk -->
								<div class="box-chk">
									<div class="tit">
										<span class="bg-chk"> <input type="checkbox"
											id="jggMembershipChk_3"> <label
											for="jggMembershipChk_3"><span>제 3자 정보제공에
													동의합니다.</span> <em class="font-red">[필수]</em></label>
										</span>
									</div>

									<!-- text-cont 약관내용-->
									<div class="text-cont">
										<div class="scroll" tabindex="0">
											<p>
												(주)무비플러스중앙이 제공하는 중앙 멤버십 혜택을 받을 경우 혜택 제공을 위하여 관련한 정보는<br>
												필요한 범위 내에서 아래와 같이 제공됩니다.<br> <br> 1. 개인정보 제공 동의<br>
												무비플러스는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 이용자의 개인정보에 있어<br>
												아래와 같이 알리고 동의를 받아 중앙멤버십 서비스 제공자에 제공합니다.<br> <br>
												2. 개인정보 제공 받는 자<br> (주)중앙일보, 중앙일보 M&amp;P(주)<br> <br>
												3. 개인정보 이용 목적<br> 중앙멤버십 서비스 이용에 따른 본인 식별 및 혜택 제공, 고객 응대<br>
												<br> 4. 개인정보 제공 항목<br> 성명, 휴대폰번호<br> <br>
												5. 개인정보 보유 및 이용 기간<br> 개인정보 이용목적 달성 시까지(단, 관계 법령의 규정에
												의해 보존의 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유기간 까지)
											</p>
										</div>

										<p class="mt20">※ 동의하지 않을 경우 중앙멤버십 혜택이 제공되지 않습니다.</p>
									</div>
									<!--// text-cont -->
								</div>
								<!--// box-chk -->
							</div>
							<!--// layer-joins-membership-request -->
						</div>

						<div class="btn-group-fixed">
							<button type="button" class="button close-layer">닫기</button>
							<button type="button" class="button purple" id="btnJoinMbship">신청하기</button>
						</div>

						<button type="button" class="btn-modal-close">레이어 닫기</button>
					</div>
				</section>

				<div class="section">
					<div class="inner">
						<div class="imgs">
							<img
								src="${pageContext.request.contextPath}/resources/image/membership/viplounge_img05.png"
								alt="VIP CULTURE EVENT">
						</div>
						<div class="number">혜택 05</div>
						<div class="title">VIP CULTURE EVENT</div>
						<div class="sText">교보문고 &amp; 핫트랙스 10% 할인쿠폰 증정!</div>
						<div class="mText">
							VIP 회원 대상 교보문고 &amp; 핫트랙스 10% 할인 쿠폰을 드립니다. (오프라인 / 1만원 이상 결제 시 사용
							가능)<br> VIP 회원 중 마케팅 정보 수신 동의 회원 대상에 한하여 제공됩니다.<br> 할인
							쿠폰은 매월 초 무비플러스APP으로 자동 발급됩니다. (나의 무비플러스&gt; 제휴쿠폰)<br> 할인 쿠폰 사용
							전 쿠폰 내 유의 사항을 반드시 확인 바랍니다.<br> 제휴 혜택은 사정에 따라 내용이 변경되거나 종료될 수
							있습니다.
						</div>
					</div>
				</div>
			</div>
			<!--//benefit-vip-selection3 end -->

			<div class="s_textBox">
				<div class="inner-wrap">
					<ul>
						<li>모든 회원의 누적 승급 포인트는 ’23년 3월 1일 부로 초기화 되며, 3월 1일 이후 관람실적부터
							새로운 승급제도 적용을 받습니다.</li>
						<li>·Friends 및 VIP 이상 회원은 승급 후 12개월의 등급 자격 유지기간이 부여되며, 부여된
							자격유지 기간 내 승급포인트 실적기준으로 매월 회원등급 조정이 진행됩니다.</li>
						<li>·Welcome 회원은 최근12개월 실적기준으로 Friends 등급으로 승급할 수
							있습니다.(Welcome 등급은 자격유지기간 부 존재하여, 최근12개월 기준으로 산정합니다.)</li>
						<li>·등급 자격 유지기간 내 승급조건을 충족한 경우, 익월에 다음등급으로 승급되며 (MVIP 제외) 새로운
							등급으로 선정되는 경우 선정월로 부터 12개월의 새로운 자격 유지기간이 부여됩니다.</li>
						<li>·VIP 등급선정 기준 및 혜택은 매년 상이 할 수 있습니다.</li>
						<li>·VIP 회원 혜택은 내부사정에 의하여 변경 또는 종료될 수 있습니다.</li>
						<li>·VIP 회원 추가적립 포인트, 선물받은 포인트, 이벤트 적립포인트, 제휴처 적립포인트 등은 VIP
							산정에서 제외됩니다.</li>
						<li>·“서로 다른 영화”는 선정기간 내 멤버십 포인트 적립된 영화 중 서로 다른 영화를 의미합니다. (동일
							영화는1편으로 산정)</li>
					</ul>
				</div>
			</div>
		</div>
		<!--// contents -->
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
</body>
</html>