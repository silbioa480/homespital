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
    $(function () {
        $.ajax({
            url: '/medicalRecordsList',
            type: 'POST',
            datatype: "json",
            data: {
                "user_number": ${diagnosis.user_number}
            },
            success: function (data) {
                console.log(data)
                $.each(data, function (index, item) {
                    $("#myMedicalList").append("<tr><td>" + item.create_date + "</td>" +
                        "<td>" + item.diagnosis_type + "</td>" +
                        "<td>" + item.doctor_name + "</td>" +
                        "<td>" + item.hospital_name + "</td>" +
                        "<td>" + item.is_prescription_upload + "</td>" +
                        "<td>" + item.is_diagnosis_complete + "</td></tr><br>);"
                    );
                })
            }
        })
    })
</script>
</html>
