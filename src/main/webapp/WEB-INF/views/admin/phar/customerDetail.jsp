<%-- 의사 리스트--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>환자 진료리스트</title>
    <link rel="stylesheet" href="/resources/css/pharCustomerDetail.css"/>

    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        .material-icons {
            font-size: 36px;
        }

        .list-header {
            /*background-color: blue;*/
            height: 200px;
        }

        th, td, tbody {
            text-align: center;
        }

        p {
            padding-top: 10px;
        }

        .table {
            overflow: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="col mt-1">
        <div class="list-header bg-info text-right">
            <h1 id="logo">Homespital</h1>

        </div>

        <p class="text-end fs-4">환자 진료내역</p>

        <div class="card p-3">
            <div class="card-body p-2">
                <div class="text-center table-responsive">
                    <table class="table fs-5">
                        <thead>
                        <tr>
                            <th>날짜/시간</th>
                            <th>환자</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>의사</th>
                            <th>병원</th>
                            <th>배송</th>
                            <th>처방전</th>
                            <th>현황</th>
                        </tr>
                        </thead>
                        <tbody id="pharCustomerlList">
                        <tr>
                            <td>${diagnosis.create_date} / ${diagnosis.diagnosis_time}시</td>
                            <td>${diagnosis.user_name}</td>
                            <td>${diagnosis.gender}</td>
                            <td>${diagnosis.birthday}</td>
                            <td>${diagnosis.doctor_name}</td>
                            <td>${diagnosis.hospital_name}</td>
                            <td id="is_delivery">${diagnosis.is_delivery}</td>
                            <td id="is_prescription_upload">${diagnosis.is_prescription_upload}</td>
                            <td id="diagnosis_status">${diagnosis.diagnosis_status}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>



            <div class="card p-3">
                <h4 class="card-title fs-3"><strong>진료 차트</strong></h4>
                <div class="card-body fs-5" style="padding: 5px; line-height: 33px;">
                    <div><strong>비대면 진료 시간 : ${diagnosis.create_date} / ${diagnosis.diagnosis_time}시</strong></div>
                    <div>생년월일 : ${diagnosis.birthday}</div>
                    <div>주소 :
                        (${diagnosis.user_zip_code}) ${diagnosis.user_street_address} ${diagnosis.user_detail_address}</div>
                    <div>휴대폰 번호 : ${diagnosis.user_phone}</div>
                </div>
                <div style="background:#F9F9F9;">
                    <table class="table table-borderless fs-5">
                        <tbody>
                        <tr>
                            <th>진단 소견서</th>
                            <td>
                                <textarea name="doctor_opinion" style="width: 100%; min-height: 100px; font-size: 18px;" readonly="readonly"
                                          maxlength="500">${diagnosis.doctor_opinion}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="card p-3">
                <h4 class="card-title"><strong>약제 배송 방법</strong></h4>
                <div class="card-body">
                    <div class="d-flex">
                        <c:choose>
                        <c:when test="${diangosis.is_delivery}">
                        <button class="btn-sm btn-warning rounded-pill" type="button">약국으로 직접 방문
                            </c:when>
                            <c:otherwise>
                            <button class="btn-sm btn-warning rounded-pill" type="button">집까지 배송받기</button>
                            </c:otherwise>
                            </c:choose>
                    </div>
                    <div class="d-flex pt-4">
                        <c:choose>
                            <c:when test="${diagnosis.is_delivery}">
                                <div class="d-block w-100">
                                    <h5>내방하실 약국</h5>
                                    <hr>
                                    <div id="pharmacyName">${empty diagnosis.pharmacy_name ? "-" : diagnosis.pharmacy_name}</div>
                                    <div id="pharmacyPhone">${empty diagnosis.pharmacy_phone ? "-" : diagnosis.pharmacy_phone}</div>
                                    <div id="pharmacyAddress">${empty diagnosis.pharmacy_address ? "-" : diagnosis.pharmacy_addres}</div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="d-block w-100">
                                    <h5>보내는 곳 주소</h5>
                                    <hr>
                                    <div id="pharmacyName">${diagnosis.pharmacy_name}</div>
                                    <div id="pharmacyPhone">${diagnosis.pharmacy_phone}</div>
                                    <div id="pharmacyAddress">${diagnosis.pharmacy_address}</div>
                                </div>
                                <div class="d-block w-100">
                                    <h5>받으시는 곳 주소</h5>
                                    <hr>
                                    <div>${diagnosis.user_address}</div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>


            <div class="card p-3">
                <h4 class="card-title"><strong>환자 진료 내역</strong></h4>
                <div class="card-body">
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
                                    <h4 class="pr-3 font-weight-bolder">${diagnosis.doctor_name}</h4>
                                    <span class="pl-3 font-weight-normal align-text-bottom">의사 / ${diagnosis.doctor_diagnosis_type}</span>
                                </div>
                            </div>
                            <div class="card-text">
                                <p class="card-text">
                                <table class="table table-borderless">
                                    <tr>
                                        <th>병원이름:</th>
                                        <td>${diagnosis.hospital_name}</td>
                                    </tr>
                                    <tr>
                                        <th>주소 :</th>
                                        <td>${diagnosis.zip_code} ${diagnosis.street_address} ${diagnosis.detail_address}</td>
                                    </tr>
                                    <tr>
                                        <th>진료시간:</th>
                                        <td>
                                            ${diagnosis.working_time}

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>점심시간:</th>
                                        <td>
                                            ${diagnosis.lunch_time}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>휴진:</th>
                                        <td>매주 ${diagnosis.holiday}요일</td>
                                    </tr>
                                </table>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div>

</div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    <%--$(document).ready(function () {--%>
    <%--    console.log("ready");--%>
    <%--    $.ajax({--%>
    <%--        url: '/docMedicalRecords',--%>
    <%--        type: 'GET',--%>
    <%--        datatype: "json",--%>
    <%--        data: {--%>
    <%--            "doctor_number": ${diagnosis.doctor_number}--%>
    <%--        },--%>
    <%--        success: function (data) {--%>
    <%--        },--%>
    <%--        error: function () {--%>
    <%--            console.log("Error");--%>
    <%--        }--%>
    <%--    })--%>
    <%--})--%>


    //진료예약(아직진료시작X) (diagnosis_status = 0) 일 때  ->> is_prescription_upload = 0 업로드버튼X,
    //진료시작(dagnosis_status = 1)일 때   ->> is_prescription_upload = 1 업로드버튼0,
    //                                   업로드 완료시 is_prescription_upload = 2 업로드완료.
    //진료 종료(diagnosis_status = 3~7) 인데 --> is_prescription_upload가 1이면
    //                                      Controller에서 is_prescription_upload = 3(처방전없음)으로 바꿔준다.
    //처방전 업로드
    let prescription = "";
    if ((${diagnosis.is_prescription_upload}) == 0) {
        prescription = "";
    } else if ((${diagnosis.is_prescription_upload}) == 1) {
        prescription = "<button type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop2_" + (${diagnosis.diagnosis_number}) + " 'id ='prescriptionUpload" + (${diagnosis.diagnosis_number}) + "' class='btn btn-info btn-sm'>처방전업로드</button><br>" +
            '<div class="modal fade" id="staticBackdrop2_' + (${diagnosis.diagnosis_number}) + '" data-bs-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">' +
            '<div class="modal-dialog" role="document">' +
            '<div class="modal-content">' +
            '<div class="modal-header">' +
            '<h5 class="modal-title" id="staticBackdropLabel">처방전 업로드</h5>' +
            '<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">' +
            '<span aria-hidden="true">&times;</span>' +
            '</button>' +
            '</div><form action="prescriptionUpload" method="POST" enctype="multipart/form-data"><div class="modal-body">' +
            "<input type='hidden' name='diagnosis_number' value='" + (${diagnosis.diagnosis_number}) + "'>" +
            '<input type="file" name="prescriptionFile">사진선택</input></div><div class="modal-footer"><button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">닫기</button><button type="submit" class="btn btn-primary upload-btn' + (${diagnosis.diagnosis_number}) + '">확인</button></div></form></div></div></div>';
    } else if ((${diagnosis.is_prescription_upload}) == 2) {
        prescription = "업로드완료";
    } else if ((${diagnosis.is_prescription_upload}) == 3) {
        prescription = "처방전없음";
    }
    $('#is_prescription_upload').html(prescription);
</script>
</html>