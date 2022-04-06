<%-- 소연 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            </div>
            <div class="col-md-8 card-body">
                <div class="card-title d-flex">
                    <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name}</h4>
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
                            <td>${doctor.hospital_address}</td>
                        </tr>
                        <tr>
                            <th>진료시간:</th>
                            <td>
                                <%--오전9시~ 오전 6시 쿼리문~!!! ㅋㄷ--%>
                            </td>
                        </tr>
                        <tr>
                            <th>점심시간:</th>
                            <td>
                                ${doctor.lunch_time}시~ ${doctor.lunch_time + 1}시
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


    <%--진료 챠트-소제목 --%>
    <div><h4><strong>진료 차트</strong></h4></div>
    <%--(위와 form비슷하게) 환자의 정보 출력하는 창 만든다 from 환자의 정보 DB--%>
    <div class="card p-3">
        <div class="row g-0">
            <div class="col-md-8 card-body">
                <div class="card-title d-flex">
                    <h3 class="pr-3 font-weight-bolder">${user.user_name}</h3>
                    <p>만 ${age}세/ ${gender}</p>

                    <%--만 나이 출력 쿼리 + 성별 출력 쿼리 from 주민등록번호 --%>
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
                            <td>${user.user_address}</td>
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
                <p>${diagnosis.diagnosis_image_name}</p>

            </div>
        </div>
    </div>


    <%--의사가 쓴 진단 소견서 내용을 출력--%>
    <div><h4><strong>진단 소견서</strong></h4></div>
    <%--진단 소견서 출력--%>


    <%--약제 배송 방법-소제목--%>
    <div><h4><strong>약제 배송 방법</strong></h4></div>
    <%--약제 배송 방법 출력하기(+결제정보도) from appointmentForm--%>
    <div class="card-body">
        <div class="card border-right">
            <div class="card-header justify-content-between">
                <div class="row mb-2">
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-secondary">
                            ${bestbragList[0].is_delivery ? "배송" : "약국내방"}</button>
                        <%--diagnosis.is_delivery  이부분 쿼리 있을껄 지금 배송 true/false 알아내는 쿼리 가져오기 list명 변경--%>
                    </div>
                </div>

                <label>보내는 곳 주소</label>
                <hr>
                <div><h5><strong>약국주소</strong></h5></div>


                <label>받으신 곳 주소</label>
                <hr>
                <div><h5><strong>환자이름: ${user.user_name}</strong></h5></div>


                <div><h4><strong>결제정보</strong></h4></div>
                <%-- 결제정보 출력--%>

            </div>
        </div>
    </div>


    <%--2nd pri 의사쌤 리뷰 부분--%>
    <%--2nd pri 사이트 리뷰 부분--%>

</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>


</script>
</html>
