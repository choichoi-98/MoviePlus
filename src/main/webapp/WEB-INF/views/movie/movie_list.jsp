<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" media="all">
<style>
#header.main-header{
	top:0px;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
<!-- container -->
<div class="container">
	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                <a href="https://www.megabox.co.kr/movie" title="영화 페이지로 이동">영화</a>
                <a href="https://www.megabox.co.kr/movie" title="전체영화 페이지로 이동">전체영화</a>
			</div>

			
		</div>
	</div>

	<!-- contents -->
	<div id="contents">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<h2 class="tit">전체영화</h2>

			<div class="tab-list fixed">
				<ul id="topMenu">
					<li class="on"><a href="https://www.megabox.co.kr/movie" title="박스오피스 탭으로 이동">박스오피스</a></li>
					<li><a href="https://www.megabox.co.kr/movie/comingsoon" title="상영예정작 탭으로 이동">상영예정작</a></li>
					<li><a href="https://www.megabox.co.kr/movie/special" title="특별상영 탭으로 이동">특별상영</a></li>
					<li><a href="https://www.megabox.co.kr/movie/film" title="필름소사이어티 탭으로 이동">필름소사이어티</a></li>
					<li><a href="https://www.megabox.co.kr/movie/classic" title="클래식소사이어티 탭으로 이동">클래식소사이어티</a></li>
					
				</ul>
			</div>

			<!-- movie-list-util -->
			<div class="movie-list-util mt40">
				<!-- 박스오피스 -->
				<div class="topSort" style="display: block;">
					<div class="movie-sorting sortTab">
<!-- 						<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span> -->
<!-- 						<span><button type="button" class="btn" sort-type="megaScore">메가스코어순</button></span> -->
					</div>

					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir">개봉작만</button>
					</div>
				</div>
				<!--// 박스오피스 -->

				<!-- 상영예정작 -->
				<div class="topSort" style="display: none;">
					<div class="movie-sorting sortTab">
						<span><button type="button" class="btn on" sort-type="rfilmDe">개봉일순</button></span>
						<span><button type="button" class="btn" sort-type="title">가나다순</button></span>
					</div>
				</div>
				<!--// 상영예정작 -->

				<!-- 특별상영 -->
				<div class="topSort" style="display: none;">
					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir">개봉작만</button>
					</div>
				</div>
				<!--// 특별상영 -->

				<!-- 필름소사이어티 -->
				<div class="topSort" style="display: none;">
					<div class="movie-sorting sortTab">
						<span><button type="button" class="btn on" sort-type="ticketing" tab-cd="">전체</button></span>
						
					</div>

					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir">개봉작만</button>
					</div>
				</div>
				<!--// 필름소사이어티 -->

				<!-- 클래식소사이어티 -->
				<div class="topSort" style="display: none;">
					<div class="movie-sorting sortTab">
						<span><button type="button" class="btn on" sort-type="ticketing" tab-cd="">전체</button></span>
						
					</div>

					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir">개봉작만</button>
					</div>
				</div>
				<!--// 클래식소사이어티 -->

				<!-- 장르모아보기 -->
				<div class="topSort" style="display: none;">
					<div class="movie-sorting sortTab">
						<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span>
						<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span>
						<span><button type="button" class="btn" sort-type="megaScore">메가스코어순</button></span>
					</div>

					<div class="onair-condition">
						<button type="button" title="개봉작만 보기" class="btn-onair btnOnAir">개봉작만</button>
					</div>
				</div>
				<!--// 장르모아보기 -->

				<!-- 검색결과 없을 때 -->
				<p class="no-result-count"><strong id="totCnt">106</strong>개의 영화가 검색되었습니다.</p>
				<!--// 검색결과 없을 때 -->

				<div class="movie-search">
					<input type="text" title="영화명을 입력하세요" id="ibxMovieNmSearch" name="ibxMovieNmSearch" placeholder="영화명 검색" class="input-text">
					<button type="button" class="btn-search-input" id="btnSearch">검색</button>
				</div>
			</div>
			<!--// movie-list-util -->

			<div class="bg-loading" style="display: none;">
				<div class="spinner-border" role="status">
					<span class="sr-only">Loading...</span>
				</div>
			</div>

			<!-- movie-list -->
			<div class="movie-list">
				<ol class="list" id="movieList">
				<li tabindex="0" class="no-img">
				<div class="movie-list-info">    
				<p class="rank" style="">1<span class="ir">위</span></p>    
				<img src="./MEET PLAY SHARE, 메가박스_files/FHpALlzrfE9IhLNkN2nvmTzVN4vWDDOG_420.jpg" 
				alt="화란" class="poster lozad" onerror="noImg(this)">    <div class="curation">        
				<p class="film" style="display: none">필름 소사이어티</p>        
				<p class="classic" style="display: none">클래식 소사이어티</p>    
			</div>    
			
			<div class="screen-type2">        
			<p name="dbcScrean" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23074200" title="화란 상세보기">            <div class="summary">지옥 같은 현실에서 벗어나고 싶은 소년 ‘연규’가 조직의 중간 보스 ‘치건’을 만나 위태로운 세계에 함께 하게 되며 펼쳐지는 이야기</div>            <div class="my-score big" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">7.9<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="화란" class="tit">화란</p></div><div class="rate-date">    <span class="rate">예매율 22.8%</span>    <span class="date">개봉일 2023.10.11</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23074200"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>394</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23074200" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23074200"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23074200" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">2<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/HtmH5PpYs0W2nj4x4pkln4T5Dy7eZvAg_420.jpg" alt="30일" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score" style="opacity: 0;">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23069600" title="30일 상세보기">            <div class="summary">“완벽한 저에게 신은 저 여자를 던지셨죠”
지성과 외모 그리고 찌질함까지 타고난, '정열'(강하늘).

“모기 같은 존재죠. 존재의 이유를 모르겠는?”
능력과 커리어 그리고 똘기까지 타고난, '나라'(정소민).

영화처럼 만나 영화같은 사랑을 했지만
서로의 찌질함과 똘기를 견디다 못해 마침내 완벽한 남남이 되기로 한다.

그러나!
완벽한 이별을 딱 D-30 앞둔 이들에게 찾아온 것은... 동반기억상실?

올 추석,
기억도 로맨스도 날리고 웃음만 남긴 이들의
제대로 터지는 코미디가 온다!</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8.7<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="30일" class="tit">30일</p></div><div class="rate-date">    <span class="rate">예매율 14.6%</span>    <span class="date">개봉일 2023.10.03</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23069600"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>761</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069600" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23069600"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069600" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">3<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/eNgPZLGFEoShQo90ApHkk7T6FVFzkzKD_420.jpg" alt="나의 행복한 결혼" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23070800" title="나의 행복한 결혼 상세보기">            <div class="summary">사이모리 가문의 능력을 이어받지 못해 집안의 미움을 받던 ‘미요’는

쿠도 가문의 당주이자 냉정한 이능력자 ‘키요카’와 갑작스러운 정략결혼을 하게 된다.

 

원하지 않은 정략결혼으로 ‘미요’를 냉대하던 ‘키요카’는

이전의 약혼자들과는 다른 그녀의 모습에 점차 빠져들게 되고,

‘미요’ 역시 무자비한 줄로만 알았던 ‘키요카’의 다정한 모습에 자꾸 설레기 시작한다.

 

그렇게 ‘키요카’와 ‘미요’가 서로의 마음을 알아가던 중

‘미요’는 자신에게 숨겨진 능력이 있다는 것을 깨닫게 되고,

그녀의 능력은 두 사람의 행복한 결혼을 방해하게 되는데…

 

원치 않은 정략결혼, 그 이후 진정한 사랑이 시작되었다!</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="나의 행복한 결혼" class="tit">나의 행복한 결혼</p></div><div class="rate-date">    <span class="rate">예매율 11%</span>    <span class="date">개봉일 2023.10.11</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23070800"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>560</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23070800" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23070800"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23070800" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">4<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/QU7FdcxjBTaHusZSFDeJO7Ti4SLaakYA_420.jpg" alt="바빌론" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score" style="opacity: 0;">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23000500" title="바빌론 상세보기">            <div class="summary">"모든 순간이 영화가 되는 곳ㅡ'바빌론'"

황홀하면서도 위태로운 고대 도시, '바빌론'에 비유되던 할리우드.
'꿈' 하나만을 위해 모인 사람들이 이를 쟁취하기 위해 벌이는 강렬하면서도 매혹적인 이야기</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8.4<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-19">,</p>    <p title="바빌론" class="tit">바빌론</p></div><div class="rate-date">    <span class="rate">예매율 5.8%</span>    <span class="date">개봉일 2023.02.01</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23000500"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>713</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">2월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23000500" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23000500"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23000500" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">5<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/Y74S8vyiZUMx6DowtPsoQ2OCgmThYqnw_420.jpg" alt="링팝 : 더 퍼스트 브이알콘서트 에스파" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23075500" title="링팝 : 더 퍼스트 브이알콘서트 에스파 상세보기">            <div class="summary">오프라인에서 만나는 VR콘서트, LYNK-POP : THE 1st VR CONCERT aespa

콘서트 1열을 뛰어넘는 생생함
당신만을 위한 특별한 무대


현실의 경계를 허물고
에스파와 함께하는 특별한 순간!


※ LYNK-POP : THE 1st VR CONCERT aespa는 VR헤드셋을 착용한 상태로 진행되는 콘텐트로, 상영관 내 음식물 반입이 어려운 점 양해 부탁드립니다.
※ 안경을 착용하실 경우 헤드셋 사용에 어려움이 있을 수 있어 콘택트 렌즈를 착용하고 방문하시면 더 좋은 경험을 즐기실 수 있습니다.</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-all">,</p>    <p title="링팝 : 더 퍼스트 브이알콘서트 에스파" class="tit">링팝 : 더 퍼스트 브이알콘서트 에스파</p></div><div class="rate-date">    <span class="rate">예매율 5.1%</span>    <span class="date">개봉일 2023.10.25</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23075500"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>183</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23075500" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23075500"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23075500" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">6<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/Qvrsvdbm8e1BrkmbSssyWOXDeYILOk14_420.jpg" alt="라라랜드" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="20007800" title="라라랜드 상세보기">            <div class="summary">황홀한 사랑, 순수한 희망, 격렬한 열정… 
이 곳에서 모든 감정이 폭발한다!
꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다. </div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">9.6<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="라라랜드" class="tit">라라랜드</p></div><div class="rate-date">    <span class="rate">예매율 4.9%</span>    <span class="date">개봉일 2022.09.28</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="20007800"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>1.8k</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="20007800" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="20007800"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="20007800" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">7<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/7ML6Wyigjy8Nz7bM8yr0zWW2AEfpAM8Y_420.jpg" alt="천박사 퇴마 연구소: 설경의 비밀" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23066600" title="천박사 퇴마 연구소: 설경의 비밀 상세보기">            <div class="summary">
대대로 마을을 지켜 온 당주집 장손이지만
정작 귀신은 믿지 않는 가짜 퇴마사 ‘천박사’(강동원).
 
사람의 마음을 꿰뚫는 통찰력으로 가짜 퇴마를 하며, 의뢰받은 사건들을 해결해 오던 그에게
귀신을 보는 의뢰인 ‘유경’(이솜)이 찾아와 거액의 수임료로 거절하기 힘든 제안을 한다.
 
‘천박사’는 파트너 ‘인배’(이동휘)와 함께 ‘유경’의 집으로 향하고 그곳에서 벌어지는 사건을 쫓으며
자신과 얽혀 있는 부적인 ‘설경’의 비밀을 알게 되는데…
 
귀신을 믿지 않는 가짜 퇴마사!
그의 세계를 흔드는 진짜 사건이 나타났다!</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8.3<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="천박사 퇴마 연구소: 설경의 비밀" class="tit">천박사 퇴마 연구소: 설경의 비밀</p></div><div class="rate-date">    <span class="rate">예매율 4.8%</span>    <span class="date">개봉일 2023.09.27</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23066600"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>1.2k</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23066600" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23066600"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23066600" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">8<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/hf4IwAG2xBS5YRNYko2GiLCXIwbbR5qB_420.jpg" alt="블루 자이언트" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23062900" title="블루 자이언트 상세보기">            <div class="summary">“세계 최고가 될 거야, 반드시”

언제나 강가에서 홀로 색소폰을 불던 고등학생 ‘다이’는

세계 최고의 재즈 플레이어에 도전하기 위해 도쿄로 향한다.

 

“실력이 안 되면 같이 안 할 거니까”

우연히 재즈 클럽에서 엄청난 연주 실력을 뽐내는

천재 피아니스트 ‘유키노리’를 만나 밴드 결성을 제안하고,

 

“나도 드럼을 칠 수 있을까?”

‘다이’의 고등학교 동창이자 평범한 대학생이던 ‘슌지’가

열정 가득한 초보 드러머로 합류하면서 밴드 ‘JASS 재스’가 탄생한다.

 

“전력을 다해 연주하자! 분명 전해질 거야”

목표는 최고의 재즈 클럽 ‘쏘 블루’! 10대의 마지막 챕터를 바친

JASS 재스의 격렬하고 치열한 연주가 지금, 바로, 여기서 시작된다!</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="블루 자이언트" class="tit">블루 자이언트</p></div><div class="rate-date">    <span class="rate">예매율 3.5%</span>    <span class="date">개봉일 2023.10.18</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23062900"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>405</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23062900" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23062900"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23062900" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">9<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/JZW8NRxTQe4WGKNap67lcZzGhKDA2Atf_420.jpg" alt="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 1" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23076900" title="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 1 상세보기">            <div class="summary">새로운 시작을 너와, 이 스테이지에서!

'블랙 오어 화이트 라이브 쇼다운' 무대에서 경쟁한 남성 아이돌계 탑러너들의 꿈의 라이브!

IDOLiSH7・TRIGGER・Re:vale・ŹOOĻ
각기 다른 매력을 지닌 4 그룹이 한자리에 모인 
웅장한 라이브 엔터테인먼트가 지금 막을 올린다!
음악이 시대와 사람들의 마음을 이어가고,
이 무대가 순간을 초월해 사랑받을 수 있기를
</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-all">,</p>    <p title="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 1" class="tit">극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 1</p></div><div class="rate-date">    <span class="rate">예매율 3.4%</span>    <span class="date">개봉일 2023.10.19</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23076900"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>402</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23076900" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23076900"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23076900" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">10<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/CZWDJ2DEzkMx4Kq1TnwVg73uut9ivvtA_420.jpg" alt="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 2" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23077300" title="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 2 상세보기">            <div class="summary">새로운 시작을 너와, 이 스테이지에서!

'블랙 오어 화이트 라이브 쇼다운' 무대에서 경쟁한 남성 아이돌계 탑러너들의 꿈의 라이브!

IDOLiSH7・TRIGGER・Re:vale・ŹOOĻ
각기 다른 매력을 지닌 4 그룹이 한자리에 모인
웅장한 라이브 엔터테인먼트가 지금 막을 올린다!
음악이 시대와 사람들의 마음을 이어가고,
이 무대가 순간을 초월해 사랑받을 수 있기를</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-all">,</p>    <p title="극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 2" class="tit">극장판 아이돌리쉬 세븐: LIVE 4bit BEYOND THE PERiOD - DAY 2</p></div><div class="rate-date">    <span class="rate">예매율 3.4%</span>    <span class="date">개봉일 2023.10.19</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23077300"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>117</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23077300" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23077300"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23077300" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">11<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/mv2fTdfzwkdLkS7lasBEwulJkdIkqXFA_420.jpg" alt="1947 보스톤" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23069400" title="1947 보스톤 상세보기">            <div class="summary">“나라가 독립을 했으면 당연히 우리 기록도 독립이 되어야지!”

1936년 베를린 올림픽, 세계 신기록을 세운 마라톤 금메달리스트 ‘손기정’.
기미가요가 울려 퍼지는 시상대에서 화분으로 가슴에 단 일장기를 가렸던 그는
하루아침에 민족의 영웅으로 떠올랐지만
일제의 탄압으로 더 이상 달릴 수 없게 된다.

광복 이후 1947년 서울,
제2의 손기정으로 촉망받는 ‘서윤복’에게 ‘손기정’이 나타나고
밑도 끝도 없이 ‘보스톤 마라톤 대회’에 나가자는 제안을 건넨다.
일본에 귀속된 베를린 올림픽의 영광을 되찾기 위해
처음으로 태극마크를 가슴에 새기고 달려 보자는 것!

운동화 한 켤레 살 돈도 없던 대한의 마라토너들은
미국 보스톤으로 잊을 수 없는 여정을 시작하는데…</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">9<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="1947 보스톤" class="tit">1947 보스톤</p></div><div class="rate-date">    <span class="rate">예매율 2.4%</span>    <span class="date">개봉일 2023.09.27</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23069400"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>708</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069400" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23069400"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069400" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">12<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/rw4jwRPwviWsEkEx1Inq6OtbHTQ29MD0_420.jpg" alt="크리에이터" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23066800" title="크리에이터 상세보기">            <div class="summary">“이것은 인류의 존망이 걸린 싸움입니다”

 

인류를 지키기 위해 만들어진 AI가 LA에 핵폭탄을 터뜨린 후, 

인류와 AI 간의 피할 수 없는 전쟁이 시작된다.

 

전직 특수부대 요원 ‘조슈아’는 

실종된 아내의 단서를 얻을지도 모른다는 생각에 

전쟁을 끝내기 위한 인류의 작전에 합류한다.

 

인류를 위협할 강력한 무기와 이를 창조한 ‘창조자’를 찾아 나서고,

그 무기가 아이 모습의 AI 로봇 '알피'란 사실을 알게 되는데…

 

인간적인가, 인간의 적인가

10월, AI 블록버스터의 신세계가 펼쳐진다!</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8.1<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="크리에이터" class="tit">크리에이터</p></div><div class="rate-date">    <span class="rate">예매율 2.1%</span>    <span class="date">개봉일 2023.10.03</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23066800"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>604</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23066800" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23066800"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23066800" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">13<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/qT59BaynqIhsvEqiZfFEpzR2lIUB0Rb5_420.jpg" alt="괴담만찬" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23063100" title="괴담만찬 상세보기">            <div class="summary">소원을 이루기 위해 무심코 한 댄스 챌린지

한강 다리 밑 목 꺾인 도플갱어가 알려준 입시 비법

잭팟 터트린 후 절대 가면 안 되는 ◆◆모텔 307호의 비밀

고급 ●●아파트 입주민 전용 헬스장의 금기

■■연구실에서 현재 진행 중인 잔인한 실험

구독자 154만 먹방 BJ가 라이브 중 저지른 돌출 행동

욕망에 눈먼 이들에게 닥친 죽음보다 더한 공포!</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="괴담만찬" class="tit">괴담만찬</p></div><div class="rate-date">    <span class="rate">예매율 1.8%</span>    <span class="date">개봉일 2023.10.18</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23063100"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>257</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23063100" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23063100"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23063100" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">14<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/er9kvzoYIsHAI6R0SjMw32ne4b70jzcW_420.jpg" alt="5등분의 신부 스페셜" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23077100" title="5등분의 신부 스페셜 상세보기">            <div class="summary">고등학교 마지막 여름방학, 
후타로는 수험 공부에 집중할 수 있도록 여름방학 기간에는 과외 아르바이트를 쉰다고 말한다.
후타로를 만나지 못해 슬퍼하는 다섯 쌍둥이의 여름방학 이야기!
귀여운 500%의 다섯 쌍둥이의 러브 코미디 여름방학편--!!
</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="5등분의 신부 스페셜" class="tit">5등분의 신부 스페셜</p></div><div class="rate-date">    <span class="rate">예매율 1.7%</span>    <span class="date">개봉일 2023.10.12</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23077100"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>286</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23077100" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23077100"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23077100" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">15<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/xdtu2ATjzTEV8inMhDMxwUvuWfA2JfTG_420.jpg" alt="거미집" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style=""><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23069500" title="거미집 상세보기">            <div class="summary">“결말만 바꾸면 걸작이 된다, 딱 이틀이면 돼!”

1970년대 꿈도 예술도 검열당하던 시대
성공적이었던 데뷔작 이후, 악평과 조롱에 시달리던 김감독(송강호)은
촬영이 끝난 영화 ‘거미집’의 새로운 결말에 대한 영감을 주는 꿈을 며칠째 꾸고 있다.
그대로만 찍으면 틀림없이 걸작이 된다는 예감, 그는 딱 이틀 간의 추가 촬영을 꿈꾼다.
그러나 대본은 심의에 걸리고, 제작자 백회장(장영남)은 촬영을 반대한다.
제작사 후계자인 신미도(전여빈)를 설득한 김감독은 베테랑 배우 이민자(임수정), 톱스타 강호세(오정세),
떠오르는 스타 한유림(정수정)까지 불러 모아 촬영을 강행하지만, 스케줄 꼬인 배우들은 불만투성이다.
설상가상 출장 갔던 제작자와 검열 담당자까지 들이닥치면서 현장은 아수라장이 되는데…

과연 ‘거미집’은 세기의 걸작으로 완성될 수 있을까?</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="거미집" class="tit">거미집</p></div><div class="rate-date">    <span class="rate">예매율 1.6%</span>    <span class="date">개봉일 2023.09.27</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23069500"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>659</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069500" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23069500"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069500" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">16<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/twDS6DyPyBWrvjNCpK13Pk2riUob86Jt_420.jpg" alt="더 넌 2" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23069000" title="더 넌 2 상세보기">            <div class="summary">컨저링 유니버스 사상

가장 강력한 악마가 돌아왔다!

 

1956년, 프랑스의 한 성당에서 신부가 끔찍하게 살해당한다.

이 사건을 조사하기 위해 파견된 아이린 수녀는 4년 전 자신을 공포에 떨게 했던 악마의 기운을 느낀다.

어두운 밤, 계속해서 일어나는 의문의 사건들 가운데 충격적인 진실이 드러나는데…

 

9월, 기도를 멈추지 마라</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">7.6<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="더 넌 2" class="tit">더 넌 2</p></div><div class="rate-date">    <span class="rate">예매율 1.2%</span>    <span class="date">개봉일 2023.09.27</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23069000"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>408</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069000" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23069000"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23069000" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">17<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/rKXm2cLwzD5hjhCitHBlKbUu6AANyc94_420.jpg" alt="[2023 시네 도슨트] MEET 모네" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23073600" title="[2023 시네 도슨트] MEET 모네 상세보기">            <div class="summary">서양 미술사의 한 획을 그은 위대한 예술가들을 집중 조명해봅니다. 
서로 다른 삶을 살았던 이들의 길과 그 끝에 피워낸 세기의 작품들을 
안현배 미술사학자의 풍부한 해설로 만나 보세요. 

[시네 도슨트 MEET 모네]
- 강연장소 : 메가박스 코엑스 지점
- 강연일시 : 10월 16일(월) 오전 11시, 오후 7시 30분
- 예매오픈 : 10월 2일(월) 오후 1시
- 강연시간 : 110분 

※ 본 강연은 월요일(10월 16일) 오전 11시, 오후 7시 30분 2회 진행됩니다. 
화요일에는 강연이 없으니 예매 시 유의해주세요. 

○ 강연 주제
“그의 시선이 현대를 가져오다. 인상파의 거장 클로드 모네를 만나다”
인상파 운동을 이끌었던 거장, 수련 시리즈로 유명한 모네를 만나는 시간입니다. 
완벽하게 새로운 길을 찾아서 미술의 혁신을 일으킨 인상파, 원래 인상파는 평론가들이 조롱하기 위해 사용했던 용어였습니다. 
그런데 어느 순간 인상파는 가장 알려진 성공한 예술 운동이 되었고, 그 작품들은 가장 비싼 가격에 거래됐죠. 
 인상파 운동을 이끌었던 리더, 그리고 가장 성공한 화가는 수련 시리즈로 유명한 모네입니다. 
조롱과 경멸을 의미했던 인상주의가 어떻게 시대를 대표하는 예술이 되었는지, 
그리고 모네와 그 친구들이 변화시킨 미술에 대한 태도가 어떻게 현대 미술로 연결되는지 알아봅시다. 
 (feat. 마네) 에두아르 마네는 모네가 알려지기 전 미술계의 혁신이 뭔지 보여줬던 작가로서, 최초의 모더니스트라고 불립니다. 
마네와 모네. 이 두명의 화가가 바꿔 놓은 미술의 흐름은 어떻게 봐야 할까요?


○ 도슨트 : 미술사학자 안현배
파리 1 대학교에서 역사학과 프랑스 근대 정치 문화사를 전공했고, 아나키즘 주제로 석사 학위를 받았다. 
예술사학과에서 프랑스 근대 예술사로 전공을 바꾸고 석사 학위를 이어, 같은 분야 박사 과정을 수료했다.
저서로는 “안현배의 예술수업, 모더니즘 편” 과 “미술관에 간 인문학자” 가 있다. 
미술사학자로서 예술을 보다 넓은 컨텍스트 안에서 인문학적으로 접근하는 시야를 열고자 노력하고 있다.

* 본 프로그램은 별도의 영상 상영 없이 진행되는 강연 프로그램입니다.
* 예술작품들의 이미지 및 동영상을 활용한 강의로, 어린 학생을 동반하실 경우 보호자의 지도가 필요합니다. 
* 강연 일정은 강사 사정에 따라 변동될 수 있습니다.
* 강연 3일전 ~ 1일전 취소 및 환불시 수수료가 10% 발생되며, 당일 취소는 불가 합니다.
</div>            <div class="my-score equa" style="display: none;">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">0<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-12">,</p>    <p title="[2023 시네 도슨트] MEET 모네" class="tit">[2023 시네 도슨트] MEET 모네</p></div><div class="rate-date">    <span class="rate">예매율 0.8%</span>    <span class="date">개봉일 2023.10.16</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23073600"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>80</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23073600" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23073600"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23073600" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">18<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/MKHKIwJ0TBrdA3o1GwJmjkZDr9PtIjs5_420.jpg" alt="퍼피 구조대: 더 마이티 무비" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23068700" title="퍼피 구조대: 더 마이티 무비 상세보기">            <div class="summary">신비한 힘을 가진 유성이 어드벤처 시티에 떨어진 날,

퍼피 구조대는 유성에서 나온 크리스털 덕분에 초능력을 가진 ‘퍼피 히어로즈’로 변신한다.

하지만 악당 ‘험딩어 시장’과 미치광이 과학자 ‘빅토리아’는 초능력의 원천인 크리스털을 빼앗아 어드벤처 시티를 지배하려 하는데..!

작고 약하게 태어났지만 오랫동안 큰 꿈을 키워 온 ‘스카이’와 퍼피 히어로즈는 주니어 구조대원들과 함께 어드벤처 시티를 지켜낼 수 있을까?</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">9.5<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-all">,</p>    <p title="퍼피 구조대: 더 마이티 무비" class="tit">퍼피 구조대: 더 마이티 무비</p></div><div class="rate-date">    <span class="rate">예매율 0.7%</span>    <span class="date">개봉일 2023.10.06</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23068700"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>85</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">10월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23068700" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23068700"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23068700" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">19<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/2VGGGrBFIl8dOoqYw2jBF8JLSZKN3gu5_420.jpg" alt="밀수" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23029300" title="밀수 상세보기">            <div class="summary">열길 물속은 알아도 한길 사람 속은 모른다!

 

평화롭던 바닷가 마을 군천에 화학 공장이 들어서면서 하루아침에 일자리를 잃은 해녀들.

먹고 살기 위한 방법을 찾던 승부사 '춘자'(김혜수)는

바다 속에 던진 물건을 건져 올리기만 하면 큰돈을 벌 수 있다는

밀수의 세계를 알게 되고 해녀들의 리더 '진숙'(염정아)에게 솔깃한 제안을 한다.

위험한 일임을 알면서도 생계를 위해 과감히 결단을 내린 해녀 '진숙'은

전국구 밀수왕 '권 상사'를 만나게 되면서 확 커진 밀수판에 본격적으로 빠지게 된다.

그러던 어느 날, 일확천금을 얻을 수 있는 일생일대의 기회가 찾아오고

사람들은 서로를 속고 속이며 거대한 밀수판 속으로 휩쓸려 들어가기 시작하는데...

 

물길을 아는 자가 돈길의 주인이 된다!</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">8.8<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="밀수" class="tit">밀수</p></div><div class="rate-date">    <span class="rate">예매율 0.7%</span>    <span class="date">개봉일 2023.07.26</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23029300"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>2k</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">7월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23029300" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23029300"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23029300" title="영화 예매하기">예매</a>    </div></div></li><li tabindex="0" class="no-img"><div class="movie-list-info">    <p class="rank" style="">20<span class="ir">위</span></p>    <img src="./MEET PLAY SHARE, 메가박스_files/br6TLP1tgxeY5XmseqTCXHTvNdJTVYh8_420.jpg" alt="아이돌 마스터 밀리언 라이브!" class="poster lozad" onerror="noImg(this)">    <div class="curation">        <p class="film" style="display: none">필름 소사이어티</p>        <p class="classic" style="display: none">클래식 소사이어티</p>    </div>    <div class="screen-type2">        <p name="dbcScrean" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_db.png" alt="dolby"></p>        <p name="mxScreen" style="display: none"><img src="./MEET PLAY SHARE, 메가박스_files/mov_top_tag_mx.png" alt="mx"></p>    </div>    <div class="movie-score">        <a href="https://www.megabox.co.kr/movie#" class="wrap movieBtn" data-no="23073100" title="아이돌 마스터 밀리언 라이브! 상세보기">            <div class="summary">「꿈」이란 무엇일까--.
바쁜 나날을 보내는 중학교 2학년 카스가 미라이는 자신의 꿈이 무엇인지 아직 모른 채. 765 PRO ALLSTARS 라이브 티켓을 우연히 받은 미라이는 행사장에서 같은 중학교 2학년 모가미 시즈카와 만난다.
어렸을 때부터 아이돌을 동경했던 시즈카. 그리고 객석에는 이부키 츠바사의 모습도.
세 사람이 바라보는 가운데 무대의 막이 오른다!</div>            <div class="my-score big">                <div class="preview">                    <p class="tit">관람평</p>                    <p class="number">9.8<span class="ir">점</span></p>                </div>            </div>        </a>    </div></div><div class="tit-area">    <p class="movie-grade age-15">,</p>    <p title="아이돌 마스터 밀리언 라이브!" class="tit">아이돌 마스터 밀리언 라이브!</p></div><div class="rate-date">    <span class="rate">예매율 0.7%</span>    <span class="date">개봉일 2023.09.21</span></div><div class="btn-util">    <button type="button" class="button btn-like" data-no="23073100"><i title="보고싶어 안함" class="iconset ico-heart-toggle-gray intrstType"></i> <span>751</span></button>    <p class="txt movieStat1" style="display: none">상영예정</p>    <p class="txt movieStat2" style="display: none">9월 개봉예정</p>    <p class="txt movieStat5" style="display: none">개봉예정</p>    <p class="txt movieStat6" style="display: none">상영종료</p>    <div class="case col-2 movieStat3" style="display: none">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23073100" title="영화 예매하기">예매</a>        <a href="https://www.megabox.co.kr/movie#" class="button purple img splBtn" data-no="23073100"><img src="./MEET PLAY SHARE, 메가박스_files/mov_list_db_btn.png" alt="dolby 버튼"></a>    </div>    <div class="case movieStat4" style="">        <a href="https://www.megabox.co.kr/movie#" class="button purple bokdBtn" data-no="23073100" title="영화 예매하기">예매</a>    </div></div></li></ol>
			</div>
			<!--// movie-list -->

			<div class="btn-more v1" id="addMovieDiv" style="">
				<button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
			</div>

			<!-- 검색결과 없을 때 -->
			<div class="movie-list-no-result" id="noDataDiv" style="display: none;">
				<p>현재 상영중인 영화가 없습니다.</p>
			</div>


			<!-- 검색결과 없을 때 -->
			<div class="movie-list-no-favor" id="noMyGenre" style="display: none;">
				<p>선호장르가 등록되지 않았습니다. 선호하시는 장르를 등록해보세요.</p>
				<div class="btn-group center">
						<a href="https://www.megabox.co.kr/mypage/additionalinfo" class="button large purple" title="선호장르설정하기 페이지로 이동">선호장르설정하기</a>
				</div>
			</div>


		</div>
	</div>
</div>
<!--// container -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>