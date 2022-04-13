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
    <title>Homespital</title>
<%--    <link rel="stylesheet" href="/resources/css/signUp.css"/>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/login.css"/>
    <script src="/resources/js/login/login.js"></script>
    <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="is-preload">

<%--<header id="header">--%>
<%--    <h1 style="margin-left: 40px; font-size: 30px">비밀번호 찾기</h1>--%>

<%--</header>--%>
<div class="pw_box" style="margin-top: 500px;">
    <div class="content">

<form id="pw-form" method="post" action="modifyPassword.do">
    <h1 style="margin-left: 20px; font-weight: bolder; margin-bottom: 30px">비밀번호 변경</h1>


    <div class="container" >
        <input type="hidden" name="email" id="email" value="${email}">
        <div class="input-control">
            <label for="password3" style="font-size: 15px; font-weight: bolder;">새 비밀번호 입력</label>
            <input style="width: 290px"type="password" id="password3" name="password3" placeholder="비밀번호를 입력해주세요" value=""
                   minlength="4" maxlength="12" size="15" pattern="/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/" title="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
                   required/>

        </div>
        <div class="input-control">
            <label for="password4"style="font-size: 15px; margin-top: 20px; font-weight: bolder;">새 비밀번호 확인</label>
            <input style="width: 290px" type="password" id="password4" name="password4" placeholder="비밀번호를 입력해주세요"
                   onkeyup="check_pw()" value="" maxlength="12" size="15" required>
            <span id="pw_check_msg" style="color: #1abc9c"></span>
        </div>
        <button type="submit" id="emailCheck" class="btn-login" style="margin-top: 20px">비밀번호 변경</button>
<%--        <input type="submit" style="margin-top: 20px" value="확인"></input>--%>
    </div>
</form>
    </div>
</div>
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
