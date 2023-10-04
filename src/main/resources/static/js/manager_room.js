$(document).ready(function () {

    let delete_id;
    let status_change_id;
    let selected_theater_status;
    var checkedRadioButton = $("input[name='THEATER_ROOM_SEAT_TYPE']:checked");
    var selected_seat = '#div-' + checkedRadioButton.prop('id');
    
    $(selected_seat).css("display", "");

    // 상영관 추가
    $('.THEATER_SEAT_TYPE').click(function() {
        $('.display-seat').css("display", "none");
        selected_seat = '#div-' + $(this).prop('id');
        
        $(selected_seat).css("display", "");
    })
    // 상영관 추가

    // 상영관 관리
    $('.main__table-btn--banned').click(function() {
        status_change_id = $(this).parent().find('.selected-theater-id').val();
        selected_theater_status = $(this).find('.selected-theater-status').val();
    })

    $('.main__table-btn--delete').click(function() {
        delete_id = $(this).parent().find('.selected-theater-id').val();
     });

    $('#change-status-modal-btn').click(function() {
        location.href="changeStatusRoomAction?num=" + status_change_id + "&status=" + selected_theater_status;
    })

    $('#delete-room-modal-btn').click(function() {
        location.href="deleteRoomAction?room_id=" + delete_id;
    })

    $('.main__table-btn--edit').click(function() {
        var modify_id = $(this).parent().find('.selected-theater-id').val();
        location.href="modifyRoom?room_id=" + modify_id;
    })

    // 상영관 관리
});