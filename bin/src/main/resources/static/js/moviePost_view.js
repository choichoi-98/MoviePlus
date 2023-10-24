$(document).ready(function(){
    
	// csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

    var loginId = $('#header-pinfo-memberId').val();
    
    var checkResult;

    var option = 'date';
    var keyword = '';
    var index = 12;
    var position_left = 0;
    var position_top = 0;
    var list_height = 1300;
    var height_plus;
    var last_index = 0;
    
    var comment_output;

    var deleteCommDisplayOption;

    getMoviePostList(option);


    //댓글 시작
 
    var comm_content = '';
    $('#postRlyCn').keyup(function(){   
        comm_content = $(this).val();

        $('#comm-length').text(comm_content.length);

    })

    $('#btnPostRly').click(function(e){
        e.preventDefault();
        if($('#header-pinfo-memberId').val() == null){
			return;
		}

        addComment($(this).attr('data-postnum'));
    });

    $('body').on('click', '.comment-delete-btn', function(e){
        e.preventDefault();

        if(confirm('정말 삭제하시겠습니까?')){
            deleteComment($(this).attr('data-commNum'), $(this).attr('data-postNum'));
        }
        
    })

    function resetComm(){
        $('#postRlyCn').val('');
        comm_content = '';
        $('#comm-length').text('0');
        $('#commentList').empty();  
    }
    

    function addComment(postNum){
        if(comm_content.trim().length == 0){
            return false;
        }

        $.ajax({
            type: "POST",
            url: "addMoviePostComment",
            data: {
                MEMBER_ID : loginId,
				MOVIEPOST_COMMENT_CONTENT : comm_content,
                MOVIEPOST_NUM : postNum             
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                getPostDetail(postNum);
                resetComm();    
            },
            error: function() {	
                
                console.log('댓글입력 ajax 실패');
            } 

            
        });
    }

    function deleteComment(comment_num, postNum){
        $.ajax({
            type: "POST",
            url: "deleteComment",
            data: {
                comment_num : comment_num
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                getPostDetail(postNum);
            },
            error: function() {	
                
                console.log('댓글삭제 ajax 실패');
            } 

            
        });
    }

    


    function getCommentList(postNum){
        $.ajax({
            type: "POST",
            url: "getCommentList",
            data: {
                postNum : postNum
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                resetComm();
                $(data).each(function(index, item) {
                    if(item.member_ID == loginId || loginId == 'admin'){
                        deleteCommDisplayOption = 'block';
                    }else {
                        deleteCommDisplayOption = 'none';
                    }
                    comment_output = '';
                    comment_output += `<div class="comment-box">
                                         <div class="user-photo">
                                            <img src="`+item.member_PROFILE+`" alt="">
                                         </div>
                                         <div class="user-comment">
                                         <p class="mb20">`+item.member_ID+`</p>
                                         <p class="text">`+item.moviepost_COMMENT_CONTENT+`</p>
                                            <div class="post-funtion rlyList">
                                                <span>`+item.moviepost_COMMENT_DATE+`</span>
                                                <button class="comment-delete-btn" type="button" data-postNum="`+item.moviepost_NUM+`" data-commNum="`+item.moviepost_COMMENT_NUM+`" style="display:`+deleteCommDisplayOption+`">삭제하기</button>
                                            </div>
                                        </div>
                                    </div>`;
                    $('#commentList').append(comment_output);
                })
            },
            error: function() {	
                console.log('댓글입력 ajax 실패');
            } 

            
        });
    }

    //댓글 끝


    $('#modal-delete-btn').click(function(e){
        e.preventDefault();

        if(confirm('정말 삭제하시겠습니까?')){
            deletePost($(this).attr('data-postNum'));
        }
        
    })

    $('#modal-like-btn').click(function() {
        if($('#header-pinfo-memberId').val() == null){
			return;
		}

        if($('#modal-like-icon').hasClass('on')){ // 이미 on일 경우
            deleteLike($('#modal-like-btn').attr('data-postnum'));
           
        }else {  // off일 경우
            addLike($('#modal-like-btn').attr('data-postnum'));

        }
    })


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
        resetComm();
    })

    $('.bg-modal2').click(function() {
        $('body').removeClass('no-scroll');
        $('#layer_post_detail').removeClass('on');
        resetComm();
    })

    $('.top5Btn').click(function() {
        reset();
        keyword = $(this).attr('data-movieTitle');
        getMoviePostList(option);
    })

    $('#moviepost-login').click(function() {
        $('#header-login-btn').trigger('click');
    })

    $('#add-moviepost-none-login').click(function(e){
        e.preventDefault();

        $('#login-alert-modal').css('display', 'block');
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
        
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
                                                href="#"
                                                style="pointer-events:none;"
                                                title="`+item.movie_Title+`">
                                                <p class="tit">`+item.movie_Title+`</p>
                                            </a> <a
                                                href="#"
                                                title="무비포스트 상세보기"
                                                class="link btn-modal-open2 post-detailPopup" 
                                                data-postNum="`+item.moviepost_Num+`" >
                                                <p class="txt">`+item.moviepost_Content+`</p>
                                                <p class="time">`+item.moviepost_Reg_date+`</p>
                                            </a>
                                            <div class="condition">               
                                                <button type="button" class="btn-like postLikeBtn listBtn jsMake" style="pointer-events:none;">
                                                <i data-postNum="`+item.moviepost_Num+`" class="iconset ico-like">좋아요 수</i> <span class="none">`+item.moviepost_Like+`</span></button>                
                                                <a href="#" title="댓글 작성하기" class="link btn-modal-open2 post-reply-detail" style="pointer-events:none;">
                                                <i class="iconset ico-reply">댓글 수</i> `+item.comment_Cnt+`</a>           
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

                checkListLike();
			

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
               $('#modal-movie-title').text(data.movie_Title);
               $('#modal-still').prop('src', data.moviepost_Still);
               $('#modal-profile').prop('src', data.member_PROFILE).prop('alt', data.member_Id+'님의 무비포스트')
               $('#modal-user-id').text(data.member_Id);
               $('#modal-date').text(data.moviepost_Reg_date);
               $('#modal-content').text(data.moviepost_Content);
               $('#modal-like-btn').attr('data-postNum', data.moviepost_Num);
               $('#modal-like-cnt').text(data.moviepost_Like);
               $('#rlyCnt').text('댓글 ('+data.comment_Cnt+')'); 
               $('#btnPostRly').attr('data-postNum', data.moviepost_Num);
               $('#modal-delete-btn').attr('data-postNum', data.moviepost_Num);

               if($('#hidden-member-id').val() == data.member_Id || $('#hidden-member-id').val() == 'admin'){
                    $('#modal-delete-btn').css('display', 'block');
                }else {
                    $('#modal-delete-btn').css('display', 'none');
                }

               if(checkLike(postNum)){
                $('#modal-like-icon').addClass('on');
               }else{
                $('#modal-like-icon').removeClass('on');
                }


                getCommentList(postNum);
               $('#layer_post_detail').addClass('on');

               
            },
            error: function() {	
                console.log('ㅍㅅㅌ ajax 실패');
            } 
        });
    }

    function checkLike(postNum){

        $.ajax({
            type: "POST",
            url: "checkLike",
            async: false,
            data: {
                MEMBER_ID : loginId,
				MOVIEPOST_NUM : postNum               
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
               if(data > 0){
                    checkResult = true;
                }else {
                    checkResult = false;
                }
            },
            error: function() {	
                console.log('좋아요 ajax 실패');
            } 

            
        });

        return checkResult;
        
    }

    function addLike(postNum){
        $.ajax({
            type: "POST",
            url: "addLikeAction",
            data: {
                MEMBER_ID : loginId,
				MOVIEPOST_NUM : postNum               
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if(data>0){

                    getPostDetail(postNum);
                }
            },
            error: function() {	
                console.log('좋아요 ajax 실패');
            } 

            
        });
    }

    function deleteLike(postNum){
        $.ajax({
            type: "POST",
            url: "deleteLikeAction",
            data: {
                MEMBER_ID : loginId,
				MOVIEPOST_NUM : postNum               
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if(data > 0) {
                    getPostDetail(postNum);
                }
            },
            error: function() {	
                console.log('좋아요 ajax 실패');
            } 

            
        });
    }

    function checkListLike(){
        $('.ico-like').each(function() {
            if($(this).prop('id')=='modal-like-icon'){
                return;
            }
            if(checkLike($(this).attr('data-postNum'))){
                $(this).addClass("on");
            }
        })
    }

    function deletePost(postNum){
        $.ajax({
            type: "POST",
            url: "deletePost",
            data: {
                postNum : postNum             
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if(data > 0){
                    location.href="all";
                }
            },
            error: function() {	
                console.log('좋아요 ajax 실패');
            } 

            
        });
    }


});