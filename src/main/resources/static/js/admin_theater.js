$(document).ready(function () {
    let delete_id;

    
    $('.main__table-btn--delete').click(function() {
       delete_id = $(this).find('.delete-selected-id').val();
    });

    $('#delete-theater-modal-btn').click(function() {
        console.log('tt');
        location.href="deleteTheaterAction?num=" + delete_id;
    })
});