$(document).ready(function() {
    $("#additem").click(function(e) {
        e.preventDefault(); // 버튼의 기본 동작 X
        
        // 선택된 값을 가져오기
        var selectedValue = $("#quality").val();
        
        // 폼 데이터에 선택된 값을 추가
        $("#quality").attr("name", "ITEM_MENU"); // 선택된 값의 이름을 폼 요소의 name 속성으로 설정
        $("#quality").val(selectedValue); // 선택된 값을 폼 요소의 값으로 설정

        // 폼을 서버로 제출
        document.additemform.submit();
    });
});