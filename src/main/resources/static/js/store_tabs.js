$(document).ready(function() {
    // 탭 클릭 시 이벤트 처리
    $(".tab-list.fixed li a").click(function(event) {
        // 클릭한 탭의 href 속성에서 이동할 URL을 가져옵니다.
        var url = $(this).attr("href");

        // 페이지 이동을 처리합니다.
        window.location.href = url;

        // 기본 클릭 이벤트 동작을 막습니다.
        event.preventDefault();
    });
});