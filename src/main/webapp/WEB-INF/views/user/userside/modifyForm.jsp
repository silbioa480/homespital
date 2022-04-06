-<%--
  Created by IntelliJ IDEA.
  User: InSung
  Date: 2022-04-01
  Time: 오전 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Homespital</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <%--    <script src="./jquery-3.4.1.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />--%>
    <%--    <script src="./bootstrapt/js/bootstrap.min.js"></script>--%>

</head>
<body>
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
        <form id="form" style="margin-left: 100px" action="modifyForm.jsp" method="post">
            <input type="hidden" id="user_email" name="user_email" value="${user.user_email}">
            <!-- One -->
            <section id="one">
                <div class="container" style="margin-top: 150px">
                    <h3>필수 회원정보 수정</h3>
                    <hr>
                    <div class="input-control">
                        <label for="email">이메일</label>
                        <input class="modi-input" style="width: 100%" type="text" id="email" name="id"
                               value="${email}" readonly="readonly">
                    </div>

                    <div class="input-control">
                        <label for="password">새 비밀번호</label>
                        <input type="password" style="width: 100%" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="" minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" title="4~12자의 영문 대소문자와 숫자로만 입력.">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password2">새 비밀번호 확인</label>
                        <input type="password" style="width: 100%" id="password2" name="password2" placeholder="비밀번호를 입력해주세요" onkeyup="check_pw()" value="" maxlength="12" size="15" >
                        <span id="pw_check_msg" style="color: #1abc9c"></span>
                        <div class="error"></div>
                    </div>


                    <div class="input-control">
                        <label for="name">이름</label>
                        <input class="modi-input" style="width: 100%" type="text" id="name" name="name"
                               value="${name}" readonly="readonly">
                    </div>

                    <div class="input-control">
                        <label for="SocialSecurityNumber">주민등록번호</label>

                        <div id="SocialSecurityNumber" name="SocialSecurityNumber" style="display:flex">
                            <input class="modi-input" style="width: 100%" type="text"
                                   value="${registration_number}" readonly="readonly">

                        </div>
                    </div>
                    <div class="input-control">
                        <label for="phone">휴대폰 번호</label>
                        <div style="display:flex">
                            <input class="modi-input" style="width:100%" id="originphone" type="text" name="phone"
                                   value="${user_phone}" readonly="readonly"/>
                            <input type="button" id="phoneBtn" class="doubleChk" value="휴대폰번호변경">
                        </div>

                            <div class="modal fade" id="phoneModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="phoneModalLabel">휴대폰번호 수정</h5>

                                        </div>
                                        <div class="modal-body">
                                            <div class="input-control">
                                                <div style="display:flex">
                                                    <input style="width: 100%" id="phone" type="text" name="phone"
                                                           placeholder="휴대폰번호를 입력해주세요" title="전화번호 입력"/>
                                                    <input type="button" id="phoneChk" class="doubleChk"
                                                           value="인증번호 받기">
                                                </div>
                                                <div class="error"></div>
                                            </div>
                                            <div class="input-control">
                                                <div style="display:flex">
                                                    <input style="width: 100%" id="phone2" type="text" name="phone2"
                                                           title="인증번호 입력" disabled/>
                                                    <input style="width: 220px" type="button" id="phoneChk2"
                                                           class="doubleChk" value="본인인증">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn" id="modalY2" href="/modifyForm">수정</a>
                                            <button class="btn" type="button" data-bs-dismiss="modal">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="error"></div>
                        </div>
                    </div>

            </section>

            <br><br><br><br>

            <!-- Two -->
            <section id="two">
                <div class="container">
                    <h3>배송지 정보 수정</h3>
                    <hr>
                    <div>
                        <table>
                            <colgroup>
                                <col style="width:20%">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>우편번호</th>
                                <td>
                                    <div style="display:flex">
                                        <input type="hidden" id="confmKey" name="confmKey" value="">
                                        <input type="text" id="zipNo" name="zipNo" readonly style="width:100%">
                                        <input type="button" value="주소변경" onclick="goPopup()"
                                               style=" margin-left:30px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>도로명주소</th>
                                <td><input type="text" id="roadFullAddr" name="roadFullAddr" style="width:100%"></td>
                            </tr>
                            <tr>
                                <th>상세주소</th>
                                <td>
                                    <input type="text" id="addrDetail" name="addrDetail" style="width:100%" value="">

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <br><br>

            <!-- Three -->
            <section id="three">
                <div class="container">


                    <h3>결제 정보 수정</h3>
                    <hr>

                    <h5>카드 번호</h5>
                    <div class="creditCardNumber">
                        <input type="text" class="moveNumber" onKeyup="inputMoveNumber(this);" maxlength="4"
                               style="width:23%"/>&nbsp;-&nbsp;
                        <input type="text" class="moveNumber" onKeyup="inputMoveNumber(this);" maxlength="4"
                               style="width:23%"/>&nbsp;-&nbsp;
                        <input type="text" class="moveNumber" onKeyup="inputMoveNumber(this);" maxlength="4"
                               style="width:23%"/>&nbsp;-&nbsp;
                        <input type="text" class="moveNumber" maxlength="4" style="width:23%"/>
                    </div>
                    <div class="creditCardValidity">
                        <h5>카드 유효기간</h5>
                        <input type="text" class="validThru" onKeyup="inputValidThru(this);" placeholder="MM/YY"
                               maxlength="5" style="width: 100%"/>
                    </div>
                    <div class="creditCardBirth">
                        <h5>생년월일</h5>
                        <input type="text" class="" placeholder="생년월일" maxlength="6" style="width: 100%">
                    </div>
                    <div>
                        <h5>카드 비밀번호</h5>
                        <div style="display:flex">
                        <input type="text" class="" placeholder="앞에 두자리만 입력해주세요" maxlength="2" style="width: 100%">
                            <input type="button" id="cardChange" class="doubleChk" value="변경">
                    </div>


                        <h5> * 본인명의 카드만 등록 가능 합니다.</h5>
                        <br><br>

                        <input type="submit" value="수정" style="width: 100%;"></input>
                    </div>

                </div>
            </section>
            <br><br><br><br>


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

                <!-- Scripts -->
<script src="/resources/js/signUp/jquery.min.js"></script>
<script src="/resources/js/signUp/jquery.scrollex.min.js"></script>
<script src="/resources/js/signUp/jquery.scrolly.min.js"></script>
<script src="/resources/js/signUp/browser.min.js"></script>
<script src="/resources/js/signUp/breakpoints.min.js"></script>
<script src="/resources/js/signUp/util.js"></script>
<script src="/resources/js/signUp/signUp.js"></script>
<script src="/resources/js/signUp/signUpCheck.js"></script>

<script src="/resources/js/signUp/signUpCheck.js"></script>

<script type="text/javascript">
    $('#pwBtn').click(function(e){
        e.preventDefault();
        $('#pwModal').modal("show");
    });

    $('#phoneBtn').click(function (e) {
        e.preventDefault();
        $('#phoneModal').modal("show");
    });

    function check_pw(){  //비밀번호 확인
        var password = document.getElementById('password').value;
        var password2 = document.getElementById('password2').value;

        if (password!==password2) {
            document.getElementById('pw_check_msg').innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요.";
        } else {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
        if (password2==="") {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
    }

</script>


</body>

</html>