<%--용식: 유저 회원가입페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homespital</title>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <link rel="stylesheet" href="/resources/css/sidebar.css"/>

</head>

<body class="is-preload">

<!-- Header -->
<section id="sidebar">
    <header>
        <span class="image avatar">
            <a href="/"><img src="/resources/img/design/logo_U_sideNav.png"></a></span>
        <%--        <h1 id="logo"><a href="#">Homespital</a></h1>--%>

    </header>
    <nav id="nav">
        <ul>
            <li class="nav-item"><a href="#one" class="nav-link active">필수정보입력</a></li>
            <li class="nav-item"><a href="#two" class="nav-link">주소 입력</a></li>
            <%--            <li><a href="#three">결제 정보 입력</a></li>--%>
            <li class="nav-item"><a href="#four" class="nav-link">약관동의</a></li>
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
        <form id="form" name="form" action="/join.do" method="post" data-bs-spy="scroll" data-bs-target="#nav"
              data-bs-offset="0" tabindex="0">
            <!-- One -->
            <section id="one">
                <div class="container">
                    <h3 style="margin-top: 100px; color: navy">홈스피탈 회원가입</h3>
                    <br>
                    <div style="font-size: 25px">로그인 정보에 사용됩니다<strong style="color: #1abc9c">(필수)</strong></div>
                    <hr style="height:3px">
                    <div class="input-control">
                        <label for="email">이메일</label>
                        <input class="signup_inputs user_border" type="email" id="email" name="email"
                               placeholder="이메일을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password">비밀번호</label>
                        <input class="signup_inputs user_border" type="password" id="password" name="password"
                               placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password2">비밀번호 확인</label>
                        <input class="signup_inputs user_border" type="password" id="password2" name="password2"
                               placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="name">이름</label>
                        <input class="signup_inputs user_border" type="text" id="name" name="name"
                               placeholder="이름을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="SocialSecurityNumber1">주민등록번호</label>
                        <div style="display:flex">
                            <input class="signup_inputs user_border" id="SocialSecurityNumber1"
                                   name="SocialSecurityNumber1" type="text" maxlength="6" style="width: 285px">&nbsp__&nbsp
                            <input class="signup_inputs user_border" type="password" id="SocialSecurityNumber2"
                                   name="SocialSecurityNumber2"
                                   maxlength="7" style="width: 285px">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="phone">휴대폰 번호</label>
                        <div style="display:flex">
                            <input class="signup_inputs user_border" id="phone" type="text" name="phone"
                                   title="전화번호 입력" style=""/>
                            <input type="button" id="phoneChk" class="w-btn" value="인증번호 받기">
                        </div>
                        <div class="error"></div>
                        <br/>
                        <div class="input-control">
                            <div style="display:flex">
                                <input class="signup_inputs user_border" id="phone2" type="text" name="phone2"
                                       title="인증번호 입력" disabled style=""/>
                                <input type="button" id="phoneChk2" class="w-btn" value="본인인증">
                            </div>
                            <div class="error"></div>
                            <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
                            <input type="hidden" id="phoneDoubleChk"/>
                        </div>
                    </div>
                </div>
            </section>

            <br><br><br><br>

            <!-- Two -->
            <section id="two">
                <div class="container">
                    <div style="font-size: 25px">배송 정보에 사용됩니다<strong style="color: #1abc9c">(선택)</strong></div>
                    <hr style="height:3px">
                    <div class="input-control">
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
                                        <input class="signup_inputs user_border" type="text" id="zipNo" name="zipNo"
                                               readonly style=" width:200px">
                                        <input type="button" value="주소검색" onclick="goPopup()"
                                               class="w-btn">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>도로명주소</th>
                                <td><input class="signup_inputs user_border" type="text" id="roadFullAddr"
                                           name="roadFullAddr" style="width:85%"></td>
                            </tr>
                            <tr>
                                <th>상세주소</th>
                                <td>
                                    <input class="signup_inputs user_border" type="text" id="addrDetail"
                                           name="addrDetail" style="width:40%" value="">

                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="error"></div>
                    </div>
                </div>
            </section>
            <br><br><br>
            <%--            <br><br><br><br>--%>

            <!-- Three -->
            <%--            <section id="three">--%>
            <%--                <div class="container">--%>
            <%--                    <h5>결제 정보에 사용됩니다(선택)</h5>--%>
            <%--                    <hr style="height:4px">--%>
            <%--                    <div class="input-control">--%>
            <%--                    <h5 class="card-title">카드 별칭</h5>--%>
            <%--                        <div style="display:flex">--%>
            <%--                        <input style="width: 100%" id="cardNameModal" type="text"--%>
            <%--                               name="cardNameModal"--%>
            <%--                               placeholder="카드 별칭를 입력해주세요. ( 최대 8자 )" title="카드 별칭 입력"--%>
            <%--                               maxlength="8"/>--%>
            <%--                    </div>--%>
            <%--                    <div class="error"></div>--%>
            <%--                    </div>--%>

            <%--                    <div class="input-control">--%>
            <%--                        <h5 class="card-title">카드 번호</h5>--%>
            <%--                        <div style="display:flex">--%>
            <%--                            <input style="width: 24%; height:40px;" id="cardNumModal1" type="text"--%>
            <%--                                   name="cardNumModal1" maxlength="4" minlength="4"/>--%>
            <%--                            <span style="line-height:40px;">-</span>--%>
            <%--                            <input style="width: 24%; height:40px;" id="cardNumModal2"--%>
            <%--                                   type="password"--%>
            <%--                                   name="cardNumModal2" maxlength="4" minlength="4"/>--%>
            <%--                            <span style="line-height:40px;">-</span>--%>
            <%--                            <input style="width: 24%; height:40px;" id="cardNumModal3"--%>
            <%--                                   type="password"--%>
            <%--                                   name="cardNumModal3" maxlength="4" minlength="4"/>--%>
            <%--                            <span style="line-height:40px;">-</span>--%>
            <%--                            <input style="width: 24%; height:40px;" id="cardNumModal4" type="text"--%>
            <%--                                   name="cardNumModal4" maxlength="4" minlength="4"/>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>


            <%--                    <div class="input-control">--%>
            <%--                        <h5 class="card-title">카드 유효기간</h5>--%>
            <%--                        <div style="display:flex">--%>
            <%--                            <input style="width: 100%" id="cardMMYYNumModal" type="text"--%>
            <%--                                   name="cardMMYYNumModal"--%>
            <%--                                   title="카드 유효기간" placeholder="MMYY" maxlength="4" minlength="4"/>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>


            <%--                    <div class="input-control">--%>
            <%--                        <h5 class="card-title">카드 비밀번호</h5>--%>
            <%--                        <div style="display:flex">--%>
            <%--                            <input style="width: 100%" id="cardPassword" type="password"--%>
            <%--                                   name="cardPassword"--%>
            <%--                                   title="카드 비밀번호" placeholder="비밀번호 앞자리 2개 입력하세요." maxlength="2"--%>
            <%--                                   minlength="2"/>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>


            <!-- Four -->
            <section id="four">
                <div class="container">
                    <div class="">
                        <div class="input-control">
                            <div style="font-size: 25px">약관동의</div>
                            <hr style="height:3px">
                            <label for="agree_all" style="display:block">
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span>모두 동의합니다</span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="1">
                                <span>이용약관 동의<strong style="color: #1abc9c">(필수)</strong></span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="2">
                                <span>개인정보 수집, 이용 동의<strong style="color: #1abc9c">(필수)</strong></span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="3">
                                <span>개인정보 이용 동의<strong style="color: #1abc9c">(필수)</strong></span>
                            </label>
                            <label style="display:block;">
                                <input type="checkbox" name="agree2" value="4">
                                <span>이벤트, 혜택정보 수신동의<strong class="select_disable" style="color: #1abc9c">(선택)</strong></span>
                            </label>
                            <div class="error"></div>
                        </div>
                    </div>
                    <br><br><br>
                    <input id="subbtn" class="w-btn" type="button" value="회원가입" style="width: 100%;"
                           onClick="checkAll()"></input>
                </div>
            </section>
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
<script>
    var scrollSpy = new bootstrap.ScrollSpy(document.body, {
        target: '#nav'
    })
</script>
</body>

</html>
