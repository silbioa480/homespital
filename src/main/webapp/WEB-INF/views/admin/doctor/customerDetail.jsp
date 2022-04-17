<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %><%-- 의사 리스트--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    HashMap<String, Object> diagnosis = (HashMap<String, Object>) request.getAttribute("diagnosis");
    String imageStr = (String) diagnosis.get("diagnosis_image_name");
    List<String> images = new ArrayList<>(Arrays.asList(imageStr.split(",")));
    List<String> sorted = new ArrayList<>();
    for (int i = 0; i < images.size(); i++) {
        if (!(images.get(i).trim().equals("") || images.get(i).trim().equals(" ") || images.get(i).trim().isEmpty()))
            sorted.add(images.get(i));
    }
    pageContext.setAttribute("images", sorted);
%>

<html>
<head>
    <title>의사 진료리스트</title>
    <link rel="stylesheet" href="/resources/css/pharCustomerDetail.css"/>
    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="col my-3">
        <div class="list-header text-center" id="doctorBanner">
            <h1 id="logo">Homespital</h1>

        </div>

        <p class="text-end fs-4">진료 상세내역</p>

        <div class="card p-3">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table ">
                        <thead>
                        <tr>
                            <th>날짜/시간</th>
                            <th>순번</th>
                            <th>환자성함</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>진료영수증</th>
                            <th>처방전</th>
                            <th>진료현황</th>
                        </tr>
                        </thead>
                        <tbody id="docMedicalList">
                        <tr>
                            <td>
                                <%--                                <%= new SimpleDateFormat("yyyy-MM-dd").format(((Date) ((HashMap<String, Object>) request.getAttribute("diagnosis")).get("create_date"))) %>--%>
                                ${diagnosis.create_date} ${diagnosis.diagnosis_time}시
                            </td>
                            <td>${diagnosis.diagnosis_wait_number}</td>
                            <td>${diagnosis.user_name}</td>
                            <td>${diagnosis.gender}</td>
                            <td>${diagnosis.birthday}</td>
                            <td id="is_diagnosis_upload">${diagnosis.is_diagnosis_upload}</td>
                            <td id="is_prescription_upload">${diagnosis.is_prescription_upload}</td>
                            <td id="diagnosis_status">${diagnosis.diagnosis_status}</td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card p-3">
                <h4 class="card-title"><strong>진료 차트</strong></h4>
                <div class="card-body">
                    <div><strong>비대면 진료 시간 : ${diagnosis.create_date} ${diagnosis.diagnosis_time}시</strong></div>
                    <div>생년월일 : ${diagnosis.birthday}</div>
                    <div>주소 :
                        (${diagnosis.user_zip_code}) ${diagnosis.user_street_address} ${diagnosis.user_detail_address}</div>
                    <div>휴대폰 번호 : ${diagnosis.user_phone}</div>
                </div>
                <div style="background:#F9F9F9;">
                    <table class="table table-borderless m-4 fs-5">
                        <tbody>
                        <tr style="height: 40px; margin-bottom: 50px;">
                            <th>증상</th>
                            <td>${diagnosis.diagnosis_content}</td>
                        </tr>

                        <tr>
                            <th>증상 이미지</th>
                            <td>
                                <c:forEach var="image" items="${images}">
                                    <img src="/resources/img/uploadImg/${image}"
                                         style="max-width:270px; max-height:600px;"
                                         onerror="this.src='https://via.placeholder.com/500/000000/FFFFFF/?text=Error...+NoImgSelected'">
                                </c:forEach>
                            </td>
                        </tr>
                        <c:if test="${diagnosis.diagnosis_status >=3}">
                            <tr>
                                <th>진단 소견서</th>
                                <td>
                                <textarea name="doctor_opinion" style="width: 100%; min-height: 100px;"
                                          maxlength="500">${diagnosis.doctor_opinion}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>검진 비용</th>
                                <td>
                                    <div class="input-group">
                                        <span class="input-group-text">비용</span>
                                        <input type="number" class="form-control" name="diagnosis_money"
                                               value="${diagnosis_money}" min="0">
                                    </div>
                                </td>
                            </tr
                            <c:if test="${diagnosis.diagnosis_status eq 3}">
                                <tr>
                                    <th>
                                        진단 소견서 / 검진 비용 제출
                                    </th>
                                    <td>
                                        <button type="button" id="submitDoctorOpinion">제출하기</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card p-3">
                <h4 class="card-title fs-4"><strong>약제 배송 방법</strong></h4>
                <div class="card-body">
                    <div class="d-flex">
                        <c:choose>
                        <c:when test="${diangosis.is_delivery}">
                        <button class="btn-sm btn-warning rounded-pill" type="button">약국으로 직접 방문
                            </c:when>
                            <c:otherwise>
                            <button class="btn-sm btn-warning rounded-pill" id="deiliveryBtn" type="button">집까지 배송받기
                            </button>
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

        </div>
    </div>
</div>
<div>

</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $("#submitDoctorOpinion").on('click', function () {
        if ($("textarea[name='doctor_opinion']:visible").val() != "" && $("input[name='diagnosis_money']").val() != 0) {
            $.ajax({
                url: "/doctor/writeOpinion",
                method: "POST",
                data: {
                    "diagnosis_number": ${diagnosis.diagnosis_number},
                    "doctor_opinion": $("textarea[name='doctor_opinion']:visible").val(),
                    "diagnosis_money": $("input[name='diagnosis_money']").val(),
                },
                async: false,
                success: function (data) {
                    alert("소견 및 금액 등록 완료");
                    window.location.reload();
                },
                error: function () {
                    alert("소견 및 금액 등록 실패");
                }
            });
        } else alert('소견서나 금액이 작성되지 않았습니다. 작성 후에 제출해주세요.');
    })
</script>
<script>
    //진료완료, 진료중 표시 및 대기/예약취소하기 버튼
    let complete = "";
    if ((${diagnosis.diagnosis_status}) == 0) {
        complete = "<button type='button' id='startBtn' class='btn btn-sm h-75' onclick='startBtn(" + (${diagnosis.diagnosis_number}) + ");'>진료시작하기</button>";
    } else if ((${diagnosis.diagnosis_status}) == 1) {
        complete = "<button type='button' id='finishBtn' class='btn btn-sm h-75' onclick='finishBtn(" + (${diagnosis.diagnosis_number}) + ");'>진료중/완료하기</button>";
    } else if ((${diagnosis.diagnosis_status}) == 2) {
        complete = "예약취소";
    } else if ((${diagnosis.diagnosis_status}) >= 3) {
        complete = "진료완료";
    }
    $('#diagnosis_status').html(complete);

    //진료예약(아직진료시작X) (diagnosis_status = 0) -> is_diagnosis_upload = 0 업로드버튼X,
    //진료시작했을 떄, (diagnosis_status = 1) -> is_diagnosis_upload = 1 업로드버튼O,
    //진료영수증 업로드 안하고 진료완료버튼 실행시 -> finishBtn()에서 유효성 처리되어 진료완료처리X.
    //진료영수증 업로드
    let receipt = "";
    if ((${diagnosis.is_diagnosis_upload}) == 0) {
        receipt = "";
    } else if ((${diagnosis.is_diagnosis_upload}) == 1) {
        receipt = "<button type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop" + ${diagnosis.diagnosis_number} +" 'id ='receiptUpload" + ${diagnosis.diagnosis_number} +"' class='btn btn-info btn-sm h-75'>영수증업로드</button><br>" +
            '<div class="modal fade" id="staticBackdrop' + ${diagnosis.diagnosis_number} +'" data-bs-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">' +
            '<div class="modal-dialog" role="document">' +
            '<div class="modal-content">' +
            '<div class="modal-header">' +
            '<h5 class="modal-title" id="staticBackdropLabel">진료 영수증 업로드</h5>' +
            // '<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">' +
            // '<span aria-hidden="true">&times;</span>' +
            '</button>' +
            '</div><form action="/doctor/receiptUpload" method="POST" enctype="multipart/form-data"><div class="modal-body">' +
            "<input type='hidden' name='diagnosis_number' value='" + ${diagnosis.diagnosis_number} +"'>" +
            '<input type="file" accept=".gif, .jpg, .png" name="receiptFile">사진선택</input></div><div class="modal-footer"><button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">닫기</button><button type="submit" class="btn btn-primary upload-btn' + (${diagnosis.diagnosis_number}) + '">확인</button></div></form></div></div></div>'
    } else if ((${diagnosis.is_diagnosis_upload}) == 2) {
        receipt = "업로드완료";
    }
    $('#is_diagnosis_upload').html(receipt);

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
        prescription = "<button type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop2_" + (${diagnosis.diagnosis_number}) + " 'id ='prescriptionUpload" + (${diagnosis.diagnosis_number}) + "' class='btn btn-info btn-sm h-75'>처방전업로드</button><br>" +
            '<div class="modal fade" id="staticBackdrop2_' + (${diagnosis.diagnosis_number}) + '" data-bs-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">' +
            '<div class="modal-dialog" role="document">' +
            '<div class="modal-content">' +
            '<div class="modal-header">' +
            '<h5 class="modal-title" id="staticBackdropLabel">처방전 업로드</h5>' +
            // '<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">' +
            // '<span aria-hidden="true">&times;</span>' +
            '</button>' +
            '</div><form action="/doctor/prescriptionUpload" method="POST" enctype="multipart/form-data"><div class="modal-body">' +
            "<input type='hidden' name='diagnosis_number' value='" + (${diagnosis.diagnosis_number}) + "'>" +
            '<input type="file" accept=".gif, .jpg, .png" name="prescriptionFile">사진선택</input></div><div class="modal-footer"><button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">닫기</button><button type="submit" class="btn btn-primary upload-btn' + (${diagnosis.diagnosis_number}) + '">확인</button></div></form></div></div></div>';
    } else if ((${diagnosis.is_prescription_upload}) == 2) {
        prescription = "업로드완료";
    } else if ((${diagnosis.is_prescription_upload}) == 3) {
        prescription = "처방전없음";
    }
    $('#is_prescription_upload').html(prescription);
</script>
<script>
    // 진료 시작하기
    //진료시작시 문자전송 + 카카오 오픈링크 태영
    function startBtn(e) {
        console.log()
        if (confirm("진료를 시작하시겠습니까?") == true) {
            $.ajax({
                url: "/doctor/startDiagnosis",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log(data);
                    console.log("진료 시작 성공 : " + e)
                    window.open("https://homespital.herokuapp.com/meeting");
                    location.href = "${pageContext.request.contextPath}/doctor/customerDetail/${diagnosis.diagnosis_number}";
                },
            })
        } else {
            return;
        }
    }

    // 진료 완료하기
    function finishBtn(e) {
        if (${empty diagnosis.diagnosis_money || empty diagnosis.doctor_opinion}) {
            alert('진단 소견서와 검진 비용이 등록되지 않았습니다.');
            return;
        }
        if (confirm("진료를 완료하시겠습니까?") == true) {
            $.ajax({
                url: "/doctor/finishDiagnosis",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    if (data === "success") {
                        console.log(data);
                        console.log("진료 완료 성공 : " + e)
                        location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                    } else if (data === "failed") {
                        alert("진료영수증이 업로드 되지 않았습니다. 진료영수증을 업로드 후 다시 실행해주세요.")
                        location.href = "${pageContext.request.contextPath}/doctor/customerDetail/${diagnosis.diagnosis_number}";
                    }
                },
            })
        } else {
            return;
        }
    }
</script>
</html>