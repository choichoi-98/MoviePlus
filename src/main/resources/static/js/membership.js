$(document).ready(function(){
    pointLane();
    

    $('#membership-login').click(function(){
        $('#header-login-btn').trigger('click');
    })		

   
    function pointLane(){
        var point = Number($('#membershipPoint').val());
        var $pointFlag;
        
        
        if(point>=6000){
            $pointFlag = $('#pointFlag-list > li').eq(1);
            $pointFlag.addClass('on');
        }
        if(point>=12000){
            $pointFlag = $('#pointFlag-list > li').eq(2);
            $pointFlag.addClass('on');
        }
        
        if(point>=18000){
            $pointFlag = $('#pointFlag-list > li').eq(3);
            $pointFlag.addClass('on');
        }
        
        if(point>=24000){
            $pointFlag = $('#pointFlag-list > li').eq(4);
            $pointFlag.addClass('on');
        }
        
        
        
        
    }
});