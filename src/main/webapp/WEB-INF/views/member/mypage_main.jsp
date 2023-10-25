<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/member_mypage.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/membership.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/js/favorite_theater.js"></script>
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp" />

	<!-- 컨텐츠 영역 -->
	<div id="contents" class="">

		<!-- my-megabox-main -->
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo" />
			<div class="my-megabox-main">
				<div class="my-magabox-info ">
					<!-- top -->
					<div class="top2">

						<div class="mbimg">
							<c:choose>
								<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'Welcome'}">
									<img
										src="${pageContext.request.contextPath}/resources/image/membership/member_WELCOME_2.png"
										alt="프로필 사진">
								</c:when>

								<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'VIP'}">
									<img
										src="${pageContext.request.contextPath}/resources/image/membership/member_VIP_2.png"
										alt="프로필 사진">
								</c:when>
								<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'VVIP'}">
									<img
										src="${pageContext.request.contextPath}/resources/image/membership/member_VVIP_2.png"
										alt="프로필 사진">
								</c:when>
								<c:when test="${pinfo.MEMBER_MEMBERSHIP == 'MVIP'}">
									<img
										src="${pageContext.request.contextPath}/resources/image/membership/member_MVIP_2.png"
										alt="프로필 사진">
								</c:when>
							</c:choose>
						</div>
						<div class="mb_name">
							안녕하세요!
							<p>${pinfo.MEMBER_NAME}<span>님</span>
							</p>
						</div>

						<div class="link">
							<a href="${pageContext.request.contextPath}/member/modifyinfo"
								title="개인정보수정 페이지로 이동">개인정보수정</a> <a href="#"
								id="bfrClassSearch" class="" title="지난등급 상세보기">지난등급조회</a>
						</div>

						<!-- <div class="txt-vip-coupon" style="display: none;">
					<i class="iconset ico-exclamation-white"></i> 아직 VIP쿠폰북을 발급하지 않으셨네요! <a href="/vipcoupon/guide" title="VIP쿠폰북 발급 페이지로 가기">VIP쿠폰북 발급하기</a>
				</div> -->

						<div class="rightBox mbClassInx1 mbClassInx0">
							<div class="inbox">
								<div class="totalPoint">${pinfo.MEMBER_POINT}P</div>
								<ul>
									<li class="nowClass"><span>현재등급</span><em>${pinfo.MEMBER_MEMBERSHIP}</em></li>
									<li class="continue"></li>
									<li class="vipCoup">아직 VIP쿠폰을 받지 않았어요. <a href="#">VIP쿠폰북
											발급</a>
									</li>
								</ul>
							</div>

							<div class="graphBox">
								<div class="inner">
									<div class="bar">
										<div class="inBar"></div>
									</div>
								</div>
								<input type="hidden" id="membershipPoint"
									value="${pinfo.MEMBER_POINT}">
								<ul class="list" id="pointFlag-list">
									<li class="list-dtl on">Welcome
										<div class="pointFlag">
											<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
										</div>
									</li>
									<li class="list-dtl">Friends
										<div class="pointFlag">
											<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
										</div>
									</li>
									<li class="list-dtl&quot;&quot;">VIP
										<div class="pointFlag">
											<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
										</div>
									</li>
									<li class="list-dtl">VVIP
										<div class="pointFlag">
											<span>다음 Friends 등급까지 6,000 P 남았어요!</span>
										</div>
									</li>
									<li class="list-dtl">MVIP</li>
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
								<a href="#" class="more" title="포인트 이용내역 페이지로 이동"> <i
									class="iconset ico-arr-right-gray">더보기</i></a>
							</div>


							<div class="change">
								<div class="save">
									<span>적립예정</span> <em>0 P</em>
								</div>

								<div class="del">
									<span>당월소멸예정</span> <em>0 P</em>
								</div>
							</div>

						</div>

						<!-- theater -->
						<div class="items theater" id="myFaverBrch">
							<div class="tit-area">
								<p class="tit">선호하는 극장</p>
								<a href="#" class="more fav-modal-on" title="선호극장 변경"><i
									class="iconset ico-arr-right-gray">변경</i></a>
							</div>

							<div class="list">
								<div class="no-list" style="display: none;">
									<span>선호극장</span>을 설정하세요.
								</div>
								<ol>
									<c:forEach var="favTheater" items="${favTheaterList }"
										varStatus='status'>
										<li><em>${status}</em> <span>${favTheater.THEATER_NAME}</span>
									</c:forEach>
								</ol>
							</div>
						</div>
						<!--// theater -->

						<!-- coupon -->
						<div class="items coupon" id="myCoupon">
							<div class="tit-area">
								<p class="tit">관람권/쿠폰</p>
								<a href="#" class="more"><i
									class="iconset ico-arr-right-gray" title="영화관람권 페이지로 이동">더보기</i></a>
							</div>

							<div class="list">
								<ul>
									<li><span>영화관람권</span> <em>0 매</em></li>
									<li><span>스토어교환권</span> <em>0 매</em></li>
									<li><span>할인/제휴쿠폰</span> <em>0 매</em></li>
								</ul>
							</div>
						</div>
						<!--// coupon -->

						<!-- 스페셜 멤버십 -->
						<div class="items special-membership" id="myMembership">

							<div class="tit-area">
								<p class="tit">스페셜 멤버십</p>
								<a href="#" class="more"><i
									class="iconset ico-arr-right-gray" title="스페셜멤버십 가입 페이지로 이동">더보기</i></a>
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
								<a href="${pageContext.request.contextPath}/member/mypage/moviestory" class="more" title="나의 무비스토리 페이지로 이동"> <i
									class="iconset ico-arr-right-gray">더보기</i></a>
							</div>
						</div>

						<div class="box-border link-movie-story">
							<a href="#" title="본 영화 탭으로 이동"> <em>${ms_scheduleCnt}</em> <span>본 영화</span>
							</a> <a href="#" title="관람평 탭으로 이동"> <em>${ms_reviewCnt}</em> <span>관람평</span>
							</a> <a href="#" title="보고싶어 탭으로 이동"> <em>${ms_movieCnt}</em> <span>보고싶어</span>
							</a> <a href="#" title="무비포스트 탭으로 이동"> <em>${ms_postCnt}</em> <span>무비포스트</span>
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

						<a href="${pageContext.request.contextPath}/booking/success" class="more" title="나의 예매내역 더보기">더보기 <i
							class="iconset ico-arr-right-gray"></i></a>
					</div>

					<!-- my-reserve-history -->
					<div class="my-reserve-history">
						<ul>
							<li class="no-result">
								<div class="no-history-reservation">예매 내역이 없습니다.</div>
							</li>
						</ul>
					</div>
					<!--// my-reserve-history -->
				</div>

				<div id="myPurc">
					<div class="tit-util mt70">
						<h2 class="tit small">나의 구매내역</h2>

						<a href="${pageContext.request.contextPath}/store/success" class="more" title="나의 구매내역 더보기">더보기 <i
							class="iconset ico-arr-right-gray"></i></a>
					</div>

					<div class="table-wrap">
						<table class="board-list line" summary="나의 구매내역 요약 표">
							<caption>나의 구매내역 요약 표</caption>
							<colgroup>
								<col style="width: 160px;">
								<col style="width: 140px;">
								<col>
								<col style="width: 120px;">
								<col style="width: 80px;">
							</colgroup>
							<tbody>
								<tr>
									<td colspan="6" class="a-c">구매내역이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- column -->
				
				<!--// column -->
			</div>
			<!--// my-megabox-main -->
		</sec:authorize>
	</div>

	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/theater/favorite_theater_modal.jsp" />

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>