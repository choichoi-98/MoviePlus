$(function() {
    $('#btn-kakaopay').click(function() {
        $.ajax({
            url: 'kakaopay',
            dataType: 'json',
            success: function(data) {
                var box = data.next_redirect_pc_url;
                window.open(box);
            },
            error: function(error) {
                alert(JSON.stringify(error, null, 2)); // 오류 객체를 JSON 문자열로 변환하여 출력
            }
        });
    });
});
