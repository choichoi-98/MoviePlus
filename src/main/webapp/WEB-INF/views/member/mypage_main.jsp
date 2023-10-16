<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/membership.js"></script>
<title>MoviePlus: 모두를 위한 영화관 </title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

<!-- 컨텐츠 영역 -->
<div id="contents" class="">

	<!-- my-megabox-main -->
	<div class="my-megabox-main">

		<div class="my-magabox-info ">
			<!-- top -->
			<div class="top2">

				<div class="mbimg"><img src="${pageContext.request.contextPath}/resources/image/membership/member_WELCOME_2.png" alt="WELCOME"></div>
				<div class="mb_name">안녕하세요!<p>${memberInfo.MEMBER_NAME}<span>님</span></p></div>

				<div class="link">
					<a href="${pageContext.request.contextPath}/member/modifyinfo" title="개인정보수정 페이지로 이동">개인정보수정</a>
					<a href="#" id="bfrClassSearch" class="" title="지난등급 상세보기">지난등급조회</a>
				</div>

				<!-- <div class="txt-vip-coupon" style="display: none;">
					<i class="iconset ico-exclamation-white"></i> 아직 VIP쿠폰북을 발급하지 않으셨네요! <a href="/vipcoupon/guide" title="VIP쿠폰북 발급 페이지로 가기">VIP쿠폰북 발급하기</a>
				</div> -->

				<div class="rightBox mbClassInx1 mbClassInx0">
					<div class="inbox">
						<div class="totalPoint">${memberInfo.MEMBER_POINT} P</div>
						<ul>
							<li class="nowClass"><span>현재등급</span><em>${memberInfo.MEMBER_MEMBERSHIP}</em></li>
							<li class="continue">
							</li>
							<li class="vipCoup">
								아직 VIP쿠폰을 받지 않았어요.
								<a href="#">VIP쿠폰북 발급</a>
							</li>
						</ul>
					</div>

					<div class="graphBox">
						<div class="inner">
							<div class="bar">
								<div class="inBar"></div>
							</div>
						</div>
						<input type="hidden" id="membershipPoint" value="${memberInfo.MEMBER_POINT}">
						<ul class="list" id="pointFlag-list">
							<li class="list-dtl on">Welcome
								<div class="pointFlag"><span>다음 Friends 등급까지 6,000 P 남았어요!</span></div>
							</li>
							<li class="list-dtl">Friends
								<div class="pointFlag"><span>다음 Friends 등급까지 6,000 P 남았어요!</span></div>
							</li>
							<li class="list-dtl&quot;&quot;">VIP
								<div class="pointFlag"><span>다음 Friends 등급까지 6,000 P 남았어요!</span></div>
							</li>
							<li class="list-dtl">VVIP
								<div class="pointFlag"><span>다음 Friends 등급까지 6,000 P 남았어요!</span></div>
							</li>
							<li class="list-dtl">MVIP
								<div class="pointFlag"><span>다음 Friends 등급까지 6,000 P 남았어요!</span></div>
							</li>
						</ul>
					</div>
				</div>

			</div>
			<!--// top -->

			<!-- bottom -->
			<div class="bottom2">
				<div class="items point" id="myPoint">
					<div class="tit-area">
						<p class="tit">포인트 이용내역</p>
						<a href="#" class="more" title="포인트 이용내역 페이지로 이동">
						<i class="iconset ico-arr-right-gray">더보기</i></a>
					</div>


					<div class="change">
						<div class="save">
							<span>적립예정</span>
							<em>0 P</em>
						</div>

						<div class="del">
							<span>당월소멸예정</span>
							<em>0 P</em>
						</div>
					</div>

				</div>

				<!-- theater -->
				<div class="items theater" id="myFaverBrch">
					<div class="tit-area">
						<p class="tit">선호하는 극장</p>
						<a href="#" class="more" title="선호극장 변경"><i class="iconset ico-arr-right-gray">변경</i></a>
					</div>

					<div class="list">
						<div class="no-list" style="display: none;">
							<span>선호극장</span>을  설정하세요.
						</div>
						<ol><li>	<em>1</em>	<span>강남</span></li><li>	<em>2</em>	<span>강남대로(씨티)</span></li><li>	<em>3</em>	<span>성수</span></li></ol>
					</div>
				</div>
				<!--// theater -->

				<!-- coupon -->
				<div class="items coupon" id="myCoupon">
					<div class="tit-area">
						<p class="tit">관람권/쿠폰</p>
						<a href="#" class="more"><i class="iconset ico-arr-right-gray" title="영화관람권 페이지로 이동">더보기</i></a>
					</div>

					<div class="list">
						<ul>
							<li>
								<span>영화관람권</span>
								<em>0 매</em>
							</li>
							<li>
								<span>스토어교환권</span>
								<em>0 매</em>
							</li>
							<li>
								<span>할인/제휴쿠폰</span>
								<em>0 매</em>
							</li>
						</ul>
					</div>
				</div>
				<!--// coupon -->

				<!-- 스페셜 멤버십 -->
				<div class="items special-membership" id="myMembership">

					<div class="tit-area">
						<p class="tit">스페셜 멤버십</p>
						<a href="#" class="more"><i class="iconset ico-arr-right-gray" title="스페셜멤버십 가입 페이지로 이동">더보기</i></a>
					</div>

					<!-- 스폐셜 가입 안했을 때 -->
					<div class="no-join">
						<p class="txt">가입된 스페셜 멤버십이 없습니다.</p>

						<a href="#" title="스페셜멤버십 가입 페이지로 이동">스페셜멤버십</a>
					</div>

					<!-- <div class="join">
						<div class="box">
							<img src="images/2023/01/my_dashboard_so_01.png" alt="filmsociety" />
						</div>
						<div class="box">
							<img src="images/2023/01/my_dashboard_so_02.png" alt="classic society" />
						</div>
					</div> -->
				</div>
				<!--//스페셜 멤버십 -->

			</div>
			<!--// bottom -->
		</div>
		<!--// my-magabox-info -->

		

		<!-- vip 일때만 출력 : my-stamp-mission -->
		
		<!--// vip 일때만 출력 : my-stamp-mission -->

		<!-- column -->
		<div class="column mt70">
			<!-- left -->
			<div class="col left" id="myStory">
				<div class="tit-util">
					<h2 class="tit small">나의 무비스토리</h2>

					<div class="right">
						<a href="#" class="button gray-line small btn-modal-open" w-data="600" h-data="470" title="본 영화 등록">본 영화 등록</a>
					</div>
				</div>

				<div class="box-border link-movie-story">
					<a href="#" title="본 영화 탭으로 이동">
						<em>0</em>
						<span>본 영화</span>
					</a>

					<a href="#" title="관람평 탭으로 이동">
						<em>0</em>
						<span>관람평</span>
					</a>

					<a href="#" title="보고싶어 탭으로 이동">
						<em>0</em>
						<span>보고싶어</span>
					</a>

					<a href="#" title="무비포스트 탭으로 이동">
						<em>0</em>
						<span>무비포스트</span>
					</a>
				</div>
			</div>
			<!--// left -->

			<!-- right -->
			<div class="col right" id="myFaverInfo">
				<div class="tit-util">
					<h2 class="tit small">선호관람정보</h2>

					<div class="right">
						<a href="#" class="button gray-line small" title="설정">설정</a>
					</div>
				</div>

				<div class="box-border favor-see">
					<ul class="dot-list gray">
						<li><span class="font-gblue mr10">내 선호장르</span></li>
						<li><span class="font-gblue mr10">내 선호시간</span></li>
					</ul>
				</div>
			</div>
			<!--// right -->
		</div>
		<!--// column -->

		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 예매내역</h2>

				<a href="#" class="more" title="나의 예매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<!-- my-reserve-history -->
			<div class="my-reserve-history">
				<ul>
					<li class="no-result">
						<div class="no-history-reservation">
							예매 내역이 없습니다.
						</div>
					</li>
				</ul>
			</div>
			<!--// my-reserve-history -->
		</div>

		<div id="myPurc">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 구매내역</h2>

				<a href="#" class="more" title="나의 구매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<div class="table-wrap">
				<table class="board-list line" summary="나의 구매내역 요약 표">
					<caption>나의 구매내역 요약 표</caption>
					<colgroup>
						<col style="width:160px;">
						<col style="width:140px;">
						<col>
						<col style="width:120px;">
						<col style="width:80px;">
					</colgroup>
					<tbody><tr><td colspan="6" class="a-c">구매내역이 없습니다.</td></tr></tbody>
				</table>
			</div>
		</div>

		<!-- column -->
		<div class="column mt70">
			<!-- left -->
			<div class="col left" id="mySbsc">
				<div class="tit-util">
					<h2 class="tit small">참여이벤트</h2>
					<a href="#" class="more" title="참여이벤트 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="brd-list">
					<ul>
						<li class="no-result">
							참여한 이벤트가 없습니다.
						</li>
					</ul>
				</div>
			</div>
			<!--// left -->

			<!-- right -->
			<div class="col right" id="myInq">
				<div class="tit-util">
					<h2 class="tit small">문의내역</h2>

					<a href="#" class="more" title="문의내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="brd-list">
					<ul>
						<li class="no-result">
							문의내역이 없습니다.
						</li>
					</ul>
				</div>
			</div>
			<!--// right -->
		</div>
		<!--// column -->
	</div>
	<!--// my-megabox-main -->
</div>

            </div>
        </div>
        
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>