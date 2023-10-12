$(function() {
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
    $('#btn-kakaopay').click(function() {
        $.ajax({
            url: 'kakaopay',
            method: 'POST',
            dataType: 'json',
            beforeSend: function(xhr) {
		        xhr.setRequestHeader(header, token);
		    },
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
