<%--
  Created by IntelliJ IDEA.
  User: Ko
  Date: 2022-04-08
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
</head>
<body>

<form style="margin-top: 100px;" action="/docPwCheck.do" method="post" id="docPwCheck" name="docPwCheck">
    <input type="hidden" id="user_id" name="user_id" value="${user.user_email}">
    <div class="container" style="margin-top: 150px">
        <h3>회원정보 수정</h3>
        <hr>

        <div class="input-control">
            <label for="password">비밀번호</label>
            <input type="password" style="width: 100%" id="password" name="password" placeholder="비밀번호를 입력해주세요" value=""
                   minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" title="4~12자의 영문 대소문자와 숫자로만 입력.">
            <div class="error"></div>
        </div>

        <input type="submit" id="pwChecked" name="pwChecked" value="확인" style="width: 100%; margin-top: 20px"></input>
    </div>


</form>

<script type="text/javascript">


    $(document).ready(function () {

        $("#pwChecked").on("click", function () {


            $.ajax({
                url: "/docPwCheck",
                type: "POST",
                // dataType : "json",
                data: {
                    "password": $('#password').val()
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function (response) {
                    console.log(response);
                    if (response == '비밀번호일치') {
                        location.href = "/modifyForm";
                    } else if (response == "비밀번호틀림") {
                        alert("비밀번호를 확인해주세요!");
                        location.href = "/docPwCheck";
                    } else {
                        alert("비밀번호를 확인해주세요!");
                        location.href = "/docPwCheck";
                    }
                },
            });
        });
    });


</script>


</body>
</html>
