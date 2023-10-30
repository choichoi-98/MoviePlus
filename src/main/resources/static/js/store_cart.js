$(function() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $('#btn-kakaopay').click(function() {
        var totalPrice = $('#totPrdtAmtView').data('price');
        var cartItemNames = $('#totPrdtAmtView').data('name');
        var cartItemMenus = $('#totPrdtAmtView').data('menu');
		
        $.ajax({
            url: 'kakaopay',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "totalPrice": totalPrice,
            	    "cartItemNames": cartItemNames,
            	    "cartItemMenus": cartItemMenus},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                xhr.setRequestHeader("Accept-Charset", "UTF-8");
            },
            success: function(data) {
                var box = data.next_redirect_pc_url;
                window.open(box);
                window.close(this);
//              alert("상품: "+ cartItemNames + " 총 가격: " + totalPrice);
            },
            error: function(error) {
                alert(JSON.stringify(error, null, 2));
            }
        });
    });
    
    $(document).on('click', '.delbtn', function(e) {
    	e.preventDefault(); // 기본 동작인 링크 이동을 막기
    	
    	const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const itemCode = row.find('.delbtn').data('code');  // 해당 행의 ITEM_CODE 값을 추출
 //       alert('itemCode:' + itemCode);
        
        $.ajax({
            url: 'cart',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "itemCode": itemCode},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
//                alert("삭제 성공, itemCode: " + itemCode);
                window.location.reload();
            },
            error: function(error) {
//                alert("삭제 실패, itemCode: " + itemCode);
                window.location.reload();
            }
        });
    });
});