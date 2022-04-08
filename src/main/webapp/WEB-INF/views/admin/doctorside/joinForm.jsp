<%--가영: 병원회원가입페이지--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homespital</title>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>

    <style>
        .doctor-title {
            font-size: 20px;
        }
    </style>


</head>

<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <form id="form" name="form" action="/doctorJoin.do" method="post">
            <!-- One -->
            <section id="one">
                <div class="container">
                    <h3 style="margin-top: 100px">의사 회원가입</h3>

                    <hr>

                    <div style="font-size: 25px">로그인 정보에 사용됩니다<strong style="color: #1abc9c">(필수)</strong></div>
                    <br>
                    <diu class="input-control">
                        <label for="email" class="doctor-title">이메일</label>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요">
                        <div class="error"></div>
                    </diu>
                    <div class="input-control">
                        <label for="password" class="doctor-title">비밀번호</label>
                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password2" class="doctor-title">비밀번호 확인</label>
                        <input type="password" id="password2" name="password2" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="phone" class="doctor-title">휴대폰 번호</label>
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
                        <span class="point successPhoneChk">※ 휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
                        <input type="hidden" id="phoneDoubleChk"/>

                    </div>
                </div>
            </section>

            <br><br><br>
            <hr>
            <!-- Two -->
            <section id="two">
                <div class="container">
                    <div style="font-size: 25px">의사/병원정보<strong style="color: #1abc9c">(필수)</strong></div>
                    <br>
                    <div class="input-control">
                        <label class="doctor-title" for="name">의사이름</label>
                        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label class="doctor-title" for="doctorNumber">의사면허번호</label>
                        <div style="display:flex">
                            <input id="doctorNumber" name="doctorNumber" type="text" maxlength="6">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label class="doctor-title" for="doctorProfile">의사사진</label>
                        <div style="display:flex">
                            <input id="doctorProfile" name="doctorProfile" type="text" maxlength="6">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label class="doctor-title" for="businessNumber">사업자번호</label>
                        <div style="display:flex">
                            <input id="businessNumber" style="width: 70%" name="businessNumber1" type="text" maxlength="6">
                            <input type="button" id="businessNumCheck" class="doubleChk" style="width: 15%" value="조회">
                        </div>
                        <div class="error"></div>
                    </div>
                    <br>


                    <div>
                        <label class="doctor-title">병원주소</label>
                        <table style="width: 90%">
                            <colgroup>
                                <col style="width:20%">
                                <col>
                            </colgroup>
                            <tbody >
                            <tr>
                                <th>우편번호</th>
                                <td>
                                    <div style="display:flex">
                                        <input type="hidden" id="confmKey" name="confmKey" value="">
                                        <input type="text" id="zipNo" name="zipNo" readonly style="width:100%">
                                        <input type="button" value="주소검색" onclick="goPopup()"
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

                    <%--                    <div>--%>
                    <%--                        <label class="doctor-title">진료과 선택</label>--%>
                    <%--                    </div>--%>

                    <%--                    <div>--%>
                    <%--                        <select id='bComps' multiple='multiple'>--%>
                    <%--                            <option value='c001'>1</option>--%>
                    <%--                            <option value='c002'>2</option>--%>
                    <%--                            <option value='c003'>3</option>--%>
                    <%--                        </select>--%>

                    <%--                        <select id='aComps' multiple='multiple'></select>--%>

                    <%--                        <input type='button' id='btnLToR' value='오른쪽'>--%>
                    <%--                        <input type='button' id='btnRToL' value='왼쪽'>--%>
                    <%--                    </div>--%>



                    <div>
                        <label class="doctor-title">진료 시간 선택</label>
                        <label style="font-size: 10pt;">단위: 시간</label>
                        <div>
                            <div style="display:flex">

                                <select name='open' class="form-select" style="width: 35%; margin-left: 30px" aria-label="Default select example">
                                    <option selected style="text-align: center;">진료 시작</option>
                                    <option value="9" style="text-align: center">9</option>
                                    <option value="10" style="text-align: center">10</option>
                                    <option value="11" style="text-align: center">11</option>
                                </select>
                                <select name='close' class="form-select" style="width: 35%;  margin-left: 40px"  aria-label="Default select example">
                                    <option selected style="text-align: center;">진료 마감</option>
                                    <option value="17" style="text-align: center">17</option>
                                    <option value="18" style="text-align: center">18</option>
                                    <option value="19" style="text-align: center">19</option>

                                </select>
                            </div>
                        </div>
                        <br>
                        <div>
                            <label class="doctor-title">점심 시간 선택</label>
                            <label style="font-size: 10pt;">단위: 시간</label>
                            <div>
                                <div style="display:flex">

                                    <select name='lunch-st' class="form-select" style="width: 35%; margin-left: 30px" aria-label="Default select example">
                                        <option selected style="text-align: center;">점심시간(부터)</option>
                                        <option value="9" style="text-align: center">11</option>
                                        <option value="10" style="text-align: center">12</option>
                                        <option value="11" style="text-align: center">13</option>
                                    </select>
                                    <select name='lunch-cl' class="form-select" style="width: 35%;  margin-left: 40px"  aria-label="Default select example">
                                        <option selected style="text-align: center;">점심시간(까지)</option>
                                        <option value="17" style="text-align: center">12</option>
                                        <option value="18" style="text-align: center">13</option>
                                        <option value="19" style="text-align: center">14</option>

                                    </select>
                                </div>
                            </div>
                            <br>

                            <label class="doctor-title">병원 정기 휴무 선택</label><label style="font-size: 10pt;">(다중선택가능)</label>

                            <div class="rest-day">

                                <label class="rest-check" style="margin-left: 50px">
                                    <input type="checkbox"  name="non" id="non">
                                    <span style="font-size: 15px; color: #000000">휴무없음</span>
                                    <input type="checkbox" name="mon" id="mon" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">월</span>
                                    <input type="checkbox" name="tue" id="tue" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">화</span>
                                    <input type="checkbox" name="wed" id="wed" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">수</span>
                                    <input type="checkbox" name="thurs" id="thurs" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">목</span>
                                    <input type="checkbox" name="fri" id="fri" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">금</span>
                                    <input type="checkbox" name="sat" id="sat" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">토</span>
                                    <input type="checkbox" name="sun" id="sun" style="margin-left: 7px">
                                    <span style="font-size: 15px; color: #000000">일</span>
                                </label>

                            </div>
                            <div style="font-size: 12px;">* 병원 운영시간을 기반으로 비대면 진료 예약을 받을 수 있습니다.</div>

                            <div style="font-size: 12px;">  시간당 최대 10명 예약이 가능합니다.</div>

                            <div style="font-size: 12px;">  예약시간 관리는 환자리스트에서 확인 가능합니다.</div>
                        </div>

                    </div>
            </section>
            <br><br><br><br>

            <!-- Three -->
            <section id="three">
                <div class="container">
                    <div style="font-size: 25px">추가 정보 입력<strong style="color: #bcb9b9">(선택)</strong></div>
                    <div style="font-size: 12px;">* 진료예약시 환자에게 제공되는 정보입니다.</div>
                    <hr>
                    <div class="input-control">
                        <div class="input-control">
                            <label class="doctor-title" for="DoctorNumber">팩스번호</label>
                            <div style="display:flex">
                                <input id="DoctorFax" name="DoctorNumber" type="text" maxlength="6">
                            </div>
                            <div class="error"></div>
                        </div>
                        <div class="input-control">
                            <label class="doctor-title" for="DoctorNumber">홈페이지(URL)</label>
                            <div style="display:flex">
                                <input id="DoctorUrl" name="DoctorNumber" type="text" maxlength="6">
                            </div>
                            <div class="error"></div>
                        </div>
                        <div class="input-control">
                            <label class="doctor-title" for="doctorProfile">병원소개</label>
                            <div style="display:flex">
                                <input id="hospitalProfile" name="doctorProfile" type="text" maxlength="6">
                            </div>
                            <div class="error"></div>
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
                            <div style="font-size: 25px">약관동의</div>
                            <hr>
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
                                <input type="checkbox" name="agree" value="4">
                                <span>이벤트, 혜택정보 수신동의<strong class="select_disable" style="color: #b2afaf">(선택)</strong></span>
                            </label>
                        </div>
                    </div>
                    <br><br>
                    <input type="submit" id="join" name="join" value="회원가입" style="width: 90%;"></input>
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

<script src="/resources/js/signUp/doctorJoin.js"></script>

<script>
    // $(function()
    // {
    //     //-- 왼쪽 -> 오른쪽 이동
    //     $('#btnLToR').click(function(event)
    //     {
    //         $("#bComps option:selected").each(function()
    //         {
    //             if($(this).index!=0)
    //             {
    //                 $(this).appendTo("#aComps");
    //             }
    //         });
    //         // alert($("#aComps").val()); -- 이동확인
    //     });
    //
    //     //-- 오른쪽 -> 왼쪽 이동
    //     $("#btnRToL").click(function(event)
    //     {
    //         $("#aComps option:selected").each(function()
    //         {
    //             if($(this).index!=0)
    //             {
    //                 $(this).appendTo("#bComps");
    //             }
    //         });
    //         // alert($("#bComps").val()); -- 이동확인
    //     });
</script>




</body>
</html>