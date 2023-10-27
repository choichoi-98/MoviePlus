$(function() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $(document).on('click', '.regibtn', function(e) {
        e.preventDefault(); // 기본 동작인 링크 이동을 막기

        const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const payNum = row.find('.regibtn').data('paynum'); // 해당 행의 PAY_NUM 값을 추출

        // alert('payNum:' + payNum);

        $.ajax({
            url: 'coupon',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {
                "payNum": payNum
            },
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                // alert("등록 성공, payNum: " + payNum);
                window.location.reload();
            },
            error: function(error) {
                // alert("등록 실패, payNum: " + payNum);
                window.location.reload();
            }
        });
    });
});
