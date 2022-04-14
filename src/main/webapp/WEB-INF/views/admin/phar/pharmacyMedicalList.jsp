<%-- 준근 --%>
<%--인성 : 약국단 진료리스트보기--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>환자 진료 내역</title>

    <link rel="stylesheet" href="/resources/css/pharCustomerDetail.css"/>
    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="col mt-3">
        <div class="list-header bg-info text-center">
            <h1 id="logo">Homespital</h1>
            <%--            <h4>${diagnosis.pharmacy_name}</h4>--%>
        </div>


        <p class="text-end fs-4">약사 처방전 내역</p>

        <div class="card p-3">
            <div class="card-body p-4">
                <div class="text-center table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>날짜/시간</th>
                            <th>환자</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>병원</th>
                            <th>배송</th>
                            <th>처방전</th>
                            <th>현황</th>
                            <th>상세보기</th>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    // 페이지에 들어오자마자 실행
    $(document).ready(function () {
        let page = 0;
        let loading = false;
        let list = null;

        $.ajax({
            url: '/pharmacy/pharMedicalRecords',
            type: 'GET',
            datatype: "json",
            data: {
                "pharmacy_number": ${pharmacy.pharmacy_number}
            },
            success: function (data) {
                console.log(data);
                list = data;
                next_load(list);
            },
            error: function () {
                console.log("Error");
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
                    if (item.diagnosis_status == 3) {
                        complete = "<button type='button' id='makeMediBtn' class='btn btn-danger btn-sm h-75' onclick='makeMediBtn(" + item.diagnosis_number + ");'>처방 접수/조제</button>";
                    } else if (item.diagnosis_status == 4) {
                        complete = "<button type='button' id='successMakeBtn' class='btn btn-info btn-sm h-75' onclick='successMadeBtn(" + item.diagnosis_number + ");'>조제 완료/전송</button>";
                    } else if (item.diagnosis_status == 5) {
                        complete = "조제완료";
                    } else if (item.diagnosis_status == 6) {
                        complete = "종료";
                    }

                    // 처방전이 있을 때만 버튼 생성, 없으면 빈문자열
                    let receiptFile = "";
                    if (item.is_prescription_upload === 2) {
                        receiptFile = "<a href='/resources/img/uploadReceipt/" + item.diagnosis_file_name + "' download='처방전'><span class='material-icons'>file_download</span></a>"
                    }
                    let is_delivery = "방문";
                    if (item.is_delivery === true) {
                        is_delivery = "배송"
                    }

                    if (item.diagnosis_status >= 3 && item.diagnosis_status <= 6) {
                        //나의 진료 내역 테이블 생성 (리눅스 서버에 올릴때 진단영수증 파일경로 바꿔줘야함)
                        $("#pharMedicalList").append("<tr><td>" + date + " (" + dayOfWeek + ") " + item.diagnosis_time + ":00</td>" +
                            "<td>" + item.user_name + "</td>" +
                            "<td>" + gender + "</td>" +
                            "<td>" + birth + "</td>" +
                            "<td>" + item.hospital_name + "</td > " +
                            "<td>" + is_delivery + "</td>" +           // 배송or방문
                            "<td>" + receiptFile + "</td > " +  //처방전 다운받기
                            "<td>" + complete + "</td>" +
                            "<td><a href='/pharmacy/customerDetail/" + item.diagnosis_number + "'><span class='material-icons'>search</span></a>" + "</td></tr><br>);"  //현황
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


    // 처방접수/조제 시작
    function makeMediBtn(e) {
        var price = Number(prompt("처방을 접수하시겠습니까? 조제비용(약값)을 입력해주세요."));
        if (isNaN(price)) {
            alert("금액을 입력해주세요.");
            return false;
        } else if (confirm("처방전 금액을 " + price + "로 하고 처방을" + " 접수하시겠습니까?") == true) {
            $.ajax({
                url: "/pharmacy/makeMedicine",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                    "prescription_money": price,
                },
                success: function (data) {
                    console.log("처방 접수 성공 : " + e)
                    location.href = "${pageContext.request.contextPath}/pharmacy/pharMedicalList";
                },
            })
        } else {
            return;
        }
    }

    // 약 수령확정
    function successMadeBtn(e) {
        if (confirm("약을 수령하셨나요? 수령확정 하시겠습니까?") == true) {
            $.ajax({
                url: "/pharmacy/successMadeMedicine",
                type: "POST",
                datatype: "json",
                data: {
                    "diagnosis_number": e,
                },
                success: function (data) {
                    console.log("약 수령 완료/비대면진료 종료 : " + e)
                    location.href = "${pageContext.request.contextPath}/pharmacy/pharMedicalList";
                },
            })
        } else {
            return;
        }
    }


</script>
</html>
