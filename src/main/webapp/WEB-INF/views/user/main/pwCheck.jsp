<%--
  Created by IntelliJ IDEA.
  User: Ko
  Date: 2022-04-03
  Time: 오후 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/login.css"/>
    <script src="/resources/js/login/login.js"></script>
</head>
<body class="is-preload">

<div class="pw_box">
    <div class="content">


        <form style="margin-top: 100px;" action="/pwCheck" method="post" id="pwCheck" name="pwCheck">
            <input type="hidden" id="user_id" name="user_id" value="${user.user_email}">
            <div class="container">
                <h1 style="margin-left: 20px; font-weight: bolder; margin-bottom: 30px">회원정보 수정</h1>


                <div class="input-control">
                    <label for="password" style="font-weight: bolder; font-size: 15px;">비밀번호 확인</label>
                    <input type="password" style="width: 290px; margin-top: 15px" id="password" name="password"
                           placeholder="비밀번호를 입력해주세요" value="" minlength="4" maxlength="12" size="15">
                    <%--            <div class="error"></div>--%>
                </div>
                <%--    <div class="input-control">--%>
                <%--        <label for="password2">비밀번호 확인</label>--%>
                <%--        <input type="password" style="width: 100%" id="password2" name="password2" placeholder="비밀번호를 입력해주세요" onkeyup="check_pw()" value="" maxlength="12" size="15" >--%>
                <%--        <span id="pw_check_msg" style="color: #1abc9c"></span>--%>
                <%--        <div class="error"></div>--%>
                <%--    </div>--%>
                <button type="submit" id="pwChecked" class="btn-login" name="pwChecked"
                        style="margin-top: 20px; width:290px"> 확 인
                </button>
            </div>


        </form>
    </div>
</div>
</body>

<script type="text/javascript">

    // function check_pw(){  //비밀번호 확인
    //     var password = document.getElementById('password').value;
    //     var password2 = document.getElementById('password2').value;
    //
    //     if (password!==password2) {
    //         document.getElementById('pw_check_msg').innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요.";
    //     }
    //     else {
    //         document.getElementById('pw_check_msg').innerHTML = "";
    //     }
    //     if (password2==="") {
    //         document.getElementById('pw_check_msg').innerHTML = "";
    //     }
    // }

    $(document).ready(function () {

        $("#pwChecked").on("click", function () {


            $.ajax({
                url: "/pwCheck",
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
                        location.href = "/pwCheck";
                    } else {
                        alert("비밀번호를 확인해주세요!");
                        location.href = "/pwCheck";
                    }
                },
            });
        });
    });


</script>


</html>
