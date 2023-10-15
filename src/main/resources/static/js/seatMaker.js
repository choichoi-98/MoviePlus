$(document).ready(function(){

    let seat_data='';

    $('.seat').click(function(e){
        e.preventDefault();

        if($(this).prop('class') == 'seat'){
            $(this).addClass('selected');
        }else{
            $(this).removeClass('selected');
        }
        
    })

    $('#reset-seat').click(function() {
        $('.seat').removeClass('selected').removeClass('deleted');
    })

    $('#delete-seat').click(function() {
        $('.selected').addClass("deleted");

        getSeatData();
    })

    function getSeatData(){
        $('.deleted').each(function(index, item) {
            var column = $(item).parent().parent().find('td').eq(0).text();
            var seat_num =  $(item).text();    
            seat_data += column+seat_num;

            $('#seat-value').val(seat_data);
        })
    }


}); 