<%-- 소연 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>나의 진료 내역 보기</title>
    <%--  파일 업로드 CSS  --%>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/css/writeMediChartForm.css"/>


</head>
<body>
<div class="container">
    <%--헤드라인--%>
    <div><h1><strong>나의 진료 내역 보기</strong></h1></div>
    <%--진료 예약 내역 - 소제목--%>
    <div><h4><strong>진료 예약 내역</strong></h4></div>
    <%--doctor detail 넣고--%>
    <div class="card p-3">
        <div class="row g-0">
            <div class="col-md-4" style="min-width: 200px; max-width: 200px;">
                <div class="img-wrapper">
                    <img alt="의사사진 영역"
                         src="<c:choose><c:when test="${doctor.doctor_profile_image_name}">/img/doctorImg/${doctor.doctor_profile_image_name}</c:when>
                                <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>
                </div>
                <button class="btn btn-secondary ml-auto"
                        onclick="location.href='/doctorDetail/${doctor.doctor_number}';">
                    <i class="fa-solid fa-magnifying-glass">의료진 상세보기</i>
                </button>
                <button class="btn ml-auto" style="background-color: #1abc9c; color: white;"
                        onclick="location.href='/appointmentForm/${doctor.doctor_number}';">
                    <i class="fa fa-check">재예약 하기</i>
                </button>
            </div>
            <div class="col-md-8 card-body">
                <div class="card-title d-flex">
                    <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name}</h4> &nbsp;&nbsp;
                    <span class="pl-3 font-weight-normal align-text-bottom">의사/${doctor.doctor_diagnosis_type}</span>
                </div>
                <div class="card-text">
                    <p class="card-text">
                    <table class="table table-borderless timetable">
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
    </div>
    <br>


    <%--진료 챠트-소제목 --%>
    <div><h4><strong>진료 차트</strong></h4></div>
    <%--(위와 form비슷하게) 환자의 정보 출력하는 창 만든다 from 환자의 정보 DB--%>
    <div class="card p-3">
        <div class="row g-0">
            <div class="col-md-8 card-body">
                <div class="card-title d-flex">
                    <h5><strong>비대면 진료시간 : </strong></h5> &nbsp;&nbsp;
                    <span><h5>${confirmTime}</h5></span>
                </div>
                <div class="card-title d-flex p-1">
                    <h3 class="pr-3 font-weight-bolder">${user.user_name}</h3> &nbsp;&nbsp;
                    <span class="pl-3 font-weight-normal align-text-bottom"> 만 ${age}세/ ${gender}</span>
                </div>

                <div class="card-text">
                    <p class="card-text">
                    <table class="table table-borderless timetable">
                        <tr>
                            <th>생년월일:</th>
                            <td>
                                ${year}-${month}-${date}
                                <%--주민등록 번호를 사용, YYYY-MM-DD 출력 만들기 --%>
                            </td>
                        </tr>
                        <tr>
                            <th>주소 :</th>
                            <td>${user.zip_code} ${user.street_address} ${user.detail_address}</td>
                        </tr>
                        <tr>
                            <th>핸드폰 번호:</th>
                            <td>
                                ${user.user_phone}
                            </td>
                        </tr>
                    </table>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <%--appointmentForm에서 쓴 증상, 이미지 출력 --%>

    <div class="card-body">
        <div class="card border-right">
            <div class="card-header justify-content-between">
                <div>
                    <h4><strong>증상</strong></h4>
                    <p>${diagnosis.diagnosis_content}</p>
                </div>
                <%-- 증상 출력--%>

                <div>
                    <h4><strong>증상 이미지</strong></h4>


                </div>
                <%-- 증상 이미지 출력--%>
                <img src="/resources/img/symptomsImg/${diagnosis.diagnosis_image_name}">
            </div>
        </div>
    </div>


    <%--의사가 쓴 진단 소견서 내용을 출력--%>
    <div><h4><strong>진단 소견서</strong></h4></div>
    <%--진단 소견서 출력--%>
    <p>${diagnosis.diagnosis_file_name}</p>


    <%--약제 배송 방법-소제목--%>
    <div><h4><strong>약제 배송 방법</strong></h4></div>

    <c:choose>
        <c:when test="${diagnosis.is_delivery == 0}">
            <div class="card-body">
                <div class="card border-right">
                    <div class="card-header justify-content-between">
                        <div class="row mb-2">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-secondary">약국내방</button>
                            </div>
                        </div>

                        <label>약국 주소</label>
                        <hr>
                        <div><h5><strong>${pharmacy.pharmacy_name}</strong></h5></div>
                        <p>${pharmacy.zip_code} ${pharmacy.street_address} ${pharmacy.detail_address}</p>
                        <br>


                        <div><h4><strong>결제정보</strong></h4></div>
                            <%-- 결제정보 출력--%>

                    </div>
                </div>
            </div>


        </c:when>
        <c:when test="${diagnosis.is_delivery == 1}">
            <div class="card-body">
                <div class="card border-right">
                    <div class="card-header justify-content-between">
                        <div class="row mb-2">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-secondary">배송</button>
                            </div>
                        </div>

                        <label>보내는 곳 주소</label>
                        <hr>
                        <div><h5><strong>${pharmacy.pharmacy_name}</strong></h5></div>
                        <p>${pharmacy.zip_code} ${pharmacy.street_address} ${pharmacy.detail_address}</p>
                        <br>


                        <label>받으신 곳 주소</label>
                        <hr>
                        <div><h5><strong>${user.user_name}</strong></h5></div>
                        <p>${user.zip_code} ${user.street_address} ${user.detail_address}</p> <br>


                        <div><h4><strong>결제정보</strong></h4></div>
                            <%-- 결제정보 출력--%>

                    </div>
                </div>
            </div>


        </c:when>

    </c:choose>


    <%--약제 배송 방법 출력하기(+결제정보도) from appointmentForm--%>


    <%--2nd pri 의사쌤 리뷰 부분--%>
    <%--2nd pri 사이트 리뷰 부분--%>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


</script>
</html>
