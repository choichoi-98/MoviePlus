$(document).ready(function () {

    $('.THEATER_SEAT_TYPE').click(function() {
        $('.display-seat').css("display", "none");
        let selected_seat = '#div-' + $(this).prop('id');
        
        $(selected_seat).css("display", "");
    })

});