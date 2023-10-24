$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    var theaterId = $('#ajax-theaterId').val();

    var chkFavResult = false;


    getFavoriteTheaterList();

    $('.fav-modal-on').click(function(e){
        getLocationList();
        e.preventDefault();
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
        $('#favor_theater_setting').addClass('on');

        getFavoriteTheaterListModal();
        //ajax
    })

    $('.close-layer').click(function(e){
        $('.bg-modal').css('opacity', '0');
        $('body').removeClass('no-scroll');
        $('#favor_theater_setting').removeClass('on');
    })

    $('#fav-modalp').click(function(){
        updateFavoriteTheaterModal();
    })

    if(theaterId != null){
        checkFavoriteTheater();
    }
   
    $('#favorBrch').click(function(){
        if(chkFavResult){
            deleteFavoriteTheater();
        }else {
            getFavoriteTheaterCount();
        }
    })
    
    $('#non-login-favorBrch').click(function() {
        $('#login-alert-modal').css('display', 'block');
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
    })

    $('body').on('click', '.loc-item', function(){
        $('#modal-loc-selected').text($(this).attr('data-location'));
        getTheaterList($(this).attr('data-location'));
    })

    $('body').on('click', '.th-item', function(){
        $('#modal-th-selected').attr('data-theaterId', $(this).attr('data-theaterId')).text($(this).attr('data-theater'));
        
    })

    $('#modal-add-theater').click(function(e){
        if($('#modal-th-selected').attr('data-theaterId') == null){
            alert('추가할 극장을 선택해주세요.');
            return false;
        }
        var checkDup = false;
        var checkMax = false;

        $('.theater-choice-list > .bg').each(function(index, item){
            if($(this).find('.circle').attr('data-theaterId') == $('#modal-th-selected').attr('data-theaterId')){
                alert("이미 등록되어 있는 극장입니다.");

                checkDup = true;
            }
        });

        if(checkDup){
            return false;
        }

        if($('.theater-choice-list > .bg').not('.empty').length == 3){
            alert('선호하는 극장은 최대 3개까지만 등록할 수 있습니다.');

            checkMax = true;
        }

        if(checkMax){
            return false;
        }
   
        $('.theater-choice-list > .bg').each(function(index, item){
            if($(item).hasClass("empty")){
                var circle_output = `<div class="circle" data-theaterId="`+$('#modal-th-selected').attr('data-theaterId')+`">
                                        <p class="txt">`+ $('#modal-th-selected').text()+`</p>
                                        <button type="button" class="modal-theater-del del">삭제</button>
                                     </div>`;
            $(this).append(circle_output);
            $(this).removeClass("empty");
            return false;
            }
        })
    })

    $('body').on('click', '.modal-theater-del', function(){
        $(this).parent().parent().addClass("empty").empty();
    })
    
    
    $('.modal-dropdown').click(function(){
        if($(this).hasClass('open')){
            $(this).removeClass('open');
        }else{
            $(this).addClass('open');
        }
    })
    
    function updateFavoriteTheaterModal(){
        const theaterId = new Array();

        $('.bg > .circle').each(function(index, item){
            theaterId.push($(this).attr('data-theaterId'));
        });

        $.ajax({
            type: "POST",
            url: "/movieplus/theater/updateFavoriteTheaterWithModal",
            cache: false,
            traditional : true,
            data : {
                theaterId : theaterId
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                location.reload();
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    
    }

    function getFavoriteTheaterList() {
        $.ajax({
            type: "POST",
            url: "/movieplus/theater/getFavoriteTheaterList",
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

    function getFavoriteTheaterListModal() {
        $.ajax({
            type: "POST",
            url: "/movieplus/theater/getFavoriteTheaterList",
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                $('.theater-choice-list > .bg').addClass('empty').empty();
                $(data).each(function(index, item) {
                    var circle_output = `<div class="circle" data-theaterId="`+item.theater_ID+`">
                                        <p class="txt">`+item.theater_NAME+`</p>
                                        <button type="button" class="modal-theater-del del">삭제</button></div>`;

                    $('.theater-choice-list > .empty').eq(0).append(circle_output).removeClass('empty');
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
                if(data > 0){
                    checkFavoriteTheater();
                }               
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }
    

    function getLocationList(){
        $.ajax({
            type: "POST",
            url: "/movieplus/theater/getLocationList",
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                var loc_output = '';
                $('#modal-location-list').empty();

                $(data).each(function(index, item){
                    loc_output += '<li class="selected"><a class="loc-item selected" data-location="'+item+'"><span class="text">'+item+'</span></a></li>';
                })  
                $('#modal-location-list').append(loc_output);  
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }

    function getTheaterList(location){
        $.ajax({
            type: "POST",
            url: "/movieplus/theater/getTheaterListByLocation",
            cache: false,
            data : {
                location : location
            },
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                var th_output = '';
                $('#modal-theater-list').empty();

                $(data).each(function(index, item){
                    th_output += '<li><a class="th-item" data-theater="'+item.theater_NAME+'" data-theaterId="'+item.theater_ID+'"><span class="text">'+item.theater_NAME+'</span></a></li>';
                })  
                $('#modal-theater-list').append(th_output);  
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }

    function getFavoriteTheaterCount(){
        $.ajax({
            type: "POST",
            url: "/movieplus/theater/getFavoriteCount",
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            async: false,
            success: function (data) {
                console.log(data);
                if(data >= 3){
                    alert('선호하는 극장은 최대 3개까지만 등록할 수 있습니다.');
                }else {
                    addFavoriteTheater();
                }
            },
            error: function() {
                console.log('ajax 실패');
            } 
        });
    }


});