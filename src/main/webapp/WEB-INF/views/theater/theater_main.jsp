<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>

<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="극장 페이지로 이동">극장</a> <a href="#"
						title="전체극장 페이지로 이동">전체극장</a>
				</div>
			</div>
		</div>

		<!-- content -->
		<div id="contents" class="no-padding">


			<!--// theater-main -->
			<div class="inner-wrap">
				<h2 class="tit mt40">전체극장</h2>
				<div class="theater-box" style="height: 292px;">
					<div class="theater-place">
						<ul>
							<c:forEach var="location" items="${locationList}" varStatus="status">
							<c:choose>
								<c:when test="${status.index == 0}">							
									<li class="on">
								</c:when>
								<c:otherwise>
									<li class="">
								</c:otherwise>
							</c:choose>
								<button type="button" class="sel-city">${location.value}</button>

								<div class="theater-list">
									<ul>
										<c:forEach var="theater" items="${theaterList}">
											<c:if test="${location.value eq theater.THEATER_LOCATION }">
												<li><a href="detail?theaterId=${theater.THEATER_ID}" title="${theater.THEATER_NAME} 상세보기">${theater.THEATER_NAME}</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>

					<div class="user-theater">



						<!-- 로그인 전 -->
						<div style="display: none;">
							<i class="iconset ico-favo-theater"></i> 나의 선호영화관 정보 
							<a href="#" class="button small ml10" id="movelogin" title="로그인하기">로그인하기</a>
						</div>
						
						
						<!-- 로그인 후 -->
						<div>
							<i class="iconset ico-favo-theater"></i> <span class="font-gblue">이름</span>님의
							선호영화관
							<ul class="theater-circle">
								<li>
									<a href="#" title="강남 상세보기">강남</a>
								</li>
							</ul>
							<a href="#" id="favorite-theater-btn" class="button small float-r" title="선호영화관 관리"> <i
								class="iconset ico-edit"></i> 선호영화관 관리
							</a>
						</div>

					</div>
				</div>


				<div class="tit-util mt70 mb15">
					<h3 class="tit">극장 이벤트</h3>
					<a href="#" class="more"
						title="극장 이벤트 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="event-box">
					<ul>

						<li><a href="#"
							class="eventBtn" data-no="14058" data-netfunnel="N"
							title="[대구경북지역] 대구경북 추석 감사제! 상세보기"> <img
								src=""
								alt="[대구경북지역] 대구경북 추석 감사제!" onerror="noImg(this)">
						</a></li>

						<li><a href="#"
							class="eventBtn" data-no="12817" data-netfunnel="N"
							title="[세종] 황금 연휴, 시크릿 쿠폰 상세보기"> <img
								src=""
								alt="[세종] 황금 연휴, 시크릿 쿠폰" onerror="noImg(this)">
						</a></li>

					</ul>
				</div>


				<div class="tit-util mt70 mb15">
					<h3 class="tit">극장 공지사항</h3>
					<a href="#"
						class="more" title="극장 공지사항 더보기">더보기 <i
						class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="table-wrap">
					<table class="board-list">
						<caption>극장, 제목, 지역, 등록일이 들어간 극장 공지사항 목록</caption>
						<colgroup>
							<col style="width: 150px;">
							<col>
							<col style="width: 150px;">
							<col style="width: 120px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">극장</th>
								<th scope="col">제목</th>
								<th scope="col">지역</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>



							<tr>
								<td>광명소하</td>
								<th scope="row"><a
									href="#"
									title="[광명소하] 리뉴얼 오픈 안내 상세보기"> [광명소하] 리뉴얼 오픈 안내 </a></th>
								<td>경기</td>
								<td>2023.09.19</td>
							</tr>

							<tr>
								<td>송파파크하비오</td>
								<th scope="row"><a
									href="#"
									title="[송파파크하비오] 9/19~9/22 운영시간 변경 안내 상세보기"> [송파파크하비오]
										9/19~9/22 운영시간 변경 안내 </a></th>
								<td>서울</td>
								<td>2023.09.15</td>
							</tr>

							<tr>
								<td>백석벨라시타</td>
								<th scope="row"><a
									href="#"
									title="[백석벨라시타]제 15회 DMZ국제다큐멘터리 영화제 개최 안내 상세보기"> [백석벨라시타]제
										15회 DMZ국제다큐멘터리 영화제 개최 안내 </a></th>
								<td>경기</td>
								<td>2023.09.13</td>
							</tr>

							<tr>
								<td>검단</td>
								<th scope="row"><a
									href="#"
									title="[검단] 우대요금 변경 안내 (9/15부터~) 상세보기"> [검단] 우대요금 변경 안내
										(9/15부터~) </a></th>
								<td>인천</td>
								<td>2023.09.11</td>
							</tr>

							<tr>
								<td>일산</td>
								<th scope="row"><a
									href="#"
									title="[일산] 임시 휴업 안내 (2023년 9월 7일 부터~) 상세보기"> [일산] 임시 휴업 안내
										(2023년 9월 7일 부터~) </a></th>
								<td>경기</td>
								<td>2023.09.04</td>
							</tr>




						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
	
	<section id="favor_theater_setting" class="modal-layer" style="z-index: 503;"> <!-- on -->

<div class="wrap" id="favorBrchReg" style="width: 500px; height: 360px; margin-left: -250px; margin-top: -180px;">
    <header class="layer-header">
        <h3 class="tit">선호극장 관리</h3>
    </header>

    <div class="layer-con" style="min-height: 220px; height: 248px;">

        <div class="box-gray v1 a-c">
            <div class="dropdown bootstrap-select w150px small bs3"><select title="" class="w150px small" name="areaList" tabindex="-98">
            <option value="10">서울</option><option value="30">경기</option><option value="35">인천</option><option value="45">대전/충청/세종</option><option value="55">부산/대구/경상</option><option value="65">광주/전라</option><option value="70">강원</option><option value="80">제주</option></select><button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown" role="button" title="서울" aria-expanded="false"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">서울</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox" style="max-height: 150px; overflow: hidden; min-width: 150px;"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1" style="max-height: 150px; overflow-y: auto;"><ul class="dropdown-menu inner "><li class="selected active"><a role="option" aria-disabled="false" tabindex="0" class="selected active" aria-selected="true"><span class="text">서울</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">경기</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">인천</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전/충청/세종</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">부산/대구/경상</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">광주/전라</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">강원</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">제주</span></a></li></ul></div></div></div>

            <div class="dropdown bootstrap-select w150px small ml05 bs3"><select title="" class="w150px small ml05" name="brchList" tabindex="-98">
                <option value="" data-area-cd="" style="display: block;">극장 선택</option>
            <option value="1372" data-area-cd="10">강남</option>
            <option value="0023" data-area-cd="10">강남대로(씨티)</option>
            <option value="1341" data-area-cd="10">강동</option><option value="1431" data-area-cd="10">군자</option><option value="0041" data-area-cd="10">더 부티크 목동현대백화점</option><option value="1003" data-area-cd="10">동대문</option><option value="1572" data-area-cd="10">마곡</option><option value="1581" data-area-cd="10">목동</option><option value="1311" data-area-cd="10">상봉</option><option value="1211" data-area-cd="10">상암월드컵경기장</option><option value="1331" data-area-cd="10">성수</option><option value="1371" data-area-cd="10">센트럴</option><option value="1381" data-area-cd="10">송파파크하비오</option><option value="1202" data-area-cd="10">신촌</option><option value="1561" data-area-cd="10">이수</option><option value="1321" data-area-cd="10">창동</option><option value="1351" data-area-cd="10">코엑스</option><option value="1212" data-area-cd="10">홍대</option><option value="1571" data-area-cd="10">화곡</option><option value="1562" data-area-cd="10">ARTNINE</option><option value="4121" data-area-cd="30" style="display: none;">고양스타필드</option><option value="0029" data-area-cd="30" style="display: none;">광명AK플라자</option><option value="0053" data-area-cd="30" style="display: none;">광명소하</option><option value="0035" data-area-cd="30" style="display: none;">금정AK플라자</option><option value="4152" data-area-cd="30" style="display: none;">김포한강신도시</option><option value="0039" data-area-cd="30" style="display: none;">남양주</option><option value="0019" data-area-cd="30" style="display: none;">남양주현대아울렛 스페이스원</option><option value="4451" data-area-cd="30" style="display: none;">동탄</option><option value="4652" data-area-cd="30" style="display: none;">미사강변</option><option value="4104" data-area-cd="30" style="display: none;">백석벨라시타</option><option value="4722" data-area-cd="30" style="display: none;">별내</option><option value="4221" data-area-cd="30" style="display: none;">부천스타필드시티</option><option value="4631" data-area-cd="30" style="display: none;">분당</option><option value="0030" data-area-cd="30" style="display: none;">수원</option><option value="0052" data-area-cd="30" style="display: none;">수원AK플라자</option><option value="0042" data-area-cd="30" style="display: none;">수원남문</option><option value="0036" data-area-cd="30" style="display: none;">수원호매실</option><option value="4291" data-area-cd="30" style="display: none;">시흥배곧</option><option value="4253" data-area-cd="30" style="display: none;">안산중앙</option><option value="0020" data-area-cd="30" style="display: none;">안성스타필드</option><option value="4821" data-area-cd="30" style="display: none;">양주</option><option value="4431" data-area-cd="30" style="display: none;">영통</option><option value="0012" data-area-cd="30" style="display: none;">용인기흥</option><option value="4462" data-area-cd="30" style="display: none;">용인테크노밸리</option><option value="4804" data-area-cd="30" style="display: none;">의정부민락</option><option value="4111" data-area-cd="30" style="display: none;">일산</option><option value="4112" data-area-cd="30" style="display: none;">킨텍스</option><option value="4132" data-area-cd="30" style="display: none;">파주금촌</option><option value="4115" data-area-cd="30" style="display: none;">파주운정</option><option value="4131" data-area-cd="30" style="display: none;">파주출판도시</option><option value="4651" data-area-cd="30" style="display: none;">하남스타필드</option><option value="4041" data-area-cd="35" style="display: none;">검단</option><option value="4062" data-area-cd="35" style="display: none;">송도</option><option value="4001" data-area-cd="35" style="display: none;">영종</option><option value="4051" data-area-cd="35" style="display: none;">인천논현</option><option value="0027" data-area-cd="35" style="display: none;">청라지젤</option><option value="3141" data-area-cd="45" style="display: none;">공주</option><option value="0018" data-area-cd="45" style="display: none;">논산</option><option value="3021" data-area-cd="45" style="display: none;">대전</option><option value="0028" data-area-cd="45" style="display: none;">대전신세계 아트앤사이언스</option><option value="0009" data-area-cd="45" style="display: none;">대전유성</option><option value="3011" data-area-cd="45" style="display: none;">대전중앙로</option><option value="0017" data-area-cd="45" style="display: none;">대전현대아울렛</option><option value="3391" data-area-cd="45" style="display: none;">세종(조치원)</option><option value="3392" data-area-cd="45" style="display: none;">세종나성</option><option value="0008" data-area-cd="45" style="display: none;">세종청사</option><option value="3631" data-area-cd="45" style="display: none;">오창</option><option value="3651" data-area-cd="45" style="display: none;">진천</option><option value="3301" data-area-cd="45" style="display: none;">천안</option><option value="0049" data-area-cd="45" style="display: none;">청주사창</option><option value="3501" data-area-cd="45" style="display: none;">홍성내포</option><option value="0040" data-area-cd="55" style="display: none;">경북도청</option><option value="7122" data-area-cd="55" style="display: none;">경산하양</option><option value="0043" data-area-cd="55" style="display: none;">경주</option><option value="7303" data-area-cd="55" style="display: none;">구미강동</option><option value="7401" data-area-cd="55" style="display: none;">김천</option><option value="7901" data-area-cd="55" style="display: none;">남포항</option><option value="7011" data-area-cd="55" style="display: none;">대구신세계(동대구)</option><option value="0022" data-area-cd="55" style="display: none;">대구이시아</option><option value="6161" data-area-cd="55" style="display: none;">덕천</option><option value="6312" data-area-cd="55" style="display: none;">마산</option><option value="7451" data-area-cd="55" style="display: none;">문경</option><option value="6001" data-area-cd="55" style="display: none;">부산극장</option><option value="6906" data-area-cd="55" style="display: none;">부산대</option><option value="0025" data-area-cd="55" style="display: none;">북대구(칠곡)</option><option value="0032" data-area-cd="55" style="display: none;">사상</option><option value="6642" data-area-cd="55" style="display: none;">삼천포</option><option value="6261" data-area-cd="55" style="display: none;">양산</option><option value="6262" data-area-cd="55" style="display: none;">양산증산</option><option value="0057" data-area-cd="55" style="display: none;">울산</option><option value="6191" data-area-cd="55" style="display: none;">정관</option><option value="0045" data-area-cd="55" style="display: none;">진주(중안)</option><option value="0048" data-area-cd="55" style="display: none;">창원</option><option value="0014" data-area-cd="55" style="display: none;">창원내서</option><option value="0038" data-area-cd="55" style="display: none;">포항</option><option value="0046" data-area-cd="55" style="display: none;">해운대(장산)</option><option value="5021" data-area-cd="65" style="display: none;">광주상무</option><option value="5061" data-area-cd="65" style="display: none;">광주하남</option><option value="5302" data-area-cd="65" style="display: none;">목포하당(포르모)</option><option value="5401" data-area-cd="65" style="display: none;">순천</option><option value="5552" data-area-cd="65" style="display: none;">여수웅천</option><option value="0010" data-area-cd="65" style="display: none;">전대(광주)</option><option value="0050" data-area-cd="65" style="display: none;">전주객사</option><option value="5612" data-area-cd="65" style="display: none;">전주송천</option><option value="0021" data-area-cd="65" style="display: none;">전주혁신</option><option value="5064" data-area-cd="65" style="display: none;">첨단</option><option value="2001" data-area-cd="70" style="display: none;">남춘천</option><option value="2171" data-area-cd="70" style="display: none;">속초</option><option value="2201" data-area-cd="70" style="display: none;">원주</option><option value="2202" data-area-cd="70" style="display: none;">원주센트럴</option><option value="0037" data-area-cd="70" style="display: none;">춘천석사</option><option value="0054" data-area-cd="80" style="display: none;">제주서귀포</option></select><button type="button" class="btn dropdown-toggle btn-default" data-toggle="dropdown" role="button" title="강남" aria-expanded="false"><div class="filter-option"><div class="filter-option-inner"><div class="filter-option-inner-inner">강남</div></div> </div><span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox" style="max-height: 150px; overflow: hidden; min-width: 150px;"><div class="inner open" role="listbox" aria-expanded="false" tabindex="-1" style="max-height: 150px; overflow-y: auto;"><ul class="dropdown-menu inner "><li class="selected active"><a role="option" style="display: block;" aria-disabled="false" tabindex="0" class="selected active" aria-selected="true"><span class="text">극장 선택</span></a></li><li class="selected active"><a role="option" aria-disabled="false" tabindex="0" aria-selected="true" class="selected active"><span class="text">강남</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">강남대로(씨티)</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">강동</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">군자</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">더 부티크 목동현대백화점</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">동대문</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">마곡</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">목동</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">상봉</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">상암월드컵경기장</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">성수</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">센트럴</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">송파파크하비오</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">신촌</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">이수</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">창동</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">코엑스</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">홍대</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">화곡</span></a></li><li><a role="option" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">ARTNINE</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">고양스타필드</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">광명AK플라자</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">광명소하</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">금정AK플라자</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">김포한강신도시</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">남양주</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">남양주현대아울렛 스페이스원</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">동탄</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">미사강변</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">백석벨라시타</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">별내</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">부천스타필드시티</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">분당</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">수원</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">수원AK플라자</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">수원남문</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">수원호매실</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">시흥배곧</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">안산중앙</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">안성스타필드</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">양주</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">영통</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">용인기흥</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">용인테크노밸리</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">의정부민락</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">일산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">킨텍스</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">파주금촌</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">파주운정</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">파주출판도시</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">하남스타필드</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">검단</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">송도</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">영종</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">인천논현</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">청라지젤</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">공주</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">논산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전신세계 아트앤사이언스</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전유성</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전중앙로</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대전현대아울렛</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">세종(조치원)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">세종나성</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">세종청사</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">오창</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">진천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">천안</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">청주사창</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">홍성내포</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">경북도청</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">경산하양</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">경주</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">구미강동</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">김천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">남포항</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대구신세계(동대구)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">대구이시아</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">덕천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">마산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">문경</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">부산극장</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">부산대</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">북대구(칠곡)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">사상</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">삼천포</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">양산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">양산증산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">울산</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">정관</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">진주(중안)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">창원</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">창원내서</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">포항</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">해운대(장산)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">광주상무</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">광주하남</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">목포하당(포르모)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">순천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">여수웅천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">전대(광주)</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">전주객사</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">전주송천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">전주혁신</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">첨단</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">남춘천</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">속초</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">원주</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">원주센트럴</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">춘천석사</span></a></li><li><a role="option" style="display: none;" aria-disabled="false" tabindex="0" aria-selected="false"><span class="text">제주서귀포</span></a></li></ul></div></div></div>

            <button type="button" class="button gray small ml05">추가</button>
        </div>

        <!-- theater-choice-list -->
        <div class="theater-choice-list">
            
                <div class="bg"><div class="circle" data-brch-no="1372">
        <p class="txt">강남</p>
        <button type="button" class="del">삭제</button>
    </div></div>
            
                <div class="bg">
                    
                </div>
            
                <div class="bg">
                    
                </div>
            
        </div>
        <!--// theater-choice-list -->
    </div>

    <div class="btn-group-fixed">
        <button type="button" id="favorite-theater-close-btn" class="button close-layer">취소</button>
        <button type="button" class="button purple">등록</button>
    </div>

    <button type="button" class="btn-modal-close">레이어 닫기</button>
	</div>


	</section>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>