<%-- 의사 리스트--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>의사 진료리스트</title>
    <link rel="stylesheet" href="/resources/css/myMedicalList.css"/>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
            font-size: 30px;
            padding: 10px;
        }

        .table {
            height: 500px;
            overflow: auto;
        }


    </style>
</head>
<body>
<div class="container">
    <div class="col mt-5">
        <div class="list-header bg-info text-right">
            <h1 id="logo">Homespital</h1>

        </div>

        <p class="text-right">마이페이지 > 의사진료내역</p>

        <div class="card">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table fs-3 fst-normal">
                        <thead>
                        <tr>
                            <th>날짜/시간</th>
                            <th>환자성함</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>진료영수증</th>
                            <th>처방전</th>
                            <th>진료현황</th>
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
<div>
    ㅂ 7ㅂ
</div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
                "doctor_number": ${diagnosis.doctor_number}
            },
            success: function (data) {
                console.log(data)
                list = data;
                next_load(list);
            },
            error: function () {
                console.log("Error");
            }
        })

        function next_load(list) {
            $.each(list, function (index, item) {
                if (index >= page * 30 && index < page * 30 + 30) {
                    console.log(index);
                    //data에서 create_date를 받아와 해당날짜의 요일을 만들어준다.
                    var old_date = list[index].create_date;
                    var date = old_date.slice(0, 10)
                    var week = ['일', '월', '화', '수', '목', '금', '토'];
                    var dayOfWeek = week[new Date(date).getDay()];

                    //진료완료, 진료중 표시 및 대기/예약취소하기 버튼
                    let complete = "";
                    if (item.diagnosis_status == 0) {
                        complete = "<button type='button' id='startBtn' class='btn btn-primary btn-sm' onclick='startBtn(" + item.diagnosis_number + ");'>진료시작하기</button>";
                    } else if (item.diagnosis_status == 1) {
                        complete = "<button type='button' id='finishBtn' class='btn btn-info btn-sm' onclick='finishBtn(" + item.diagnosis_number + ");'>진료완료하기</button>";
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

                    // 진료영수증이 있으면 내려받기 버튼 생성, 없으면 공백
                    let upload = "";
                    if (item.is_prescription_upload == true) {
                        upload = "<button type='button' id ='uploadBtn' class='uploadBtn'>내려받기</button>"
                    } else {
                        upload = "";
                    }

                    // 나의 진료 내역 테이블 생성 (리눅스 서버에 올릴때 진단영수증 파일경로 바꿔줘야함)
                    $("#docMedicalList").append("<tr><td>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</td>" +
                        "<td>" + item.user_name + "</td>" +
                        "<td>" + item.doctor_name + "</td>" +
                        "<td>" + item.user_registration_number + "</td>" +
                        "<td><a href='/resources/img/uploadReceipt/" + item.diagnosis_file_name + "' download=''><span class='material-icons'>file_download</span></a>" + "</td > " +
                        "<td>" + complete + "</td>" +
                        "<td><a href='/myMedicalDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"
                    )
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
    function startBtn(e) {
        if (confirm("진료를 시작하시겠습니까?") == true) {
            $.ajax({
                url: "startDiagnosis",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
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
                    console.log("진료 완료 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/doctor/docMedicalList";
                },
            })
        } else {
            return;
        }
    }


</script>
</html>
