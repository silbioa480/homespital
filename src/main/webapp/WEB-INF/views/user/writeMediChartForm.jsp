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
    <style> <%-- 카카오맵 관련 기본 CSS --%>
    .map_wrap, .map_wrap * {
        margin: 0;
        padding: 0;
        font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
        font-size: 12px;
    }

    .map_wrap a, .map_wrap a:hover, .map_wrap a:active {
        color: #000;
        text-decoration: none;
    }

    .map_wrap {
        position: relative;
        width: 100%;
        height: 500px;
    }

    #menu_wrap {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        width: 250px;
        margin: 10px 0 30px 10px;
        padding: 5px;
        overflow-y: auto;
        background: rgba(255, 255, 255, 0.7);
        z-index: 1;
        font-size: 12px;
        border-radius: 10px;
    }

    .bg_white {
        background: #fff;
    }

    #menu_wrap hr {
        display: block;
        height: 1px;
        border: 0;
        border-top: 2px solid #5F5F5F;
        margin: 3px 0;
    }

    #menu_wrap .option {
        text-align: center;
    }

    #menu_wrap .option p {
        margin: 10px 0;
    }

    #menu_wrap .option button {
        margin-left: 5px;
    }

    #placesList li {
        list-style: none;
    }

    #placesList .item {
        position: relative;
        border-bottom: 1px solid #888;
        overflow: hidden;
        cursor: pointer;
        min-height: 65px;
    }

    #placesList .item span {
        display: block;
        margin-top: 4px;
    }

    #placesList .item h5, #placesList .item .info {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    #placesList .item .info {
        padding: 10px 0 10px 55px;
    }

    #placesList .info .gray {
        color: #8a8a8a;
    }

    #placesList .info .jibun {
        padding-left: 26px;
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
    }

    #placesList .info .tel {
        color: #009900;
    }

    #placesList .item .markerbg {
        float: left;
        position: absolute;
        width: 36px;
        height: 37px;
        margin: 10px 0 0 10px;
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
    }

    #placesList .item .marker_1 {
        background-position: 0 -10px;
    }

    #placesList .item .marker_2 {
        background-position: 0 -56px;
    }

    #placesList .item .marker_3 {
        background-position: 0 -102px
    }

    #placesList .item .marker_4 {
        background-position: 0 -148px;
    }

    #placesList .item .marker_5 {
        background-position: 0 -194px;
    }

    #placesList .item .marker_6 {
        background-position: 0 -240px;
    }

    #placesList .item .marker_7 {
        background-position: 0 -286px;
    }

    #placesList .item .marker_8 {
        background-position: 0 -332px;
    }

    #placesList .item .marker_9 {
        background-position: 0 -378px;
    }

    #placesList .item .marker_10 {
        background-position: 0 -423px;
    }

    #placesList .item .marker_11 {
        background-position: 0 -470px;
    }

    #placesList .item .marker_12 {
        background-position: 0 -516px;
    }

    #placesList .item .marker_13 {
        background-position: 0 -562px;
    }

    #placesList .item .marker_14 {
        background-position: 0 -608px;
    }

    #placesList .item .marker_15 {
        background-position: 0 -654px;
    }

    #pagination {
        margin: 10px auto;
        text-align: center;
    }

    #pagination a {
        display: inline-block;
        margin-right: 10px;
    }

    #pagination .on {
        font-weight: bold;
        cursor: default;
        color: #777;
    }
    </style>
</head>
<body>
<div>
    <div class="card p-3">
        <h4><strong>시간 선택하기</strong></h4>
    </div>
    <div class="card p-3">
        <h4><strong>진료 차트 작성</strong></h4>
        <div class="card p-3">
            <table class="table table-borderless">
                <tr>
                    <th>증상 입력</th>
                    <td>
                        <textarea name="symptom" style="width: 100%; min-height: 200px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>증상 이미지 첨부</th>
                    <td>
                        <div class="card p-3" style="width:100%;">
                            여기에 사진 관련 넣을 예정
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="btn btn-primary">사진 삭제? 협의해보아요</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="card p-3">
        <h4><strong>약제 배송 방식</strong></h4>
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
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="기능구현은 나중에 하겠음">
                        <button class="btn btn-primary">검색</button>
                    </div>
                    <div class="map_wrap">
                        <div id="map" style="width: auto; height: 100%; position: relative; overflow: hidden;"></div>

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
    <div class="card p-3">
        <h4><strong>결제 정보</strong></h4>
        <div class="card p-3">
            <span>황인성</span><span>만 18세(남)</span>
            <p>배송 방법 : 집으로 받아보기(배송)</p>
            <p>약국 이름 : 어디어디</p>
            <p>받으시는 곳 주소 : 경기도 고양시 어쩌고</p>
            <span>핸드폰 번호</span>
            <div>
                결제 정보
                <input type="text" placeholder="카드정보" readonly>
                <button class="btn btn-primary">변경하기</button>
                <select>
                    <option>KB국민카드</option>
                    <option>농협카드</option>
                    <option>신한카드</option>
                    <option>하나카드</option>
                    <option>삼성카드</option>
                    <option>현대카드</option>
                    <option>우리카드</option>
                    <option>BC카드</option>
                    <option>롯데카드</option>
                    <option>이거 이렇게 일일히 입력할리가 없는데</option>
                </select>
                <input type="text" value="일시불" disabled>
            </div>
        </div>
        <div>
            <p>
                입력하신 결제 정보를 바탕으로 진료가 끝나면 진료비가 자동 결제 됩니다.<br>
                약 처방이 있는 경우에는 조제후 약제 비용이 자동으로 결제 됩니다.<br>
                진단에 따라 처방의 유무가 결정되기 때문에 진단 시/조제 시 결제가 두번 되는 부분을 양해 부탁 드립니다. 감사합니다.
            </p>
            <label><input type="checkbox" name="paymentConfirm">확인했어요</label>
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
