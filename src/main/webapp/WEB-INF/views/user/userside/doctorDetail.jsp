<%--의료진 보기 : 훈/소연--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>의료진 상세보기</title>
    <link rel="stylesheet" href="/resources/css/doctorListDetail.css"/>
</head>
<body>


<div class="card p-3" id="session1">
    <div class="row g-0">
        <div class="col-md-4" style="min-width: 200px; max-width: 200px;">
            <div class="img-wrapper">
                <img alt="의사사진 영역"
                     src="/resources/img/doctorImg/${doctor.doctor_profile_image_name}">
                <%--                <c:choose><c:when test="--%>

                <%--</c:when>--%>
                <%--                                <c:otherwise>https://img.freepik.com/free-photo/portrait-of-asian-doctor-woman-cross-arms-standing-in-medical-uniform-and-stethoscope-smiling-at-camera-white-background_1258-83220.jpg</c:otherwise></c:choose>"/>--%>
            </div>
        </div>
        <div class="col-md-8 card-body">
            <div class="card-title d-flex">
                <h4 class="name">${doctor.doctor_name} &nbsp&nbsp&nbsp&nbsp</h4>
                <span class="type">${doctor.doctor_diagnosis_type}</span>
            </div>
            <div class="card-text">
                <p class="card-text">

                <p>병원이름 : ${doctor.hospital_name}</p>
                <p>병원주소 : ${doctor.detail_address}</p>
                <p>진료시간 : ${doctor.working_time}</p>
                <p>점심시간 : ${doctor.lunch_time}</p>
                <p>정기휴무 : 매주 ${doctor.holiday}요일</p>
                <p>팩스번호 : ${doctor.hospital_fax}</p>
                <p>홈페이지:
                    <c:choose>
                        <c:when test="${not empty doctor.hospital_url}">
                            <a href="${doctor.hospital_url}">${doctor.hospital_url}</a>
                        </c:when>
                        <c:otherwise>홈페이지 없음</c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
        <div class="card p-3">
            <%--            <div>--%>
            <%--                <h3 class="card-title">의료진 소개</h3>--%>
            <%--                <img src="/resources/img/doctorImg/${doctor.doctor_introduction}" onerror="this.src='https://via.placeholder.com/300x100/000000/808080?Text=No+Image+Available'"></img>--%>
            <%--            </div>--%>
            <div>
                <h3 class="card-title">병원소개</h3>
                <img src="/resources/img/hospitalImg/${doctor.hospital_file_name}"
                     onerror="this.src='https://via.placeholder.com/300x100/000000/808080?Text=No+Image+Available'"></img>
            </div>
        </div>
        <%--        <hr>--%>
        <%--        <label><input type="checkbox" name="naebangChecked"> 확인 했어요</label>--%>

    </div>
</div>
</body>
</html>
