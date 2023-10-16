$(document).ready(function(){


    var search_btn_chk = true;
    var layer_sitemap_chk = true;
    var my_megabox_chk = true;
    var $layer_header_search =  $('#layer_header_search');
    var $layer_sitemap = $('#layer_sitemap');
    var $layer_mymega = $('#layer_mymega2');

    function resetHeader() {
        $layer_header_search.removeClass('target on');
        $layer_sitemap.removeClass('target on');
        $layer_mymega.removeClass('target on');
        $('#header-search-btn').removeClass('target on');
        $('#header-sitemap-btn').removeClass('target on');
        $('#header-my-megabox-btn').removeClass('target on');
    }
 
	
    function openLoginModal() {
        $('#layer_login_select').addClass('on');
        $('.bg-modal').css('opacity', '1');
        $('body').addClass('no-scroll');
        $('#LoginId').val('');
        $('#LoginPass').val('');
    }

    $('#header-search-btn').click(function() {
        layer_sitemap_chk = true;
        my_megabox_chk = true;
        resetHeader();

        if(search_btn_chk) {
            $(this).addClass('target on');
            $layer_header_search.addClass('target on');
        }else{
            $(this).removeClass('target on');
            $layer_header_search.removeClass('target on');
        }
        search_btn_chk = !search_btn_chk;
    });

    $('#header-sitemap-btn').click(function() {
        search_btn_chk = true;
        my_megabox_chk = true;
        resetHeader();

        if(layer_sitemap_chk) {
            $(this).addClass('target on');
            $layer_sitemap.addClass('on');
        }else{
            $(this).removeClass('target on');
            $layer_sitemap.removeClass('on');
        }

        layer_sitemap_chk = !layer_sitemap_chk;
    });

    $('#header-my-megabox-btn').click(function() {
        search_btn_chk = true;
        layer_sitemap_chk = true;
        resetHeader();

        if(my_megabox_chk) {
            $(this).addClass('target on');
            $layer_mymega.addClass('on');
        }else {
            $(this).removeClass('target on');
            $layer_mymega.removeClass('on');    
        }

        my_megabox_chk = !my_megabox_chk;
    })

    $('#header-login-btn').click(function() {
        openLoginModal();
    })
    
    $('#movelogin').click(function() {
        openLoginModal();
    })

    
    $('.btn-modal-close').click(function() {
        $('.modal-layer').removeClass('on');
        $('.bg-modal').css('opacity', '0');
        $('body').removeClass('no-scroll');
    })


    $('.gnb-depth1 > li').hover(function() {
        $('.gnb-depth1 > li').removeClass('on');
        $(this).addClass('on');
        $('#gnb').addClass('on');
    })
    

    $('#gnb').mouseleave(function () { 
        $('.gnb-depth1 > li').removeClass('on');
        $('#gnb').removeClass('on');
    });
    
	
    function login_alert_modal_close(){
        $('.bg-modal').css('opacity', '0');
        $('.alert-popup').css('display', 'none');
        $('body').removeClass('no-scroll');
    }

    $('.btn-layer-close').click(function() {
        login_alert_modal_close();
    })

    $('.lyclose').click(function(){
        login_alert_modal_close();
    })

    $('#login-alert-modal-ok').click(function() {
        login_alert_modal_close();
        openLoginModal();
    })

	$('.btn-modal-open').click(function(){
		openLoginModal();	
	})
	
	$('#logout').click(function(event){
		event.preventDefault();
		$("form[name=logout]").submit();
	})
	
	function openAlertPopup(){
		$('#loginfailalert').css('opacity', '1');
		//$('#loginfailalert').css('display', 'block');
		$('.alertStyle').css('display', 'block');
        $('body').addClass('no-scroll');
	}
	
	function closeAlertPopup(){
        $('#loginfailalert').css('opacity', '1');
        $('#loginfailalert').css('display', 'none');
        $('.alertStyle').css('display', 'none');
        $('.alertStyle').css('opacity', '0');
        $('body').removeClass('no-scroll');
    }
    
    
    $("#loginfailok").click(function(){
		closeAlertPopup();
	})
	
	
	
	
	
});