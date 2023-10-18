$(document).ready(function(){

    var selectCnt = 0;
    var selectedMovieCode = "";

    $('#movieList > li').click(function(e){
        e.preventDefault();

        if(selectCnt >= 1){
            if($(this).find('a').hasClass('on')){
                $(this).find('a').removeClass("on");
                selectCnt--;
                selectedMovieCode = "";
            }else {
                return false;
            }
            
            
        }else{
            $(this).find('a').addClass("on");
            selectCnt++;
            selectedMovieCode = $(this).find('a').attr('data-moviecode');   
        }
    })

    $('#selectMovieBtn').click(function(e){
        e.preventDefault();

        if(selectedMovieCode != ""){
            location.href="write?movieCode=" + selectedMovieCode;
        }else{
            alert("영화를 선택해주세요.")
        }
        
    })

    $('.stillBtn').click(function(){
        $('#form-stillcut').prop('src', $(this).find('img').prop('src'));
    });
    

    $('#moviePostInsert').click(function(e){
        e.preventDefault();

        var stillcut = $('#form-stillcut').prop('src');
        var movieCode = $('#hidden-movieCode').val();
        var content = $('#post_content').val();

        location.href = "writeAction?moviepost_Content=" + content + "&moviepost_Still=" + stillcut + "&moviepost_Code=" + movieCode;
    })
});