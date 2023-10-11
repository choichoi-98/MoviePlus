$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    var theaterId = $('#ajax-theaterId').val();

    var chkFavResult = false;
    
    getFavoriteTheaterList();

    if(theaterId != null){
        checkFavoriteTheater();
    }
    
   
    $('#favorBrch').click(function(){
        if(chkFavResult){
            deleteFavoriteTheater();
        }else {
            addFavoriteTheater();
        }
    })
    
    $('#non-login-favorBrch').click(function() {
        $('#login-alert-modal').css('display', 'block');
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
    })
    
    function getFavoriteTheaterList() {
        $.ajax({
            type: "POST",
            url: "getFavoriteTheaterList",
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                $(data).each(function(index, item) {
                    var output = '<li><a href="detail?theaterId='+item.theater_ID+'" title="'+item.theater_NAME +'상세보기">'+item.theater_NAME+'</a><input type="hidden" id="hidden</li>';
                    $('#fav-theater-list').append(output);
                })
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    
    }

    function checkFavoriteTheater(){
        $.ajax({
            type: "POST",
            url: "checkFavoriteTheater",
            data: {
                theaterId : theaterId
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if(data > 0){
                    $('#favorBrch').addClass('on');
                    chkFavResult = true;
                }else{
                    $('#favorBrch').removeClass('on');
                    chkFavResult = false;
                }
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    
    }

    function addFavoriteTheater(){
        $.ajax({
            type: "POST",
            url: "addFavoriteTheater",
            data: {
                theaterId : theaterId
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                console.log(data);
                if(data > 0){
                    checkFavoriteTheater();
                }
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }

    function deleteFavoriteTheater(){
        $.ajax({
            type: "POST",
            url: "deleteFavoriteTheater",
            data: {
                theaterId : theaterId
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                console.log(data);
                if(data > 0){
                    checkFavoriteTheater();
                }               
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }
    
});