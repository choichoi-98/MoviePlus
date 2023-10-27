$(function() {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    
    var searchedCoupons = []; // 이미 조회한 쿠폰 코드(배열)
    var couponValue;

    $(document).on('click', '#btn_coupon_search', function(e) {
        e.preventDefault();
        var couponCode = $('#couponCode').val();

        if (couponCode) {
            // 이미 조회한 쿠폰 코드인지 확인
            if (searchedCoupons.includes(couponCode)) {
                alert("해당 코드는 이미 조회되었습니다.");
            } else {
                $.ajax({
                    url: "cart",
                    method: 'POST',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: { "couponCode": couponCode },
                    dataType: "json",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(result) {
                        var susCoupon = `<tr>
                            <td>` + result.coupon_TYPE + `</td>
                            <td>2023.10.20 ~ 2023.11.20</td>
                            <td><input type="checkbox" title="쿠폰 사용여부 체크" name="chkDcoupon" data-idx="0"></td>
                        </tr>`;
                        couponValue = result.coupon_VALUE;
                        $('#1coupon').append(susCoupon);
                        // 이미 조회한 쿠폰 코드
                        searchedCoupons.push(couponCode);
                    },
                    error: function(error) {
                        console.log(error);
                    }
                });
            }
        } else {
            alert("쿠폰 코드를 입력해주세요.");
        }
    });
    
    $(document).on('change', 'input[name="chkDcoupon"]', function() {
    	var isChecked = $(this).prop("checked"); // true or false
    	var discountElement = $('#discountPrice em')
    	
    	if(isChecked) {
    		var discountAmount = totalDiscount();
    		discountElement.text(discountAmount);
    		
    		var totalPrice = $('#Checker').data("amount");
            var currentDiscount = parseInt(discountElement.text());
            
            var finalPrice = totalPrice - currentDiscount;
            if(finalPrice < 0) {
            	finalPrice = 0;
            } else {
            	finalPrice = totalPrice - currentDiscount;
            }
            
            $('#Checker').attr('data-amount', finalPrice);
            $('#Checker').text(finalPrice);
    	} else {
    		discountElement.text("0");
    		
    		// 최종값 업데이트 - totalPrice는 미리 계산한 값을 사용
            var totalPrice = $('#Checker').data("amount");
            $('#Checker').attr('data-amount', totalPrice);
            $('#Checker').text(totalPrice);
    	}
    });
    
    function totalDiscount() {
		return couponValue;
	}
    
    $(document).on('click', '#btn_booking_pay', function(e) {
    	e.preventDefault(); // 기본 동작인 링크 이동을 막기
//    $('#btn_booking_pay').click(function() {
    	var totalAmount = $('#Checker').text();
    	var sid = $('#Checker').data("sid");
    	var cnt = $('#Checker').data("cnt");
    	var seatinfo = $('#Checker').data("seatinfo");
//    	alert(totalAmount);
    	
        $.ajax({
            url: 'kakaopay',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "totalAmount": totalAmount,
            	    "sid": sid,
            	    "seatinfo": seatinfo,
            	    "cnt": cnt},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                xhr.setRequestHeader("Accept-Charset", "UTF-8");
            },
            success: function(data) {
                var box = data.next_redirect_pc_url;
                window.open(box);
//              alert("상품: "+ cartItemNames + " 총 가격: " + totalPrice);
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    });


    var couponOpen = false; // 초기 상태는 닫혀있음
    $('#grp_coupon').click(function()  {
        if (couponOpen) {
            // 탑다운이 열려있으면 닫음
            $('#movieWonLi').removeClass('on');
            $('#mega_point').hide();
            couponOpen = false;
        } else {
            // 탑다운이 닫혀있으면 엶
            $('#movieWonLi').addClass('on');
            $('#mega_point').show();
            couponOpen = true;
        }
    });

    var ticketOpen = false; // 초기 상태는 닫혀있음
    $('#grp_ticket').click(function()  {
        if (ticketOpen) {
            // 탑다운이 열려있으면 닫음
            $('#movieWonLi2').removeClass('on');
            $('#mobile_coupon').hide();
            ticketOpen = false;
        } else {
            // 탑다운이 닫혀있으면 엶
            $('#movieWonLi2').addClass('on');
            $('#mobile_coupon').show();
            ticketOpen = true;
        }
    });
    
    $(document).ready(function() {
        // 앵커 클릭 이벤트 처리
        $('a#btn_pay_mcoupon').click(function(e) {
            e.preventDefault(); // 기본 앵커 동작을 막기

            // 모달 열기
            $('#layer_dcoupon').show();
        });

        // 모달 닫기 버튼 클릭 이벤트 처리
        $('#btn_close_dcoupon').click(function() {
            // 모달 닫기
            $('#layer_dcoupon').hide();
            $('#data_table tbody').empty();
            searchedCoupons = []; // searchedCoupons 초기화
        });
        $('#btn_close_modal_dcoupon').click(function() {
            // 모달 닫기
            $('#layer_dcoupon').hide();
            $('#data_table tbody').empty();
            searchedCoupons = []; // searchedCoupons 초기화
        });
        $('#btn_apply_dcoupon').click(function() {
            // 모달 닫기
            $('#layer_dcoupon').hide();
            $('#data_table tbody').empty();
            searchedCoupons = []; // searchedCoupons 초기화
        });
    });
}); // func end