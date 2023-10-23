$(document).ready(function(){

    var alp = ["A", "B", "C", "D", "E", "D", "F", "G", "H", "J", "K", "L", "M"];
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
        $('.seat').attr('class', 'seat hide')
        seat_data='';
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

    $('#create-btn').click(function(){
        var seat_x = $('#seat-x').val();
        var seat_y = $('#seat-y').val();

        createTable(seat_x, seat_y);
        
    })

    function createTable(x, y){
        $('.seat-column').each(function(index, item){

            console.log(index);
            if(index==y){
                return false;
            }

            for(var i=0;i<x;i++){
                $(this).find('.seat').eq(i).removeClass('hide');
            }   
        })

        seat_data = alp[y-1]+x;
        $('#seat-value').val(seat_data);
        
    }


}); 