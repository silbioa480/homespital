<%-- 준근 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>나의 진료 내역</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/pharCustomerDetail.css"/>
    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="col mt-5">
        <div class="list-header text-center" id="userBanner">
            <img src="/resources/img/design/u_banner.png" />
<%--            <h1 id="logo">Homespital</h1>--%>
        </div>

        <p class="text-end fs-4">마이페이지 > 나의진료내역</p>

        <div class="card p-3">
            <div class="card-body">
                <div class="text-center table-responsive">
                    <table class="table">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            list.sort((a, b) => {
                return a.diagnosis_status - b.diagnosis_status;
            })

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
                        complete = "<button type='button' id='cancelBtn' class='btn btn-sm h-75' onclick='cancelBtn(" + item.diagnosis_number + ");'>대기/예약취소</button>";
                    } else if (item.diagnosis_status == 1) {
                        complete = "<strong style='color:#33CC99'>진료중</strong>";

                    } else if (item.diagnosis_status == 2) {
                        complete = "예약취소완료";
                    } else if (item.diagnosis_status == 3) {
                        complete = "<strong style='color:#0058A8'>진료완료/조제대기</strong>";
                    } else if (item.diagnosis_status == 4) {
                        complete = "<strong style='color:#FFCD4A'>조제중</strong>";
                    } else if (item.diagnosis_status == 5) {
                        complete = "<button type='button' id='successBtn' class='btn btn-sm h-75' onclick='successBtn(" + item.diagnosis_number + ");'>약 수령 확정</button>";
                    } else if (item.diagnosis_status == 6) {
                        complete = "종료";
                    } else if (item.diagnosis_status == 7) {
                        complete = "종료";
                    }

                    // 진료영수증이 있으면 내려받기 버튼 생성, 없으면 빈 문자열
                    let upload = "";
                    if (item.is_diagnosis_upload == 2) {
                        upload = "<a href='/resources/img/uploadReceipt/" + item.diagnosis_file_name + "' download=''><span class='material-icons'>file_download</span></a>"
                    } else {
                        upload = "";
                    }

                    // 나의 진료 내역 테이블 생성 (리눅스 서버에 올릴때 진단영수증 파일경로 바꿔줘야함)
                    if (item.diagnosis_status == 0 || item.diagnosis_status == 1 || item.diagnosis_status == 4) {
                        $("#myMedicalList").append("<tr><td style='background-color:#33cc99'>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</td>" +
                            "<td>" + item.diagnosis_type + "</td>" +
                            "<td>" + item.doctor_name + "</td>" +
                            "<td>" + item.hospital_name + "</td>" +
                            "<td>" + upload + "</td > " +
                            "<td>" + complete + "</td>" +
                            "<td><a href='/myMedicalDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"
                        )
                        ;
                    } else if (item.diagnosis_status == 2 || item.diagnosis_status == 3 || item.diagnosis_status == 5 || item.diagnosis_status == 6 || item.diagnosis_status == 7) {
                        $("#myMedicalList").append("<tr><td style='background-color:#cccccc'>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</td>" +
                            "<td>" + item.diagnosis_type + "</td>" +
                            "<td>" + item.doctor_name + "</td>" +
                            "<td>" + item.hospital_name + "</td>" +
                            "<td>" + upload + "</td > " +
                            "<td>" + complete + "</td>" +
                            "<td><a href='/myMedicalDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"
                        )
                        ;
                    }
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
