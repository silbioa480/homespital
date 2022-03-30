<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    $.ajax({
        url: '/medicalRecordsList',
        type: 'POST',
        datatype: "json",
        data: {"user_email": ${user.user_email}},
        success: function (data) {
            $.each(data, function (index, item) {
                $("#myMedicalList").append("");
            });
        }
    });
</script>
</html>
