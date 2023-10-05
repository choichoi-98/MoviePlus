<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	 <div class="body-wrap">

<div style="display:none;"><a id="loginPupupATag" href="https://megabox.co.kr/support/lost#layer_login_select" class="button active btn-modal-open" w-data="850" h-data="484"></a></div>

	<!-- container -->
	<div class="container has-lnb">
		<div class="page-util fixed">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span>
					<a href="https://megabox.co.kr/support" title="고객센터 페이지로 이동">고객센터</a>
					<a href="https://megabox.co.kr/support/lost" title="분실물 문의 페이지로 이동">분실물 문의</a>
				</div>

			</div>
		</div>

		<div class="inner-wrap">
			<div class="lnb-area addchat location-fixed">
				<nav id="lnb" class="ty2">
					<p class="tit"><a href="https://megabox.co.kr/support" title="고객센터">고객센터</a></p>
					<ul>
						<li><a href="https://megabox.co.kr/support" title="고객센터 홈">고객센터 홈</a></li>
						<li><a href="https://megabox.co.kr/support/faq" title="자주 묻는 질문">자주 묻는 질문</a></li>
						<li><a href="https://megabox.co.kr/support/notice" title="공지사항">공지사항</a></li>
						<li><a href="https://megabox.co.kr/support/inquiry" title="1:1문의">1:1문의</a></li>
						<li><a href="https://megabox.co.kr/support/rent" title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
						<li class="on"><a href="https://megabox.co.kr/support/lost" title="분실물 문의">분실물 문의</a></li>
						
						<li><a href="https://megabox.co.kr/support/terms" title="이용약관">이용약관</a></li>
						<li><a href="https://megabox.co.kr/support/lcinfo" title="위치기반서비스이용약관">위치기반서비스이용약관</a></li>
						<li><a href="https://megabox.co.kr/support/privacy" title="개인정보처리방침">개인정보처리방침</a></li>
						<li><a href="https://megabox.co.kr/support/screenrule" style="border-radius: 0 0 10px 10px;" title="스크린배정수에관한기준">스크린배정수에관한기준</a></li>
					</ul>

					<!-- 고객센터 메뉴일때만 출력 -->
					<div class="left-customer-info">
						<p class="tit">
							메가박스 고객센터
							<span>Dream center</span>
						</p>
						<p class="time"><i class="iconset ico-clock"></i> 10:00~19:00</p>
					</div>
				</nav>
			</div>

			<div id="contents" class="location-fixed">
				<h2 class="tit">분실물 문의</h2>

				<div class="clearfix">
					<ul class="dot-list">
						<li>
							메가박스에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.
						</li>
						<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
					</ul>
				</div>

				<div class="board-list-util">
					<p class="result-count"><strong>전체 <span id="totalCnt" class="font-gblue">9,806</span>건</strong></p>

					<div class="dropdown bootstrap-select bs3"><select id="theater" title="지역 선택" class="selectpicker" tabindex="-98"><option class="bs-title-option" value=""></option>
						<option value="">지역 선택</option>
						
							<option value="10">서울</option>
						
							<option value="30">경기</option>
						
							<option value="35">인천</option>
						
							<option value="45">대전/충청/세종</option>
						
							<option value="55">부산/대구/경상</option>
						
							<option value="65">광주/전라</option>
						
							<option value="70">강원</option>
						
							<option value="80">제주</option>
						
					</select><button type="button" class="btn dropdown-toggle btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="theater" title="지역 선택"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">지역 선택</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>

					<div class="dropdown bootstrap-select disabled ml07 bs3"><select id="theater02" title="극장 선택" class="selectpicker ml07" disabled="disabled" tabindex="-98"><option class="bs-title-option" value=""></option>
						<option value="">극장 선택</option>
						
					</select><button type="button" class="btn dropdown-toggle disabled btn-default bs-placeholder" data-toggle="dropdown" role="button" data-id="theater02" tabindex="-1" aria-disabled="true" title="극장 선택"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">극장 선택</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1"><ul class="dropdown-menu inner "></ul></div></div></div>

					<div class="dropdown bootstrap-select ml07 bs3"><select id="custInqStatCd" class="selectpicker ml07" tabindex="-98">
							
					<div class="board-search">
						<input type="text" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" value="">
					</div>
				</div>

				<div class="table-wrap">
					<table class="board-list">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
						<colgroup>
							<col style="width:72px;">
							<col style="width:133px;">
							<col>
							<col style="width:100px;">
							<col style="width:116px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">제목</th>
								<th scope="col">접수상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody><tr><td>9806</td><td>코엑스</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681854" data-no="10183352" title="분실물 문의 상세보기">장우산</a></th><td>미답변</td><td>2023.09.27</td></tr><tr><td>9805</td><td>성수</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681825" title="분실물 문의 상세보기">보조배터리 분실</a></th><td>미답변</td><td>2023.09.26</td></tr><tr><td>9804</td><td>이수</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681817" title="분실물 문의 상세보기">분실물 문의</a></th><td>미답변</td><td>2023.09.26</td></tr><tr><td>9803</td><td>코엑스</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681815" title="분실물 문의 상세보기">분실물 문의</a></th><td>미답변</td><td>2023.09.26</td></tr><tr><td>9802</td><td>대구신세계(동대구)</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681796" title="분실물 문의 상세보기">분실물</a></th><td>답변완료</td><td>2023.09.26</td></tr><tr><td>9801</td><td>대구신세계(동대구)</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681795" title="분실물 문의 상세보기">분실물</a></th><td>답변완료</td><td>2023.09.26</td></tr><tr><td>9800</td><td>대구신세계(동대구)</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681794" title="분실물 문의 상세보기">분실물</a></th><td>답변완료</td><td>2023.09.26</td></tr><tr><td>9799</td><td>코엑스</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681787" title="분실물 문의 상세보기">분실물 문의</a></th><td>미답변</td><td>2023.09.26</td></tr><tr><td>9798</td><td>코엑스</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681786" title="분실물 문의 상세보기">분실물 문의</a></th><td>미답변</td><td>2023.09.26</td></tr><tr><td>9797</td><td>안산중앙</td><th scope="row"><a href="https://megabox.co.kr/support/lost#layer-01" class="btn-layer-open moveBtn" data-sn="681744" title="분실물 문의 상세보기">갤럭시 버즈2 분실물 문의드립니다.</a></th><td>답변완료</td><td>2023.09.26</td></tr></tbody>
					</table>
				</div>


				<!-- pagination -->
				<nav class="pagination"><strong class="active">1</strong> <a title="2페이지보기" href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기" href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기" href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기" href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기" href="javascript:void(0)" pagenum="6">6</a> <a title="7페이지보기" href="javascript:void(0)" pagenum="7">7</a> <a title="8페이지보기" href="javascript:void(0)" pagenum="8">8</a> <a title="9페이지보기" href="javascript:void(0)" pagenum="9">9</a> <a title="10페이지보기" href="javascript:void(0)" pagenum="10">10</a> <a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a> <a title="마지막 페이지 보기" href="javascript:void(0)" class="control last" pagenum="981">last</a> </nav>
				<!--// pagination -->
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>