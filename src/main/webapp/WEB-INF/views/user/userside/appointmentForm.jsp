<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>비대면 진료 예약하기</title>
    <%--  파일 업로드 CSS  --%>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/writeMediChartForm.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/resources/js/signUp/jquery.scrollex.min.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/resources/js/signUp/jquery.scrolly.min.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/resources/js/signUp/browser.min.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/resources/js/signUp/util.js"></script>--%>
    <%--    <script src="${pageContext.request.contextPath}/resources/js/main/commonSidebarScroll.js"></script>--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>--%>


</head>
<body>

<%--side-nav 시작 by 소연 4/8--%>
<section id="sidebar">
    <div style="height:50px;"></div>
    <div class="d-flex flex-column align-items-center">
        <span class="image avatar"><a href="/"><img src="/resources/img/design/logo_U_sideNav.png" alt=""/></a></span>


        <p class="py-5"><strong>비대면 진료 예약하기</strong></p>
    </div>
    <nav>
        <ul id="nav">
            <li class="nav-item"><a href="#one" class="nav-link active">예약시간 선택</a></li>
            <li class="nav-item"><a href="#two" class="nav-link">진료차트 작성</a></li>
            <li class="nav-item"><a href="#three" class="nav-link">약 배송방법 선택</a></li>
            <li class="nav-item"><a href="#four" class="nav-link">결제정보 입력</a></li>
        </ul>
    </nav>
    <%--    <footer>--%>
    <%--        <ul class="icons">--%>
    <%--            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>--%>
    <%--            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>--%>
    <%--            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>--%>
    <%--        </ul>--%>
    <%--    </footer>--%>
</section>
<%--side-nav 끝 by 소연 4/7--%>

<div>
    <c:forEach var="map" items="${ds}">

    </c:forEach>


    <%--    인성      --%>
    <form method="post" class="file-uploader" data-bs-spy="scroll" data-bs-target="#nav"
          data-bs-offset="0" tabindex="0" action="/appointmentForm" enctype="multipart/form-data">
        <section class="card p-3" id="one">
            <h4><strong>시간 선택하기</strong></h4>
            <div class="card p-3">
                <div class="row g-0">
                    <div class="col-md-4" style="min-width: 200px; max-width: 200px;">
                        <div class="img-wrapper">
                            <img alt="의사사진 영역"
                                 src="<c:choose><c:when test="${not empty doctor.doctor_profile_image_name}">/resources/img/doctorImg/${doctor.doctor_profile_image_name}</c:when>
                                <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>
                        </div>
                    </div>
                    <div class="col-md-8 card-body">
                        <div class="card-title d-flex">
                            <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name} &nbsp&nbsp&nbsp&nbsp</h4>
                            <span class="pl-3 font-weight-normal align-text-bottom">${doctor.doctor_diagnosis_type}</span>
                            <input type="hidden" name="diagnosis_type" value="${doctor.doctor_diagnosis_type}">
                        </div>
                        <div class="card-text">
                            <p class="card-text">
                            <table class="table table-borderless timetable">
                                <tr>
                                    <th>병원이름:</th>
                                    <td>${doctor.hospital_name}</td>
                                </tr>
                                <tr>
                                    <th>휴진:</th>
                                    <td>${doctor.holiday}요일</td>
                                </tr>
                                <tr>
                                    <th>시간:</th>
                                    <td id="workBtn">
                                        <c:forEach var="tt" items="${real_work_timeList}" varStatus="status">

                                            <label class="box-radio-input" data-bs-toggle="tooltip"
                                                   data-bs-placement="top"
                                                   id="tcTitle${tt}" title="0/5">

                                                <input type="radio" class="tcRadio" id="tcRadio${tt}"
                                                       name="diagnosis_time" value="${tt}"
                                                >
                                                <span id="tcSpan${tt}">${tt}:00</span>

                                            </label>

                                        </c:forEach>
                                    </td>
                                </tr>
                            </table>
                            </p>
                        </div>
                    </div>
                    <div class="card p-3">
                        <p class="appointmentNotice">- 비대면 진료 예약의 특성 상 당일 진료만 가능 합니다.<br>
                            - 비대면 진료는 1시간 단위로 예약을 신청 받으며, 1시간 중 비대면 진료실이 개설되며 고객님의 핸드폰으로 비대면 진료실 링크를 문자로 보내 드립니다.<br>
                            - 비대면 진료실 개설후 5분 이내로 입장하지 않으시면 자동으로 예약이 취소되오니 이점 양해하시어 비대면 진료 예약 시간에 맞추어 준비 해 주시길 바랍니다.<br>
                            - 비대면 진료 예약 시간은 병원 현장 상황에 맞추어 유동적으로 조정되어 정확한 진료 예약 시간을 미리 정할 수 없는 점 양해 부탁 드립니다. </p>
                    </div>
                    <hr>
                    <label><input type="checkbox" class="timeChecked" name="timeChecked"> 확인 했어요</label>

                </div>
            </div>

        </section>
        <section class="card p-3" id="two">
            <h4><strong>진료 차트 작성</strong></h4>
            <div class="card p-3">
                <table class="table table-borderless chartTable">
                    <tr>
                        <th>증상 입력</th>
                        <td>
                        <textarea name="diagnosis_content" class="diagnosis_content" placeholder="진료부위 / 증상 입력 최대한 자세하게 기입해 주시기 바랍니다.
예) 감기 기운이 있고, 머리가 아파요! 증상을 구체적으로 적어주세요!" style="width: 100%; min-height: 200px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>증상 이미지 첨부</th>
                        <td>
                            <div class="card p-3">
                                <div id="preview" align="center"></div>
                                <div align="center" class="filebox" style="padding:10px">
                                    <label id="filebtn" for="btnAtt">사진 등록</label>
                                    <input type='file' id="btnAtt" style="display: none;" name="diagnosisImgNames"
                                           accept=".gif, .jpg, .png" multiple/>
                                    <div id='att_zone'>
                                    </div>
                                    <input type="hidden" name="doctor_number" value="${doctor.doctor_number}">
                                    <input type="hidden" name="user_number" value="${user.user_number}">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </section>
        <%----------------------------------------------------------------------%>

        <section class="card p-3" id="three">
            <h4><strong>약제 배송 방식</strong></h4>
            <div id="choosePharmacy">
                <div class="map_wrap">
                    <div id="map"
                         style="width: auto; height: 100%; position: relative; overflow: hidden;"></div>

                    <%--                        <div id="menu_wrap" class="bg_white" style="visibility: hidden;">--%>
                    <%--                            <ul id="placesList"></ul>--%>
                    <%--                            <div id="pagination"></div>--%>
                    <%--                        </div>--%>
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">

                            <input type="text" class="form-control" placeholder="키워드 입력"
                                   id="searchKeyword" size="15">
                            <button onclick="searchPlaces(); return false;" class="btn btn-primary">검색하기
                            </button>

                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
                <hr>
                <div id="currentPharmacy">
                    <h5>현재 설정된 약국</h5>
                    <div id="pharmacy_name">
                        -
                    </div>
                    <div id="pharmacy_phone">
                        -
                    </div>
                    <div id="pharmacy_address">
                        -
                    </div>
                    <input type="hidden" name="pharmacy_name">
                    <input type="hidden" name="pharmacy_phone">
                    <input type="hidden" name="pharmacy_address">

                </div>
                <hr>
                <div class="m-3">
                    <input type="number" name="is_delivery" id="is_delivery" class="d-none" value="0">
                    <%-- 버튼색깔 변경 태영 기존부트스트랩 버튼색깔 삭제--%>
                    <button class="btn rounded-pill"
                            onclick="toggleDelivery('false'); return false;">약국으로 직접 방문
                    </button>
                    <button class="btn rounded-pill"
                            onclick="toggleDelivery('true'); return false;">집까지 배송받기
                    </button>
                </div>
            </div>
            <div id="naebang">
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
                    <label><input type="checkbox" class="naebangChecked" name="naebangChecked"> 확인 했어요</label>
                </div>
            </div>
            <div id="delivery" class="card p-3" style="display:none;">
                <div id="currentTargetPlace">
                    <span>현재 배송지 : </span>
                    <span id="diagnosis_addressSpan">(${user.zip_code}) ${user.street_address} ${user.detail_address}</span>
                    <button type="button" id="changePlace" class="btn border-dark" onClick="goPopup()">배송지 변경하기</button>
                </div>
                <input type="hidden" name="user_address"
                       value="(${user.zip_code}) ${user.street_address} ${user.detail_address}">

            </div>

        </section>
        <section class="card p-3" id="four">
            <h4><strong>결제 정보</strong></h4>
            <div class="card p-3">
                <div class="d-flex align-items-end">
                    <h4>${user.user_name}</h4>
                    <span class="px-2 pb-2">만 ${age}세(${gender})</span>
                </div>
                <p>배송 방법 : <font id="fouris_delivery">약국으로 직접 방문</font></p>
                <div>약국 이름 :<p id="pharmacy_namePay"></p></div>
                <div>약국 전화번호 : <p id="pharmacy_phonePay"></p></div>
                <div>약국 주소 : <p id="pharmacy_addressPay"></p></div>
                <p id="diagnosis_address">받으시는 곳 주소 :
                    [${user.zip_code}] ${user.street_address} ${user.detail_address}</p>
                <span>핸드폰 번호 : ${user.user_phone}</span>
                <br>
                <div>
                    카드 정보
                    <input type="text" id="default_card" value="${cardInfo}" disabled="disabled"/>
                    <input type="hidden" id="billing_key" name="billing_key">
                    <%-- 비어있으면 유저의 billing_key 따라가게, 카드 추가했으면 여기에 값 담겨서 전송됨 --%>
                    <button id="writeCard" class="btn" onclick="return false;">카드 변경</button>
                    <%--                        모달 --%>
                    <%--                        <span><input type="button" id="deleteCard" name="deleteCard" class="deleteCard" value="삭제" /></span>--%>
                </div>
                <div class="modal fade" id="writeCardModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5>카드등록</h5>
                            </div>
                            <div class="modal-body">
                                <div class="input-control">
                                    <h6 class="modal-title">카드 별칭</h6>
                                    <div style="display:flex">
                                        <input style="width: 100%" id="cardNameModal" type="text"
                                               name="cardNameModal"
                                               placeholder="카드 별칭를 입력해주세요. ( 최대 8자 )" title="카드 별칭 입력"
                                               maxlength="8"/>
                                    </div>
                                    <div class="error"></div>
                                </div>
                                <div class="input-control">
                                    <h6 class="modal-title">카드 번호</h6>
                                    <div style="display:flex">
                                        <input style="width: 23%; height:40px;" id="cardNumModal1" type="text"
                                               name="cardNumModal1" maxlength="4" minlength="4"/>
                                        <span style="line-height:40px;">-</span>
                                        <input style="width: 23%; height:40px;" id="cardNumModal2" type="password"
                                               name="cardNumModal2" maxlength="4" minlength="4"/>
                                        <span style="line-height:40px;">-</span>
                                        <input style="width: 23%; height:40px;" id="cardNumModal3" type="password"
                                               name="cardNumModal3" maxlength="4" minlength="4"/>
                                        <span style="line-height:40px;">-</span>
                                        <input style="width: 23%; height:40px;" id="cardNumModal4" type="text"
                                               name="cardNumModal4" maxlength="4" minlength="4"/>
                                    </div>
                                </div>
                                <h6 class="modal-title">카드 유효기간</h6>
                                <div class="input-control">
                                    <div style="display:flex">
                                        <input style="width: 100%" id="cardMMYYNumModal" type="text"
                                               name="cardMMYYNumModal"
                                               title="카드 유효기간" placeholder="MMYY" maxlength="4" minlength="4"/>
                                    </div>
                                </div>
                                <h6 class="modal-title">카드 비밀번호</h6>
                                <div class="input-control">
                                    <div style="display:flex">
                                        <input style="width: 100%" id="cardPassword" type="password"
                                               name="cardPassword"
                                               title="카드 비밀번호" placeholder="비밀번호 앞자리 2개 입력하세요." maxlength="2"
                                               minlength="2"/>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn border-dark" type="button" id="submitNewCard"
                                        onclick="submitNewCardId(); return false;">추가
                                </button>
                                <button class="btn" type="button" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <hr>
            <p>
                입력하신 결제 정보를 바탕으로 진료가 끝나면 진료비가 자동 결제 됩니다.<br>
                약 처방이 있는 경우에는 조제후 약제 비용이 자동으로 결제 됩니다.<br>
                진단에 따라 처방의 유무가 결정되기 때문에 진단 시/조제 시 결제가 두번 되는 부분을 양해 부탁 드립니다. 감사합니다.
            </p>
            <label><input type="checkbox" class="paymentConfirm" name="paymentConfirm">확인했어요</label>
        </section>

        <div class="appoint-out">
            <label for="appointDo" class="appointBtn">예약하기</label>
            <input type="submit" id="appointDo" class="appointDo" style="display: none"/>
        </div>
    </form>
</div>
<script>
    // 주소찾기API

    function goPopup() {
        // 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

        // 모바일 웹인 경우, 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(zipNo, roadFullAddr, addrDetail) {
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        var usraddr = "(" + zipNo + ") " + roadFullAddr;
        document.getElementsByName('user_address').value = usraddr;
        document.getElementById("diagnosis_address").innerText = usraddr;
        document.getElementById("diagnosis_addressSpan").innerText = usraddr;
        // document.form.zipNo.value = zipNo;
        // document.form.roadFullAddr.value = roadFullAddr;
        // document.form.addrDetail.value = addrDetail;
    }
</script>

<%-- 카카오맵 관련 JS --%>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a69fc7ca725d20c3e61c5b6bb3d32242&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    <%--
    <td id="workBtn">
        <c:forEach var="tt" items="${real_work_timeList}" varStatus="status">
            <label class="box-radio-input" data-bs-toggle="tooltip" data-bs-placement="top" id="tcTitle${tt}" title="0/10">
            <input type="radio" class="tcRadio" id="tcRadio${tt}" name="diagnosis_time" value="${tt}" checked="checked">
            <span>${tt}:00</span>
            </label>
        </c:forEach>
    </td>
    --%>

    //test(준근) 타임카운트
    console.log('리얼타임');

    let tcArr = JSON.parse(`${timeCount}`);
    console.log(tcArr);
    for (let i in tcArr) {
        let msg = "5/5"
        if (tcArr[i].request_count < 5) {
            msg = tcArr[i].request_count + "/5";
        } else {
            $('#tcRadio' + tcArr[i].diagnosis_time).attr('disabled', true);
            $('#tcSpan' + tcArr[i].diagnosis_time).attr("style", 'background-color:gray;');

        }
        $('#tcTitle' + tcArr[i].diagnosis_time).attr('title', msg);
    }
    let rtArr = JSON.parse(`${real_work_timeList}`);
    let hours = new Date().getHours();
    for (let realTime of rtArr) {
        if (hours >= realTime) {
            let msg = "예약 불가능한 시간입니다."
            $('#tcRadio' + realTime).attr('disabled', true);
            $('#tcSpan' + realTime).attr("style", 'background-color:gray;');
            $('#tcTitle' + realTime).attr('title', msg);
        }
    }


</script>
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
    getCurrentPosBtn();

    // 키워드로 장소를 검색합니다
    function searchPlaces() {
        var keyword = document.getElementById('searchKeyword').value;
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB, {category_group_code: "PM9", location: map.getCenter()});
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
        el.onclick = function () {
            document.getElementById("pharmacy_name").innerText = places.place_name;
            document.getElementById("pharmacy_phone").innerText = places.phone;
            document.getElementById("pharmacy_address").innerText = places.road_address_name ? places.road_address_name : places.address_name;

            document.getElementById("pharmacy_namePay").innerText = places.place_name;
            document.getElementById("pharmacy_phonePay").innerText = places.phone;
            document.getElementById("pharmacy_addressPay").innerText = places.road_address_name ? places.road_address_name : places.address_name;

            document.getElementsByName('pharmacy_name')[0].value = places.place_name;
            document.getElementsByName('pharmacy_phone')[0].value = places.phone;
            document.getElementsByName('pharmacy_address')[0].value = places.road_address_name ? places.road_address_name : places.address_name;
        }
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

    function locationLoadSuccess(pos) {
        // 현재 위치 받아오기
        var currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
        // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
        map.panTo(currentPos);
        // 마커 생성
        var marker = new kakao.maps.Marker({
            position: currentPos
        });
        // 기존에 마커가 있다면 제거
        marker.setMap(null);
        marker.setMap(map);
    };

    function locationLoadError(pos) {
        alert('위치 정보를 가져오는데 실패했습니다.');
    };

    // 위치 가져오기 버튼 클릭시
    function getCurrentPosBtn() {
        navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);

    };
</script>
<%-- bootstrap tooltip 설정 --%>
<script>
    function tooltipInitialing() {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    }

    tooltipInitialing();
</script>
<%-- 약국내방/배달받기 설정 --%>
<script>
    function toggleDelivery(arg) {
        console.log(arg);
        console.log(typeof arg);
        if (arg === 'true') {
            document.getElementById('is_delivery').value = 1;
            document.getElementById('delivery').style.display = "block";
            document.getElementById('naebang').style.display = "none";
            document.getElementById('fouris_delivery').innerText = "집까지 배송받기";
        } else {
            document.getElementById('is_delivery').value = 0;
            document.getElementById('delivery').style.display = "none";
            document.getElementById('naebang').style.display = "block";
            document.getElementById('fouris_delivery').innerText = "약국으로 직접 방문하기";
        }
    }
</script>
<%-- 증상 사진 미리보기, 삭제, 드래그 앤 드롭  ( 인성 ) --%>
<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn) {
            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];
            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;border:1px solid #b4b4b4;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                + 'right:0px;bottom:0px;z-index:999;background-color:rgba(0,67,50,0);color:#d52a2a';
            btnAtt.onchange = function (e) {
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for (f of fileArr) {
                    imageLoader(f);
                }
            }
            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false)
            attZone.addEventListener('dragover', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false)
            attZone.addEventListener('drop', function (e) {
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for (f of files) {
                    imageLoader(f);
                }
            }, false)
            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function (image) {
                sel_files.push(image);
                var reader = new FileReader();
                reader.onload = function (ee) {
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img));
                }
                reader.readAsDataURL(image);
            }
            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function (img) {
                var div = document.createElement('div')
                div.setAttribute('style', div_style)
                var btn = document.createElement('img')
                btn.setAttribute('src', '/resources/img/delete.png')
                btn.setAttribute('delFile', img.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function (ev) {
                    var ele = ev.target;
                    var delFile = ele.getAttribute('delFile');
                    for (var i = 0; i < sel_files.length; i++) {
                        if (delFile === sel_files[i].name) {
                            sel_files.splice(i, 1);
                        }
                    }
                    dt = new DataTransfer();
                    for (f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'btnAtt')

    // 인성: 카드 관리 and 추가 모달
    $('#writeCard').click(function (e) {
        e.preventDefault();
        $('#writeCardModal').modal("show");
    });
    // $('#modalY3').click(function (e) {
    //   e.preventDefault();
    //   let radioV = $('input:radio[name="cardCheck"]:checked').val();
    //   console.log(radioV);
    //   $('#default_card').val("****-****-****-" + radioV);
    // $('#addCardModal').modal("hide");
    // });
    // 인성: 카드 추가 모달폼 정규성 검사
    function submitNewCardId() {
        if ($("#cardNameModal").val() == "") {
            alert("카드 별칭을 입력해주세요.");
            $("#cardNameModal").focus();
            return false;
        }
        if ($("#cardNumModal1").val().length != 4) {
            alert("1.4자리");
            $("#cardNumModal1").focus();
            return false;
        } else if ($("#cardNumModal2").val().length != 4) {
            alert("2.4자리");
            $("#cardNumModal2").focus();
            return false;
        } else if ($("#cardNumModal3").val().length != 4) {
            alert("3.4자리");
            $("#cardNumModal3").focus();
            return false;
        } else if ($("#cardNumModal4").val().length != 4) {
            alert("4.4자리");
            $("#cardNumModal4").focus();
            return false;
        }
        if ($("#cardMMYYNumModal").val().length != 4) {
            alert("유효기간 숫자 4자리를 입력해주세요.");
            $("#cardMMYYNumModal").focus();
            return false;
        }
        if ($("#cardPassword").val().length != 2) {
            alert("카드 비밀번호 앞자리 2자리를 입력해주세요.");
            $("#cardPassword").focus();
            return false;
        }
        // 훈:
        card_number = $('#cardNumModal1').val() + '-' + $('#cardNumModal2').val() + '-' + $('#cardNumModal3').val() + '-' + $('#cardNumModal4').val();
        expiry = '20' + $('#cardMMYYNumModal').val().substr(2, 2) + '-' + $('#cardMMYYNumModal').val().substr(0, 2);
        pwd_2digit = $('#cardPassword').val();

        // var formData = new FormData();
        // formData.append("card_number", card_number);
        // formData.append("expiry", expiry);
        // formData.append("pwd_2digit", pwd_2digit);
        $.ajax({
            url: "/writeMyCard",
            type: "POST",
            cache: false,
            data: {
                "card_name": $("#cardNameModal").val(),
                "card_number": card_number,
                "expiry": expiry,
                "pwd_2digit": pwd_2digit,
            },
            contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
            success: function (data) {
                let d = JSON.parse(data);
                alert("성공하였습니다.");
                $('#writeCardModal').modal("hide");
                console.log(d);
                card = d.card_nickname + " (" + d.card_number + ")";
                $('#default_card').val(card);
                $('#billing_key').val(d.customer_uid);

            },
            error: function (data) {
                alert("에러가 발생했습니다.")
            }
        })
        return false;
    }

    // 인성: 예약하기 버튼 정규성 검사
    $('.appointDo').click(function () {
        // console.log(document.getElementById('is_delivery').value);
        console.log($('input[name="pharmacy_address"]').val() == "" || $('input[name="pharmacy_address"]').val() == null);
        if (!$("input:checked[name='timeChecked']").is(":checked")) {
            alert("시간약관을 체크하세요.")
            $(".timeChecked").focus();
            return false;
        } else if ($('#is_delivery').val() == 0 && !$("input:checked[name='naebangChecked']").is(":checked")) {
            alert("내방약관을 체크하세요.");
            $('.naebangChecked').focus();
            return false;
        } else if (!$("input:checked[name='paymentConfirm']").is(":checked")) {
            alert("결제약관을 체크하세요.")
            $(".paymentConfirm").focus();
            return false;
        } else if ($('.diagnosis_content').val() == "") {
            alert("증상 내용을 입력해주세요.")
            $(".diagnosis_content").focus();
            return false;

        } else if ($('input[name="pharmacy_address"]').val() == "" || $('input[name="pharmacy_address"]').val() == null) {
            alert("약국을 선택해주세요.")
            $("#map_wrap").focus();
            return false;
        } else if ((${empty cardInfo}) && (($('#billing_key').val() == "") || ($('#billing_key').val() == null))) {
            alert("결제 카드를 입력해주세요.");
            $('#writeCard').focus();
            return false;
        } else {
            alert('${doctor.doctor_name} ' + "의사에게 " + $("input:checked[name='diagnosis_time']").val() + "시에 예약 완료되었습니다.");
        }
    })

    <%--$('#test').click(function() {--%>
    <%--  alert( '${doctor.doctor_name} '+ "의사에게 " + $("input:checked[name='diagnosis_time']").val()+ "시에 예약 완료되었습니다.");--%>
    <%--})--%>


</script>
<script>
    var scrollSpy = new bootstrap.ScrollSpy(document.body, {
        target: '#nav'
    })
</script>
<script>
    if (${empty cardInfo}) {
        alert('기본 카드를 등록하지 않으셨습니다. 마이페이지에서 기본 카드를 등록해놓지 않았다면 예약 시마다 카드 정보를 새로 넣어주셔야 하며, 카드 정보를 넣지 않은 경우 예약되지 않습니다.')
    }
</script>
<script>
    function notify() {
        // Let's check if the browser supports notifications
        if (!("Notification" in window)) {
            alert("This browser does not support desktop notification");
        }

        // Let's check whether notification permissions have already been granted
        else if (Notification.permission === "granted") {
            // If it's okay let's create a notification
            var notification = new Notification("Hi there!");
        }

        // Otherwise, we need to ask the user for permission
        else if (Notification.permission !== 'denied') {
            Notification.requestPermission(function (permission) {
                // If the user accepts, let's create a notification
                if (permission === "granted") {
                    var notification = new Notification("Hi there!");
                }
            });
        }

        // At last, if the user has denied notifications, and you
        // want to be respectful there is no need to bother them any more.
    }
</script>
</body>
</html>
