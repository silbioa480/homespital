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
<%--헤드라인--%>
<div><h1><strong>나의 진료 내역 보기</strong></h1></div>
<%--표 상단의 제목 출력/JS--%>
<div class="col mt-5">
    <div class="card">
        <div class="card-body p-4">
            <div class="text-center table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>날짜/시간</th>
                        <th>진료과</th>
                        <th>의사이름</th>
                        <th>병원이름</th>
                        <th>진료영수증</th>
                        <th>진료현황</th>
                    </tr>
                    </thead>
                    <tbody id="myMedicalList">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


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
                <h4 class="pr-3 font-weight-bolder">김돌팔${doc.doctor_name}</h4>
                <span class="pl-3 font-weight-normal align-text-bottom">의사/${doctor.doctor_diagnosis_type}</span>
            </div>
            <div class="card-text">
                <p class="card-text">
                <table class="table table-borderless timetable">
                    <tr>
                        <th>병원이름:</th>
                        <td>el태그로 병원이름${doctor.hospital_name}</td>
                    </tr>
                    <tr>
                        <th>주소 :</th>
                        <td>el태그로 병원주소${doctor.hospital_address}</td>
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
                            <%--오전12시~오후 1시 쿼리문~!!! ㅋㄷ--%>
                        </td>
                    </tr>
                    <tr>
                        <th>휴진:</th>
                        <td>매주 ${doctor.holiday}</td>
                    </tr>
                    <tr>
                        <th>비대면 진료 시간:</th>
                        <td>
                            <%--여기에 비대면 진료 내가 한 시간 넣는다 --%>
                        </td>
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
                <h4 class="pr-3 font-weight-bolder">환자이름 출력 부분${user.user_name}</h4>
                <span class="pl-3 font-weight-normal align-text-bottom">만 ${user.user_registration_number}세(${user.user_registration_number}</span>
                <%--만 나이 출력 쿼리 + 성별 출력 쿼리 from 주민등록번호 --%>
            </div>
            <div class="card-text">
                <p class="card-text">
                <table class="table table-borderless timetable">
                    <tr>
                        <th>생년월일:</th>
                        <td>
                            <%--주민등록 번호를 사용, YYYY-MM-DD 출력 쿼리 만들기 --%>
                        </td>
                    </tr>
                    <tr>
                        <th>주소 :</th>
                        <td>el태그로 환자주소${user.user_address}</td>
                    </tr>
                    <tr>
                        <th>핸드폰 번호:</th>
                        <td>
                            <%--핸드폰 번호에 하이픈 붙어 나오는 쿼리문 작성하기--%>
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
            <div><h4><strong>증상</strong></h4></div>
            <%-- 증상 출력--%>

            <div><h4><strong>증상 이미지</strong></h4></div>
            <%-- 증상 이미지 출력--%>

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
            <div><h5><strong>환자이름 ${user.user_name}</strong></h5></div>


            <div><h4><strong>결제정보</strong></h4></div>
            <%-- 결제정보 출력--%>

        </div>
    </div>
</div>


<%--2nd pri 의사쌤 리뷰 부분--%>
<%--2nd pri 사이트 리뷰 부분--%>


</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>


    //나의 진료 내역 출력
    $(function () {
        $.ajax({
            url: '/medicalRecordsList',
            type: 'GET',
            datatype: "json",
            data: {
                "user_number": ${diagnosis.user_number}
            },
            success: function (data) {
                console.log(data);


                $.each(data, function (index, item) {

                    //data에서 create_date를 받아와 해당날짜의 요일을 만들어준다.
                    var old_date = data[index].create_date;
                    var date = old_date.slice(0, 10)
                    var week = ['일', '월', '화', '수', '목', '금', '토'];
                    var dayOfWeek = week[new Date(date).getDay()];
                    // console.log(week);
                    // console.log(old_date);
                    // console.log(date);
                    // console.log(dayOfWeek);


                    //진료완료, 진료중 표시 및 대기/예약취소하기 버튼
                    let complete = "";
                    if (item.is_diagnosis_complete == 0) {
                        complete = "<button type='button' id='completeBtn' class='completeBtn' onclick='deleteBtn(" + item.diagnosis_number + ");'>대기/예약취소하기</button>";
                    } else if (item.is_diagnosis_complete == 1) {
                        complete = "진료완료";
                    } else {
                        complete = "진료중";
                    }

                    // 진료영수증이 있으면 내려받기 버튼 생성, 없으면 공백
                    let upload = "";
                    if (item.is_prescription_upload == true) {
                        upload = "<button type='button' id ='uploadBtn' class='uploadBtn'>내려받기</button>"
                    } else {
                        upload = "";
                    }
                    // 나의 진료 내역 테이블 생성
                    $("#myMedicalList").append("<tr><td>" + date + " (" + dayOfWeek + ") <br>" + item.diagnosis_time + ":00</td>" +
                        "<td>" + item.diagnosis_type + "</td>" +
                        "<td>" + item.doctor_name + "</td>" +
                        "<td>" + item.hospital_name + "</td>" +
                        "<td>" + upload + "</td>" +
                        "<td>" + complete + "</td></tr><br>);"
                    );
                })
            }
        })
    })


</script>
</html>
