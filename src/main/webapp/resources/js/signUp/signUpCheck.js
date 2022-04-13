//==============================================================================
//회원가입 정규성 검사

const form = document.getElementById('form');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');
const name = document.getElementById('name');
const SocialSecurityNumber = document.getElementById('SocialSecurityNumber1').parentElement;
const SocialSecurityNumber2 = document.getElementById('SocialSecurityNumber2').parentElement;
const phone = document.getElementById('phone').parentElement;
const phone2 = document.getElementById("phone2").parentElement
// const address = document.getElementById("zipNo").parentElement.parentElement.parentElement.parentElement.parentElement;
const agree = document.getElementById("agree_all").parentElement

email.addEventListener("change", checkEmail);
password.addEventListener("change", checkPassword);
password2.addEventListener("change", checkPassword2);
name.addEventListener("change", checkName);
SocialSecurityNumber.addEventListener("change", checkSocialSecurityNumber);
SocialSecurityNumber2.addEventListener("change", checkSocialSecurityNumber2);
phone.addEventListener("change", checkPhone);
phone2.addEventListener("change", checkPhone2);

// address.addEventListener("change", checkAddress);

function checkAll() {
    checkEmail();
    checkPassword();
    checkPassword2();
    checkName();
    checkSocialSecurityNumber();
    checkSocialSecurityNumber2();
    checkPhone();
    checkPhone2();
    // checkAddress();
    checkRadio();
    console.log(checkEmail());
    console.log(checkSocialSecurityNumber());
    console.log(checkSocialSecurityNumber2());

    if (confirm("회원가입을하시겠습니까?")) {
        if (checkEmail() === true && checkPassword() === true && checkPassword2() === true
            && checkName() === true && checkSocialSecurityNumber() === true
            && checkSocialSecurityNumber2() === true
            && checkPhone() === true && checkPhone2() === true
            && checkRadio() === true) {
            alert("회원가입이 완료 되었습니다.감사합니다");
            $("form").submit();
        } else {
            alert("회원가입에 실패했습니다.")
        }


    }
}

// 에러메세지
const setError = (element, message, e) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
}
//성공시 에러메시지 삭제
const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
}

function checkEmail() {
    var checked = false;
    const emailValue = email.value.trim();
    var emailPattern = /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
    if (emailValue === "") {
        setError(email, "필수 정보입니다.");
        return false;
    } else if (!emailPattern.test(emailValue)) {
        setError(email, "올바른 형식으로 입력해 주세요.");
        return false;
    } else {
        $.ajax({
            type: "POST",
            url: "/emailoverlap",
            data: {
                "email": emailValue
            },
            async: false,
            success: function (data) {
                var isOK = data
                if (isOK) {
                    setError(email, "이미있는 이메일 입니다.");
                    checked = false;
                } else {
                    setSuccess(email);
                    checked = true;
                }
            }
        })
    }
    return checked;

}

function checkPassword() {
    const passwordValue = password.value.trim();
    var pwPattern = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    if (passwordValue.value === "") {
        setError(password, "필수 정보입니다.");
        return false;
    } else if (!pwPattern.test(passwordValue)) {
        setError(password, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        return false;
    } else {
        setSuccess(password);
    }
    return true;
}

function checkPassword2() {
    const passwordValue = password.value.trim();
    const password2Value = password2.value.trim();
    if (password2Value === "") {
        setError(password2, "필수 정보입니다.");
        return false;
    } else if (password2Value !== passwordValue) {
        setError(password2, "비밀번호가 일치하지 않습니다.");
        return false;
    } else {
        setSuccess(password2);
    }
    return true;
}

function checkName() {
    const nameValue = name.value.trim();
    var namePattern = /^[가-힣]{2,4}$/;
    if (nameValue === "") {
        setError(name, "필수 정보입니다.");
        return false;
    } else if (!namePattern.test(nameValue)) {
        setError(name, "2글자 이상 한글만 입력해 주세요.");
        return false;
    } else {
        setSuccess(name);
    }
    return true;
}


function checkSocialSecurityNumber() {
    const socialSecurityNumberValue = document.getElementById("SocialSecurityNumber1").value.trim();
    // var SocialSecurityNumberPattern = /d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])/
    if (socialSecurityNumberValue === "") {
        setError(SocialSecurityNumber, "필수 정보입니다.");
        return false;
    }
        // else if (!SocialSecurityNumberPattern.test(socialSecurityNumberValue)) {
        //     setError(SocialSecurityNumber, "형식에 맞게 입력해 주세요.");
    //     return false;
    else {
        setSuccess(SocialSecurityNumber);
    }
    return true;
}

function checkSocialSecurityNumber2() {
    const socialSecurityNumberValue2 = document.getElementById("SocialSecurityNumber2").value.trim();
    var SocialSecurityNumberPattern = /[1-4]\d{6}/
    if (socialSecurityNumberValue2 === "") {
        setError(SocialSecurityNumber2, "필수 정보입니다.");
        return false;
    } else if (!SocialSecurityNumberPattern.test(socialSecurityNumberValue2)) {
        setError(SocialSecurityNumber2, "형식에 맞게 입력해 주세요.");
        return false;
    } else {
        setSuccess(SocialSecurityNumber2);
    }
    return true;
}

function checkPhone() {
    var phonePattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    const phoneValue = document.getElementById("phone").value.trim();
    if (phoneValue === "") {
        setError(phone, "필수 정보입니다.");
        return false;
    } else if (!phonePattern.test(phoneValue)) {
        setError(phone, "형식에 맞지 않은 번호입니다.");
        return false;
    } else {
        setSuccess(phone);
    }
    return true;
}

function checkPhone2() {
    const phone2Value = document.getElementById("phone2").value.trim();
    if (phone2Value === "") {
        setError(phone2, "필수 정보입니다.");
        return false;
    } else if (phone2Value !== code2) {
        setError(phone2, "인증번호가 일치하지 않습니다.")
        return false;
    } else {
        setSuccess(phone2);
    }
    return true;
}

// function checkAddress() {
//     const zipNoValue = document.getElementById("zipNo").value.trim();
//     const roadFullAddrValue = document.getElementById("roadFullAddr").value.trim();
//     const addrDetailValue = document.getElementById("addrDetail").value.trim();
//     if (zipNoValue === "" || roadFullAddrValue === "" || addrDetailValue === "") {
//         setError(address, "필수 정보입니다.");
//         return false;
//     } else {
//         setSuccess(address);
//     }
//     return true;
// }

function checkRadio() {
    if (!$("input:checkbox[name='agree']").is(":checked")) {
        setError(agree, "필수 정보입니다.");
        return false
    } else {
        setSuccess(agree);
    }
    return true;
}

// const isValidEmail = email => {
//     const reg = /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
//     return reg.test(String(email).toLowerCase());
// }
//
// const isVaildPassword = password => {
//     const reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
//     return reg.test(password);
// }
// const isValidName = name => {
//     const reg = /^[가-힝].{2,}$/
//     return reg.test(String(name));
// }
//
// const isValidSocialSecurityNumber = SocialSecurityNumber => {
//     const reg = /^[a-zA-Z0-9]{4,12}$/;
//     return reg.test(SocialSecurityNumber);
// }
//
// const isValidSocialSecurityNumber2 = SocialSecurityNumber2 => {
//     const reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//     return reg.test(SocialSecurityNumber2);
// }

// form.addEventListener('change', e => {
//     e.preventDefault();
//     validateInput(e);
// })

// form.addEventListener('submit', e => {
//     validateInput(e);
//     alert("회원강비에 성공하샸습니다.");
// })


// trim: 양끝의 공백을 제거한다.
// function validateInput(e) {
//     const emailValue = email.value.trim();
//     const passwordValue = password.value.trim();
//     const password2Value = password2.value.trim();
//     const nameValue = name.value.trim();
//     const SocialSecurityNumberValue = document.getElementById('SocialSecurityNumber').value.trim();
//     const SocialSecurityNumberValue2 = document.getElementById('SocialSecurityNumber2').value.trim();
//     const phoneValue = document.getElementById('phone').value.trim();
// //이메일
//     if (emailValue === "") {
//         setError(email, "필수 정보입니다.", e);
//     } else if (!isValidEmail(emailValue)) {
//         setError(email, "올바른 형식으로 입력해주세요.", e);
//     } else {
//         $.ajax({
//             type: "POST",
//             url: "emailoverlap",
//             data: {
//                 "email": emailValue
//             },
//             async: false,
//             success: function (data) {
//                 var isOK = data
//                 if (isOK) {
//                     console.log(typeof isOK);
//                     console.log(!isOK);
//                     setError(email, "이미있는 이메일 입니다.");
//                 } else {
//                     setSuccess(email);
//                     e.preventDefault();
//                 }
//             }
//         });
//     }
//
// //비밀번호
//     if (passwordValue === "") {
//         setError(password, "필수 정보입니다.", e);
//     } else if (!isVaildPassword(passwordValue)) {
//         setError(password, "비밀번호는 8자 이상이어야 하며, 숫자/영문/특수문자를 모두 포함해야 합니다.", e);
//     } else {
//         setSuccess(password);
//     }
// //비밀번호 확인
//     if (password2Value === "") {
//         setError(password2, "필수 정보입니다.", e);
//     } else if (password2Value !== passwordValue) {
//         setError(password2, "비밀번호가 일치하지 않습니다.", e);
//     } else {
//         setSuccess(password2);
//     }
//
// //이름
//     if (nameValue === "") {
//         setError(name, "이름을 입력해주세요.", e);
//     } else if (!isValidName(nameValue)) {
//         setError(name, "2글자이상 한글만 입력해주세요", e);
//     } else {
//         setSuccess(name);
//     }
// //주민등록번호 앞자리
//     if (SocialSecurityNumberValue === "") {
//         setError(SocialSecurityNumber, "필수 정보입니다.", e);
//         // } else if (!isValidSocialSecurityNumber(SocialSecurityNumber)) {
//         //     setError(SocialSecurityNumber, "숫자 6개를 입력해주세요.",e);
//     } else {
//         setSuccess(SocialSecurityNumber);
//     }
// //주민등록번호 뒷자리
//     if (SocialSecurityNumberValue2 === "") {
//         setError(SocialSecurityNumber2, "필수 정보입니다.", e);
//         // } else if (!isValidSocialSecurityNumber2(SocialSecurityNumber2)) {
//         //     setError(SocialSecurityNumber2, "숫자 7개를 입력해주세요.",e);
//     } else {
//         setSuccess(SocialSecurityNumber2);
//     }
//     // 후대폰
//     if (phoneValue === "") {
//         setError(phone, "필수 정보입니다.", e);
//     } else {
//         setSuccess(phone);
//     }
//
//     if (confirm("회원가입을하시겠습니까?")) {
//         alert("회원가입이 완료 되었습니다.감사합니다");
//         $("form").submit();
//     }
//     ;
// }


//카드번호
function inputMoveNumber(num) {


    if (isFinite(num.value) == false) {
        alert("카드번호는 숫자만 입력할 수 있습니다.");
        num.value = "";
        return false;
    }


    max = num.getAttribute("maxlength");


    if (num.value.length >= max) {

        num.nextElementSibling.focus();

    }

}

// //카드유효기간
function inputValidThru(period) {

    // replace 함수를 사용하여 슬래시( / )을 공백으로 치환한다.
    var replaceCard = period.value.replace(/\//g, "");

    // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
    if (replaceCard.length >= 4 && replaceCard.length < 5) {

        var inputMonth = replaceCard.substring(0, 2);    // 선언한 변수 month에 월의 정보값을 담는다.
        var inputYear = replaceCard.substring(2, 4);       // 선언한 변수 year에 년의 정보값을 담는다.


        // 현재 날짜 값을 구한다.

        var nowDate = new Date();

        var nowMonth = autoLeftPad(nowDate.getMonth() + 1, 2);

        var nowYear = autoLeftPad(nowDate.getFullYear().toString().substr(2, 2), 2);


        // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
        if (isFinite(inputMonth + inputYear) == false) {
            alert("문자는 입력하실 수 없습니다.");
            period.value = autoLeftPad((Number(nowMonth) + 1), 2) + "/" + nowYear;
            return false;
        }

        // 입력한 월이 12월 보다 큰 경우
        if (inputMonth > 12) {
            alert("12월보다 큰 월수는 입력하실 수 없습니다. ");
            period.value = "12/" + inputYear;
            return false;
        }


        // 입력한 유효기간을 현재날짜와 비교하여 사용 가능 여부를 판단한다.
        if ((inputYear + inputMonth) <= (nowYear + nowMonth)) {
            alert("유효기간이 만료된 카드는 사용하실 수 없습니다.");
            period.value = inputMonth + "/" + autoLeftPad((Number(nowYear) + 1), 2);
            return false;
        }

        period.value = inputMonth + "/" + inputYear;
    }
}

function autoLeftPad(num, digit) {
    if (String(num).length < digit) {
        num = new Array(digit - String(num).length + 1).join('0') + num;
    }
    return num;
}

// //후대폰 문자보내기
var code2 = "";
$("#phoneChk").click(function () {
    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
    var phone = $("#phone").val();
    $.ajax({
        type: "GET",
        url: "phoneCheck?phone=" + phone,
        cache: false,//cache옵션은 브라우저 캐시를 방지하는 옵션입니다.
        success: function (data) {
            if (data == "error") {
                alert("휴대폰 번호가 올바르지 않습니다.")
                $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                $(".successPhoneChk").css("color", "red");
                $("#phone").attr("autofocus", true);
            } else {
                $("#phone2").attr("disabled", false);
                $("#phoneChk2").css("display", "inline-block");
                $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
                $(".successPhoneChk").css("color", "green");
                code2 = data;
            }
        }
    });
});
// 휴대폰 인증번호 대조
$("#phoneChk2").click(function () {
    if ($("#phone2").val() == code2) {
        $(".successPhoneChk").text("인증번호가 일치합니다.");
        $(".successPhoneChk").css("color", "green");
        $("#phoneDoubleChk").val("true");
        $("#phone2").attr("disabled", true);
    } else {
        $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".successPhoneChk").css("color", "red");
        $("#phoneDoubleChk").val("false");
        $(this).attr("autofocus", true);
    }
});

// 동의 모두선택 / 해제
const agreeChkAll = document.querySelector("input[name=agree_all]");
agreeChkAll.addEventListener("change", (e) => {
    let agreeChk = document.querySelectorAll(
        "input[name=agree],input[name=agree2]"
    );
    for (let i = 0; i < agreeChk.length; i++) {
        agreeChk[i].checked = e.target.checked;
    }
});

//===============================================================================
// 주소찾기API

function goPopup() {
    // 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

    // 모바일 웹인 경우, 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}

function jusoCallBack(zipNo, roadFullAddr, addrDetail) {
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.form.zipNo.value = zipNo;
    document.form.roadFullAddr.value = roadFullAddr;
    document.form.addrDetail.value = addrDetail;
}

//=============================================================================