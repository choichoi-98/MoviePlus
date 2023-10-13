<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="container" id="schdlContainer">

	<div class="page-util fixed">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span>
                    <a href="https://www.megabox.co.kr/event" title="진행중 이벤트 페이지로 이동">이벤트</a>

				<a href="javascript:void(0)" title="이벤트 상세">이벤트 상세</a>
			</div>

			
		</div>
	</div>


	<div id="contents" class="location-fixed">

		<!-- event-detail -->
		<div class="event-detail">
			<h2 class="tit">&lt;30일&gt; 2주차 무대인사</h2>
			<p class="event-detail-date">
				<span>기간</span>
				<em>2023.10.14 ~ 2023.10.15</em>
			</p>

			<!--
				가로가 100% 일때
				<div class="event-html full">

				가로가 1100px 일때
				<div class="event-html">
			-->

			
				
				
					<div class="event-html">
					
					    
						
						
						
							
<title></title>
<table align="center" border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td><img border="0" src="./eventdetail_files/BzydzmnqEnThgEuCO8zmKcVAuqS15KkV.jpg"></td>
		</tr>
		<tr>
			<td><img border="0" src="./eventdetail_files/qpzJbWeTVEoIuHJSrsYZXcw4vsbtZa9C.jpg" usemap="#Map"></td>
		</tr>
		<tr>
			<td><img border="0" src="./eventdetail_files/zm9gecGZC8AuWGeNi2WKpKJ7Pd8Vr5IV.jpg"></td>
		</tr>
	</tbody>
</table>
<map name="Map"><area coords="185,794,535,880" href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600" shape="rect" target="_blank"> <area coords="565,794,915,880" href="https://m.megabox.co.kr/re/WebApp/booking/movie?movieNo=23069600" shape="rect" target="_blank"></map>
	                        
	                        
	                        
	                        
	                        
						
					
					</div>
				
			

			<!--// iframe 아닐 때  -->
		</div>
		<!--// event-detail -->
		<!-- 댓글 이벤트 상세페이지 -->
		

		<!-- 빵원쿠폰플러스/빵원쿠폰/응모하기/쿠폰다운/URL링크/포인트플러스 이벤트 상세페이지 -->
		
			
                      
                   
                    
                     
                            
				
				
				
            




<script src="./eventdetail_files/megabox-simpleBokd.js.다운로드"></script>
<script type="text/javascript">

$(function(){

	// 바로예매 버튼 클릭
	//$('div.event-button-type a').click(function(){
    $('.movie-greeting').on('click', 'a.button', function(e) {

	    var sampleObj = new Object();
	    sampleObj['brch-no']       = $(this).closest('.greeting-infomation').attr('brch-no');       //지점번호
	    sampleObj['play-schdl-no'] = $(this).closest('.greeting-infomation').attr('play-schdl-no'); //상영일정번호
	    sampleObj['rpst-movie-no'] = $(this).closest('.greeting-infomation').attr('rpst-movie-no'); //대표영화번호
	    sampleObj['theab-no']      = $(this).closest('.greeting-infomation').attr('theab-no');      //상영관번호
	    sampleObj['play-de']       = $(this).closest('.greeting-infomation').attr('play-de');       //상영일자
	    sampleObj['play-seq']      = $(this).closest('.greeting-infomation').attr('play-seq');      //상영회차
	    sampleObj['netfnl-adopt-at']      = $(this).closest('.greeting-infomation').attr('netfnl-adopt-at');      //넷퍼넬

	    fn_directSmapSeat(sampleObj);
	});
});

//로그인 페이지 이동
function fn_moveLoginPage() {
	fn_viewLoginPopup('default','pc');
}
</script>

<!-- inner-wrap -->
<div class="inner-wrap">


	<h3 class="tit">{[무대인사] 30일} 무대인사</h3>

	<div class="movie-greeting">
		<ul>
            
            
			
                
                <li>
					<p class="greeting-date">2023.10.14</p>
                

					<div class="greeting-infomation" brch-no="4062" play-schdl-no="2310144062003" rpst-movie-no="23069600" theab-no="01" play-de="20231014" play-seq="2" netfnl-adopt-at="Y">
						<p class="greeting-location">송도 1관</p>
						<p class="greeting-time">11:20~13:29</p>
						<p class="greeting-moment">상영후</p>
						<p class="greeting-person">정소민, 윤경호, 남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="4062" play-schdl-no="2310144062002" rpst-movie-no="23069600" theab-no="05" play-de="20231014" play-seq="2" netfnl-adopt-at="Y">
						<p class="greeting-location">송도 5관</p>
						<p class="greeting-time">13:00~14:59</p>
						<p class="greeting-moment">상영전</p>
						<p class="greeting-person">정소민, 윤경호, 남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="4062" play-schdl-no="2310144062001" rpst-movie-no="23069600" theab-no="03" play-de="20231014" play-seq="1" netfnl-adopt-at="Y">
						<p class="greeting-location">송도 3관</p>
						<p class="greeting-time">13:15~15:14</p>
						<p class="greeting-moment">상영전</p>
						<p class="greeting-person">정소민, 윤경호, 남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
				</li>
                
			
                
                <li>
					<p class="greeting-date">2023.10.15</p>
                

					<div class="greeting-infomation" brch-no="0052" play-schdl-no="2310150052004" rpst-movie-no="23069600" theab-no="02" play-de="20231015" play-seq="2" netfnl-adopt-at="Y">
						<p class="greeting-location">수원AK플라자(수원역) 컴포트 2관</p>
						<p class="greeting-time">11:55~14:04</p>
						<p class="greeting-moment">상영후</p>
						<p class="greeting-person">강하늘 배우,정소민 배우,남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="0052" play-schdl-no="2310150052005" rpst-movie-no="23069600" theab-no="03" play-de="20231015" play-seq="1" netfnl-adopt-at="Y">
						<p class="greeting-location">수원AK플라자(수원역) 수원여자대학교관(컴포트 3관)</p>
						<p class="greeting-time">12:05~14:14</p>
						<p class="greeting-moment">상영후</p>
						<p class="greeting-person">강하늘 배우,정소민 배우,남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="0052" play-schdl-no="2310150052006" rpst-movie-no="23069600" theab-no="05" play-de="20231015" play-seq="1" netfnl-adopt-at="Y">
						<p class="greeting-location">수원AK플라자(수원역) 컴포트 5관</p>
						<p class="greeting-time">14:25~16:24</p>
						<p class="greeting-moment">상영전</p>
						<p class="greeting-person">강하늘 배우,정소민 배우,남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="4431" play-schdl-no="2310154431001" rpst-movie-no="23069600" theab-no="02" play-de="20231015" play-seq="1" netfnl-adopt-at="Y">
						<p class="greeting-location">영통 2관</p>
						<p class="greeting-time">14:05~16:14</p>
						<p class="greeting-moment">상영후</p>
						<p class="greeting-person">강하늘, 정소민, 남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
			
                

					<div class="greeting-infomation" brch-no="4431" play-schdl-no="2310154431002" rpst-movie-no="23069600" theab-no="03" play-de="20231015" play-seq="1" netfnl-adopt-at="Y">
						<p class="greeting-location">영통 3관</p>
						<p class="greeting-time">16:25~18:24</p>
						<p class="greeting-moment">상영전</p>
						<p class="greeting-person">강하늘, 정소민, 남대중 감독</p>
						<!-- p class="btn">
							<a href="#" class="button purple">바로예매</a>
						</p-->

						
							
							
							
							
								<p class="btn"><a class="button purple">바로예매</a></p>
							
						
					</div>
                
                
                
				</li>
                
			
		</ul>
	</div>


</div>
<!--// inner-wrap -->

		


    </div>



</div>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>