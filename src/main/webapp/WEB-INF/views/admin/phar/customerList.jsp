<%-- 준근 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>환자 진료 내역</title>

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
            <h4 style="float:left; margin-top: 110px; margin-left: 25px;">인성${name}님 안녕하세요~</h4>
        </div>


        <p class="text-right">환자 진료 내역</p>

        <div class="card">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table fs-3 fst-normal">
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
                        <tbody id="pharMedicalList">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

    // 페이지에 들어오자마자 실행
    $(document).ready(function () {
        let page = 0;
        let loading = false;
        let list = null;

        $.ajax({
            url: '/medicalRecordsList',
            type: 'GET',
            datatype: "json",
            data: {
                "user_number": ${diagnosis.user_number}
            },
            success: function (data) {
                list = data;
                next_load(list);
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
                        complete = "<button type='button' id='cancelBtn' class='btn btn-danger btn-sm' onclick='cancelBtn(" + item.diagnosis_number + ");'>예약취소하기</button>";
                    } else if (item.diagnosis_status == 1) {
                        complete = "진료중";
                    } else if (item.diagnosis_status == 2) {
                        complete = "예약취소";
                    } else if (item.diagnosis_status == 3) {
                        complete = "조제중";
                    } else if (item.diagnosis_status == 4) {
                        complete = "처방전X/진료완료";
                    } else if (item.diagnosis_status == 5) {
                        complete = "조제중";
                    } else if (item.diagnosis_status == 6) {
                        complete = "<button type='button' id='successBtn' class='btn btn-info btn-sm' onclick='successBtn(" + item.diagnosis_number + ");'>약제 수령 확정</button>";
                    } else if (item.diagnosis_status == 7) {
                        complete = "약배송완료/진료완료";
                    }

                    // 진료영수증이 있으면 내려받기 버튼 생성, 없으면 공백
                    let upload = "";
                    if (item.is_prescription_upload == true) {
                        upload = "<button type='button' id ='uploadBtn' class='uploadBtn'>내려받기</button>"
                    } else {
                        upload = "";
                    }

                    // 나의 진료 내역 테이블 생성 (리눅스 서버에 올릴때 진단영수증 파일경로 바꿔줘야함)
                    $("#myMedicalList").append("<tr><td>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</td>" +
                        "<td>" + item.diagnosis_type + "</td>" +
                        "<td>" + item.doctor_name + "</td>" +
                        "<td>" + item.hospital_name + "</td>" +
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


    // 예약 취소
    function cancelBtn(e) {
        if (confirm("예약 취소하시겠습니까?") == true) {
            $.ajax({
                url: "/cancelMedicalRecord",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("예약취소 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/myMedicalList";
                },
            })
        } else {
            return;
        }
    }

    // 약 수령확정
    function successBtn(e) {
        if (confirm("약을 수령하셨나요? 수령확정 하시겠습니까?") == true) {
            $.ajax({
                url: "/successMedicalRecord",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("약 수령 완료/비대면진료 종료 : " + e)
                    location.href = "${pageContext.request.contextPath}/myMedicalList";
                },
            })
        } else {
            return;
        }
    }


</script>
</html>
