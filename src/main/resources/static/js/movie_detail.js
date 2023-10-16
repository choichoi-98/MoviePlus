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
                        <button type="button" class="oneLikeBtn" title="댓글 추천"
                          data-no="2470459" data-is="N">
                          <i class="iconset ico-like-gray"></i> <span>0</span>
                        </button>
                      </div>
                      <!-- 나머지 HTML 구조 -->
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
   $("#content").on('input',function(){
      let content = $(this).val();
      let length = content.length;
      if(length > 100){
         length=100;
         content = content.substring(0,length);
         $(this).val(content);
      }
      $(".float-left").text(length+"/50");
   });//comtent input end
   
   $("#message").click(function(){
      getList(++page);
   });

//관람평(댓글) 등록
$("#popupLink").on('click',function(){
	
  });
});//$(document).ready(function(){