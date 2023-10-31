<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>

<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp"/>

<!-- 컨텐츠 영역 -->

<div id="contents" class="location-fixed" style="padding-top:40px">
	<h2 class="tit">포인트 이용내역</h2>

	<!-- point-present-condition -->
	<div class="point-present-condition">
		<div class="tit-area">
			<p class="tit">나의 포인트 정보
				<a href="#" class=""><i class="iconset ico-exclamation-gray">툴팁</i></a>
			</p>

		</div>

		<!-- cont-area -->
		<div class="cont-area">
			<!-- summary -->
			<div class="summary" id="myPoint">
				<div class="usable">
					<p class="tit">사용가능 포인트</p>

				</div>
				<div class="mainpoint">
					<p class="point">${membership_member.MEMBER_POINT } P</p>
				</div>
				<div class="subpoint" id="subpoint" style="margin-bottom: 30px; margin-top: -5px">
					<div class="oval">
						<p class="tit">적립예정</p>
						<p class="point">0 P</p>
					</div>
					<div class="oval">
						<p class="tit">당월소멸예정
							<a href="#" class="" title="소멸예정 포인트 보기">
								<i class="iconset ico-circle-plus-small">툴팁</i>
							</a>
						</p>
						<p class="point">0 P</p>
					</div>
				</div>
			</div>
			<!--// summary -->

			<!-- this-year -->
			<div class="this-year">
				<p class="tit-year">VIP 선정 누적 포인트 현황</p>

				<!-- section -->
				<div class="section" id="pointPrco">
					<div class="cell new">
						<p class="tit">포인트</p>

						<div class="row">
							<p class="txt">매표</p>
							<p class="point">0</p>
						</div>

						<div class="row">
							<p class="txt">매점</p>

							<p class="point">0</p>
						</div>

						<div class="row">
							<p class="txt">이벤트<span>(VIP등급대상)</span></p>
							<p class="point">0</p>
						</div>

						<div class="sum">${membership_member.MEMBER_POINT } P</div>
					</div>
				</div>
				<!--// section -->
			</div>
			<!--// this-year -->
		</div>
		<!--// cont-area -->
	</div>
	<!--// point-present-condition -->

	<!-- 레이어 : 소명예정 포인트 -->
	<section id="layer_modal_point_del" class="modal-layer"><a href="#" class="focus">레이어로 포커스 이동 됨</a>
		<div class="wrap">
			<header class="layer-header">
				<h3 class="tit">소멸예정 포인트</h3>
			</header>

			<div class="layer-con">

				<!-- layer-my-point-delete -->
				<div class="layer-my-point-delete">
					<div class="box-slash a-c">회원님의 당월소멸예정 포인트는 <em>0 point</em> 입니다.</div>

					<p class="reset mt20">소멸예정 포인트 (매월 말 극장영업 종료 시)</p>

					<div class="table-wrap mt10">
						<table class="data-table a-c">
							<caption>년, 월, 일 기준 소멸예정 포인트 목록 표</caption>
							<colgroup>
								<col style="width:33.3%;">
								<col style="width:33.4%;">
								<col style="width:33.3%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">2023.10.31</th>
									<th scope="col">2023.11.30</th>
									<th scope="col">2023.12.31</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0 P</td>
									<td>0 P</td>
									<td>0 P</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="box-border v1 mt20">
						<p class="tit-box">소멸예정 포인트란?</p>

						<ul class="dash-list">
							<li>유효기간의 경과로 소멸이 예상되는 포인트 입니다.</li>
							<li>유효기간이 경과된 포인트는 매월 말일 영업 종료 후 포인트가 자동 소멸됩니다.</li>
							<li>포인트 유효기간
								<ul class="star-list">
									<li>기본 적립 포인트 : 적립일로부터 24개월이 지난 해당월 말일 (티켓 및 매점 유료 구매 시)</li>
									<li>선물 받은 포인트 : 선물 받은 날로부터 3개월이 지난 해당월 말일</li>
									<li>이벤트 적립 포인트 : 이벤트 마다 유효기간이 상이</li>
								</ul>
							</li>
							<li>멤버십 포인트 사용 시 포인트가 차감되는 순서는 다음과 같아 포인트 소멸을 최대한 방지할 수 있습니다.
								<ul class="star-list">
									<li>남은 유효기간이 짧은 순서대로</li>
									<li>선물 받은 포인트 &gt; 이벤트 적립 포인트 &gt; 기본 적립(티켓, 매점) 포인트</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!--// layer-my-point-delete -->
			</div>

			<div class="btn-group-fixed">
				<button type="button" class="button purple close-layer">닫기</button>
			</div>

			<button type="button" class="btn-modal-close">레이어 닫기</button>
		</div>
	</section>
	<!--// 레이어 : 소명예정 포인트 -->


	<!-- 레이어 : 나의 포인트 정보 -->
	<section id="layer_my_point_info" class="modal-layer"><a href="https://www.megabox.co.kr/mypage/point-list" class="focus">레이어로 포커스 이동 됨</a>
		<div class="wrap">
			<header class="layer-header">
				<h3 class="tit">나의 포인트 정보</h3>
			</header>
			<div class="layer-con">
				<ul class="dash-list">
					<li>사용 가능 포인트는 현재 기준 온,오프라인에서 실제 사용 가능한 포인트입니다.</li>
					<li>VIP 선정 누적 포인트 현황은 현재 월승급 기준 VIP 선정 기준에 부합하는 포인트 합계입니다.</li>
				</ul>
			</div>
			<br>
			<div class="btn-group-fixed">
				<button type="button" class="button purple close-layer">닫기</button>
			</div>

			<button type="button" class="btn-modal-close">레이어 닫기</button>
		</div>
	</section>
	<!--// 레이어 : 나의 포인트 정보 -->

	<h3 class="tit mt40">이용내역 조회</h3>

	<ul class="dot-list">
		<li>하단 내역은 상영일 및 구매일 기준이며, 해당일 익일(+1) 에 사용 가능 포인트로 전환됩니다.</li>
		<li>적립 예정 포인트는 사용 가능포인트에 포함되지 않으며, 환불 또는 거래 취소가 될 경우 내역에서 삭제됩니다.</li>
	</ul>

	<div class="board-list-search mt20">
		<table>
			<colgroup>
				<col style="width:75px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">조회기간</th>
					<td>
						<div class="btn-period">
							<button type="button" class="btn on" value="D7">1주일</button>
							<button type="button" class="btn" value="M1">1개월</button>
							<button type="button" class="btn" value="M3">3개월</button>
							<button type="button" class="btn" value="M6">6개월</button>
						</div>

						<div class="date">
							<input type="text" title="조회기간 시작 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar hasDatepicker" id="dp1697501420520"><button type="button" class="ui-datepicker-trigger">날짜 선택</button>
							<span>~</span>
							<input type="text" title="조회기간 마지막 날짜 입력" placeholder="yyyy.mm.dd" class="date-calendar hasDatepicker" id="dp1697501420521"><button type="button" class="ui-datepicker-trigger">날짜 선택</button>
							<button type="button" class="button gray-line" name="search"><i class="iconset ico-search-gray"></i> 조회</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="board-list-util">
		<p class="result-count"><strong>전체 <b>0</b> 건</strong></p>

		<div class="right">
			<div class="dropdown bootstrap-select bs3"><select class="selectpicker" id="selPointUse" tabindex="-98">
				<option value="">전체</option>
				
					<option value="RESVR">적립</option>
				
					<option value="USE">사용</option>
				
					<option value="EXPIR">소멸</option>
				
			</select><button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="selPointUse" title="전체"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">전체</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>
		</div>
	</div>

	<div class="table-wrap">
		<table class="board-list">
			<caption>일자, 구분, 내용, 극장, 포인트 항목을 가진 포인트 이용내역 목록 표</caption>
			<colgroup>
				<col style="width:120px;">
				<col style="width:200px;">
				<col>
				<col style="width:150px;">
				<col style="width:110px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">일자</th>
					<th scope="col">구분</th>
					<th scope="col">내용</th>
					<th scope="col">지점</th>
					<th scope="col">포인트</th>
				</tr>
			</thead>
			<tbody><tr><td colspan="5" class="a-c">조회된 내역이 없습니다</td></tr></tbody>
		</table>
	</div>
</div>

	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>