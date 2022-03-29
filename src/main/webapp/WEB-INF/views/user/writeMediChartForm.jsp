<%--
  Created by IntelliJ IDEA.
  User: lihea
  Date: 2022-03-29
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div class="card p-3">
        <h4><strong>시간 선택하기</strong></h4>
    </div>
    <div class="card p-3">
        <h4><strong>진료 차트 작성</strong></h4>
    </div>
    <div class="card p-3">
        <h4><strong>약제 배송 방식</strong></h4>
    </div>
    <div class="card p-3">
        <h4><strong>결제 정보</strong></h4>
        <div class="m-3">
            <button class="btn btn-warning rounded-pill">약국으로 직접 방문</button>
            <button class="btn btn-secondary rounded-pill">집까지 배송받기</button>
        </div>
        <div id="naebang">
            <div class="card p-3">
                <div class="m-3">
                    <h5>내방하실 약국</h5>
                    <span class="text-secondary">병원과 연계된 약국으로 자동 설정됩니다.</span>
                    <hr>
                    <div>
                        00약국<br>
                        00-0000-0000
                    </div>
                </div>
                <div class="m-3">
                    <span class="text-secondary">원하시는 약국을 직접 선택할 수도 있어요.</span>
                    <hr>
                    <div class="map_wrap">
                        <div id="map"
                             style="width: auto; height: 100%; position: relative; overflow: hidden;">
                        </div>

                        <div id="menu_wrap" class="bg_white" style="visibility: hidden;">
                            <ul id="placesList"></ul>
                            <div id="pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <div class="p-4">
                <h5><strong>약국으로 직접 방문시 주의사항</strong></h5>
                <p>
                    조제의약품 수령 방법을 약국 내방으로 선택 시, 조제가 완료 되면 휴대폰으로 알림 문자 메세지가 전송 됩니다.<br>
                    약국 내방 시 [제조완료] 시간으로 부터 ±1시간동안 약이 보관되며, 의료법(?) , 무슨 무슨 법으로 인해 약제는 폐기되며, 제조 완료 시간에 맞추어 약국 내방을 권유 드립니다.<br>
                    <br>
                    혹시라도 사정이 생겨 내방이 힘드시거나 기타 문의 사항이 있으시면 상기 약국 번호로 전화 주시기 바랍니다.<br>
                    등등 내용 들어 가겠져
                </p>
                <hr>
                <label><input type="checkbox" name="naebangChecked"> 확인 했어요</label>
            </div>
        </div>
        <div id="shipping" class="d-none">
            <div>
                <span>보내는 곳 주소 확인</span>
                <hr>
                <div>
                    00약국<br>
                    00-0000-0000
                </div>
            </div>
            <div>
                <span>원하시는 약국을 직접 선택할 수도 있어요.</span>
                <hr>
                <div>
                    <input type="text" placeholder="현재 위치를 기반으로 약국을 검색합니다.">
                    <button class="btn btn-primary">변경하기</button>
                </div>


            </div>

            <div>
                <span>받으시는 곳 주소 확인</span>
                <hr>
            </div>
        </div>

    </div>
    <div>
        <button class="btn rounded-0 btn-dark">예약하기</button>
    </div>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a69fc7ca725d20c3e61c5b6bb3d32242&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.529521, 126.964540), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({zIndex: 1});
    </script>
</body>
</html>
