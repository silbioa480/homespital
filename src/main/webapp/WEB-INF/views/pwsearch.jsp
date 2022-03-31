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
    <h1 style="margin-left: 40px; font-size: 30px">비밀번호 찾기</h1>

</header>

<div class="pw_box" >
    <div class="content">

        <form id="pw-form" method="post" action="#">
            <hr style="margin-bottom: 30px; width: 280px;">

            <div class="form-group" id="divEmail">
                <input class="pw-email" type="email" name="email" id="email" placeholder="Email Address" />
            </div>

            <div class="form-group" style="margin-top: 15px">
                <button id="emailCheck" onclick="emailSend()"> 인증번호전송 </button>

            </div>

            <div class="form-group" id="divVaildnum" style="margin-top: 30px">
                <input class="validnum" type="text" name="validnum" id="vailidnum" placeholder="인증번호 6글자 입력해주세요" />
            </div>



            <div class="form-group" style="margin-top: 15px">
                <button id="certificationBtn" onclick="emailCertification()"> 인증번호확인 </button>
                <input type="hidden" id="certificationYN" value="false">

            </div>

        </form>

        <!-- Footer -->
        <footer id="footer">

        </footer>
    </div>
</div>

        <!-- Scripts -->

<script src="/resources/js/login/login.js"></script>
        <script>
            function emailSend() {
                let clientEmail = document.getElementById('email').value;
                let emailYN = isEmail(clientEmail);

                console.log('입력한 메일' + clientEmail);

                if (emailYN == true) {
                    alert('이메일로 전송되었습니다.');

                    $.ajax({
                        type: "post",
                        url: "/api/user/email",
                        data: {userEmail: clientEmail},
                        success: function (data) {
                        }, error: function (e) {
                            alert('다시 시도해주세요.');
                        }
                    });

                } else {
                    alert('이메일 형식에 알맞게 작성해주세요.')
                }
            }

            function isEmail(asValue) {
                var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                return regExp.test(asValue);
            }

            function emailCertification() {
                let clientEmail = document.getElementById('email').value;
                let inputCode = document.getElementById('vailidnum').value;

                console.log('입력한 메일' + clientEmail);
                console.log('인증코드' + inputCode);

                    $.ajax({
                        type: "post",
                        url: "/api/user/email/certification",
                        data: {userEmail:clientEmail, inputCode:inputCode},
                        success: function (result) {
                            console.log(result);
                            if(result==true){
                                alert('인증완료');
                                document.getElementById('certificationYN').value ="true";
                                clientEmail.onchange = function(){
                                    document.getElementById('certificationYN').value="false";
                                }
                            }else{
                                alert('다시시도해주세요');
                            }

                        }
                    });
            }


        </script>

</body>
</html>
