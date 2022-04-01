<%-- 준근 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>나의 진료 내역</title>

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


    </style>
</head>
<body>
<div>
    <div class="col mt-5">
        <div class="list-header bg-info text-right">
            <h1 id="logo">Homespital</h1>
        </div>

        <p class="text-right">마이페이지 > 나의진료내역</p>

        <div class="card">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table fs-3 fst-normal">
                        <thead>
                        <tr>
                            <th>날짜/시간</th>
                            <th>진료과</th>
                            <th>의사</th>
                            <th>병원명</th>
                            <th>진료영수증</th>
                            <th>진료현황</th>
                            <th>상세보기</th>
                        </tr>
                        </thead>
                        <tbody id="myMedicalList">
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
    // 예약 취소
    function deleteBtn(e) {
        if (confirm("예약 취소하시겠습니까?") == true) {
            $.ajax({
                url: "/deleteMedicalRecord",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("삭제 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/myMedicalList";
                },
            })
        } else {
            return;
        }
    }

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
                        complete = "<button type='button' id='completeBtn' class='btn btn-info btn-sm' onclick='deleteBtn(" + item.diagnosis_number + ");'>예약취소하기</button>";
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
                })
            }
        })
    })


</script>
</html>
