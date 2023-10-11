$(document).ready(function(){

    $('#favorBrch').click(function(){
        if($(this).hasClass('on')){
            $(this).removeClass('on');
            return;
        }
        $(this).addClass('on');

        $('#login-alert-modal').css('display', 'block');
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
    })
    
    $('#non-login-favorBrch').click(function() {
        openLoginModal();
    })

    
});