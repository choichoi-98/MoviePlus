$(document).ready(function () {

// 극장 리스트 시작
    let delete_id;
    let status_change_id;
    let selected_theater_status;
    
    $('.main__table-btn--edit').click(function() {
        var modify_id = $(this).parent().find('.selected-theater-id').val();
        location.href="modifytheater?num=" + modify_id;
    })

    $('.main__table-btn--banned').click(function() {
        status_change_id = $(this).parent().find('.selected-theater-id').val();
        selected_theater_status = $(this).find('.selected-theater-status').val();
    })

    $('#change-status-modal-btn').click(function() {
        location.href="changeStatusTheaterAction?num=" + status_change_id + "&status=" + selected_theater_status;
    })

    $('.main__table-btn--delete').click(function() {
       delete_id = $(this).parent().find('.selected-theater-id').val();
    });

    $('#delete-theater-modal-btn').click(function() {
        location.href="deleteTheaterAction?num=" + delete_id;
    })

    $('.move-to-manager-menu').click(function() {
        var manager_id = $(this).parent().find('.selected-theater-manager-id').val();
        location.href="/movieplus/manager?selectedId=" + manager_id;
    })

    $('.filter-option').click(function(){
    
    })



    
// 극장 리스트 끝





});