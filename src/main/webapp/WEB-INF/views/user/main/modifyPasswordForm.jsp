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
</head>
<body>
<form method="post" action="modifyPassword.do">
    <input type="hidden" name="email" id="email" value="${email}">
    <div class="input-control">
        <label for="password3">새 비밀번호 입력</label>
        <input type="password" id="password3" name="password3" placeholder="비밀번호를 입력해주세요" value=""
               minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" title="4~12자의 영문 대소문자와 숫자로만 입력."
               required/>

    </div>
    <div class="input-control">
        <label for="password4">새 비밀번호 확인</label>
        <input type="password" id="password4" name="password4" placeholder="비밀번호를 입력해주세요"
               onkeyup="check_pw()" value="" maxlength="12" size="15" required>
        <span id="pw_check_msg" style="color: #1abc9c"></span>
    </div>
    <input type="submit">확인</input>
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
