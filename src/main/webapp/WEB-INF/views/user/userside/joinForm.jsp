<%--용식: 유저 회원가입페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homespital</title>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>

</head>

<body class="is-preload">

<%--<!-- Header -->--%>
<%--<section id="header">--%>
<%--    <header>--%>
<%--        <span class="image avatar"><img src="/resources/img/signUp/avatar.jpg" alt=""/></span>--%>
<%--        <h1 id="logo"><a href="#">Homespital</a></h1>--%>
<%--        <p>Hi</p>--%>

<%--    </header>--%>
<%--    <nav id="nav">--%>
<%--        <ul>--%>
<%--            <li><a href="#one" class="active">필수정보입력</a></li>--%>
<%--            <li><a href="#two">주소 입력</a></li>--%>
<%--            <li><a href="#three">결제 정보 입력</a></li>--%>
<%--            <li><a href="#four">약관동의</a></li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--    <footer>--%>
<%--        <ul class="icons">--%>
<%--            <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>--%>
<%--            <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>--%>
<%--            <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>--%>
<%--        </ul>--%>
<%--    </footer>--%>
<%--</section>--%>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <form id="form" name="form" action="/join.do" method="post">
            <!-- One -->
            <section id="one">
                <div class="container">
                    <h3>회원가입</h3>
                    <br>
                    <h5>로그인 정보에 사용됩니다(필수)</h5>
                    <hr>
                    <diu class="input-control">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요">
                        <div class="error"></div>
                    </diu>
                    <div class="input-control">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password2">비밀번호 확인</label>
                        <input type="password" id="password2" name="password2" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="SocialSecurityNumber">주민등록번호</label>
                        <div style="display:flex">
                            <input id="SocialSecurityNumber" name="SocialSecurityNumber1" type="text" maxlength="6">&nbsp__&nbsp<input
                                type="text" id="SocialSecurityNumber2" name="SocialSecurityNumber2" maxlength="7">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="phone">휴대폰 번호</label>
                        <div style="display:flex">
                            <input id="phone" type="text" name="phone" title="전화번호 입력"/>
                            <input type="button" id="phoneChk" class="doubleChk" value="인증번호 받기">
                        </div>
                        <div class="error"></div>
                        <br/>
                        <div style="display:flex">
                            <input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled/>
                            <input type="button" id="phoneChk2" class="doubleChk" value="본인인증">
                        </div>
                        <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
                        <input type="hidden" id="phoneDoubleChk"/>

                    </div>
                </div>
            </section>

            <br><br><br><br>

            <!-- Two -->
            <section id="two">
                <div class="container">
                    <h5>배송 정보에 사용됩니다(선택)</h5>
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
                                        <input type="text" id="zipNo" name="zipNo" readonly style="width:200px">
                                        <input type="button" value="주소검색" onclick="goPopup()"
                                               style=" margin-left:30px;">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>도로명주소</th>
                                <td><input type="text" id="roadFullAddr" name="roadFullAddr" style="width:85%"></td>
                            </tr>
                            <tr>
                                <th>상세주소</th>
                                <td>
                                    <input type="text" id="addrDetail" name="addrDetail" style="width:40%" value="">

                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <br><br><br><br>

            <!-- Three -->
            <section id="three">
                <div class="container">
                    <h5>결제 정보에 사용됩니다(선택)</h5>
                    <hr>
                    <div class="input-control">
                    <h5 class="card-title">카드 별칭</h5>
                        <div style="display:flex">
                        <input style="width: 100%" id="cardNameModal" type="text"
                               name="cardNameModal"
                               placeholder="카드 별칭를 입력해주세요. ( 최대 8자 )" title="카드 별칭 입력"
                               maxlength="8"/>
                    </div>
                    <div class="error"></div>
                    </div>

                    <div class="input-control">
                        <h5 class="card-title">카드 번호</h5>
                        <div style="display:flex">
                            <input style="width: 24%; height:40px;" id="cardNumModal1" type="text"
                                   name="cardNumModal1" maxlength="4" minlength="4"/>
                            <span style="line-height:40px;">-</span>
                            <input style="width: 24%; height:40px;" id="cardNumModal2"
                                   type="password"
                                   name="cardNumModal2" maxlength="4" minlength="4"/>
                            <span style="line-height:40px;">-</span>
                            <input style="width: 24%; height:40px;" id="cardNumModal3"
                                   type="password"
                                   name="cardNumModal3" maxlength="4" minlength="4"/>
                            <span style="line-height:40px;">-</span>
                            <input style="width: 24%; height:40px;" id="cardNumModal4" type="text"
                                   name="cardNumModal4" maxlength="4" minlength="4"/>
                        </div>
                    </div>


                    <div class="input-control">
                        <h5 class="card-title">카드 유효기간</h5>
                        <div style="display:flex">
                            <input style="width: 100%" id="cardMMYYNumModal" type="text"
                                   name="cardMMYYNumModal"
                                   title="카드 유효기간" placeholder="MMYY" maxlength="4" minlength="4"/>
                        </div>
                    </div>


                    <div class="input-control">
                        <h5 class="card-title">카드 비밀번호</h5>
                        <div style="display:flex">
                            <input style="width: 100%" id="cardPassword" type="password"
                                   name="cardPassword"
                                   title="카드 비밀번호" placeholder="비밀번호 앞자리 2개 입력하세요." maxlength="2"
                                   minlength="2"/>
                        </div>
                    </div>
                </div>



            </section>
            <br><br><br><br>


            <!-- Four -->
            <section id="four">
                <div class="container">
                    <div class="">
                        <div class="">
                            <h5>약관동의</h5>
                            <hr>
                            <label for="agree_all" style="display:block">
                                <input type="checkbox" name="agree_all" id="agree_all">
                                <span>모두 동의합니다</span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="1">
                                <span>이용약관 동의<strong>(필수)</strong></span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="2">
                                <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
                            </label>
                            <label style="display:block">
                                <input type="checkbox" name="agree" value="3">
                                <span>개인정보 이용 동의<strong>(필수)</strong></span>
                            </label>
                            <label style="display:block;">
                                <input type="checkbox" name="agree" value="4">
                                <span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
                            </label>
                        </div>
                    </div>
                    <br><br><br>
                    <input type="submit" value="회원가입" style="width: 100%;"></input>
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

</body>

</html>
