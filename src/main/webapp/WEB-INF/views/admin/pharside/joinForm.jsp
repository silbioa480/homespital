<%--용식: 약국 회원가입페이지--%>
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
<section id="sidebar" style="background-color: #FFCD4A;">
    <header>
        <span class="image avatar">
            <a href="/pharmacy/"><img src="/resources/img/design/logo_white.png" alt=""/></a></span>
    </header>
    <nav id="nav">
        <ul>
            <li class="nav-item"><a href="#one" class="nav-link active">로그인 정보 입력<font color="red">(필수)</font></a></li>
            <li class="nav-item"><a href="#two" class="nav-link ">약국 정보 입력<font color="red">(필수)</font></a></li>
            <li class="nav-item"><a href="#three" class="nav-link ">약관동의</a></li>
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
    <div id="main">
        <!-- One -->
        <form id="form" name="form" action="/pharmacy/join.do" method="post" data-bs-spy="scroll" data-bs-target="#nav"
              data-bs-offset="0" tabindex="0">
            <section id="one">
                <div>
                    <h3>약사 회원가입</h3>
                    <hr>
                    <div style="font-size: 25px">로그인 정보에 사용됩니다<strong style="color: #1abc9c">(필수)</strong></div>
                    <hr style="height:3px">
                    <diu class="input-control">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="pharmacy_email" placeholder="이메일을 입력해주세요">
                        <div class="error"></div>
                    </diu>
                    <div class="input-control">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="pharmacy_password" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password2">비밀번호 확인</label>
                        <input type="password" id="password2" name="password2" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="phone">휴대폰 번호</label>
                        <div style="display:flex">
                            <input id="phone" type="text" name="pharmacy_mobile" title="전화번호 입력"/>
                            <input type="button" id="phoneChk" class="doubleChk" value="인증번호 받기">
                        </div>
                        <div class="error"></div>
                        <br/>
                        <div class="input-control">
                            <div style="display:flex">
                                <input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled/>
                                <input type="button" id="phoneChk2" class="doubleChk" value="본인인증">
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
                <div>
                    <div style="font-size: 25px">약국정보입력<strong style="color: #1abc9c">(필수)</strong></div>
                    <hr style="height:3px">
                    <div class="input-control">
                        <label for="businessNumber">사업자 번호</label>
                        <div style="display:flex;">
                            <input type="text" id="businessNumber" name="pharmacy_business"
                                   placeholder="사업자 번호를 입력해주세요" style="width:370px">
                            <input type="button" id="businessNumCheck" class="businessBtn" value="사업자 조회"
                                   style="margin-left: 30px; width: 200px"/>
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="pharmacyName">약국명</label>
                        <input type="text" id="pharmacyName" name="pharmacy_name" placeholder="약국명을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <%--                    <div class="input-control">--%>
                    <%--                        <label for="institutionNumber">요양기관 번호</label>--%>
                    <%--                        <div style="display:flex">--%>
                    <%--                            <input type="text" id="institutionNumber" name="pharmacy_institution"--%>
                    <%--                                   placeholder="요양기관 번호를 입력해주세요">--%>
                    <%--                            <input class="institutionBtn" type="button" value="중복 확인">--%>
                    <%--                        </div>--%>
                    <%--                        <div class="error"></div>--%>

                    <%--                    </div>--%>
                    <div class="input-control">
                        <label for="pharmacyPhone">약국 전화번호</label>
                        <input type="text" id="pharmacyPhone" name="pharmacy_phone" placeholder="약국 전화번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label>약국 주소</label>
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
                                        <input type="text" id="zipNo" name="zipNo" style="width:200px">
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
                        <div class="error"></div>
                    </div>

                </div>
            </section>
            <br><br><br><br>

            <!-- Three -->
            <section id="three">
                <div>
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
                    <input id="subbtn" type="button" value="회원가입" style="width: 100%;" onClick="checkAll()"></input>
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
<script src="/resources/js/signUp/pharmacySignUpCheck.js"></script>


</body>

</html>
