//약사 회원가입 정규성 검사

const form = document.getElementById('form');
const email = document.getElementById("email");
const password = document.getElementById("password");
const password2 = document.getElementById('password2');
const phone = document.getElementById("phone").parentElement;
const phone2 = document.getElementById("phone2").parentElement
const businessNumber = document.getElementById("businessNumber").parentElement;
const pharmacyName = document.getElementById("pharmacyName");
const pharmacyPhone = document.getElementById("pharmacyPhone");
const address = document.getElementById("zipNo").parentElement.parentElement.parentElement.parentElement.parentElement;
const agree = document.getElementById("agree_all").parentElement

email.addEventListener("change", checkEmail);
password.addEventListener("change", checkPassword);
password2.addEventListener("change", checkPassword2);
phone.addEventListener("change", checkPhone);
phone2.addEventListener("change", checkPhone2);
businessNumber.addEventListener("change", checkBusinessNumber);
pharmacyName.addEventListener("change", checkPharmacyName);
pharmacyPhone.addEventListener("change", checkPharmacyPhone);
address.addEventListener("change", checkAddress);

// form.addEventListener("submit", e => {
//     checkEmail();
//     checkPassword();
//     checkPassword2();
//     checkPhone();
//     checkPhone2();
//     checkBusinessNumber();
//     checkPharmacyName();
//     checkPharmacyPhone();
//     checkAddress();
//     e.preventDefault();
// })

function checkAll() {
    checkEmail();
    checkPassword();
    checkPassword2();
    checkPhone();
    checkPhone2();
    checkBusinessNumber();
    checkPharmacyName();
    checkPharmacyPhone();
    checkAddress();
    checkRadio();
    if (confirm("회원가입을하시겠습니까?")) {
        console.log(checkEmail(), "이메일 체크")
        console.log(checkPassword(), "비번 체크")
        console.log(checkPassword2(), "비번2 체크")
        console.log(checkPhone(), "전번 체크")
        console.log(checkPhone2(), "전번2 체크")
        console.log(checkBusinessNumber(), "사업자번호 체크")
        console.log(checkPharmacyName(), "약국 체크")
        console.log(checkPharmacyPhone(), "약구전화 체크")
        console.log(checkAddress(), "주ㅜ소 체크")
        console.log(checkRadio(), "라디오 체크")

        console.log(checkEmail() === true && checkPassword() === true && checkPassword2() === true
            && checkPhone() === true && checkPhone2() === true && checkBusinessNumber() === true
            && checkPharmacyName() === true && checkPharmacyPhone() === true
            && checkAddress() === true && checkRadio() === true)

        if (checkEmail() === true && checkPassword() === true && checkPassword2() === true
            && checkPhone() === true && checkPhone2() === true && checkBusinessNumber() === true
            && checkPharmacyName() === true && checkPharmacyPhone() === true
            && checkAddress() === true && checkRadio() === true) {
            alert("회원가입이 완료 되었습니다.감사합니다");
            $("form").submit();
        } else {
            alert("회원가입에 실패했습니다.")
        }


    }
}


// 에러메세지
const setError = (element, message) => {
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
    var emailChecked = false;
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
            url: "/pharmacy/emailoverlap",
            data: {
                "email": emailValue
            },
            async: false,
            success: function (data) {
                var isOK = data
                if (isOK) {
                    setError(email, "이미있는 이메일 입니다.");
                    emailChecked = false;
                } else {
                    setSuccess(email);
                    emailChecked = true;
                }
            }
        })
    }
    return emailChecked;

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


function checkBusinessNumber() {
    const businessNumberValue = document.getElementById("businessNumber").value.trim();
    if (businessNumberValue === "") {
        setError(businessNumber, "필수 정보입니다.");
        return false;
    } else if ($('#businessNumCheck').val() !== "조회 완료") {
        setError(businessNumber, "조회버튼 눌러주세요.");
        return false;
    } else {
        setSuccess(businessNumber);
    }
    return true;
}

$(function () {
    $('#businessNumCheck').click(function () {
        let ceonumber = $('#businessNumber').val();
        let arrayData = {
            "b_no": [ceonumber]
        }
        // console.log(ceonumber);
        // console.log(arrayData);
        $.ajax({
            url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=smkh950RF%2BKUYSGK2GSWio7MhSh80eabzme3oFO%2B%2B%2FbR9Zl0vWADP9G0sx2iCZJK5TihKXg4AYHUMb9XVYgX3w%3D%3D",
            type: "post",
            data: JSON.stringify(arrayData), // json 을 string으로 변환하여 전송
            dataType: "JSON",
            contentType: "application/json",
            accept: "application/json",
            success: function (data, result) {
                console.log(data);
                for (let i = 0; i < data.data.length; i++) {
                    // console.log(data.data[i]);
                    // console.log(data.data[i].tax_type);
                    if (data.data[i].tax_type === "국세청에 등록되지 않은 사업자등록번호입니다.") {
                        setError(businessNumber, "국세청에 등록되지 않은 사업자등록번호입니다.");
                    } else {
                        setSuccess(businessNumber);
                        alert("확인 되었습니다.");
                        $('#businessNumber').attr('readonly', true);
                        $('#businessNumCheck').val("조회 완료");
                        break;
                    }
                }
            }

        })
    })
})


function checkPharmacyName() {
    const pharmacyNameValue = pharmacyName.value.trim();
    if (pharmacyNameValue === "") {
        setError(pharmacyName, "필수 정보입니다.");
        return false;
    } else {
        setSuccess(pharmacyName);
    }
    return true;
}

function checkPharmacyPhone() {
    const pharmacyPhoneValue = pharmacyPhone.value.trim();
    if (pharmacyPhoneValue === "") {
        setError(pharmacyPhone, "필수 정보입니다.");
        return false;
    } else {
        setSuccess(pharmacyPhone);
    }
    return true;
}

function checkAddress() {
    const zipNoValue = document.getElementById("zipNo").value.trim();
    const roadFullAddrValue = document.getElementById("roadFullAddr").value.trim();
    const addrDetailValue = document.getElementById("addrDetail").value.trim();
    if (zipNoValue === "" || roadFullAddrValue === "" || addrDetailValue === "") {
        setError(address, "필수 정보입니다.");
        return false;
    } else {
        setSuccess(address);
    }
    return true;
}

function checkRadio() {
    if (!$("input:checkbox[name='agree']").is(":checked")) {
        setError(agree, "필수 정보입니다.");
        return false
    } else {
        setSuccess(agree);
    }
    return true;
}

// function checkAll() {
//     if (!checkEmail(emailValue)) {
//         console.log(emailValue);
//         return false
//     }
//     if (!checkPassword(passwordValue)) {
//         console.log(passwordValue);
//
//         return false
//     }
//     return true;
// }
//
// // 공백확인 함수
// function checkExistData(value, dataName) {
//     if (value == "") {
//         alert(dataName + " 입력해주세요!");
//         return false;
//     }
//     return true;
// }
//
// //이메일 체크
// function checkEmail(emailValue, e) {
//     if (!checkExistData(emailValue, "이메일을")) {
//         console.log(emailValue);
//         emailValue.focus();
//         e.preventDefault();
//     }
//     return false;
//
//     var emailRegExp = /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
//     if (!emailRegExp.test(emailValue)) {
//         alert("이메일 형식이 올바르지 않습니다!");
//         emailValue.focus();
//         return false;
//     }
//     return true;
// }
//
// function checkPassword(emailValue, passwordValue, password2Value) {
//     //비밀번호가 입력되었는지 확인하기
//     if (!checkExistData(passwordValue, "비밀번호를"))
//         return false;
//     //비밀번호 확인이 입력되었는지 확인하기
//     if (!checkExistData(password2Value, "비밀번호 확인을"))
//         return false;
//
//     var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
//     if (!password1RegExp.test(passwordValue)) {
//         alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
//         passwordValue.focus();
//         return false;
//     }
//     //비밀번호와 비밀번호 확인이 맞지 않다면..
//     if (passwordValue != password2Value) {
//         alert("두 비밀번호가 맞지 않습니다.");
//         password2Value.focus();
//         return false;
//     }
//     return true;
// }


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
                code2 = data;
                console.log(code2);
            }
        }
    });
});
// 휴대폰 인증번호 대조
// $("#phoneChk2").click(function () {
//     if ($("#phone2").val() == code2) {
//         $(".successPhoneChk").text("인증번호가 일치합니다.");
//         $(".successPhoneChk").css("color", "green");
//         $("#phoneDoubleChk").val("true");
//         $("#phone2").attr("disabled", true);
//     } else {
//         $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
//         $(".successPhoneChk").css("color", "red");
//         $("#phoneDoubleChk").val("false");
//         $(this).attr("autofocus", true);
//     }
// });

// 동의 모두선택 / 해제
const agreeChkAll = document.querySelector('input[name=agree_all]');
agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree],input[name=agree2]');
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