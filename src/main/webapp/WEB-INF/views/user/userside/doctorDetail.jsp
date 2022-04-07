<%--의료진 보기 : 훈/소연--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>의료진 상세보기</title>
    <link rel="stylesheet" href="/resources/css/writeMediChartForm.css"/>
</head>
<body>


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
                <h4 class="pr-3 font-weight-bolder">${doctor.doctor_name} &nbsp&nbsp&nbsp&nbsp</h4>
                <span class="pl-3 font-weight-normal align-text-bottom">${doctor.doctor_diagnosis_type}</span>
            </div>
            <div class="card-text">
                <p class="card-text">
                <table class="table table-borderless timetable">
                    <tr>
                        <th>병원이름:</th>
                        <td>${doctor.hospital_name}</td>
                    </tr>
                    <tr>
                        <th>홈페이지:</th>
                        <td>
                            <c:choose>
                                <c:when test="${not empty doctor.hospital_url}">
                                    <a href="${doctor.hospital_url}">${doctor.hospital_url}</a>
                                </c:when>
                                <c:otherwise>홈페이지 없음</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>휴진:</th>
                        <td>${doctor.holiday}요일</td>
                    </tr>
                </table>
                </p>
            </div>
        </div>
        <div class="card p-3">
            <h3 class="card-title">의료진 소개</h3>
            <h5>의료진 설명</h5>
            <p>${doctor.doctor_introduction}</p>
            <h5>의료진 학력</h5>
            <p>${doctor.doctor_education}</p>
            <h5>의료진 논문</h5>
            <p>${doctor.doctor_thesis}</p>
        </div>
        <%--        <hr>--%>
        <%--        <label><input type="checkbox" name="naebangChecked"> 확인 했어요</label>--%>

    </div>
</body>
</html>
