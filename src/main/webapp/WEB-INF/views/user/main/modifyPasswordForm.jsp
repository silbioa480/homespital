<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-03
  Time: 오전 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/pwsearch.css"/>
    <script src="/resources/js/login/login.js"></script>
</head>
<body>

<%--<header id="header">--%>
<%--    <h1 style="margin-left: 40px; font-size: 30px">비밀번호 찾기</h1>--%>

<%--</header>--%>

<form id="pw-form" method="post" action="modifyPassword.do">
    <hr style="margin-bottom: 30px; width: 280px;">

    <div class="container" style="height:500px">
        <input type="hidden" name="email" id="email" value="${email}">
        <div class="input-control">
            <label for="password3" style="font-size: 20px">새 비밀번호 입력</label>
            <input type="password" id="password3" name="password3" placeholder="비밀번호를 입력해주세요" value=""
                   minlength="4" maxlength="12" size="15" pattern="/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/" title="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
                   required/>

        </div>
        <div class="input-control">
            <label for="password4"style="font-size: 20px; margin-top: 20px">새 비밀번호 확인</label>
            <input type="password" id="password4" name="password4" placeholder="비밀번호를 입력해주세요"
                   onkeyup="check_pw()" value="" maxlength="12" size="15" required>
            <span id="pw_check_msg" style="color: #1abc9c"></span>
        </div>
        <button type="submit" id="emailCheck" class="btn-login" style="margin-top: 20px">비밀번호 변경</button>
<%--        <input type="submit" style="margin-top: 20px" value="확인"></input>--%>
    </div>
</form>
</body>
<script>
    function check_pw() {  //비밀번호 확인
        var pw3 = document.getElementById('password3').value;
        var pw4 = document.getElementById('password4').value;

        if (pw3 != pw4) {
            document.getElementById('pw_check_msg').innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요.";
        } else {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
        if (pw4 == "") {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
    }


</script>
</html>
