$(function() {
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	// 수량 값을 저장하는 변수
    var quantity = 1;
    var quantityInput = $('#quantity');

    // "수량증가" 버튼을 클릭할 때
    $('.btn.plus').on('click', function() {
        // 수량을 1 증가시키고 입력 요소에 반영
        quantity++;
        quantityInput.val(quantity);
        updateTotalPrice();
    });

    // "수량감소" 버튼을 클릭할 때
    $('.btn.minus').on('click', function() {
        if (quantity > 1) {
            // 수량을 1 감소시키고 입력 요소에 반영
            quantity--;
            quantityInput.val(quantity);
            updateTotalPrice();
        }
    });
    
    function updateTotalPrice() {
        var itemPrice = parseFloat($('#prdtSumAmt').data('price'));
        var totalPrice = quantity * itemPrice;
        $('#prdtSumAmt').text(totalPrice);
    }
	
	$(document).on('click', '#btnGift', function(e) {
//	$('#btnGift').on('click', function(e) {
	e.preventDefault(); // 기본 동작인 링크 이동을 막기
		var itemCode = $('#prdtSumAmt').data('test');
		var itemCnt = quantity; 
		
		$.ajax({
		    url: "item",
		    method: 'POST',
		    contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // 폼 데이터 형식으로 설정
		    data: { "itemCode": itemCode,
		    		"itemCnt": itemCnt}, // 서버로 폼 데이터로 전송
		    dataType : "text",
		    beforeSend: function(xhr) {
		        xhr.setRequestHeader(header, token);
		    },
		    success: function(response) {
		        alert("장바구니에 추가되었습니다.");
		    },
		    error: function(error) {
		        alert("로그인이 필요합니다.");
		    } 
		});
	});
});