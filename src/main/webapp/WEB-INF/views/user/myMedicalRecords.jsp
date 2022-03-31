<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>나의 진료 내역</title>
</head>
<body>
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
                    location.href = "${pageContext.request.contextPath}/myMedicalRecords";
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
                $.each(data, function (index, item) {
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
                    $("#myMedicalList").append("<tr><td>" + item.create_date + "</td>" +
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
