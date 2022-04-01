<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<section id="header">
    <header>
        <span class="image avatar"><img src="/resources/img/doctorList/doctor01.jpg" alt=""/></span>
        <h1 id="logo"><a href="#">Homespital</a></h1>
        <p>Hi</p>

    </header>
    <nav id="nav">
        <ul>
            <li><a href="#one" class="active">필수정보입력</a></li>
            <li><a href="#two">주소 입력</a></li>
            <li><a href="#three">결제 정보 입력</a></li>
            <li><a href="#four">약관동의</a></li>
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
</section>

<!-- Wrapper -->
<div id="wrapper">
    <div class="m-3">
        <input type="hidden" name="docListSortOption" id="docListSortOption" value="false">
        <button class="btn btn-secondary rounded-pill">실시간 진료</button>
        <button class="btn btn-warning rounded-pill">거리순</button>
    </div>
    <div class="card p-3">
        <c:if test="${not empty doctorList}">
            <c:forEach var="doctor" items="doctorList">
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
                            <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name}</h4>
                            <span class="pl-3 font-weight-normal align-text-bottom">의사/${doctor.doctor_diagnosis_type}</span>
                            <button class="btn btn-secondary">
                                <i class="fa-solid fa-magnifying-glass">의료진 상세보기</i>
                            </button>
                        </div>
                        <div class="card-text">
                            <p class="card-text">
                            <table class="table table-borderless">
                                <tr>
                                    <th>병원이름:</th>
                                    <td>${doctor.hospital_name}</td>
                                </tr>
                                <tr>
                                    <th>진료시간:</th>
                                    <td>${doctor.working_time}</td>
                                </tr>
                                <tr>
                                    <th>휴진:</th>
                                    <td>${doctor.holiday}</td>
                                </tr>
                            </table>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>


</div>

<!-- Footer -->
<section id="footer">
    <div class="container">
        <ul class="copyright">
            <li>&copy; Untitled. All rights reserved.</li>
            <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
        </ul>
    </div>
</section>

</div>

<!-- Scripts -->
<script src="/resources/js/doctorList/jquery.min.js"></script>
<script src="/resources/js/doctorList/jquery.scrollex.min.js"></script>
<script src="/resources/js/doctorList/jquery.scrolly.min.js"></script>
<script src="/resources/js/doctorList/browser.min.js"></script>
<script src="/resources/js/doctorList/breakpoints.min.js"></script>
<script src="/resources/js/doctorList/util.js"></script>
<script src="/resources/js/doctorList/doctorList.js"></script>


</body>

</html>
