<%--
  Created by IntelliJ IDEA.
  User: Ko
  Date: 2022-03-30
  Time: 오전 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homespital</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/resources/css/pwsearch.css"/>
</head>
<body class="is-preload">

<header id="header">
    <h1 style="margin-left: 63px">비밀번호 찾기</h1>

</header>

<div class="pw_box">
    <div class="content">

        <form id="pw-form" method="post" action="#">

            <div class="form-group" id="divEmail">
                <input class="pw-email" type="email" name="email" id="email" placeholder="Email Address" />
            </div><br>

            <div class="form-group">
                <button type="submit" class="btn-login"> 인증번호 </button>

            </div>

            <div class="form-group" id="divVaildnum">
                <input class="validnum" type="number" name="validnum" id="vailidnum" placeholder="인증번호 6글자 입력해주세요" />
            </div><br>

            <div class="form-group">
                <button type="submit" class="btn-login"> 확 인 </button>

            </div>

        </form>

        <!-- Footer -->
        <footer id="footer">

        </footer>

        <!-- Scripts -->
        <script src="/resources/js/login.js"></script>

</body>
</html>
