$(function() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $(document).on('click', '.main__table-btn--delete', function(e) {
        e.preventDefault(); // 기본 동작인 링크 이동을 막습니다.

        const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾습니다.
        const itemCode = row.find('.item-code').data('icode');  // 해당 행의 ITEM_CODE 값을 추출합니다.

        $.ajax({
            url: "itemlist",
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "itemCode": itemCode },
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {
                window.location.reload();
            },
            error: function(error) {
                window.location.reload();
            }
        });
    });
});

