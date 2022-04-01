<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homespital</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
</head>
<body class="is-preload">

<!-- Header -->
<section id="header">
    <header>
        <span class="image avatar"><img src="/resources/img/signUp/avatar.jpg" alt=""/></span>
        <h1 id="logo"><a href="#">Homespital</a></h1>
        <p>Hi</p>

    </header>
    <nav id="nav">
        <ul>
            <li><a href="#one" class="active">필수정보수정</a></li>
            <li><a href="#two">배송지 수정</a></li>
            <li><a href="#three">결제 정보 수정</a></li>

        </ul>
    </nav>
    <footer>
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
        </ul>
    </footer>
</section>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <form id="form" action="joinForm.jsp" method="post">
            <!-- One -->
            <section id="one">
                <div class="container">
                    <h3>필수 회원정보 수정</h3>
                    <hr>
                    <div class="input-control">
                        <label for="email">이메일</label>
                        <input class="modi-input" style="width: 100%" type="text" id="email" name="id" value="${User.user_email}" readonly="readonly">
                    </div>

                    <div class="input-control">
                        <label for="password">비밀번호</label>
                        <div style="display: flex">
                        <input class="modi-input" type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" required>
                            <a class="btn-modal" style="margin-left: 30px" data-toggle="modal" href="javascript:void(0)" onclick="passwordModal();">비밀번호수정</a>
                        <div class="error"></div>
                        </div>
                    </div>

                    <div class="input-control">
                        <label for="name">이름</label>
                        <input class="modi-input" style="width: 100%" type="text" id="name" name="name" value="${User.user_name}" readonly="readonly">
                    </div>

                    <div class="input-control">
                        <label for="SocialSecurityNumber">주민등록번호</label>

                        <div id="SocialSecurityNumber" name="SocialSecurityNumber" style="display:flex">
                            <input class="modi-input" style="width: 100%" type="text" value="${User.user_registration_number}" readonly="readonly">

                        </div>
                    </div>
                    <div class="input-control">
                        <label for="phone">휴대폰 번호</label>
                        <div style="display:flex">
                            <input class="modi-input" style="width: 100%" id="phone" type="text" name="phone" value="${User.user_phone}" readonly="readonly"/>
                            <input type="button" id="phoneChk" class="doubleChk" value="휴대폰번호변경">
                            <div class="error"></div>
                        </div>
                    </div>
                </div>
            </section>

            <br><br><br><br>

            <!-- Two -->
            <section id="two">
                <div class="container">
                    <h3>배송지 정보 수정</h3>
                    <hr>

                                    <div class="input-control">
                                        <label for="SocialSecurityNumber">주소</label>
                                    <div style="display:flex">
                                        <input type="hidden" id="confmKey" name="confmKey" value="">
                                        <input type="text" id="zipNo" name="zipNo" readonly style="width:100%">
                                        <input type="button" value="주소변경" onclick="goPopup()"
                                               style=" margin-left:30px;">
                                    </div>

                    </div>
                </div>
            </section>
<br><br>
            <!-- Three -->
            <section id="three">
                <div class="container">

                    <hr>
                    <h3>결제 정보 수정</h3>
                    <hr>

                    <div class="input-control">
                        <label for="creditCardNumber">결제정보</label>
                    <div class="creditCardNumber" style="display:flex">
                        <input type="text" class="moveNumber" onKeyup="inputMoveNumber(this);" maxlength="4"
                               style="width:100%; margin-bottom: 10px"/>
                        <input type="button" id="cardChange" class="doubleChk" value="변경">
                    </div>
                    <h5> * 본인명의 카드만 등록 가능 합니다.</h5>
                    <br><br>

                    <input type="submit" value="수정" style="width: 100%;"></input>
                </div>
            </section>
            <br><br><br><br>


            <!-- Four -->

        </form>


    </div>

    <!-- Footer -->
    <section id="footer">
        <div class="container">
            <ul class="copyright">
                <li>&copy; Untitled. All rights reserved.</li>
                <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
        </div>
    </section>

</div>

<!-- 모달창1: 비밀번호 변경 -->
<div class="modal fade password in" id="pwModal" aria-hidden="false" style="display: block;">
    <div class="modal-dialog pwchange animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">비밀번호변경</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">

                        <div class="error"></div>
                        <div class="form passwordBox">
                            <form method="" action="" accept-charset="UTF-8">
                                <input id="pre-password" class="form-control" type="password" placeholder="기존비밀번호" name="password">
                                <input id="new-password" class="form-control" type="password" placeholder="변경할비밀번호" name="password">
                                <input id="chk-password" class="form-control" type="password" placeholder="변경할비밀번호확인" name="password">
                                <input class="btn btn-default btn-login" type="button" value="수정" onclick="pwChangeAjax()">
                            </form>
                        </div>
                    </div>
                </div>
<!--// 모달창 -->



<!-- Scripts -->
<script src="/resources/js/signUp/jquery.min.js"></script>
<script src="/resources/js/signUp/jquery.scrollex.min.js"></script>
<script src="/resources/js/signUp/jquery.scrolly.min.js"></script>
<script src="/resources/js/signUp/browser.min.js"></script>
<script src="/resources/js/signUp/breakpoints.min.js"></script>
<script src="/resources/js/signUp/util.js"></script>
<script src="/resources/js/signUp/signUp.js"></script>
<script src="/resources/js/signUp/signUpCheck.js"></script>

<script>

    function showPasswordForm(){
        $('#passwordModal').fadeOut('fast',function(){
            $('.passwordBox').fadeIn('fast');


            $('.modal-title').html('비밀번호 수정');
        });
        $('.error').removeClass('alert alert-danger').html('');
    }

    function passwordModal(){
        showPasswordForm();
        setTimeout(function(){
            $('#pwModal').modal('show');
        }, 230);

    }

</script>

</body>

</html>
