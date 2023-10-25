$(document).ready(function(){
    var add_x;
    var add_y;

  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(37.57296, 126.9922), // 지도의 중심좌표
      level: 3,
      // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  var imageSrc =
      "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png", // 마커이미지의 주소입니다
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {
      offset: new kakao.maps.Point(27, 69),
    }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
  var markerImage = new kakao.maps.MarkerImage(
      imageSrc,
      imageSize,
      imageOption
    ),
    markerPosition = new kakao.maps.LatLng(37.57296, 126.9922); // 마커가 표시될 위치입니다

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
    position: markerPosition,
    image: markerImage,
    // 마커이미지 설정
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);

  var geocoder = new daum.maps.services.Geocoder();

  var theaterAddr = $("#theater-address-data").val();

  geocoder.addressSearch(theaterAddr, function (results, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === daum.maps.services.Status.OK) {
      var result = results[0]; //첫번째 결과의 값을 활용
      add_x = result.x;
      add_y = result.y;

      // 해당 주소에 대한 좌표를 받아서
      var coords = new daum.maps.LatLng(result.y, result.x);
      // 지도를 보여준다.
      mapContainer.style.display = "block";
      map.relayout();
      // 지도 중심을 변경한다.
      map.setCenter(coords);
      // 마커를 결과값으로 받은 위치로 옮긴다.
      marker.setPosition(coords);
    }
  });

  $("#find-way-btn").click(function(e){
    e.preventDefault();
    var url = 'https://m.map.naver.com/map.naver?lng='+add_x+'&lat='+add_y+'&level=2';

    window.open(url);
  });


});