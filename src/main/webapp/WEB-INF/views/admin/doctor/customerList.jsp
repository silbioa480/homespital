<%--
  Created by IntelliJ IDEA.
  User: InSung
  Date: 2022-04-01
  Time: 오전 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/css/myMedicalList.css"/>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <%-- 구글 아이콘 CDN링크 --%>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<%--  휴대폰 문자전송(진료시작 내용+카카오링크) test 태영  --%>

div class="container">
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
</html>
