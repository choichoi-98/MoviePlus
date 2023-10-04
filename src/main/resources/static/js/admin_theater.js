$(document).ready(function () {

// 극장 리스트 시작
    let delete_id;
    let status_change_id;
    let selected_theater_status;
    let reset_pass_flag = true;
    
    $('.main__table-btn--edit').click(function() {
        var modify_id = $(this).parent().find('.selected-theater-id').val();
        location.href="modifytheater?num=" + modify_id;
    })

    $('.main__table-btn--banned').click(function() {
        status_change_id = $(this).parent().find('.selected-theater-id').val();
        selected_theater_status = $(this).find('.selected-theater-status').val();
    })

    $('#change-status-modal-btn').click(function() {
        location.href="changeStatusTheaterAction?num=" + status_change_id + "&status=" + selected_theater_status;
    })

    $('.main__table-btn--delete').click(function() {
       delete_id = $(this).parent().find('.selected-theater-id').val();
    });

    $('#delete-theater-modal-btn').click(function() {
        location.href="deleteTheaterAction?num=" + delete_id;
    })

    $('.move-to-manager-menu').click(function() {
        var manager_id = $(this).parent().find('.selected-theater-manager-id').val();
        location.href="/movieplus/manager?selectedId=" + manager_id;
    })
// 극장 리스트 끝



// 극장 추가 시작
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('theater_postcode').value = data.zonecode;
                document.getElementById("theater_roadAddress").value = roadAddr;
                

                var guideTextBox = document.getElementById("guide");
            }
        }).open();
    }


    $("#post-id-btn").click(function() {
        sample4_execDaumPostcode();
    })


    $('#reset-password-btn').click(function() {
        
        if(reset_pass_flag){
            $(this).css('background', 'skyblue');
            $(this).text("선택됨");
            $('#reset-pass-check').val('checked');
        }else {
            $(this).css('background', 'gray');
            $(this).text("비밀번호 초기화");
            $('#reset-pass-check').val('unchecked');
        }

        reset_pass_flag = !reset_pass_flag;
        return;
    })
// 극장 추가 끝



});