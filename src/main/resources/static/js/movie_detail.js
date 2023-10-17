$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
	movieReviewList();
	
//보고싶어요 추가 및 삭제
	$("body").on("click", ".btn-like", function(e){
		e.preventDefault();
		
		var imgsrc = $(this).find('.dibs_img').attr('src');
		var movieCode = $(this).attr('data-movie-code');
		
		
		console.log("imgsrc = " + imgsrc);
		console.log("movieCode = " + movieCode);
		
		var ajaxURL;
		
		if(imgsrc.includes('heart_full.png')){
			ajaxURL = '../movie/deleteMovieDibs';		
		} else {
			ajaxURL = '../movie/addMovieDibs';		
		}
		
		$.ajax({
			type: 'POST',
			url: ajaxURL,
			data: {
				//movie_code값 넘겨주기
				"movieCode":movieCode
			},
			dataType: 'json',
			beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
	        },
	        success: function(response) {
	            // AJAX 요청 성공 시 처리
	            var responseAlert = response.alert;
	            if(responseAlert){
	            	alert("로그인이 필요한 서비스입니다.");
	            } else{
	            	console.log("보고싶어요 기능 성공");
	            }
	            console.log("AJAX 요청 성공");
	            
	            location.reload();
	            
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("AJAX 요청 실패");
	        }
	        
	    });//$.ajax({
	
	});//$("body").on("click", ".btn-like", function(e){

//관람평(댓글) 화면 표시
function movieReviewList() {
console.log("movieReviewList 메서드입니다.");
  $.ajax({
    type: "post",
    url: "../movie/getMovieReview",
    data: {
      "movieCode": $("#movieCode").val()
    },
    beforeSend: function (xhr) {
      // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
      xhr.setRequestHeader(header, token);
    },
    success: function (movieReview) { // 변수 이름 수정
      var reviewCount = movieReview.length;
      console.log("수:" + reviewCount);
      
      
      if (reviewCount > 0) {
        var reviewList = $(".movie-idv-story.oneContent ul");
        console.log("revieList"+reviewList);
        movieReview.forEach(function (review) {
          var listItem = `
<li class="type01 oneContentTag">
    <div class="story-area">
        <div class="user-prof">
            <div class="prof-img">
                <img src="${review.MEMBER_PROFILE}" alt="프로필 사진" title="프로필 사진" onerror="noImg(this, 'human')">
            </div>
            <p class="user-id">${review.member_Id}</p>
        </div>
        <div class="story-box">
            <div class="story-wrap review">
                <div class="tit">관람평</div>
                <div class="story-cont">
                    <div class="story-point">
                        <span>${review.movie_Review_star}</span>
                    </div>
                    <div class="story-recommend">
                        <em>배우</em>
                    </div>
                    <div class="story-txt">${review.movie_Review_content}</div>
                    <div class="story-like">
                        <button type="button" class="oneLikeBtn" title="댓글 추천" data-no="2470459" data-is="N">
                            <i class="iconset ico-like-gray"></i> <span>0</span>
                        </button>
                    </div>
                    <div class="story-util">
                        <div class="post-funtion">
                            <div class="wrap">
                                <button type="button" class="btn-alert">옵션보기</button>
                                <div class="balloon-space writer">
                                    <div class="balloon-cont">
                                        <div class="writer">
                                            <a href="#layer_regi_reply_review" title="수정" class="btn-modal-open updateOne" w-data="500" h-data="680" data-score="10" data-no="2475551" data-cn="chlrhldml dudghk cncjsgkqslek.">수정 <i class="iconset ico-arr-right-green"></i></a>
                                            <button type="button" class="deleteOne" data-no="2475551" data-mno="01573800" data-cd="PREV">삭제 <i class="iconset ico-arr-right-green"></i></button>
                                        </div>
                                        <div class="btn-close" id="popup_close">
                                            <a href=" " title="닫기">
                                            <img src="${contextPath}/resources/image/movie/btn-balloon-close.png" alt="닫기">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="story-date">
        <div class="review on">
            <span>${review.movie_Review_reg_date}</span>
        </div>
    </div>
</li>

          `;
          

          // 각 동적으로 생성된 목록 아이템을 "reviewList" ID를 가진 요소에 추가합니다.
          reviewList.append(listItem);
        });
      }
    }
  }); // ajax 종료
} // function movieReviewList


//글자수 100개 제한 이벤트
    var textarea = $('#textarea');
    var count = $('#contentCount');
    var maxLength = 100; // 최대 글자 수

    textarea.on('input', function() {
        var text = textarea.val();
        var currentLength = text.length;

        if (currentLength > maxLength) {
            textarea.val(text.substring(0, maxLength)); // 글자 수 제한
            currentLength = maxLength;
        }

        count.text(currentLength + ' / ' + maxLength);
    });
   


//관람평 점수 hover이벤트
 var buttons = $(".box-star-score .star .group button");
	  var numEm = $(".box-star-score .num em");
	  var score = 0;
	  var clicked = false;

	  buttons.on('click', function() {
	    var buttonIndex = buttons.index(this);
	    buttons.removeClass('on'); // 모든 버튼의 'on' 클래스 제거
	    buttons.slice(0, buttonIndex + 1).addClass('on'); // 해당 버튼과 이전 버튼들에 'on' 클래스 추가
	    numEm.text(buttonIndex + 1); // em 엘리먼트에 버튼의 숫자 설정
	    score = buttonIndex + 1;
	    clicked = true; // 클릭 이벤트 발생 시 clicked 값을 true로 설정
	  });

	  buttons.hover(
	    function() {
	      if (!clicked) { // 클릭 이벤트로 값이 고정되지 않은 경우에만 호버 이벤트 적용
	        var buttonIndex = buttons.index(this);
	        buttons.slice(0, buttonIndex + 1).addClass('on'); // 해당 버튼과 이전 버튼들에 'on' 클래스 추가
	        numEm.text(buttonIndex + 1); // em 엘리먼트에 버튼의 숫자 설정
	      }
	    },
	    function() {
	      if (!clicked) { // 클릭 이벤트로 값이 고정되지 않은 경우에만 호버 이벤트 적용
	        buttons.removeClass('on'); // 마우스가 벗어나면 모든 버튼의 'on' 클래스 제거
	        numEm.text(score); // em 엘리먼트를 클릭한 버튼의 숫자로 설정
	      }
	    }
	  );

//관람평 팝업 닫기
$(".btn-modal-close").click(function (e) {
		e.preventDefault();
		
		$("#layer_regi_reply_review").css("display", "none");
	   
	});//$(".btn-modal-close").click(function (e) {
$(".close-layer").click(function (e) {
		e.preventDefault();
		
		$("#layer_regi_reply_review").css("display", "none");
	   
	   
	});//$(".btn-modal-close").click(function (e) {


//관람평(댓글) 등록
$("body").on("click", "#regOneBtn", function(e){
		var movieCode = $("#movieCode").val();
		var memberId = $("#loginId").val();
		var reviewText = $("#textarea").val();
		var movieStar = $(".num em").text();
		
		$.ajax({
			type: 'POST',
			url: "../movie/addMovieReview",
			data: {
				"movieCode":movieCode,
				"memberId":memberId,
				"reviewText":reviewText,
				"movieStar":movieStar
			},
			dataType: 'json',
			beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
	        },
	        success: function(response) {
	          console.log("댓글 등록 성공")
	           $("#layer_regi_reply_review").css("display", "none");
	           $(".movie-idv-story ul li:not(:first)").empty();
	            movieReviewList();
	            
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("댓글 등록 실패");
	        }
	        
	    });//$.ajax({
});//$("body").on("click", "#btnPostRly", function(e){


//댓글 수정, 삭제 popup 열기
$("body").on("click", ".post-funtion", function(e){
	console.log("댓글 수정,삭제 popup open")
	var $balloonSpace = $(this).find(".balloon-space.writer");
    $balloonSpace.toggleClass("on");
});

//댓글 수정, 삭제 popup 닫기
$("body").on("click", "#popup_close", function(e){
	e.preventDefault();
	console.log("댓글 수정,삭제 popup close")
	$(this).find(".balloon-space.writer").removeClass("on");
});
});//$(document).ready(function(){