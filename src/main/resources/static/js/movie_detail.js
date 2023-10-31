$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
	movieReviewList();
	var loginId = $("#loginId").val();
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
                    
                    <div class="story-txt">${review.movie_Review_content}</div>
                    <div class="story-like">
                        <button type="button" class="oneLikeBtn" title="댓글 추천" data-no="${review.movie_Review_num}" data-is="N">
                            <i class="iconset ico-like-gray"></i> <span>${review.movie_Review_like_cnt}</span>
                        </button>
                    </div>

                    <div class="story-util">
                        <div class="post-funtion">
                            <div class="wrap">
                                <button type="button" class="btn-alert">옵션보기</button>
                                <div class="balloon-space writer">
                                    <div class="balloon-cont">
                                        <div class="writer">
                                            <a href="#layer_regi_reply_review" title="수정" class="btn-modal-open updateOne" 
                                            	data-content="${review.movie_Review_content}" data-score="${review.movie_Review_star}" 
                                            	data-code="${review.movie_code}"  data-no="${review.movie_Review_num}"
                                            	owner="${review.member_Id}">
                                            	수정 <i class="iconset ico-arr-right-green"></i>
                                            </a>
											<button type="button" class="deleteOne" data-no="2475551" data-mno="01573800" data-cd="PREV" data-id="${review.member_Id}" data-num="${review.movie_Review_num}">
                                            	삭제 <i class="iconset ico-arr-right-green"></i>
                                            	
                                            </button>
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
	    $(".num em").text(0);
	    $("#textarea").val("");
	    $("#contentCount").text("0/ 100");
	    buttons.removeClass('on');
	    
	});//$(".btn-modal-close").click(function (e) {
$(".close-layer").click(function (e) {
		e.preventDefault();
		
		$("#layer_regi_reply_review").css("display", "none");
	    $(".num em").text(0);
	    $("#textarea").val("");	   
	    $("#contentCount").text("0/ 100");
	    buttons.removeClass('on');
	    
	});//$(".btn-modal-close").click(function (e) {


//관람평(댓글) 등록
$("body").on("click", "#regOneBtn", function(e){
		var movieCode = $("#movieCode").val();
		var memberId = $("#loginId").val();
		var reviewText = $("#textarea").val();
		var movieStar = $(".num em").text();
		console.log("등록-평점="+movieStar)
    if (!reviewText || reviewText.trim() === "") {
        // 만약 reviewText가 null이거나 빈 문자열이면 경고를 표시하고 AJAX 호출을 하지 않음
        alert("내용을 입력해주세요");
    }else {		
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
			    $(".num em").text(0);
			    $("#textarea").val("");	   
			    $("#contentCount").text("0/ 100");
			    buttons.removeClass('on');
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("댓글 등록 실패");
	        }
	        
	    });//$.ajax({
	    }//}else {	
});//$("body").on("click", "#btnPostRly", function(e){

// "로그인 바로가기" 링크를 클릭하면 #header-login-btn 버튼을 클릭합니다.
$('a[title="로그인 바로가기"]').on('click', function(e) {
    e.preventDefault(); // 기본 동작을 중지합니다 (페이지 이동 방지).
    
    $('#header-login-btn').click(); // #header-login-btn 버튼을 클릭합니다.
});

//댓글 수정, 삭제 popup 열기
$("body").on("click", ".post-funtion", function(e){
	var $balloonSpace = $(this).find(".balloon-space.writer");
    $balloonSpace.toggleClass("on");
});

//댓글 수정, 삭제 popup 닫기
$("body").on("click", "#popup_close", function(e){
	e.preventDefault();
	$(this).find(".balloon-space.writer").removeClass("on");
});

//댓글 수정 popup
$("body").on("click", ".updateOne", function(e){

    var ownerValue = $(this).attr('owner');
    console.log("loginId=" + loginId);
    console.log("ownerValue=" + ownerValue);
    //평점
    var score = $(this).attr('data-score');
    console.log("data-score=" + score);
    //콘텐츠
    var review_content = $(this).attr('data-content');
    console.log("data-content=" + review_content);
    //review_num
    var review_num = $(this).attr('data-no');
    console.log("data-no=" + review_num);
    
	if(loginId == ownerValue){
		$("#layer_regi_reply_review").css("display", "block");
		$(".num em").text(score);
		$("#textarea").val(review_content);
		buttonIndex = score;
		buttons.removeClass('on'); // 모든 버튼의 'on' 클래스 제거
	    buttons.slice(0, score).addClass('on'); // 해당 버튼과 이전 버튼들에 'on' 클래스 추가
	    $("#review_num").val(review_num);
		 $('#regOneBtn').prop('id', 'updateBtn').text('수정');
	} else{
		alert('나의 댓글만 수정 가능합니다.');
	}

});//$("body").on("click", ".updateOne", function(e){

//댓글 수정 action
$("body").on("click", "#updateBtn", function(e){
		var movieCode = $("#movieCode").val();
		var memberId = $("#loginId").val();
		var reviewText = $("#textarea").val();
		var movieStar = $(".num em").text();
		var review_num = $("#review_num").val();
	 console.log("수정 review_num=" + review_num);
	 console.log("수정 score=" + movieStar);
	 console.log("수정 review_content=" + reviewText);
	$.ajax({
			type: 'POST',
			url: "../movie/modifyReview",
			data: {
				"review_num":review_num,
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
	            console.log("댓글 수정 실패");
	        }
	        
	    });//$.ajax({
});//$("body").on("click", "#updateBtn", function(e){

//댓글 삭제 popup
$("body").on("click", ".deleteOne", function(e){

    var ownerValue = $(this).attr('data-id');
    console.log("삭제 loginId=" + loginId);
    console.log("삭제 ownerValue=" + ownerValue);

    //review_num
    var review_num = $(this).attr('data-num');
    console.log("data-no=" + review_num);
    
	if(loginId == ownerValue){
		$("#layerId_04504997593960893").css("display", "block");
		$("#review_num").val(review_num);
	} else{
		alert('나의 댓글만 삭제 가능합니다.');
	}
});//$("body").on("click", ".updateOne", function(e){

//댓글 삭제 action
$("body").on("click", "#deleteBtn", function(e){
	var review_num = $("#review_num").val();
	console.log("댓글 삭제 action review_num" + review_num);
	$.ajax({
			type: 'POST',
			url: "../movie/deleteReview",
			data: {
				"review_num":review_num
			},
			dataType: 'json',
			beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
	        },
	        success: function(response) {
	          console.log("댓글 삭제 성공")
				$("#layerId_04504997593960893").css("display", "none");
	           $("#layer_regi_reply_review").css("display", "none");
	           $(".movie-idv-story ul li:not(:first)").empty();
	            movieReviewList();
	            
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("댓글 삭제 실패");
	        }
	        
	    });//$.ajax({
});

//댓글 좋아요 추가
$("body").on("click", ".oneLikeBtn", function(e){
	var loginId = $("#loginId").val();
	var iconElement = $(this).find('i.iconset');
	var iconClass = iconElement.attr('class');
	var review_num = $(this).attr('data-no');
    var ajaxURL;
	console.log("댓글 pk=" + review_num);
	console.log("iconClass=" + iconClass);
	console.log("loginId=" + loginId);
	if(loginId === null){ 
		alert("로그인이 필요한 서비스입니다.");
	} else {
		if(iconClass == 'iconset ico-like-gray'){
		    iconElement.removeClass('ico-like-gray').addClass('ico-like-purple');
			ajaxURL = '../movie/addMovieReviewLike';
			console.log("ajax 로그인=" + ajaxURL);
		}
		$.ajax({
			type: 'POST',
			url: ajaxURL,
			data: {
				"review_num": review_num,
				"loginId":loginId
			},
			dataType: 'json',
			beforeSend: function(xhr) {
				// 데이터를 전송하기 전에 헤더에 csrf값을 설정
				xhr.setRequestHeader(header, token);
			},
			success: function(response) {
				console.log("좋아요 성공");
				$(".movie-idv-story ul li:not(:first)").empty();
				movieReviewList();
			},
			error: function() {
				// AJAX 요청 실패 시 처리
				console.log("좋아요 실패");
			}
		});
	}
});//$("body").on("click", ".oneLikeBtn", function(e){

//예매율 저장
var ratio = $('#movieRatio').text();
console.log("예매율 " + ratio)
$('#charByPoint').text(ratio);

});//$(document).ready(function(){