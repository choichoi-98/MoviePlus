$(document).ready(function(){
    
	// csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    

    var option = 'date';
    var keyword = '';
    var index = 12;
    var position_left = 0;
    var position_top = 0;
    var list_height = 1300;
    var height_plus;
    var last_index = 0;

    getMoviePostList(option);

    $('#btnAddMovie').click(function(){
        position_left = 0;
        position_top = 0;
        

        getMoviePostList(option);

        list_height += height_plus;
        $('#moviePostList').css('height', list_height);

       
    })

    $('#sort-date-btn').click(function(){
        reset();

        option = 'date';
        $(this).addClass('on').parent().next().find('.btn').removeClass('on');
        getMoviePostList(option);
    })

    $('#sort-like-btn').click(function(){
        reset();

        option = 'like';
        $(this).addClass('on').parent().prev().find('.btn').removeClass('on');
        getMoviePostList(option);
    })

    $('#btnSearch').click(function(){
        reset();
        keyword = $('#ibxMovieNmSearch').val();
        getMoviePostList(option);
    })

    $('body').on('click', '.post-detailPopup', function(e) {
        e.preventDefault();
        getPostDetail($(this).attr('data-postNum'));

        $('body').addClass('no-scroll');
        $('#layer_post_detail').addClass('on');
        
        
    })

    $('#post-modal-close').click(function() {
        $('body').removeClass('no-scroll');
        $('#layer_post_detail').removeClass('on');
    })

    $('.bg-modal2').click(function() {
        $('body').removeClass('no-scroll');
        $('#layer_post_detail').removeClass('on');
    })

    function reset(){
        
        index = 12;
        position_left = 0;
        position_top = 0;
        list_height = 1300;
        height_plus = 0;
        last_index = 0;

        $('#moviePostList').css('height', list_height);
        $('#btnAddMovie').css('display', 'block');
    }
    
    function getMoviePostList(option){
		$.ajax({
            type: "POST",
            url: "getMoviePostListAjax",
            data: {
				option : option,
				keyword : keyword,
                index : index
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                $('#moviePostList').empty();

                if(data.length==0){
                    $('#moviePostList').append('<div class="no-moviepost">등록된 무비포스트가 없습니다.</div>');
                    return false;
                }
                if(data.length <= 12){
                    $('#btnAddMovie').css('display', 'none');
                }

                if(data.length/12 == 0){
                    height_plus = 1300
                }
                if(data.length/12 <= 8){
                    height_plus = 866.6
                }
                if(data.length/12 <= 4){
                    height_plus = 433.3
                }
                if(last_index == data.length){ // 늘어난 값이 없는 경우
                    $('#btnAddMovie').css('display', 'none');
                    height_plus = 0;
                }

                
                
                


                $(data).each(function(card_index, item){
                    var output = `<div class="grid-item" style="position: absolute; left: `+position_left+`px; top: `+position_top+`px;">
                                    <div class="wrap">
                                        <div class="img">
                                            <a
                                                href=#"
                                                title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
                                                data-postNum="`+item.moviepost_Num+`"><img
                                                src="`+item.moviepost_Still+`"
                                                alt="`+item.movie_Title+`"></a>
                                        </div>
                                        <div class="cont">
                                            <div class="writer">
                                                `+item.member_Id+`
                                            </div>
                                            <a
                                                href="/movieplus/movie/movieDetail?movieCode=`+item.movie_Code+`"
                                                title="`+item.movie_Title+`">
                                                <p class="tit">`+item.movie_Title+`</p>
                                            </a> <a
                                                href="#"
                                                title="무비포스트 상세보기"
                                                class="link btn-modal-open2 post-detailPopup" 
                                                data-postNum="" >
                                                <p class="txt">`+item.moviepost_Content+`</p>
                                                <p class="time">`+item.moviepost_Reg_date+`</p>
                                            </a>
                                            <div class="condition">
                                                <button type="button"
                                                    class="btn-like postLikeBtn listBtn jsMake" data-postNum="236655">
                                                    <i class="iconset ico-like">좋아요 수</i> <span class="none">`+item.moviepost_Like+`</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>`;


                    $('#moviePostList').append(output);

                    position_left += 290;

                    if((card_index+1) % 4 == 0 && card_index != 0){
                        position_top += 450;
                        position_left = 0;
                    }
                })
			

                index += 12;
				last_index = data.length;
            },
            error: function() {	
                console.log('ㅍㅅㅌ ajax 실패');
            } 
        });
	}

        
    function getPostDetail(postNum){
        $.ajax({
            type: "POST",
            url: "getPostDetail",
            data: {
				postNum : postNum               
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
               console.log(data);
               $('#modal-movie-title').text(data.movie_Title);
               $('#modal-still').prop('src', data.moviepost_Still);
               $('#modal-profile').prop('src', data.member_PROFILE).prop('alt', data.member_Id+'님의 무비포스트')
               $('#modal-user-id').text(data.member_Id);
               $('#modal-date').text(data.moviepost_Reg_date);
               $('#modal-stillcut').prop('src', data.moviepost);
               $('#modal-content').text(data.moviepost_Content);
               $('#modal-like-btn').attr('data-postNum', data.moviepost_Num);

               $('#layer_post_detail').addClass('on');
            },
            error: function() {	
                console.log('ㅍㅅㅌ ajax 실패');
            } 
        });
    }

});