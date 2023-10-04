<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<div class="container has-lnb">

		<div class="inner-wrap">
			<div class="lnb-area addchat location-fixed">
				<nav id="lnb" class="ty2">

					
					<p class="tit"><a href="고객센터 홈 주소" title="고객센터">고객센터</a></p>   
					<ul>
						<li class="on"><a href="고객센터 홈 이동 주소" title="고객센터 홈">고객센터 홈</a></li>
						<li><a href="자주 묻는 질문 이동 주소" title="자주 묻는 질문">자주 묻는 질문</a></li>
						<li><a href="공지사항 이동 주소" title="공지사항">공지사항</a></li>
						<li><a href="1:1문의 이동 주소" title="1:1문의">1:1문의</a></li>
						<li><a href="단체관람 및 대관문의 이동 주소" title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
						<li><a href="분실물 문의 이동 주소" title="분실물 문의">분실물 문의</a></li>
						<li><a href="이용약관 이동 주소" title="이용약관">이용약관</a></li>
						<li><a href="위치기반서비스이용약관 이동 주소" title="위치기반서비스이용약관">위치기반서비스이용약관</a></li>
						<li><a href="개인정보처리방침 이동 주소" title="개인정보처리방침">개인정보처리방침</a></li>
						<li><a href="스크린배정수에관한기준 이동주소" style="border-radius: 0 0 10px 10px;" title="스크린배정수에관한기준">스크린배정수에관한기준</a></li>
					</ul>

					<div class="left-customer-info">
						<p class="tit">
							MoviePlus 고객센터
							<span>Dream center</span>
						</p>
						<p class="time"><i class="iconset ico-clock"></i> 10:00~19:00</p>
					</div>
				</nav>
			</div>

			<div id="contents" class="location-fixed">
				<h2 class="tit">고객센터 홈</h2>

				<!-- input-search-area -->
				<div class="input-search-area mb30">
					<div class="input-area">
						<label for="search01" class="label">빠른검색</label>

						<div class="board-search w460px">
							<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15">
							<button type="button" class="btn-search-input" id="searchBtn">검색</button>
						</div>
					</div>

					<div class="btn-area">
						
					</div>
				</div>
				<!--// input-search-area -->

				<div class="custo-main">
					<div class="main-block">
						<div class="block-content" style="display: none">
							<a href="https://megabox.co.kr/support#" id="channelTalk" title="상담톡 이용">
								<p>
									<strong>상담톡 이용</strong>
									상담톡으로 편리하게 문의해주세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="https://megabox.co.kr/support/lost" title="분실물 문의 페이지로 이동">
								<p>
									<strong>분실물 문의</strong>
									잃어버린 물건을 접수해 주시면<br>신속히 찾아드리겠습니다.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="https://megabox.co.kr/support/inquiry" title="1:1 문의 페이지로 이동">
								<p>
									<strong>1:1 문의</strong>
									해결되지않은 문제가 있나요?<br>1:1문의로 문의주세요
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="https://megabox.co.kr/support/rent" title="단체관람 및 대관문의 페이지로 이동">
								<p>
									<strong>단체관람 및 대관문의</strong>
									단체관람 또는 대관을 원하시면<br>문의 해주세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="https://megabox.co.kr/benefit/discount/guide" title="할인카드 안내 페이지로 이동">
								<p>
									<strong>할인카드 안내</strong>
									멤버십 제휴카드 및 다양한 할인카드를<br>통해 알뜰하게 영화 감상하세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="https://megabox.co.kr/support/faq" title="자주 묻는 질문 페이지로 이동">
								<p>
									<strong>자주 묻는 질문</strong>
									자주 묻는 질문<br>빠르고 간편하게 검색하세요.
								</p>
							</a>
						</div>
					</div>
					<div class="notice-wrap">
						<div class="block left">
							<div class="tit-area">
								<h3 class="tit small">자주 묻는 질문 BEST5</h3>
								<a href="https://megabox.co.kr/support/faq" class="more" title="더보기">더보기 <i class="iconset ico-arr-right-gray ml07"></i></a>
							</div>
							<div class="">
								<ol class="decimal-list">
										<li>
											<a href="https://megabox.co.kr/support#" class="faqBtn" data-idx="1" title="질문 상세보기">
												<span class="font-roboto">1</span>&nbsp;
												<span class="font-gblue">[대제목입력]</span> 내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="faqBtn" data-idx="2" title="질문 상세보기">
												<span class="font-roboto">2</span>&nbsp;
												<span class="font-gblue">[대제목입력]</span> 내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="faqBtn" data-idx="3" title="질문 상세보기">
												<span class="font-roboto">3</span>&nbsp;
												<span class="font-gblue">[대제목입력]</span> 내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="faqBtn" data-idx="4" title="질문 상세보기">
												<span class="font-roboto">4</span>&nbsp;
												<span class="font-gblue">[대제목입력]</span> 내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="faqBtn" data-idx="5" title="질문 상세보기">
												<span class="font-roboto">5</span>&nbsp;
												<span class="font-gblue">[대제목입력]</span> 내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
								</ol>
							</div>
						</div>

						<div class="block right">
							<div class="tit-area">
								<h3 class="tit small">공지사항</h3>
								<a href="https://megabox.co.kr/support/notice" class="more" title="더보기">더보기 <i class="iconset ico-arr-right-gray ml07"></i></a>
							</div>
							<div class="decimal-list">
								<ol>
										<li>
											<a href="https://megabox.co.kr/support#" class="moveBtn" data-no="10966" title="공지사항 상세보기">
														<span class="font-gblue"><i class="iconset ico-notice"></i> [대제목입력]</span>																								
												내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
									
										<li>
											<a href="https://megabox.co.kr/support#" class="moveBtn" data-no="10965" title="공지사항 상세보기">
												<span class="font-gblue"><i class="iconset ico-notice"></i> [대제목입력]</span>																								
												내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="moveBtn" data-no="10964" title="공지사항 상세보기">
												<span class="font-gblue"><i class="iconset ico-notice"></i> [대제목입력]</span>																								
												내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="moveBtn" data-no="10963" title="공지사항 상세보기">
												<span class="font-gblue"><i class="iconset ico-notice"></i> [대제목입력]</span>																								
												내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
										<li>
											<a href="https://megabox.co.kr/support#" class="moveBtn" data-no="10962" title="공지사항 상세보기">
												<span class="font-gblue"><i class="iconset ico-notice"></i> [대제목입력]</span>																								
												내용입력
												<span class="date">날짜입력</span>
											</a>
										</li>
									
								</ol>
							</div>
						</div>
					</div>
						</div>
						</div>
		</div></div>
		</head>
		</html>