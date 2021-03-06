<%-- Created by IntelliJ IDEA. User: InSung Date: 2022-04-01 Time: 오전 12:23 To
change this template use File | Settings | File Templates. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/sidebar.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> --%>
    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" /> --%>
    <%-- <script src="./jquery-3.4.1.min.js"></script> --%>
    <%-- <link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" /> --%>
    <%-- <script src="./bootstrapt/js/bootstrap.min.js"></script> --%>
    <style>
        .addCard,
        .deleteCard {
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
<section id="sidebar">
    <div class="d-flex flex-column align-items-center">
        <div style="height: 30px"></div>
        <span class="image avatar">
            <a href="/"><img src="/resources/img/design/logo_U_sideNav.png" alt=""/></a></span>
        <p class="userName">${user.user_name}님 안녕하세요.</p>
    </div>
    <nav>
        <ul id="nav">
            <li class="nav-item">
                <a href="#one" class="nav-link active">필수정보수정</a>
            </li>
            <li class="nav-item">
                <a href="#two" class="nav-link">배송지 수정</a>
            </li>
            <li class="nav-item">
                <a href="#three" class="nav-link">결제 정보 수정</a>
            </li>
        </ul>
    </nav>
    <%--    <footer>--%>
    <%--        <ul class="icons">--%>
    <%--            <li>--%>
    <%--                <a href="#" class="icon brands fa-twitter"--%>
    <%--                ><span class="label">Twitter</span></a--%>
    <%--                >--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#" class="icon brands fa-facebook-f"--%>
    <%--                ><span class="label">Facebook</span></a--%>
    <%--                >--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#" class="icon brands fa-instagram"--%>
    <%--                ><span class="label">Instagram</span></a--%>
    <%--                >--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#" class="icon brands fa-github"--%>
    <%--                ><span class="label">Github</span></a--%>
    <%--                >--%>
    <%--            </li>--%>
    <%--            <li>--%>
    <%--                <a href="#" class="icon solid fa-envelope"--%>
    <%--                ><span class="label">Email</span></a--%>
    <%--                >--%>
    <%--            </li>--%>
    <%--        </ul>--%>
    <%--    </footer>--%>
</section>
<div class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <form
                    id="form"
                    name="form"
                    action="/modifyMember.do"
                    method="post"
            >
                <input
                        type="hidden"
                        id="user_email"
                        name="user_email"
                        value="${email}"
                />
                <!-- One -->
                <section id="one">
                    <div class="container" style="margin-top: 150px">
                        <h3>필수 회원정보 수정</h3>
                        <hr/>
                        <table>
                            <tr>
                                <th>
                                    <label style="width: 140px" for="email">이메일</label>
                                </th>
                                <td>
                                    <input
                                            class="signup_inputs user_border"
                                            style="width: 100%"
                                            type="text"
                                            id="email"
                                            name="email"
                                            value="${email}"
                                            readonly="readonly"
                                    />
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <label for="password">새 비밀번호</label>
                                </th>
                                <td>
                                    <input
                                            class="signup_inputs user_border"
                                            type="password"
                                            style="width: 100%"
                                            id="password"
                                            name="password"
                                            placeholder="비밀번호를 입력해주세요"
                                            value=""
                                            minlength="4"
                                            maxlength="12"
                                            size="15"
                                            pattern="[a-zA-Z0-9]{4,12}"
                                            title="4~12자의 영문 대소문자와 숫자로만 입력."
                                    />
                                    <div class="error"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label for="password2">새 비밀번호 확인</label>
                                </th>
                                <td>
                                    <input
                                            class="signup_inputs user_border"
                                            type="password"
                                            style="width: 100%"
                                            id="password2"
                                            name="password2"
                                            placeholder="비밀번호를 입력해주세요"
                                            onkeyup="check_pw()"
                                            value=""
                                            maxlength="12"
                                            size="15"
                                    />
                                    <span id="pw_check_msg" style="color: #1abc9c"></span>
                                    <div class="error"></div>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <label for="name">이름</label>
                                </th>
                                <td>
                                    <input
                                            class="signup_inputs user_border"
                                            style="width: 100%"
                                            type="text"
                                            id="name"
                                            name="name"
                                            value="${user.user_name}"
                                            readonly="readonly"
                                    />
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <label for="SocialSecurityNumber">주민등록번호</label>
                                </th>
                                <td>
                                    <div
                                            id="SocialSecurityNumber"
                                            name="SocialSecurityNumber"
                                            style="display: flex"
                                    >
                                        <input
                                                class="signup_inputs user_border"
                                                style="width: 100%"
                                                type="text"
                                                value="${user.user_registration_number}"
                                                readonly="readonly"
                                        />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label for="phone">휴대폰 번호</label>
                                </th>
                                <td>
                                    <div style="display: flex">
                                        <input
                                                class="signup_inputs user_border"
                                                style="width: 100%"
                                                id="originphone"
                                                type="text"
                                                name="phone"
                                                value="${user.user_phone}"
                                                readonly="readonly"
                                        />
                                        <input
                                                type="button"
                                                id="phoneBtn"
                                                class="w-btn"
                                                value="휴대폰번호변경"
                                        />
                                    </div>
                                </td>

                                <%--가영: 여기서부터 휴대폰 번호변경 인증번호 모달창 시작--%>
                                <div
                                        class="modal fade"
                                        id="phoneModal"
                                        tabindex="-1"
                                        role="dialog"
                                        aria-labelledby="exampleModalLabel"
                                        aria-hidden="true"
                                >
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="phoneModalLabel">
                                                    휴대폰번호 수정
                                                </h5>
                                            </div>
                                            <div class="modal-body">
                                                <div class="input-control">
                                                    <div style="display: flex">
                                                        <input
                                                                class="signup_inputs user_border"
                                                                id="phone"
                                                                type="text"
                                                                name="phone"
                                                                placeholder="휴대폰번호를 입력해 주세요."
                                                                title="전화번호 입력"
                                                        />
                                                        <input
                                                                style="width: 185px"
                                                                type="button"
                                                                id="phoneChk"
                                                                class="w-btn"
                                                                value="인증번호 받기"
                                                        />
                                                    </div>
                                                    <div class="error"></div>
                                                </div>
                                                <div class="input-control">
                                                    <div style="display: flex">
                                                        <input
                                                                class="signup_inputs user_border"
                                                                id="phone2"
                                                                type="text"
                                                                name="phone2"
                                                                placeholder="인증번호를 입력해 주세요."
                                                                title="인증번호 입력"
                                                                disabled
                                                        />
                                                        <input
                                                                style="width: 185px"
                                                                type="button"
                                                                id="phoneChk2"
                                                                class="w-btn"
                                                                value="본인인증"
                                                        />
                                                    </div>
                                                    <%--                                                <div class="modal-footer" style="width: 470px">--%>
                                                    <%--                                                    <button--%>
                                                    <%--                                                            class="phonemodibtn btn"--%>
                                                    <%--                                                            id="modalY2"--%>
                                                    <%--                                                            disabled--%>
                                                    <%--                                                    >--%>
                                                    <%--                                                        수정--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                    <button--%>
                                                    <%--                                                            class="btn"--%>
                                                    <%--                                                            type="button"--%>
                                                    <%--                                                            data-bs-dismiss="modal"--%>
                                                    <%--                                                    >--%>
                                                    <%--                                                        취소--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </div>--%>
                                                    <%--                                                <div class="error" style="width: 300px"></div>--%>
                                                    <%--                                            </div>--%>
                                                </div>
                                                <div class="modal-footer">
                                                    <a
                                                            class="w-btn phonemodibtn"
                                                            style="text-align: center"
                                                            id="modalY2"
                                                            href="/modifyForm"
                                                    >수정</a
                                                    >
                                                    <button
                                                            class="w-btn"
                                                            type="button"
                                                            data-bs-dismiss="modal"
                                                    >
                                                        취소
                                                    </button>
                                                </div>
                                            </div>
                                            <%--가영: 여기까지 휴대폰 번호변경 인증번호 모달창
                                            시작--%>
                                            <div class="error"></div>
                                        </div>
                                    </div>

                                    <div class="error"></div>
                                </div>
                            </tr>
                        </table>
                    </div>
                </section>

                <br/><br/><br/><br/>

                <!-- Two -->
                <section id="two">
                    <div class="container">
                        <h4>배송지 정보 수정</h4>
                        <hr/>
                        <div>
                            <table>
                                <colgroup>
                                    <col style="width: 20%"/>
                                    <col/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>우편번호</th>
                                    <td>
                                        <div style="display: flex">
                                            <input
                                                    type="hidden"
                                                    id="confmKey"
                                                    name="confmKey"
                                                    value=""
                                            />
                                            <input
                                                    class="signup_inputs user_border"
                                                    type="text"
                                                    id="zipNo"
                                                    name="zipNo"
                                                    readonly
                                                    style="width: 100%"
                                                    value="${user.zip_code}"
                                            />
                                            <input
                                                    class="w-btn"
                                                    type="button"
                                                    value="주소변경"
                                                    onclick="goPopup()"
                                            />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>도로명주소</th>
                                    <td>
                                        <input
                                                class="signup_inputs user_border"
                                                type="text"
                                                id="roadFullAddr"
                                                name="roadFullAddr"
                                                style="width: 100%"
                                                value="${user.street_address}"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th>상세주소</th>
                                    <td>
                                        <input
                                                class="signup_inputs user_border"
                                                type="text"
                                                id="addrDetail"
                                                name="addrDetail"
                                                style="width: 100%"
                                                value="${user.detail_address}"
                                        />
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                <br/><br/>

                <!-- Three -->
                <section id="three">
                    <div class="container">
                        <h3>카드 관리</h3>
                        <hr/>
                        <div class="input-group">
                            <input
                                    class="signup_inputs user_border"
                                    style="width: 70%"
                                    type="text"
                                    class="form-control"
                                    id="default_card"
                                    value="${cardInfo}"
                                    disabled="disabled"
                            />
                            <button
                                    id="writeCard"
                                    class="w-btn button"
                                    style="width: fit-content !important"
                                    onclick="return false;"
                            >
                                카드 등록/변경
                            </button>
                        </div>
                        <%-- 모달 --%>
                        <div
                                class="modal fade"
                                id="addCardModal"
                                tabindex="-1"
                                role="dialog"
                                aria-labelledby="exampleModalLabel"
                                aria-hidden="true"
                        >
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCardLabel">
                                            메인 카드 변경
                                        </h5>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <input
                                                    type="radio"
                                                    name="cardCheck"
                                                    class="card_list"
                                                    value="1111"
                                                    checked
                                            />
                                            <span> ****-****-****-1111</span>
                                        </div>
                                        <hr/>
                                        <div>
                                            <input
                                                    type="radio"
                                                    name="cardCheck"
                                                    class="card_list"
                                                    value="2222"
                                            />
                                            <span> ****-****-****-2222</span>
                                        </div>
                                        <hr/>
                                        <div>
                                            <input
                                                    type="radio"
                                                    name="cardCheck"
                                                    class="card_list"
                                                    value="3333"
                                            />
                                            <span> ****-****-****-3333</span>
                                        </div>
                                        <hr/>
                                        <div>
                                            <input
                                                    type="radio"
                                                    name="cardCheck"
                                                    class="card_list"
                                                    value="4444"
                                            />
                                            <span> ****-****-****-4444</span>
                                        </div>
                                        <hr/>
                                    </div>
                                    <div class="modal-footer">
                                        <a class="btn" id="modalY3" onclick="">확인</a>
                                        <button
                                                class="w-btn"
                                                type="button"
                                                data-bs-dismiss="modal"
                                        >
                                            취소
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--
                        <span
                          ><input
                            type="button"
                            id="deleteCard"
                            name="deleteCard"
                            class="deleteCard"
                            value="삭제" /></span
                        >--%>
                    </div>
                    <div
                            class="modal fade"
                            id="writeCardModal"
                            tabindex="-1"
                            role="dialog"
                    >
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5>카드 등록/변경</h5>
                                </div>
                                <div class="modal-body">
                                    <div class="input-control">
                                        <h6 class="modal-title">카드 별칭</h6>
                                        <div style="display: flex">
                                            <input
                                                    class="signup_inputs user_border"
                                                    id="cardNameModal"
                                                    type="text"
                                                    name="cardNameModal"
                                                    placeholder="카드 별칭를 입력해주세요. ( 최대 8자 )"
                                                    title="카드 별칭 입력"
                                                    maxlength="8"
                                            />
                                        </div>
                                        <div class="error"></div>
                                    </div>
                                    <div class="input-control">
                                        <h6 class="modal-title">카드 번호</h6>
                                        <div style="display: flex">
                                            <input
                                                    class="signup_inputs user_border"
                                                    style="width: 23%; height: 40px"
                                                    id="cardNumModal1"
                                                    type="text"
                                                    name="cardNumModal1"
                                                    maxlength="4"
                                                    minlength="4"
                                            />
                                            <span style="line-height: 40px">-</span>
                                            <input
                                                    class="signup_inputs user_border"
                                                    style="width: 23%; height: 40px"
                                                    id="cardNumModal2"
                                                    type="password"
                                                    name="cardNumModal2"
                                                    maxlength="4"
                                                    minlength="4"
                                            />
                                            <span style="line-height: 40px">-</span>
                                            <input
                                                    class="signup_inputs user_border"
                                                    style="width: 23%; height: 40px"
                                                    id="cardNumModal3"
                                                    type="password"
                                                    name="cardNumModal3"
                                                    maxlength="4"
                                                    minlength="4"
                                            />
                                            <span style="line-height: 40px">-</span>
                                            <input
                                                    class="signup_inputs user_border"
                                                    style="width: 23%; height: 40px"
                                                    id="cardNumModal4"
                                                    type="text"
                                                    name="cardNumModal4"
                                                    maxlength="4"
                                                    minlength="4"
                                            />
                                        </div>
                                    </div>
                                    <h6 class="modal-title">카드 유효기간</h6>
                                    <div class="input-control">
                                        <div style="display: flex">
                                            <input
                                                    class="signup_inputs user_border"
                                                    id="cardMMYYNumModal"
                                                    type="text"
                                                    name="cardMMYYNumModal"
                                                    title="카드 유효기간"
                                                    placeholder="MMYY"
                                                    maxlength="4"
                                                    minlength="4"
                                            />
                                        </div>
                                    </div>
                                    <h6 class="modal-title">카드 비밀번호</h6>
                                    <div class="input-control">
                                        <div style="display: flex">
                                            <input
                                                    class="signup_inputs user_border"
                                                    id="cardPassword"
                                                    type="password"
                                                    name="cardPassword"
                                                    title="카드 비밀번호"
                                                    placeholder="비밀번호 앞자리 2개 입력하세요."
                                                    maxlength="2"
                                                    minlength="2"
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button
                                            class="w-btn"
                                            type="button"
                                            id="submitNewCard"
                                            onclick="submitNewCardId(); return false;"
                                    >
                                        변경
                                    </button>
                                    <button class="w-btn" type="button" data-bs-dismiss="modal">
                                        취소
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h5 style="margin-left: 60px">* 본인명의 카드만 등록 가능 합니다.</h5>
                    <br/><br/>
                    <div class="d-flex" style="justify-content: center">
                        <input
                                type="button"
                                value="수정"
                                class="w-btn"
                                style="margin-left: 20px; margin-right: 20px"
                                onclick="checkAll()"
                        />
                        <a
                                class="w-btn button"
                                style="text-align: center"
                                id="deleteMem"
                                href="/delete"
                                style="margin-right: 0px"
                        > 회원탈퇴</a
                        >
                    </div>
                </section>
                <br/><br/><br/><br/>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <%--    <section id="footer">--%>
    <%--        <div class="container">--%>
    <%--            <ul class="copyright">--%>
    <%--                <li>&copy; Untitled. All rights reserved.</li>--%>
    <%--                <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--    </section>--%>
</div>

<!-- Scripts -->
<script src="/resources/js/signUp/jquery.min.js"></script>
<script src="/resources/js/signUp/jquery.scrollex.min.js"></script>
<script src="/resources/js/signUp/jquery.scrolly.min.js"></script>
<script src="/resources/js/signUp/browser.min.js"></script>
<script src="/resources/js/signUp/breakpoints.min.js"></script>
<script src="/resources/js/signUp/util.js"></script>
<script src="/resources/js/signUp/signUp.js"></script>
<script src="/resources/js/signUp/modifyForm.js"></script>
<%--<script src="/resources/js/signUp/signUpCheck.js"></script>--%>

<script type="text/javascript">
    $("#pwBtn").click(function (e) {
        e.preventDefault();
        $("#pwModal").modal("show");
    });
    //가영: 휴대폰번호 수정관련 모달창
    $("#phoneBtn").click(function (e) {
        e.preventDefault();
        $("#phoneModal").modal("show");
    });
    $("#addCard").click(function (e) {
        e.preventDefault();
        $("#addCardModal").modal("show");
    });
    $("#writeCard").click(function (e) {
        e.preventDefault();
        $("#writeCardModal").modal("show");
    });
    $("#modalY3").click(function (e) {
        e.preventDefault();
        let radioV = $('input:radio[name="cardCheck"]:checked').val();
        console.log(radioV);
        $("#default_card").val("****-****-****-" + radioV);
        $("#addCardModal").modal("hide");
    });

    //가영: 휴대폰인증 후 부모창으로 데이터전송하는 함수
    // function getParentText() {
    //     $('#phoneModal').modal("hide");
    //     document.getElementById("originphone").value = document.getElementById("phone").value
    // }

    //새로운 비밀번호 입력시 정규성검사(아래에 에러메세지 뜸)
    function check_pw() {
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        if (password !== password2) {
            document.getElementById("pw_check_msg").innerHTML =
                "비밀번호가 다릅니다. 다시 확인해 주세요.";
        } else {
            document.getElementById("pw_check_msg").innerHTML = "";
        }
        if (password2 === "") {
            document.getElementById("pw_check_msg").innerHTML = "";
        }
    }

    //새로운 비밀번호 입력시 정규성검사(아래에 에러메세지 뜸)
    function check_pw() {
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        if (password !== password2) {
            document.getElementById("pw_check_msg").innerHTML =
                "비밀번호가 다릅니다. 다시 확인해 주세요.";
        } else {
            document.getElementById("pw_check_msg").innerHTML = "";
        }
        if (password2 === "") {
            document.getElementById("pw_check_msg").innerHTML = "";
        }
    }

    function submitNewCardId() {
        if ($("#cardNameModal").val() == "") {
            alert("카드 별칭을 입력해주세요.");
            $("#cardNameModal").focus();
            return false;
        }

        function getParentText() {
            document.getElementById("cardName").value =
                document.getElementById("cardNameModal").value;
            document.getElementById("lastCardNum").value =
                document.getElementById("lastCardNumModal").value;
            document.getElementById("cardMMYYNum").value =
                document.getElementById("cardMMYYNumModal").value;
        }

        //새로운 비밀번호 입력시 정규성검사(아래에 에러메세지 뜸)
        function check_pw() {
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            if (password !== password2) {
                document.getElementById("pw_check_msg").innerHTML =
                    "비밀번호가 다릅니다. 다시 확인해 주세요.";
            } else {
                document.getElementById("pw_check_msg").innerHTML = "";
            }
            if (password2 === "") {
                document.getElementById("pw_check_msg").innerHTML = "";
            }
        }

        // function submitNewCardId() {
        if ($("#cardNameModal").val() == "") {
            alert("카드 별칭을 입력해주세요.");
            $("#cardNameModal").focus();
            return false;
        }
        if ($("#cardNumModal1").val().length != 4) {
            alert("1.4자리");
            $("#cardNumModal1").focus();
            return false;
        } else if ($("#cardNumModal2").val().length != 4) {
            alert("2.4자리");
            $("#cardNumModal2").focus();
            return false;
        } else if ($("#cardNumModal3").val().length != 4) {
            alert("3.4자리");
            $("#cardNumModal3").focus();
            return false;
        } else if ($("#cardNumModal4").val().length != 4) {
            alert("4.4자리");
            $("#cardNumModal4").focus();
            return false;
        }
        if ($("#cardMMYYNumModal").val().length != 4) {
            alert("유효기간 숫자 4자리를 입력해주세요.");
            $("#cardMMYYNumModal").focus();
            return false;
        }
        if ($("#cardPassword").val().length != 2) {
            alert("카드 비밀번호 앞자리 2자리를 입력해주세요.");
            $("#cardPassword").focus();
            return false;
        }
        //     card_number = $('#cardNumModal1').val() + '-' + $('#cardNumModal2').val() + '-' + $('#cardNumModal3').val() + '-' + $('#cardNumModal4').val();
        //     expiry = '20' + $('#cardMMYYNumModal').val().substr(2, 2) + '-' + $('#cardMMYYNumModal').val().substr(0, 2);
        //     pwd_2digit = $('#cardPassword').val();
        //     // var formData = new FormData();
        //     // formData.append("card_number", card_number);
        //     // formData.append("expiry", expiry);
        //     // formData.append("pwd_2digit", pwd_2digit);
        //     $.ajax({
        //         url: "/writeMyCard",
        //         type: "POST",
        //         cache: false,
        //         data: {
        //             "card_name": $("#cardNameModal").val(),
        //             "card_number": card_number,
        //             "expiry": expiry,
        //             "pwd_2digit": pwd_2digit,
        //         },
        //         contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
        //         success: function (data) {
        //             alert("성공하였습니다.");
        //             //$('#writeCardModal').modal("hide");
        //         },
        //         error: function (data) {
        //             alert("에러가 발생했습니다.")
        //         }
        //     })
        //     return false;
        // }

        // 훈:
        card_number =
            $("#cardNumModal1").val() +
            "-" +
            $("#cardNumModal2").val() +
            "-" +
            $("#cardNumModal3").val() +
            "-" +
            $("#cardNumModal4").val();
        expiry =
            "20" +
            $("#cardMMYYNumModal").val().substr(2, 2) +
            "-" +
            $("#cardMMYYNumModal").val().substr(0, 2);
        pwd_2digit = $("#cardPassword").val();

        // var formData = new FormData();
        // formData.append("card_number", card_number);
        // formData.append("expiry", expiry);
        // formData.append("pwd_2digit", pwd_2digit);
        $.ajax({
            url: "/writeMyCard",
            type: "POST",
            cache: false,
            data: {
                card_name: $("#cardNameModal").val(),
                card_number: card_number,
                expiry: expiry,
                pwd_2digit: pwd_2digit,
                insertIntoMyData: true,
            },
            contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
            success: function (data) {
                alert("성공하였습니다.");
                $("#default_card").val(
                    $("#cardNameModal").val() + " (" + $("#cardNumModal4").val() + ")"
                );
                $("#writeCardModal").modal("hide");
            },
            error: function (data) {
                alert("에러가 발생했습니다.");
            },
        });
        return false;
    }
</script>
</body>
</html>
