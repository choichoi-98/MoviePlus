$(function() {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).on('click', '.delbtn', function(e) {
    	e.preventDefault(); // 기본 동작인 링크 이동을 막기
    	
    	const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const KpayNum = row.find('.delbtn').data('kpaynum');  // 해당 행의 ITEM_CODE 값을 추출
//        alert('KpayNum:' + KpayNum);
        
        $.ajax({
            url: 'success',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "KpayNum": KpayNum},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
//                alert("삭제 성공, KpayNum: " + KpayNum);
                window.location.reload();
            },
            error: function(error) {
//                alert("삭제 실패, KpayNum: " + KpayNum);
                window.location.reload();
            }
        });
    });
}); 