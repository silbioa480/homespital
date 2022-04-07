<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Homespital</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
  <link rel="stylesheet" href="/resources/css/doctorList.css"/>
</head>
<body class="is-preload">

<!-- Header -->
<%--<section id="header">--%>
<%--    <header>--%>
<%--        <span class="image avatar"><img src="/resources/img/doctorList/doctor01.jpg" alt=""/></span>--%>
<%--        <h1 id="logo"><a href="#">Homespital</a></h1>--%>
<%--        <p>Hi</p>--%>

<%--    </header>--%>
<%--    <nav id="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="#one" class="active">필수정보입력</a></li>--%>
<%--            <li><a href="#two">주소 입력</a></li>--%>
<%--            <li><a href="#three">결제 정보 입력</a></li>--%>
<%--            <li><a href="#four">약관동의</a></li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--    <footer>--%>
<%--        <ul class="icons">--%>
<%--            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>--%>
<%--            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>--%>
<%--        </ul>--%>
<%--    </footer>--%>
<%--</section>--%>

<!-- Wrapper -->
<div style="background:#34495e; color: white;">
  <h3>최고의 의료진을 소개합니다!</h3>
  <p>약국 내방을 할 예정 이신가요 ? -> 거리순으로<br>
    지금 당장 비대면 진료가 가능한 선생님을 찾으시나요 ?-> 실시간 진료순<br>
    원하시는 병원이 있으신가요 ? 검색도 있어야 ??<br>
    그럼 처음에 병원을 서치 할수 있어야 하네 순서가 동일 선상에 있음<br>
    지금 대면 진료일것 같다고 예상? 거리순 </p>
</div>

<%--의사 및 병원 검색 태영--%>
<div id="searcharea">
  <div class="search">
    <form action="dohSearch" method="post">
      <input type="search" placeholder="원하시는 의사 및 병원을 입력하세요" name="dhSearch" id="dhSearch"/>
      <button type="submit" id="searchMedical">검색</button>
    </form>
  </div>
</div>


<div style="padding-right: 40px;">
  <div class="d-flex m-3 justify-content-between">
        <span class="my-auto">총
            <c:if test="${not empty doctorList}">${fn:length(doctorList)}</c:if>명</span>
    <div>
      <input type="hidden" name="docListSortOption" id="docListSortOption" value="false">
      <button class="btn btn-secondary rounded-pill">실시간 진료</button>
      <button class="btn btn-warning rounded-pill" onclick={sortByDistance();}>거리순</button>
    </div>
  </div>
  <div class="card p-3">
    <c:if test="${not empty doctorList}">
      <c:forEach var="doctor" items="${doctorList}" varStatus="status">
        <div class="row g-0">
          <div class="col-md-4" style="min-width: 200px; max-width: 200px;">
            <div class="img-wrapper">
                <%--                            <img alt="의사사진 영역"--%>
                <%--                                 src="<c:choose><c:when test="${not empty doctor.doctor_profile_image_name || doctor.doctor_profile_image_name eq ''}">/img/doctorImg/${doctor.doctor_profile_image_name}</c:when>--%>
                <%--                                            <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>--%>
              <img alt="의사사진 영역" src="${doctor.doctor_profile_image_name}"
                   onerror="this.src='https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg'">
            </div>
          </div>
          <div class="col-md-8 card-body">
            <div class="card-title d-flex justify-content-between">
              <div class="d-flex">
                <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name}</h4>
                <span
                  class="pl-3 font-weight-normal align-text-bottom">의사 / ${doctor.doctor_diagnosis_type}</span>
              </div>
              <div class="d-flex">
                <button class="btn btn-secondary ml-auto" onclick="">
                  <i class="fa-solid fa-magnifying-glass">의료진 상세보기</i>
                </button>
                <button class="btn ml-auto" style="background-color: #1abc9c; color: white;"
                        onclick="location.href='/appointmentForm/${doctor.doctor_number}';">
                  <i class="fa fa-check">비대면 진료 예약하기</i>
                </button>

              </div>
            </div>
            <div class="card-text">
              <p class="card-text">
              <table class="table table-borderless">
                <tr>
                  <th>병원이름:</th>
                  <td>${doctor.hospital_name}</td>
                </tr>
                <tr>
                  <th>주소 :</th>
                  <td>${doctor.zip_code} ${doctor.street_address} ${doctor.detail_address}</td>
                </tr>
                <tr>
                  <th>진료시간:</th>
                  <td>
                      ${doctor.working_time}

                  </td>
                </tr>
                <tr>
                  <th>점심시간:</th>
                  <td>
                      ${doctor.lunch_time}
                  </td>
                </tr>
                <tr>
                  <th>휴진:</th>
                  <td>매주 ${doctor.holiday}요일</td>
                </tr>
              </table>
              </p>
            </div>
          </div>
        </div>
        <c:if test="${!status.last}">
          <hr>
        </c:if>
      </c:forEach>
    </c:if>
  </div>
  <nav class="text-center" id="pageList">
    <ul class="pagination justify-content-center">
      <c:choose>
        <c:when test="${pageInfo.page<=1}">
          <li class="page-item"><a class="page-link" href="#">이전</a></li>
          <!-- [이전]&nbsp; -->
        </c:when>
        <c:otherwise>
          <li class="page-item"><a class="page-link"
                                   href="./${place.id }?place_name=${place.place_name }&page=${pageInfo.page-1}">이전</a>
          </li>
        </c:otherwise>
      </c:choose>
      <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
        <c:choose>
          <c:when test="${pageInfo.page==i }">
            <li class="page-item active">
              <a class="page-link" href="#">${i }</a></li>
          </c:when>
          <c:otherwise>
            <li class="page-item"><a class="page-link"
                                     href="./${place.id }?place_name=${place.place_name }&page=${pageInfo.page}">${i }</a>
            </li>

          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:choose>
        <c:when test="${pageInfo.page>=pageInfo.maxPage }">
          <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item"><a class="page-link"
                                   href="./${place.id }?place_name=${place.place_name }&page=${pageInfo.page+1}">다음</a>
          </li>
        </c:otherwise>
      </c:choose>
    </ul>
  </nav>

</div>

<!-- Scripts -->

<%-- 카카오맵 관련 JS --%>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a69fc7ca725d20c3e61c5b6bb3d32242&libraries=services"></script>

<%-- JQuery --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<%-- 거리순 버튼을 클릭하면 현재 나의 위치와 가까운 순으로 의사 리스트가 출력된다. 종호 --%>
<script>
  let myLatitude;
  let myLongitude;

  let geocoder = new kakao.maps.services.Geocoder();

  // 1. 현재 나의 좌표를 가져온다.
  getCurrentPosBtn();

  function locationLoadSuccess(pos) {
    // 현재 위치 받아오기
    var currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);

    myLatitude = pos.coords.latitude;
    myLongitude = pos.coords.longitude;
  };

  function locationLoadError(pos) {
    alert('위치 정보를 가져오는데 실패했습니다.');
  };

  function getCurrentPosBtn() {
    navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);
  };

  // 2. for 문을 돌려 doctor 의 좌표와 나의 좌표로 거리를 구한다.
  let doctors = "${doctorList}";
  let newDoctors = [];

  for (let doctor in doctors) {
    let doctorLatitude;
    let doctorLongitude;
    let distance = Number.MAX_SAFE_INTEGER;

    geocoder.addressSearch(doctor.street_address, (result, status) => {
      if (status === kakao.maps.services.Status.OK) {
        doctorLatitude = result[0].y;
        doctorLongitude = result[0].x;

        distance = Math.sqrt(Math.pow(myLatitude - doctorLatitude, 2) + Math.pow(myLongitude - doctorLongitude, 2));
      }
    });

    doctor.distance = distance;
    newDoctors.push(doctor);
  }

  // 3. 거리의 오름차순으로 정렬한다.
  newDoctors.sort((a, b) => {
    if (a.distance === b.distance) return 0;
    return a.distance > b.distance ? 1 : -1;
  });

  function sortByDistance() {
    // 4. 새로운 의사 배열을 ajax 로 controller 에 전송한다.
    $.ajax({
      type: "get",
      url: "/doctorList/distance",
      data: newDoctors,
      success: function (result) {
        console.log(result);
      }
    });
  }

</script>

<script src="/resources/js/doctorList/jquery.min.js"></script>
<script src="/resources/js/doctorList/jquery.scrollex.min.js"></script>
<script src="/resources/js/doctorList/jquery.scrolly.min.js"></script>
<script src="/resources/js/doctorList/browser.min.js"></script>
<script src="/resources/js/doctorList/breakpoints.min.js"></script>
<script src="/resources/js/doctorList/util.js"></script>
<script src="/resources/js/doctorList/doctorList.js"></script>


</body>

</html>
