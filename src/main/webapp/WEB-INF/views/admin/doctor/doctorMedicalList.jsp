<%-- 의사 리스트--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>의사 진료리스트</title>
    <link rel="stylesheet" href="/resources/css/pharCustomerDetail.css"/>
    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="col mt-3">
        <div class="list-header text-center" id="doctorBanner">
            <h1 id="logo">Homespital</h1>
        </div>

        <p class="text-end fs-4">환자 진료내역</p>

        <div class="card p-3">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table">
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
                            <th>상세보기</th>
                        </tr>
                        </thead>
                        <tbody id="docMedicalList">
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        let page = 0;
        let loading = false;
        let list = null;


        console.log("ready");

        $.ajax({
            url: '/doctor/docMedicalRecords',
            type: 'GET',
            datatype: "json",
            data: {
                "doctor_number": ${doctor.doctor_number}
            },
            success: function (data) {
                console.log(data);
                list = data;
                next_load(list);
            },
            error: function () {

            }
        })

        //10초마다 새로운 예약이 들어오면 데이터 갱신 태영
        setInterval(function () {
            $.ajax({
                url: '/doctor/docMedicalRecords',
                type: 'GET',
                datatype: "json",
                data: {
                    "doctor_number": ${doctor.doctor_number}
                },
                success: function (data) {
                    console.log(list);
                    console.log(data);
                    if (list.toString() != data.toString()) {
                        alert("비대면 진료가 예약되었습니다.");
                        list = data;
                        window.location.reload();
                    }
                },
                error: function () {

                }
            })
        }, 10000);


        function next_load(list) {
            list.sort((a, b) => {
                return a.diagnosis_status - b.diagnosis_status;
            })

            $.each(list, function (index, item) {
                if (index >= page * 30 && index < page * 30 + 30) {
                    //data에서 create_date를 받아와 해당날짜의 요일을 만들어준다.
                    var old_date = list[index].create_date;
                    var date = old_date.slice(0, 10)
                    var week = ['일', '월', '화', '수', '목', '금', '토'];
                    var dayOfWeek = week[new Date(date).getDay()];

                    //data에서 user_registraion_number를 받아와 성별을 만들어준다.
                    let old_registration = list[index].user_registration_number;
                    let gender = old_registration.substring(7, 8);

                    if (gender === '1' || gender === '3') {
                        gender = "남";
                    } else if (gender === '2' || gender === '4') {
                        gender = "여";
                    }

                    // 환자 주민번호가 db에는 1******, 2******로 들어가지만 프론트에서 한번 더 처리해준다.
                    let birth = old_registration.substr(0, 8);
                    birth = birth + "******";

                    //진료완료, 진료중 표시 및 대기/예약취소하기 버튼
                    let complete = "";
                    if (item.diagnosis_status == 0) {
                        complete = "<button type='button' id='startBtn' class='btn btn-sm h-75' onclick='startBtn(" + item.diagnosis_number + ");'>진료시작하기</button>";
                    } else if (item.diagnosis_status == 1) {
                        complete = "<button type='button' id='finishBtn' class='btn btn-sm h-75' onclick='finishBtn(" + item.diagnosis_number + ");'>진료중/완료하기</button>";
                    } else if (item.diagnosis_status == 2) {
                        complete = "예약취소";
                    } else if (item.diagnosis_status == 3) {
                        complete = "진료완료";
                    } else if (item.diagnosis_status == 4) {
                        complete = "진료완료";
                    } else if (item.diagnosis_status == 5) {
                        complete = "진료완료";
                    } else if (item.diagnosis_status == 6) {
                        complete = "진료완료";
                    } else if (item.diagnosis_status == 7) {
                        complete = "진료완료";
                    }


                    //진료예약(아직진료시작X) (diagnosis_status = 0) -> is_diagnosis_upload = 0 업로드버튼X,
                    //진료시작했을 떄, (diagnosis_status = 1) -> is_diagnosis_upload = 1 업로드버튼O,
                    //진료영수증 업로드 안하고 진료완료버튼 실행시 -> finishBtn()에서 유효성 처리되어 진료완료처리X.
                    //진료영수증 업로드
                    let receipt = "";
                    if (item.is_diagnosis_upload == 0) {
                        receipt = "";
                    } else if (item.is_diagnosis_upload == 1) {
                        receipt = "<button type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop" + item.diagnosis_number + " 'id ='receiptUpload" + item.diagnosis_number + "' class='btn btn-info btn-sm h-75'>영수증업로드</button><br>" +
                            '<div class="modal fade" id="staticBackdrop' + item.diagnosis_number + '" data-bs-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">' +
                            '<div class="modal-dialog" role="document">' +
                            '<div class="modal-content">' +
                            '<div class="modal-header">' +
                            '<h5 class="modal-title" id="staticBackdropLabel">진료 영수증 업로드</h5>' +
                            // '<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">' +
                            // '<span aria-hidden="true">&times;</span>' +
                            '</button>' +
                            '</div><form action="receiptUpload" method="POST" enctype="multipart/form-data"><div class="modal-body">' +
                            "<input type='hidden' name='diagnosis_number' value='" + item.diagnosis_number + "'>" +
                            '<input type="file" accept=".gif, .jpg, .png" name="receiptFile">사진선택</input></div><div class="modal-footer"><button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">닫기</button><button type="submit" class="btn btn-primary upload-btn' + item.diagnosis_number + '">확인</button></div></form></div></div></div>'
                    } else if (item.is_diagnosis_upload == 2) {
                        receipt = "업로드완료";
                    }

                    //진료예약(아직진료시작X) (diagnosis_status = 0) 일 때  ->> is_prescription_upload = 0 업로드버튼X,
                    //진료시작(dagnosis_status = 1)일 때   ->> is_prescription_upload = 1 업로드버튼0,
                    //                                   업로드 완료시 is_prescription_upload = 2 업로드완료.
                    //진료 종료(diagnosis_status = 3~7) 인데 --> is_prescription_upload가 1이면
                    //                                      Controller에서 is_prescription_upload = 3(처방전없음)으로 바꿔준다.
                    //처방전 업로드
                    let prescription = "";
                    if (item.is_prescription_upload == 0) {
                        prescription = "";
                    } else if (item.is_prescription_upload == 1) {
                        prescription = "<button type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop2_" + item.diagnosis_number + " 'id ='prescriptionUpload" + item.diagnosis_number + "' class='btn btn-info btn-sm h-75'>처방전업로드</button><br>" +
                            '<div class="modal fade" id="staticBackdrop2_' + item.diagnosis_number + '" data-bs-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">' +
                            '<div class="modal-dialog" role="document">' +
                            '<div class="modal-content">' +
                            '<div class="modal-header">' +
                            '<h5 class="modal-title" id="staticBackdropLabel">처방전 업로드</h5>' +
                            // '<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">' +
                            // '<span aria-hidden="true">&times;</span>' +
                            '</button>' +
                            '</div><form action="prescriptionUpload" method="POST" enctype="multipart/form-data"><div class="modal-body">' +
                            "<input type='hidden' name='diagnosis_number' value='" + item.diagnosis_number + "'>" +
                            '<input type="file" accept=".gif, .jpg, .png" name="prescriptionFile">사진선택</input></div><div class="modal-footer"><button type="button" class="btn btn-secondary"  data-bs-dismiss="modal">닫기</button><button type="submit" class="btn btn-primary upload-btn' + item.diagnosis_number + '">확인</button></div></form></div></div></div>'
                    } else if (item.is_prescription_upload == 2) {
                        prescription = "업로드완료";
                    } else if (item.is_prescription_upload == 3) {
                        prescription = "처방전없음";
                    }

                    // 나의 진료 내역 테이블 생성 (리눅스 서버에 올릴때 진단영수증 파일경로 바꿔줘야함)
                    // 진료시작이거나 진료중일때  /예약취소 / 진료완료상태일때 색깔 적용 태영
                    if (item.diagnosis_status == 0 || item.diagnosis_status == 1) {
                        $("#docMedicalList").append("<tr><td style='background-color:#00B6EE'><a href='/doctor/customerDetail/" + item.diagnosis_number + "'>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</a></td>" +
                            "<td>" + item.diagnosis_wait_number + "</td>" +
                            "<td><a href='/doctor/customerDetail/" + item.diagnosis_number + "'>" + item.user_name + "</a></td>" +
                            "<td>" + gender + "</td>" +
                            "<td>" + birth + "</td>" +
                            "<td>" + receipt + "</td>" +
                            "<td>" + prescription + "</td>" +
                            "<td>" + complete + "</td>" +
                            "<td><a href='/doctor/customerDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"
                        )
                    } else if (item.diagnosis_status >= 3 && item.diagnosis_status <= 7) {
                        $("#docMedicalList").append("<tr><td style='background-color:#cccccc'><a href='/doctor/customerDetail/" + item.diagnosis_number + "'>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</a></td>" +
                            "<td>" + item.diagnosis_wait_number + "</td>" +
                            "<td><a href='/doctor/customerDetail/" + item.diagnosis_number + "'>" + item.user_name + "</a></td>" +
                            "<td>" + gender + "</td>" +
                            "<td>" + birth + "</td>" +
                            "<td>" + receipt + "</td>" +
                            "<td>" + prescription + "</td>" +
                            "<td>" + complete + "</td>" +
                            "<td><a href='/doctor/customerDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"
                        )
                    }
                    ;
                }
            })
            loading = false;
        }

        $(window).scroll(function () {
            if ($(window).scrollTop() + 200 >= $(document).height() - $(window).height()) {
                if (!loading) {     //실행 가능 상태라면?
                    loading = true; //실행 불가능 상태로 변경
                    page += 1;
                    next_load(list);
                }
            }
        });
    })

    // 진료 시작하기
    //진료시작시 문자전송 + 카카오 오픈링크 태영
    function startBtn(e) {
        console.log()
        if (confirm("진료를 시작하시겠습니까?") == true) {
            $.ajax({
                url: "startDiagnosis",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log(data);

                    console.log("진료 시작 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                },
            })
        } else {
            return;
        }
    }

    // 진료 완료하기
    function finishBtn(e) {
        if (confirm("진료를 완료하시겠습니까?") == true) {
            $.ajax({
                url: "finishDiagnosis",
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
                        location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                    }
                },
            })
        } else {
            return;
        }
    }

    <%--
    //진료영수증 업로드
    function receiptUpload(e) {
        if (confirm("진료영수증 업로드를 하시겠습니까?") == true) {
            $.ajax({
                url: "receiptUpload",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("진료영수증 업로드 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                },
            })
        } else {
            return;
        }
    }

    //진단서 업로드
    function prescriptionUpload(e) {
        if (confirm("진료영수증 업로드를 하시겠습니까?") == true) {
            $.ajax({
                url: "prescriptionUpload",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("진단서 업로드 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                },
            })
        } else {
            return;
        }
    }
    --%>


</script>


</html>
