<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form id="form" name="form" action="/admin/doctorJoin.do" method="post">
            <!-- One -->
            <section id="one">
                <div class="container">
                    <h3 style="margin-top: 100px">의사 회원가입</h3>

                    <hr>

                    <div style="font-size: 25px">로그인 정보에 사용됩니다<strong style="color: #1abc9c">(필수)</strong></div>
                    <br>
                    <diu class="input-control" id="divEmail">
                        <label for="email" class="doctor-title">이메일</label>
                        <input type="email" id="email" name="doctor_email" placeholder="이메일을 입력해주세요">
                        <div class="error"></div>
                    </diu>
                    <div class="input-control" id="divPassword">
                        <label for="password" class="doctor-title">비밀번호</label>
                        <input type="password" id="password" name="doctor_password" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control" id="divPassword2">
                        <label for="password2" class="doctor-title">비밀번호 확인</label>
                        <input type="password" id="password2" name="password2" placeholder="비밀번호를 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control" id="divPhone">
                        <label for="phone" class="doctor-title">휴대폰 번호</label>
                        <div style="display:flex">
                            <input id="phone" type="text" name="doctor_phone" title="전화번호 입력"/>
                            <input type="button" id="phoneChk" class="doubleChk" value="인증번호 받기">
                        </div>
                        <div class="error"></div>
                        <br/>
                    </div>
                        <div class="input-control" id="divPhone2">
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
                    <div class="input-control" id="divDoctorName">
                        <label class="doctor-title" for="doctorName">의사이름</label>
                        <input type="text" id="doctorName" name="doctor_name" placeholder="이름을 입력해주세요">
                        <div class="error"></div>
                    </div>
                    <div class="input-control" id="divDoctorNumber">
                        <label class="doctor-title" for="doctorNumber">의사면허번호</label>
                        <div style="display:flex">
                            <input id="doctorNumber" name="doctor_valid_number" type="text" maxlength="6">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control" id="divDoctorProfile">
                        <label class="doctor-title" for="doctorProfile">의사사진</label>
                        <div style="display:flex">
                            <input id="doctorProfile" name="doctor_profile_image_name" type="text" maxlength="6">
                        </div>
                        <div class="error"></div>
                    </div>
                    <div class="input-control" id="divBusinessNumber">
                        <label class="doctor-title" for="businessNumber">사업자번호</label>
                        <div style="display:flex">
                            <input id="businessNumber" style="width: 70%" name="hospital_business_number" type="text" maxlength="10">
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

                    <div>
                        <label class="doctor-title">진료과 선택</label>
                    </div>

                    <div>
<%--                        <input type="hidde" name="doctor_diagnosis_type"/>--%>
                         <div style="display:flex">
                        <select id='bComps' multiple='multiple' style="height: 200px;" >
                            <c:forEach var="med" items="${medicalList}">
                                <option value="${med.medical_name}">${med.medical_name}</option>
                            </c:forEach>
<%--                            <option value='내과'>1</option>--%>
<%--                            <option value='소아과'>2</option>--%>
<%--                            <option value='이비인후과'>3</option>--%>
                        </select>
                            <input type='button' id='btnLToR' value='▶'>
                            <input type='button' id='btnRToL' value='◀'>

                        <select id='aComps' multiple='multiple' name="doctor_diagnosis_type" style="height: 200px;"></select>

                        </div>
                    </div>



                    <div>
                        <label class="doctor-title">진료 시간 선택</label>
                        <label style="font-size: 10pt;">단위: 시간</label>
                        <div>
                            <div style="display:flex">
<%--           애도 히든추가                --%>
<%--                        <input type="hidden" id="openClose" name="openClose">--%>
                        <select name="open" class="form-select" style="width: 35%; margin-left: 30px" aria-label="오픈 진료 시간">
                            <option selected style="text-align: center;">진료 시작</option>
                            <option value="9" style="text-align: center">9</option>
                            <option value="10" style="text-align: center">10</option>
                            <option value="11" style="text-align: center">11</option>
                        </select>
                        <select name="close" class="form-select" style="width: 35%;  margin-left: 40px"  aria-label="마감 진료 시간">
                            <option selected style="text-align: center;">진료 마감</option>
                            <option value="17" style="text-align: center">17</option>
                            <option value="18" style="text-align: center">18</option>
                            <option value="19" style="text-align: center">19</option>

                        </select>
                            </div>
                    </div>
                    </div>
                        <br>
                    <div>
                        <label class="doctor-title">점심 시간 선택</label>
                        <label style="font-size: 10pt;">단위: 시간</label>
                        <div>
                            <div style="display:flex">
<%--                                <input type="hidden" name="lunch-time">--%>
                                <select name='lunch-st' class="form-select" id="lunch-st" style="width: 35%; margin-left: 30px" aria-label="Default select example">
                                    <option selected style="text-align: center;">점심시간(부터)</option>
                                    <option value="11" style="text-align: center">11</option>
                                    <option value="12" style="text-align: center">12</option>
                                    <option value="13" style="text-align: center">13</option>
                                </select>
                                <select name='lunch-cl' class="form-select" id="lunch-cl" style="width: 35%;  margin-left: 40px"  aria-label="Default select example">
                                    <option selected style="text-align: center;">점심시간(까지)</option>
                                    <option value="12" style="text-align: center">12</option>
                                    <option value="13" style="text-align: center">13</option>
                                    <option value="14" style="text-align: center">14</option>

                                </select>
                            </div>
                    </div>

                        <script>
                            // lunch-st 와 umnch-cl 의 벨류값 hidden 에 넘기기
                            const str = document.getElementsByName("lunch-st") +"~" + document.getElementsByName("lunch-cl")

                        </script>
                        <br>

                        <label class="doctor-title">병원 정기 휴무 선택</label><label style="font-size: 10pt;">(다중선택가능)</label>

                        <div class="rest-day">
<%--                            히든추가--%>
<%--                            <input type="hidden" id="holiday" name="holiday">--%>
<%--                            <label for="holiday" class="rest-check"style="margin-left: 50px">--%>

                                <span style="font-size: 15px; color: #000000">
                                    <input type="checkbox"  name="non" id="non"> 휴무없음</span>
<%--체크박스 인풋 span안에 넣어놨음--%>
                                <span style="font-size: 15px; color: #000000" > <input type="checkbox" class="check" name="holiday" id="mon" value="월" style="margin-left: 7px">월</span>

                                <span style="font-size: 15px; color: #000000"><input type="checkbox" class="check"name="holiday" id="tue" value="화" style="margin-left: 7px">화</span>

                                <span style="font-size: 15px; color: #000000"><input type="checkbox" class="check"name="holiday" id="wed" value="수" style="margin-left: 7px">수</span>

                                <span style="font-size: 15px; color: #000000"> <input type="checkbox" class="check"name="holiday" id="thurs" value="목" style="margin-left: 7px">목</span>

                                <span style="font-size: 15px; color: #000000"><input type="checkbox" class="check"name="holiday" id="fri" value="금" style="margin-left: 7px">금</span>

                                <span style="font-size: 15px; color: #000000"><input type="checkbox" class="check"name="holiday" id="sat" value="토" style="margin-left: 7px">토</span>

                                <span style="font-size: 15px; color: #000000"><input type="checkbox"class="check" name="holiday" id="sun" value="일" style="margin-left: 7px">일</span>
<%--                            </label>--%>

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
                            <label class="doctor-title" for="hospital_fax">팩스번호</label>
                            <div style="display:flex">
                                <input id="Hospital_fax" name="hospital_fax" type="text" maxlength="6">
                            </div>
                            <div class="error"></div>
                        </div>
                        <div class="input-control">
                            <label class="doctor-title" for="Hospital_url">홈페이지(URL)</label>
                            <div style="display:flex">
                                <input id="Hospital_url" name="hospital_url" type="text" maxlength="6">
                            </div>
                            <div class="error"></div>
                        </div>
                        <div class="input-control">
                            <label class="doctor-title" for="Doctor_introduction">병원소개</label>
                            <div style="display:flex">
                                <input id="Doctor_introduction" name="doctor_introduction" type="text" maxlength="6">
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
                    <input type="button"  onclick="validateInput()" value="회원가입" style="width: 100%;"></input>
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
<%--<script src="/resources/js/signUp/signUpCheck.js"></script>--%>

<script src="/resources/js/signUp/doctorJoin.js"></script>
<script src="/resources/js/signUp/doctorCheck.js"></script>

<script>
    $(function() {
        //-- 왼쪽 -> 오른쪽 이동
        $('#btnLToR').click(function (event) {
            $("#bComps option:selected").each(function () {
                if ($(this).index != 0) {
                    $(this).appendTo("#aComps");
                }
            });
            // alert($("#aComps").val()); -- 이동확인
        });

        //-- 오른쪽 -> 왼쪽 이동
        $("#btnRToL").click(function (event) {
            $("#aComps option:selected").each(function () {
                if ($(this).index != 0) {
                    $(this).appendTo("#bComps");
                }
            });
            // alert($("#bComps").val()); -- 이동확인
        });
    });


</script>

<%--사업자 번호 조회 태영--%>
<script>
    $(function(){
        $('#businessNumCheck').click(function(){
            let ceonumber=$('#businessNumber').val();
            let arrayData = {
                "b_no":[ceonumber]
            }

            // console.log(ceonumber);
            // console.log(arrayData);
            $.ajax({
                url:"https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=smkh950RF%2BKUYSGK2GSWio7MhSh80eabzme3oFO%2B%2B%2FbR9Zl0vWADP9G0sx2iCZJK5TihKXg4AYHUMb9XVYgX3w%3D%3D",
                type:"post",
                data: JSON.stringify(arrayData), // json 을 string으로 변환하여 전송
                dataType: "JSON",
                contentType: "application/json",
                accept: "application/json",
                success: function(data,result) {
                    console.log(data);
                    for(let i=0;i<data.data.length;i++){
                        console.log(data.data[i]);
                        console.log(data.data[i].tax_type);
                  if(data.data[i].tax_type === "국세청에 등록되지 않은 사업자등록번호입니다." ) {
                      alert("국세청에 등록되지 않은 사업자등록번호입니다.");

                  } else {
                      alert("확인되었습니다.")
                  }
                    }

                }

            })

        })
    })

</script>


</body>
</html>
