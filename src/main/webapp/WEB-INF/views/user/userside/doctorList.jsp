<%--의료진 보기 : 훈/소연/준근--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>의료진 보기</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/doctorList.css"/>
    <link rel="stylesheet" href="/resources/css/sidebar.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>
    a:link, a:visited, a:hover, a:active {
        color: grey;
        text-decoration: none;
    !important
    }

</style>

<body class="is-preload">
<%--side-nav 시작 by 소연 4/7--%>
<div id="sidebar">
    <div class="d-flex flex-column align-items-center">
        <span class="image avatar"><a href="/"><img src="/resources/img/design/logo_U_sideNav.png" alt=""/></a></span>
    </div>
    <nav id="nav">
        <ul>
            <li><a href="/medicalSearch">진료과 선택</a></li>
            <li><a href="/doctorList" class="active">의료진 선택</a></li>
        </ul>
    </nav>
    <footer>
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
        </ul>
    </footer>
</div>
<%--side-nav 끝 by 소연 4/7--%>
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


<%--의사 및 병원 검색 태영--%>
<%--<div id="searcharea">--%>
<%--    <div class="search">--%>
<%--        <form action="dohSearch" method="post">--%>
<%--            <input type="search" placeholder="원하시는 의사 및 병원을 입력하세요" name="dhSearch" id="dhSearch"/>--%>
<%--            <button type="submit" id="searchMedical" class="btn border-dark">검색</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>

<div>
    <h4>의료진을 소개합니다!</h4>
</div>

<div style="padding-right: 40px;">
    <div class="d-flex m-3 justify-content-between">
        <span class="my-auto">총 ${not empty doctorList? fn:length(doctorList) : 0}명</span>
        <div id="searcharea">
            <div class="search">
                <form action="dohSearch" method="post" class="pr-2">
                    <input type="search" placeholder="원하시는 의사 및 병원을 입력하세요" name="dhSearch" id="dhSearch"/>
                    <button type="submit" id="searchMedical" class="btn border border-dark">검색</button>
                </form>
            </div>
        </div>
        <div>
            <input type="hidden" name="docListSortOption" id="docListSortOption" value="false">
            <%--            <button class="btn btn-secondary rounded-pill">실시간 진료</button>--%>
            <button class="btn btn-warning rounded-pill" onclick={sortByDistance();}>거리순</button>
        </div>
    </div>
    <div class="card p-3">
        <c:choose>
            <c:when test="${not empty doctorList && fn:length(doctorList) != 0}">
                <c:forEach var="doctor" items="${doctorList}" varStatus="status">

                    <div class="row">
                        <div class="col" style="min-width: 200px; max-width: 200px;">
                            <div class="img-wrapper">
                                    <%--                            <img alt="의사사진 영역"--%>
                                    <%--                                 src="<c:choose><c:when test="${not empty doctor.doctor_profile_image_name || doctor.doctor_profile_image_name eq ''}">/img/doctorImg/${doctor.doctor_profile_image_name}</c:when>--%>
                                    <%--                                            <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>--%>
                                <img alt="의사사진 영역" src="/resources/img/doctorImg/${doctor.doctor_profile_image_name}"
                                     onerror="this.src='https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg'">
                            </div>
                        </div>
                        <div class="col-md-8 card-body">
                            <div class="card-title d-flex justify-content-between">
                                <div class="d-flex">
                                    <h4 id="docName">${doctor.doctor_name}</h4>
                                    <span
                                            id="docType">의사 / ${doctor.doctor_diagnosis_type}</span>
                                </div>
                                <div class="d-flex">
                                    <button class="btn btn-secondary ml-auto" id="detailBtn"
                                            onclick="location.href='/doctorDetail/${doctor.doctor_number}';">
                                        <i class="fa-solid fa-magnifying-glass">의료진 상세보기</i>
                                    </button>
                                    <button class="btn ml-auto" id="appBtn"
                                            onclick="location.href='/appointmentForm/${doctor.doctor_number}';">
                                        <i class="fa fa-check">비대면 진료 예약하기</i>
                                    </button>

                                </div>
                            </div>
                            <div class="card-text" style="margin-top: -40px; margin-left: 30px;">
                                <p class="card-text">

                                <p class="context">병원이름: ${doctor.hospital_name}</p>

                                <p class="context">주소
                                    : ${doctor.zip_code} ${doctor.street_address} ${doctor.detail_address}</p>

                                <p class="context">진료시간 : ${doctor.working_time}</p>

                                <p class="context">점심시간 : ${doctor.lunch_time}</p>

                                <p class="context">휴진 : 매주 ${doctor.holiday}요일</p>
                                <p class="context"></p>
                                </p>
                            </div>
                        </div>
                    </div>


                    <c:if test="${!status.last}">
                        <hr>
                    </c:if>
                </c:forEach>
            </c:when>

        </c:choose>
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
                                             href="./doctorList?doctor_diagnosis_type=${doctor_diagnosis_type }&page=${pageInfo.page-1}&longitude=${longitude != 0 ? longitude : 0}&latitude=${latitude != 0 ? latitude : 0}">이전</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                <c:choose>
                    <c:when test="${pageInfo.page==i }">
                        <li class="page-item active">
                            <a class="page-link"
                               href="/doctorList?doctor_diagnosis_type=${doctor_diagnosis_type }&page=${i }&longitude=${longitude != 0 ? longitude : 0}&latitude=${latitude != 0 ? latitude : 0}">${i }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link"
                               href="/doctorList?doctor_diagnosis_type=${doctor_diagnosis_type }&page=${i }&longitude=${longitude != 0 ? longitude : 0}&latitude=${latitude != 0 ? latitude : 0}">${i }</a>
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
                                             href="/doctorList?doctor_diagnosis_type=${doctor_diagnosis_type }&page=${pageInfo.page+1}&longitude=${longitude != 0 ? longitude : 0}&latitude=${latitude != 0 ? latitude : 0}">다음</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>

<!-- Scripts -->

<%-- 거리순 버튼을 클릭하면 현재 나의 위치와 가까운 순으로 의사 리스트가 출력된다. 종호 --%>
<script>

    let myLatitude;
    let myLongitude;

    getCurrentPosBtn();

    function locationLoadSuccess(pos) {
        myLatitude = pos.coords.latitude;
        myLongitude = pos.coords.longitude;
    };

    function locationLoadError(pos) {
        alert('위치 정보를 가져오는데 실패했습니다.');
    };

    function getCurrentPosBtn() {
        navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);
    };

    <%--function sortByDistance() {--%>
    <%--    if (`${doctorList.size()}` == 0) {--%>
    <%--        alert('검색 결과가 조회되지 않았습니다.');--%>
    <%--    } else {--%>
    <%--        console.log("Asdasdasd");--%>
    <%--        location.href = "/doctorList?doctor_diagnosis_type=" + ${doctorList.size() == 0 ? '': doctorList.get(0).doctor_diagnosis_type} "&longitude=" + myLongitude + "&latitude=" + myLatitude;--%>
    <%--    }--%>
    <%--}--%>
    <c:if test="${not empty doctorList}">

    function sortByDistance() {
        location.href = "/doctorList?doctor_diagnosis_type=${doctorList.get(0).doctor_diagnosis_type}&longitude=" + myLongitude + "&latitude=" + myLatitude;
    }

    </c:if>

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