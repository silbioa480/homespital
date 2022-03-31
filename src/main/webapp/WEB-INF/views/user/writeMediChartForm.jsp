<%--
  Created by IntelliJ IDEA.
  User: lihea
  Date: 2022-03-29
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%--  파일 업로드 CSS  --%>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/writeMediChartForm.css" />
</head>
<body>
<div>
    <form method="post" class="file-uploader" action="" enctype="multipart/form-data">
        <div class="card p-3">
            <h4><strong>시간 선택하기</strong></h4>
            <div class="card p-3">
                <div class="row g-0">
                    <div class="col-md-4" style="min-width: 200px; max-width: 200px;">
                        <div class="img-wrapper">
                            <img alt="의사사진 영역"
                                 src="<c:choose><c:when test="${doctor.doctor_profile_image_name}">/img/doctorImg/${doctor.doctor_profile_image_name}</c:when>
                                <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>
                        </div>
                    </div>
                    <div class="col-md-8 card-body">
                        <div class="card-title d-flex">
                            <h4 class="pr-3 font-weight-bolder">김돌팔${doctor.doctor_name}</h4>
                            <span class="pl-3 font-weight-normal align-text-bottom">의사/${doctor.doctor_diagnosis_type}</span>
                        </div>
                        <div class="card-text">
                            <p class="card-text">
                            <table class="table table-borderless timetable">
                                <tr>
                                    <th>병원이름:</th>
                                    <td>el태그로 병원이름${doctor.hospital_name}</td>
                                </tr>
                                <tr>
                                    <th>휴진:</th>
                                    <td>el태그로 휴진${doctor.holiday}</td>
                                </tr>
                                <tr>
                                    <th>시간:</th>
                                    <td>
                                        c:foreach로 넣을 영역. 예시
                                        <label class="box-radio-input" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="현재 시간에 예약한 인원 : 1/10">
                                            <input type="radio" name="diagnosis_time" value="10" checked="checked">
                                            <span>10:00</span>
                                        </label>
                                        <label class="box-radio-input" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="현재 시간에 예약한 인원 : 8/10">
                                            <input type="radio" name="diagnosis_time" value="11">
                                            <span>11:00</span>
                                        </label>
                                        <label class="box-radio-input" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="점심시간">
                                            <input type="radio" name="diagnosis_time" value="12" disabled>
                                            <span class="text-muted">12:00</span>
                                        </label>
                                        <label class="box-radio-input" data-bs-toggle="tooltip" data-bs-placement="top"
                                               title="현재 시간에 예약한 인원 : 10/10">
                                            <input type="radio" name="diagnosis_time" value="13" disabled>
                                            <span class="text-muted">13:00</span>
                                        </label>
                                    </td>
                                </tr>
                            </table>
                            </p>
                        </div>
                    </div>
                    <div class="card p-3">
                        <p>*비대면 진료 예약의 특성 상 당일 진료만 가능 합니다.<br>
                            *비대면 진료는 1시간 단위로 예약을 신청 받으며, 1시간 중 비대면 진료실이 개설되며 고객님의 핸드폰으로 비대면 진료실 링크를 문자로 보내 드립니다.<br>
                            *비대면 진료실 개설후 5분 이내로 입장하지 않으시면 자동으로 예약이 취소되오니 이점 양해하시어 비대면 진료 예약 시간에 맞추어 준비 해 주시길 바랍니다.<br>
                            *비대면 진료 예약 시간은 병원 현장 상황에 맞추어 유동적으로 조정되어 정확한 진료 예약 시간을 미리 정할 수 없는 점 양해 부탁 드립니다. </p>
                    </div>
                    <hr>
                    <label><input type="checkbox" name="naebangChecked"> 확인 했어요</label>

                </div>
            </div>

        </div>
        <div class="card p-3">
            <h4><strong>진료 차트 작성</strong></h4>
            <div class="card p-3">
                <table class="table table-borderless chartTable">
                    <tr>
                        <th>증상 입력</th>
                        <td>
                        <textarea name="diagnosis_content" placeholder="진료부위 / 증상 입력 최대한 자세하게 기입해 주시기 바랍니다.
예) 감기 기운이 있고, 머리가 아파요! 증상을 구체적으로 적어주세요!" style="width: 100%; min-height: 200px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>증상 이미지 첨부</th>
                        <td>
                            <div class="card p-3" >
                                <div align="center" id="image_container" >
                                    <img id="default_image" style="border-radius: 200px; width: 150px; height: 150px;"
                                         src="<c:url value='/resources/img/QR.png'/>"/>
                                </div>
                                <div id="preview" align="center"></div>
                                <div align="center" class="filebox" style="padding:10px">
                                    <label for="diagnosisImgName">사진 등록</label>
                                    <input type="file" multiple="multiple"  id="diagnosisImgName" name="diagnosisImgName" class="inp-img" accept=".gif, .jpg, .png">
                                    <button type="button" id="cancelImg" name="cancelImg" class="btn-delete">사진 삭제</button>
                                </div>
                            </div>
                        </td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="card p-3">
            <h4><strong>약제 배송 방식</strong></h4>
            <div class="m-3">
                <input type="hidden" name="is_delivery" id="is_delivery" value="false">
                <button class="btn btn-warning rounded-pill"
                        onclick="toggleDelivery('false'); return false;">약국으로 직접 방문
                </button>
                <button class="btn btn-secondary rounded-pill"
                        onclick="toggleDelivery('true'); return false;">집까지 배송받기
                </button>
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
                        <%--<div class="input-group">
                            <input type="text" id="searchKeyword" class="form-control" placeholder="현재 위치를 기반으로 약국을 검색합니다.">
                            <button class="btn btn-primary" onclick="searchPlaces();">검색</button>
                        </div>--%>
                        <div class="map_wrap">
                            <div id="map"
                                 style="width: auto; height: 100%; position: relative; overflow: hidden;"></div>

                            <%--                        <div id="menu_wrap" class="bg_white" style="visibility: hidden;">--%>
                            <%--                            <ul id="placesList"></ul>--%>
                            <%--                            <div id="pagination"></div>--%>
                            <%--                        </div>--%>
                            <div id="menu_wrap" class="bg_white">
                                <div class="option">
                                    <form class="input-group" onsubmit="searchPlaces(); return false;">
                                        <input type="text" class="form-control" placeholder="키워드 입력"
                                               id="searchKeyword" size="15">
                                        <button type="submit" class="btn btn-primary">검색하기</button>
                                    </form>
                                </div>
                                <hr>
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
                        약국 내방 시 [제조완료] 시간으로 부터 ±1시간동안 약이 보관되며, 의료법(?) , 무슨 무슨 법으로 인해 약제는 폐기되며, 제조 완료 시간에 맞추어 약국 내방을 권유
                        드립니다.<br>
                        <br>
                        혹시라도 사정이 생겨 내방이 힘드시거나 기타 문의 사항이 있으시면 상기 약국 번호로 전화 주시기 바랍니다.<br>
                        등등 내용 들어 가겠져
                    </p>
                    <hr>
                    <label><input type="checkbox" name="naebangChecked"> 확인 했어요</label>
                </div>
            </div>
            <div id="delivery" class="card p-3" style="display:none;">
                <div class="p-3">
                    <h5>보내는 곳 주소 확인</h5>
                    <hr>
                    <div>
                        00약국<br>
                        00-0000-0000
                    </div>
                </div>
                <div>
                    <span>원하시는 약국을 직접 선택할 수도 있어요.</span>
                    <hr>
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
                <div class="d-flex align-items-end">
                    <h4>황인성</h4>
                    <span class="px-2 pb-2">만 ${user.age}세(남)</span>
                </div>
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
            <input type="submit" class="btn rounded-0 btn-dark">예약하기</input>
        </div>
    </form>
</div>
<%-- 카카오맵 관련 JS --%>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a69fc7ca725d20c3e61c5b6bb3d32242&libraries=services"></script>
<script>
    var markers = [];
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

    // 키워드로 장소를 검색합니다
    function searchPlaces() {
        var keyword = document.getElementById('searchKeyword').value;
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB, {category_group_code: "PM9"});
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {
        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';
        listEl.style.visibility = "visible";
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function () {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                itemEl.onmouseover = function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout = function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' + places.address_name + '</span>';
        } else {
            itemStr += '    <span>' + places.address_name + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }
</script>
<%-- bootstrap tooltip 설정 --%>
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>
<%-- 약국내방/배달받기 설정 --%>
<script>
    function toggleDelivery(arg) {
        if (arg == 'true') {
            document.getElementById('is_delivery').value = true;
            document.getElementById('delivery').style.display = "block";
            document.getElementById('naebang').style.display = "none";
        } else {
            document.getElementById('is_delivery').value = false;
            document.getElementById('delivery').style.display = "none";
            document.getElementById('naebang').style.display = "block";

        }
    }
</script>

</body>
</html>
