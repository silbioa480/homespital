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
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/login.css"/>

    <%--    <!-- Bootstrap -->--%>
    <link
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="is-preload">

<%--<header id="header">--%>
<%--    <h1 style="font-weight: bolder;">비밀번호 찾기</h1>--%>

<%--</header>--%>

<div class="pw_box" style="margin-top:100px">
    <div class="content">

        <form id="pw-form" method="post">
            <h1 style="font-weight: bolder; margin-bottom: 40px; margin-left: 15px">비밀번호 찾기</h1>
            <%--            <hr style="margin-bottom: 30px; width: 280px;">--%>

            <div class="form-group" id="divEmail">
                <input style="width: 290px" class="pw-email" type="email" name="email" id="email"
                       placeholder="Email Address"/>
            </div>

            <div class="form-group" style="margin-top: 15px">
                <%--                <input type="button" id="emailCheck" value="인증번호 받기">--%>
                <button type="button" id="emailCheck" class="btn-login" style="width:290px">인증번호 받기</button>

            </div>

            <div class="form-group" id="divVaildnum" style="margin-top: 30px">
                <input style="width: 290px" class="validnum" type="text" name="validnum" id="vailidnum"
                       placeholder="인증번호 6글자 입력해주세요"/>
            </div>


            <div class="form-group" style="margin-top: 15px">
                <%--                <input type="button" id="certificationBtn" value="인증번호 확인" disabled/>--%>
                <button type="button" id="certificationBtn" class="btn-login" style="width:290px;" disabled>
                    인증번호 확인
                </button>
            </div>


        </form>


    </div>
</div>

<!-- Scripts -->

<script src="/resources/js/login/login.js"></script>
<script>
    let email = null;
    //이메일 보내기
    var code = "";
    $("#emailCheck").click(function () {
        email = $("#email").val();
        if (email != "") {
            $.ajax({
                type: "GET",
                url: "/sendMail?email=" + encodeURIComponent(email),
                cache: false,
                success: function (data) {
                    console.log("data:" + data);
                    if (data == "noUserErr") {
                        alert("사용자로 등록되지 않은 이메일 입니다.")
                    } else if (data == "error") {
                        alert("이메일이 전송되지 않았습니다. 잠시 후 다시 시도해보세요.")
                    } else {
                        alert("인증번호 발송이 완료되었습니다.\n이메일을 확인해주세요.");
                        $("#certificationBtn").attr("disabled", false);
                        code = data;
                    }
                }
            })
        } else {
            alert("이메일을 입력해주세요");
        }
    })
    //이메일 인증번호 대조
    $("#certificationBtn").click(function (e) {
            e.preventDefault();
            if ($("#vailidnum").val() == code) {
                alert("인증번호가 일치합니다.");
                location.href = "modifyPasswordForm?email=" + email;
            } else {
                alert("인증번호가 일치하지 않습니다.");
            }
        }
    );


    // function emailSend() {
    //     let clientEmail = document.getElementById('email').value;
    //     let emailYN = isEmail(clientEmail);
    //
    //     console.log('입력한 메일' + clientEmail);
    //
    //     if (emailYN == true) {
    //         alert('이메일로 전송되었습니다.');
    //
    //         $.ajax({
    //             type: "post",
    //             url: "/api/user/email",
    //             data: {userEmail: clientEmail},
    //             success: function (data) {
    //             }, error: function (e) {
    //                 alert('다시 시도해주세요.');
    //             }
    //         });
    //
    //     } else {
    //         alert('이메일 형식에 알맞게 작성해주세요.')
    //     }
    // }
    //
    // function isEmail(asValue) {
    //     var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    //     return regExp.test(asValue);
    // }
    //
    // function emailCertification() {
    //     let clientEmail = document.getElementById('email').value;
    //     let inputCode = document.getElementById('vailidnum').value;
    //
    //     console.log('입력한 메일' + clientEmail);
    //     console.log('인증코드' + inputCode);
    //
    //         $.ajax({
    //             type: "post",
    //             url: "/api/user/email/certification",
    //             data: {userEmail:clientEmail, inputCode:inputCode},
    //             success: function (result) {
    //                 console.log(result);
    //                 if(result==true){
    //                     alert('인증완료');
    //                     document.getElementById('certificationYN').value ="true";
    //                     clientEmail.onchange = function(){
    //                         document.getElementById('certificationYN').value="false";
    //                     }
    //                 }else{
    //                     alert('다시시도해주세요');
    //                 }
    //
    //             }
    //         });
    // }


</script>

</body>
</html>
