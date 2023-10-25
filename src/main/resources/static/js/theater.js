$(document).ready(function(){
  
  function modal_close() {
    $(".modal-layer").removeClass("on");
    $(".bg-modal").css("opacity", "0");
    $("body").removeClass("no-scroll");
  }

  // theater-main 시작 =======================================================================

  $("#favorite-theater-btn").click(function () {
    $("#favor_theater_setting").addClass("on");
    $(".bg-modal").css("opacity", "1");
    $("body").addClass("no-scroll");
  });

  $(".btn-modal-close").click(function () {
    modal_close();
  });

  $("#favorite-theater-close-btn").click(function () {
    modal_close();
  });

  $(".theater-place > ul > li > button").click(function () {
    $(".theater-place > ul > li").removeClass("on");
    $(this).parent().addClass("on");
  });

  // theater-main 끝 =======================================================================

  // theater-detail 시작 =======================================================================

  $(".area-depth1 > li").hover(function () {
    $(".area-depth1 > li").removeClass("on");
    $(this).addClass("on");
  });

  $(".area-depth1").mouseleave(function () {
    $(".area-depth1 > li").removeClass("on");
  });

  $("#theater-detail-tab-ul > li").click(function () {
    $("#theater-detail-tab-ul > li").removeClass("on");
    $(this).addClass("on");

    var tab_selector = "#tab0" + ($(this).index() + 1);

    $("#theater-detail-tab-div > .tab-cont").removeClass("on");
    $(tab_selector).addClass("on");
  });

  // theater-detail 끝 =======================================================================
});