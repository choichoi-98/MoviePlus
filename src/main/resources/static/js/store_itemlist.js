$(function() {
		var itemlistcount = ${itemlistcount};
		if(itemlistcount == 10) {
			var per1page = 10;
		} else {
			var per1page = itemlistcount % 10;
		}
	    // per1page 값을 <span> 요소 내에 동적으로 삽입
	    document.querySelector('div#per1page').textContent = per1page;
	})
	
$(function() {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).on('click', '.main__table-btn--delete', function(e) {
        e.preventDefault(); // 기본 동작인 링크 이동을 막습니다.
        
        const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾습니다.
        const itemCode = row.find('.item-code').data('icode');  // 해당 행의 ITEM_CODE 값을 추출합니다.
        
//      alert("itemCode: " + itemCode);
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
//				alert("삭제 성공, itemCode: " + itemCode);
                window.location.reload();
            },
            error: function(error) {
 // 				alert("삭제 하는중 오류, itemCode: " + itemCode);
                window.location.reload();
            }
        });
    });
});
	
/*  	$(function() {
	    // 페이지 번호 클릭 이벤트 처리
	    document.querySelectorAll('.paginator__item a').forEach(function(pageLink) {
	        pageLink.addEventListener('click', function(event) {
	            // event.preventDefault(); // 주석 처리: 클릭 시 주소가 변경되도록 하려면 주석 처리

	            // 현재 활성화된 페이지 번호에서 paginator__item--active 클래스 제거
	            document.querySelector('.paginator__item.paginator__item--active').classList.remove('paginator__item--active');

	            // 클릭한 페이지 번호에 paginator__item--active 클래스 추가
	            this.parentNode.classList.add('paginator__item--active');
	        });
	    });
	});  */