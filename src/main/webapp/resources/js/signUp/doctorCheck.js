// //가영: 의사 유효성검사(진행중 - 완료되면 완료라고 바꿀예정)

//약사 회원가입 정규성 검사

const form = document.getElementById("form");
const email = document.getElementById("email");
const password = document.getElementById("password");
const password2 = document.getElementById("password2");
// const phone = document.getElementById("phone").parentElement;
// const phone2 = document.getElementById("phone2").parentElement;
const doctorName = document.getElementById("doctorName");
const doctorNumber = document.getElementById("doctorNumber");
const doctorProfile =
    document.getElementById("doctorProfile").parentElement.parentElement
        .parentElement.parentElement.parentElement;
const hospitalName = document.getElementById("hospitalName");
const businessNumber = document.getElementById("businessNumber");
const address =
    document.getElementById("zipNo").parentElement.parentElement.parentElement
        .parentElement.parentElement;
//확인필요
// const diagnosisType = document.getElementById("diagnosis_type");
const diagnosisType2 = document.getElementById("diagnosis_type2").parentElement;
// const diagnosisType2 =$('#diagnosis_type2');
const open = document.getElementsByName("open")[0];
const close = document.getElementsByName("close")[0];
const lunchSt = document.getElementsByName("lunch-st")[0];
const lunchCl = document.getElementsByName("lunch-cl")[0];
const holiday = document.getElementsByName("holiday")[0].parentElement;
const agree = document.getElementById("agree_all").parentElement;
const lunch = document.getElementsByName("lunch-time");
const lunVaule = document.getElementById("eleven").parentElement;
// const doctorUrl = document.getElementById("doctor_url");

// doctorUrl.addEventListener("change",checkDoctorUrl);
email.addEventListener("change", checkEmail);
password.addEventListener("change", checkPassword);
password2.addEventListener("change", checkPassword2);
// phone.addEventListener("change", checkPhone);
// phone2.addEventListener("change", checkPhone2);
doctorName.addEventListener("change", checkDoctorName);
doctorNumber.addEventListener("change", checkDoctorNumber);
doctorProfile.addEventListener("change", checkProfile);
businessNumber.addEventListener("change", checkBusinessNumber);
hospitalName.addEventListener("change", checkHospitalName);
address.addEventListener("change", checkAddress);
// diagnosisType.addEventListener("change", checkDiagnosisType);
diagnosisType2.addEventListener("change", checkDiagnosisType2);
open.addEventListener("change", checkOpen);
close.addEventListener("change", checkClose);
// lunchSt.addEventListener("change", checkLunchSt);
// lunchCl.addEventListener("change", checkLunchCl);
// holiday.addEventListener("change", checkHoliday);
address.addEventListener("change", checkAddress);

function checkAll() {
    console.log(checkEmail());
    console.log(checkPassword());
    console.log(checkPassword2());
    console.log(checkDoctorName());
    console.log(checkDoctorNumber());
    // console.log(checkDoctorUrl());
    console.log(checkProfile());
    console.log(checkAddress());
    console.log(checkDiagnosisType2());
    console.log(checkOpen());
    console.log(checkClose());
    console.log(checkLunchTime());
    console.log(checkBusinessNumber());
    console.log(checkHospitalName());
    console.log(checkHospitalTelephone());
    console.log(checkAddress());
    console.log(checkRadio());
    console.log(checkHoliday());

    checkEmail();
    checkPassword();
    checkPassword2();
    // checkPhone();
    // checkPhone2();
    checkDoctorName();
    checkDoctorNumber();
    // checkDoctorUrl();
    checkProfile();

    checkAddress();
    // checkDiagnosisType();
    checkDiagnosisType2();
    checkOpen();
    checkClose();
    checkLunchTime();
    // checkLunchSt();
    // checkLunchCl();
    checkBusinessNumber();
    checkHospitalName();
    checkHospitalTelephone();
    checkAddress();
    checkRadio();
    checkHoliday();
    if (confirm("회원가입을하시겠습니까?")) {
        if (
            checkEmail() === true &&
            checkPassword() === true &&
            checkPassword2() === true &&
            checkLunchTime() === true &&
            // && checkPhone() === true && checkPhone2() === true
            checkBusinessNumber() === true &&
            checkAddress() === true &&
            checkRadio() === true &&
            checkDoctorName() === true &&
            checkDoctorNumber() === true &&
            // checkDoctorUrl() === true &&
            checkProfile() === true &&
            // && checkDiagnosisType() === true
            checkHospitalName() === true &&
            checkHospitalTelephone() === true &&
            checkDiagnosisType2() === true &&
            checkOpen() === true &&
            checkClose() === true &&
            // checkLunchSt() === true &&
            // checkLunchCl() === true &&
            checkHoliday() === true &&
            checkRadio() === true
        ) {
            alert("회원가입이 완료 되었습니다.감사합니다");
            $("form").submit();
        } else {
            alert("회원가입에 실패했습니다.");
        }
    }
}

// 에러메세지
// const setError = (element, message) => {
//     const inputControl = element.parentElement;
//     const errorDisplay = inputControl.querySelector('.error');
//     errorDisplay.innerText = message;
//     inputControl.classList.add('error');
//     inputControl.classList.remove('success');
// }
function setError(element, message) {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".error");
    errorDisplay.innerText = message;
    inputControl.classList.add("error");
    inputControl.classList.remove("success");
}

//성공시 에러메시지 삭제
// const setSuccess = element => {
//     const inputControl = element.parentElement;
//     const errorDisplay = inputControl.querySelector('.error');
//
//     errorDisplay.innerText = '';
//     inputControl.classList.add('success');
//     inputControl.classList.remove('error');
// }
function setSuccess(element) {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".error");

    errorDisplay.innerText = "";
    inputControl.classList.add("success");
    inputControl.classList.remove("error");
}

function checkEmail() {
    var checked = false;
    const emailValue = email.value.trim();
    var emailPattern =
        /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
    if (emailValue === "") {
        setError(email, "필수 정보입니다.");
        return false;
    } else if (!emailPattern.test(emailValue)) {
        setError(email, "올바른 형식으로 입력해 주세요.");
        return false;
    } else {
        $.ajax({
            type: "POST",
            url: "/doctor/Emailoverlap",
            data: {
                email: emailValue,
            },
            async: false,
            success: function (data) {
                var isOK = data;
                if (isOK) {
                    setError(email, "이미있는 이메일 입니다.");
                    checked = false;
                } else {
                    setSuccess(email);
                    checked = true;
                }
            },
        });
    }
    return checked;
}

function checkPassword() {
    const passwordValue = password.value.trim();
    var pwPattern = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    if (passwordValue.value === "") {
        setError(password, "비밀번호를 입력해주세요.");
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
        setError(password2, "비밀번호 확인을 입력해주세요.");
        return false;
    } else if (password2Value !== passwordValue) {
        setError(password2, "비밀번호가 일치하지 않습니다.");
        return false;
    } else {
        setSuccess(password2);
    }
    return true;
}

// function checkPhone() {
//     var phonePattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
//     const phoneValue = document.getElementById("phone").value.trim();
//     if (phoneValue === "") {
//         setError(phone, "휴대폰 번호를 입력해주세요.");
//         return false;
//     } else if (!phonePattern.test(phoneValue)) {
//         setError(phone, "형식에 맞지 않은 번호입니다.");
//         return false;
//     } else {
//         setSuccess(phone);
//     }
//     return true;
// }
//
// function checkPhone2() {
//     const phone2Value = document.getElementById("phone2").value.trim();
//     if (phone2Value === "") {
//         setError(phone2, "인증번호를 입력해주세요.");
//         return false;
//     } else if (phone2Value !== code2) {
//         setError(phone2, "인증번호가 일치하지 않습니다.")
//         return false;
//     } else {
//         setSuccess(phone2);
//     }
//     return true;
// }

function checkDoctorName() {
    const doctorNameValue = document.getElementById("doctorName").value.trim();
    if (doctorNameValue === "") {
        setError(doctorName, "이름을 입력해주세요.");
        return false;
    } else {
        setSuccess(doctorName);
    }
    return true;
}

function checkDoctorNumber() {
    const doctorNumberValue = document
        .getElementById("doctorNumber")
        .value.trim();
    if (doctorNumberValue === "") {
        setError(doctorNumber, "의사면허번호를 입력해주세요.");
        return false;
    } else {
        setSuccess(doctorNumber);
    }
    return true;
}

// function checkDoctorUrl() {
//     const doctorUrlValue = document.getElementById("doctor_url").value.trim();
//     if (doctorUrlValue === "") {
//         setError(doctorUrl, "줌(개인회의실)링크를 입력해주세요.");
//         return false;
//     } else {
//         setSuccess(doctorUrl);
//     }
//     return true;
// }


function checkProfile() {
    const doctorProfileValue = document
        .getElementById("doctorProfile")
        .value.trim();
    if (doctorProfileValue === "") {
        setError(doctorProfile, "프로필사진은 업로드해주세요.");
        return false;
    } else {
        setSuccess(doctorProfile);
    }
    return true;
}

// function checkBusinessNumber() {
//     const businessNumberValue = document.getElementById("businessNumber").value.trim();
//     if (businessNumberValue === "") {
//         setError(businessNumber, "사업자번호를 입력해주세요.");
//         return false;
//     } else {
//         setSuccess(businessNumber);
//     }
//     return true;
// }
function checkBusinessNumber() {
    const businessNumberValue = document
        .getElementById("businessNumber")
        .value.trim();
    if (businessNumberValue === "") {
        setError(businessNumber, "필수 정보입니다.");
        return false;
    } else if ($("#businessNumCheck").val() !== "조회 완료") {
        setError(businessNumber, "조회버튼 눌러주세요.");
        return false;
    } else {
        setSuccess(businessNumber);
    }
    return true;
}

function checkHospitalName() {
    const hospitalNameValue = document
        .getElementById("hospitalName")
        .value.trim();
    if (hospitalNameValue === "") {
        setError(hospitalName, "병원이름을 입력해주세요.");
        return false;
    } else {
        setSuccess(hospitalName);
    }
    return true;
}

function checkHospitalTelephone() {
    const hospitalTelephoneValue = document
        .getElementById("hospitalTelephone")
        .value.trim();
    if (hospitalTelephoneValue === "") {
        setError(hospitalTelephone, "병원 전화번호를 입력해주세요.");
        return false;
    } else {
        setSuccess(hospitalTelephone);
    }
    return true;
}

function checkDiagnosisType2() {
    var diagnosisType2Value =
        document.getElementById("diagnosis_type2").options.length;
    // const diagnosisType2Value = document.getElementById("diagnosisType2").value.trim();
    if (diagnosisType2Value === 0) {
        setError(diagnosisType2, "진료과를 1개 이상 선택해주세요.");
        return false;
    } else {
        setSuccess(diagnosisType2);
    }
    return true;
}

// function checkHoliday() {
//     const holidayValue = document.getElementsByName("holiday")[0].value.trim();
//     console.log(holiday.checkbox[0].checked);
//     if (holiday.checkbox[0].checked==false &&
//         holiday.checkbox[1].checked==false &&
//         holiday.checkbox[2].checked==false &&
//         holiday.checkbox[3].checked==false &&
//         holiday.checkbox[4].checked==false &&
//         holiday.checkbox[5].checked==false &&
//         holiday.checkbox[6].checked==false &&
//         holiday.checkbox[7].checked==false) {
//         setError(holiday, "휴무일을 선택해주세요.")
//     } else {
//         setSuccess(holiday);
//     }
//     return true;
// }
//진료시간(시작)
function checkOpen() {
    const openValue = document.getElementsByName("open")[0].value.trim();
    if (
        open.options[1].selected == false &&
        open.options[2].selected == false &&
        open.options[3].selected == false
    ) {
        setError(open, "진료시간을 선택해주세요.");
    } else {
        setSuccess(open);
    }
    return true;
}

//진료마감
function checkClose() {
    const closeValue = document.getElementsByName("close")[0].value.trim();
    if (
        close.options[1].selected == false &&
        close.options[2].selected == false &&
        close.options[3].selected == false
    ) {
        setError(close, "진료시간을 선택해주세요.");
    } else {
        setSuccess(close);
    }
    return true;
}

// 점심시간선택(checkbox)
function checkLunchTime() {
    if (
        lunch[0].checked == false &&
        lunch[1].checked == false &&
        lunch[2].checked == false) {
        setError(lunVaule, "점심시간을 선택해주세요.");
        return false;
    } else {
        setSuccess(lunVaule);
    }
    return true;
}


//점심시간(시작)
// function checkLunchSt() {
//   const lunchStValue = document.getElementsByName("lunch-st")[0].value.trim();
//   if (
//     lunchSt.options[1].selected == false &&
//     lunchSt.options[2].selected == false &&
//     lunchSt.options[3].selected == false
//   ) {
//     setError(lunchSt, "점심시간을 선택해주세요.");
//   } else {
//     setSuccess(lunchSt);
//   }
//   return true;
// }
//
// //점심시간(시작)
// function checkLunchCl() {
//   const lunchClValue = document.getElementsByName("lunch-cl")[0].value.trim();
//   if (
//     lunchCl.options[1].selected == false &&
//     lunchCl.options[2].selected == false &&
//     lunchCl.options[3].selected == false
//   ) {
//     setError(lunchCl, "점심시간을 선택해주세요.");
//   } else {
//     setSuccess(lunchCl);
//   }
//   return true;
// }
//사업자번호 체크
$(function () {
    $("#businessNumCheck").click(function () {
        let ceonumber = $("#businessNumber").val();
        let arrayData = {
            b_no: [ceonumber],
        };

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
                // console.log(data);
                for (let i = 0; i < data.data.length; i++) {
                    // console.log(data.data[i]);
                    // console.log(data.data[i].tax_type);
                    if (
                        data.data[i].tax_type ===
                        "국세청에 등록되지 않은 사업자등록번호입니다."
                    ) {
                        setError(
                            businessNumber,
                            "국세청에 등록되지 않은 사업자등록번호입니다."
                        );
                    } else {
                        setSuccess(businessNumber);
                        alert("확인 되었습니다.");
                        $("#businessNumber").attr("readonly", true);
                        $("#businessNumCheck").val("조회 완료");
                        break;
                    }
                }
            },
        });
    });
});

//
//
// function checkLunchCl() {
//     const lunchcl = document.getElementsByName("lunchcl").value.trim();
//     if (open === "") {
//         setError(open, "진료시작 시간을 선택해주세요.");
//         return false;
//     } else {
//         setSuccess(open);
//     }
//     return true;
// }
//
// function checkEnd() {
//     const endValue = document.getElementById("end").value.trim();
//     if (endValue === "") {
//         setError(end, "진료마감 시간을 선택해주세요.");
//         return false;
//     } else {
//         setSuccess(end);
//     }
//     return true;
// }
//
// function checkLunchSt() {
//     const lunchStValue = document.getElementById("lunchSt").value.trim();
//     if (lunchStValue === "") {
//         setError(lunchSt, "점심시간을 선택해주세요.");
//         return false;
//     } else {
//         setSuccess(lunchSt);
//     }
//     return true;
// }
//
// function checkLunchCl() {
//     const lunchClValue = document.getElementById("lunchCl").value.trim();
//     if (lunchClValue === "") {
//         setError(lunchCl, "점심시간을 선택해주세요.");
//         return false;
//     } else {
//         setSuccess(lunchCl);
//     }
//     return true;
// }

function checkAddress() {
    const zipNoValue = document.getElementById("zipNo").value.trim();
    const roadFullAddrValue = document
        .getElementById("roadFullAddr")
        .value.trim();
    const addrDetailValue = document.getElementById("addrDetail").value.trim();
    if (zipNoValue === "" || roadFullAddrValue === "" || addrDetailValue === "") {
        setError(address, "주소를 입력해주세요.");
        return false;
    } else {
        setSuccess(address);
    }
    return true;
}

function checkRadio() {
    if (!$("input:checkbox[name='agree']").is(":checked")) {
        setError(agree, "약관을 확인해주세요.");
        return false;
    } else {
        setSuccess(agree);
    }
    return true;
}

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

// //휴무일 선택 / 해제
// function check() {
//     if ($("input:checkbox[name='holiday']").is(":checked")==false) {
//         setError(agree, "필수 선택 사항입니다.");
//         return false
//     } else {
//         setSuccess(agree);
//     }
//     return true;
// }
function checkHoliday() {
    if (!$("input:checkbox[name='holiday']").is(":checked")) {
        setError(holiday, "적어도 하나는 선택해야합니다.");
        return false;
    } else {
        setSuccess(holiday);
    }
    return true;
}

// //후대폰 문자보내기
var code2 = "";
$("#phoneChk").click(function () {
    alert(
        "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."
    );
    var phone = $("#phone").val();
    $.ajax({
        type: "GET",
        url: "/phoneCheck?phone=" + phone,
        cache: false, //cache옵션은 브라우저 캐시를 방지하는 옵션입니다.
        success: function (data) {
            if (data == "error") {
                alert("휴대폰 번호가 올바르지 않습니다.");
                $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                $(".successPhoneChk").css("color", "red");
                $("#phone").attr("autofocus", true);
            } else {
                $("#phone2").attr("disabled", false);
                $("#phoneChk2").css("display", "inline-block");

                $(".successPhoneChk").text(
                    "인증번호를 입력한 뒤 본인인증을 눌러주십시오."
                );
                $(".successPhoneChk").css("color", "green");
                $("#phone").attr("readonly", true);
                code2 = data;
                console.log(code2);
            }
        },
    });
});
// // 휴대폰 인증번호 대조
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

// 주소찾기API

function goPopup() {
    // 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open(
        "/jusoPopup",
        "pop",
        "width=570,height=420, scrollbars=yes, resizable=yes"
    );

    // 모바일 웹인 경우, 호출된 페이지(jusoPopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}

function jusoCallBack(zipNo, roadFullAddr, addrDetail) {
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.form.zipNo.value = zipNo;
    document.form.roadFullAddr.value = roadFullAddr;
    document.form.addrDetail.value = addrDetail;
}

// // const form = document.getElementById('form');
// // const email = document.getElementById('email');
// //
// // const setError = (element, message, e) => {
// //     const inputControl = element.parentElement;
// //     const errorDisplay = inputControl.querySelector('.error');
// //     errorDisplay.innerText = message;
// //     inputControl.classList.add('error');
// //     inputControl.classList.remove('success');
// // }
// // //성공시 에러메시지 삭제
// // const setSuccess = element => {
// //     const inputControl = element.parentElement;
// //     const errorDisplay = inputControl.querySelector('.error');
// //
// //     errorDisplay.innerText = '';
// //     inputControl.classList.add('success');
// //     inputControl.classList.remove('error');
// // }
//
// // 정규성검사
// $(function () {
//     // 모달을 전역변수로 선언
//
//
//     // ------- 검사하여 상태를 class에 적용
//     $('#email').keyup(function (event) {
//
//         var divId = $('#divId');
//
//         if ($('#id').val() == "") {
//             divId.removeClass("has-success");
//             divId.addClass("has-error");
//         } else {
//             divId.removeClass("has-error");
//             divId.addClass("has-success");
//         }
//     });
//
//     $('#password').keyup(function (event) {
//
//         var divPassword = $('#divPassword');
//
//         if ($('#password').val() == "") {
//             divPassword.removeClass("has-success");
//             divPassword.addClass("has-error");
//         } else {
//             divPassword.removeClass("has-error");
//             divPassword.addClass("has-success");
//         }
//     });
//
//     $('#password2').keyup(function (event) {
//
//         var password2 = $('#password2').val();
//         var password = $('#password').val();
//         var divPassword2 = $('#divPasswordCheck');
//
//         if ((password2 == "") || (password != password2)) {
//             divPassword2.removeClass("has-success");
//             divPassword2.addClass("has-error");
//         } else {
//             divPassword2.removeClass("has-error");
//             divPassword2.addClass("has-success");
//         }
//     });
//
//     $('#phone').keyup(function (event) {
//
//         var divPhone = $('#divPhone');
//
//         if (($('#phone').val()) == "") {
//             divPhone.removeClass("has-success");
//             divPhone.addClass("has-error");
//         } else {
//             divPhone.removeClass("has-error");
//             divPhone.addClass("has-success");
//         }
//     });
//
//     $('#phone2').keyup(function (event) {
//
//         var divPhone2 = $('#divPhone2');
//
//         if (($('#phone2').val()) == "") {
//             divPhone2.removeClass("has-success");
//             divPhone2.addClass("has-error");
//         } else {
//             divPhone2.removeClass("has-error");
//             divPhone2.addClass("has-success");
//         }
//     });
//
//     $('#doctorName').keyup(function (event) {
//
//         var divDoctorName = $('#divDoctorName');
//
//         if (($('#doctorName').val()) == "") {
//             divDoctorName.removeClass("has-success");
//             divDoctorName.addClass("has-error");
//         } else {
//             divDoctorName.removeClass("has-error");
//             divDoctorName.addClass("has-success");
//         }
//     });
//
//     $('#doctorNumber').keyup(function (event) {
//
//         var divDoctorNumber = $('#divDoctorNumber');
//
//         if (($('#doctorNumber').val()) == "") {
//             divDoctorNumber.removeClass("has-success");
//             divDoctorNumber.addClass("has-error");
//         } else {
//             divDoctorNumber.removeClass("has-error");
//             divDoctorNumber.addClass("has-success");
//         }
//     });
//
//     $('#doctorProfile').keyup(function (event) {
//
//         var divDoctorProfile = $('#divDoctorProfile');
//
//         if (($('#doctorProfile').val()) == "") {
//             divDoctorProfile.removeClass("has-success");
//             divDoctorProfile.addClass("has-error");
//         } else {
//             divDoctorProfile.removeClass("has-error");
//             divDoctorProfile.addClass("has-success");
//         }
//     });
//
//     $('#businessNumber').keyup(function (event) {
//
//         var divBusinessNumber = $('#divBusinessNumber');
//
//         if (($('#businessNumber').val()) == "") {
//             divBusinessNumber.removeClass("has-success");
//             divBusinessNumber.addClass("has-error");
//         } else {
//             divBusinessNumber.removeClass("has-error");
//             divBusinessNumber.addClass("has-success");
//         }
//     });
//
//     $('#zipNo').keyup(function (event) {
//
//         var divZipNo = $('#divZipNor');
//
//         if (($('#zipNo').val()) == "") {
//             divZipNo.removeClass("has-success");
//             divZipNo.addClass("has-error");
//         } else {
//             divZipNo.removeClass("has-error");
//             divZipNo.addClass("has-success");
//         }
//     });
//
//     $('#roadFullAddr').keyup(function (event) {
//
//         var divRoadFullAddr = $('#divRoadFullAddr');
//
//         if (($('#roadFullAddr').val()) == "") {
//             divRoadFullAddr.removeClass("has-success");
//             divRoadFullAddr.addClass("has-error");
//         } else {
//             divRoadFullAddr.removeClass("has-error");
//             divRoadFullAddr.addClass("has-success");
//         }
//     });
//     $('#addrDetail').keyup(function (event) {
//
//         var divAddrDetail = $('#divAddrDetail');
//
//         if (($('#addrDetail').val()) == "") {
//             divAddrDetail.removeClass("has-success");
//             divAddrDetail.addClass("has-error");
//         } else {
//             divAddrDetail.removeClass("has-error");
//             divAddrDetail.addClass("has-success");
//         }
//     });
// });
//
// $( "form" ).submit(function( event ) {
//     var modalContents = $(".modal-contents");
//     var modal = $("#defaultModal");
//
//
//     var provision = $('#provision');
//     var provision2 = $('#provision2');
//     var provision3 = $('#provision3');
//     var divEmail = $('#divEmail');
//     var divPassword = $('#divPassword');
//     var divPassword2 = $('#divPassword2');
//     var divPhone = $('#divPhone');
//     var divPhone2 = $('#divPhone2');
//     var divDoctorName = $('#divDoctorName');
//     var divDoctorNumber = $('#divDoctorNumber');
//     var divDoctorProfile = $('#divDoctorProfile');
//     var divBusinessNumber = $('#divBusinessNumber');
//     var divZipNo = $('#divZipNo');
//     var divAddrDetail = $('#divAddrDetail');
//     var divOpen = $('#divOpen');
//
//     //회원가입약관
//     if($('#provisionYn:checked').val()!==checked){
//         modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
//         modal.modal('show'); //모달 띄우기
//
//         provision.removeClass("has-success");
//         provision.addClass("has-error");
//         $('#provisionYn').focus();
//         return false;
//     }else{
//         provision.removeClass("has-error");
//         provision.addClass("has-success");
//     }
//
//     //회원가입약관
//     if($('#provisionYn2:checked').val()!="Y"){
//         modalContents.text("개인정보 수집 및 이용에 동의하여 주시기 바랍니다."); //모달 메시지 입력
//         modal.modal('show'); //모달 띄우기
//
//         provision2.removeClass("has-success");
//         provision2.addClass("has-error");
//         $('#provisionYn2').focus();
//         return false;
//     }else{
//         provision2.removeClass("has-error");
//         provision2.addClass("has-success");
//     }
//
//     //개인정보취급방침
//     if($('#provisionYn3:checked').val()!="Y"){
//         modalContents.text("개인정보 수집 및 이용에 동의하여 주시기 바랍니다."); //모달 메시지 입력
//         modal.modal('show'); //모달 띄우기
//
//         provision3.removeClass("has-success");
//         provision3.addClass("has-error");
//         $('#provisionYn3').focus();
//         return false;
//     }else{
//         provision3.removeClass("has-error");
//         provision3.addClass("has-success");
//     }
//
//
//
//
//     //이메일 검사
//     if($('#email').val()==""){
//         modalContents.text("이메일을 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divEmail.removeClass("has-success");
//         divEmail.addClass("has-error");
//         $('#email').focus();
//         return false;
//     }else{
//         divEmail.removeClass("has-error");
//         divEmail.addClass("has-success");
//     }
//
//     //패스워드 검사
//     if($('#password').val()==""){
//         modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divPassword.removeClass("has-success");
//         divPassword.addClass("has-error");
//         $('#password').focus();
//         return false;
//     }else{
//         divPassword.removeClass("has-error");
//         divPassword.addClass("has-success");
//     }
//
//     //패스워드 확인
//     if($('#password2').val()==""){
//         modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divPassword2.removeClass("has-success");
//         divPassword2.addClass("has-error");
//         $('#password2').focus();
//         return false;
//     }else{
//         divPassword2.removeClass("has-error");
//         divPassword2.addClass("has-success");
//     }
//
//     //패스워드 비교
//     if($('#password').val()!=$('#password2').val() || $('#password2').val()==""){
//         modalContents.text("패스워드가 일치하지 않습니다.");
//         modal.modal('show');
//
//         divPassword2.removeClass("has-success");
//         divPassword2.addClass("has-error");
//         $('#password2').focus();
//         return false;
//     }else{
//         divPassword2.removeClass("has-error");
//         divPassword2.addClass("has-success");
//     }
//
//     // 휴대폰
//     // if($('#phone').val()==""){
//     //     modalContents.text("휴대폰번호를 입력하여 주시기 바랍니다.");
//     //     modal.modal('show');
//     //
//     //     divPhone.removeClass("has-success");
//     //     divPhone.addClass("has-error");
//     //     $('#phone').focus();
//     //     return false;
//     // }else{
//     //     divPhone.removeClass("has-error");
//     //     divPhone.addClass("has-success");
//     // }
//     //근무시간 - 오픈
//     if(($('#open').val() == "")) {
//         console.log(($('#open').val()));
//         modalContents.text("진료시작 시간을 선택해주세요.");
//         modal.modal('show');
//
//         divOpen.removeClass("has-success");
//         divOpen.addClass("has-error");
//         $('#open').focus();
//         return false;
//     }else{
//         divOpen.removeClass("has-error");
//         divOpen.addClass("has-success");
//     }
//     //근무시간 - 마감
//     if(($('#end').val() == "")) {
//         console.log(($('#end').val()));
//         modalContents.text("진료마감 시간을 선택해주세요.");
//         modal.modal('show');
//
//         divEnd.removeClass("has-success");
//         divEnd.addClass("has-error");
//         $('#end').focus();
//         return false;
//     }else{
//         divEnd.removeClass("has-error");
//         divEnd.addClass("has-success");
//     }
//
//     //점심시간 시작
//     if(($('#lunch-st').val() == "")) {
//         console.log(($('#lunch-st').val()));
//         modalContents.text("점심시간을 선택해주세요.");
//         modal.modal('show');
//
//         divStartLunch.removeClass("has-success");
//         divStartLunch.addClass("has-error");
//         $('#lunch-st').focus();
//         return false;
//     }else{
//         divStartLunch.removeClass("has-error");
//         divStartLunch.addClass("has-success");
//     }
//     //점심시간 끝
//     if(($('#lunch-cl').val() == "")) {
//         console.log(($('#lunch-cl').val()));
//         modalContents.text("점심시간을 선택해주세요.");
//         modal.modal('show');
//
//         divEndLunch.removeClass("has-success");
//         divEndLunch.addClass("has-error");
//         $('#lunch-cl').focus();
//         return false;
//     }else{
//         divEndLunch.removeClass("has-error");
//         divEndLunch.addClass("has-success");
//     }
//
//     //인증번호
//     if($('#phone2').val()==""){
//         modalContents.text("인증번호를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divPhone2.removeClass("has-success");
//         divPhone2.addClass("has-error");
//         $('#phone2').focus();
//         return false;
//     }else{
//         divPhone2.removeClass("has-error");
//         divPhone2.addClass("has-success");
//     }
//
//     //의사이름
//     if($('#doctorName').val()==""){
//         modalContents.text("이름을 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divDoctorName.removeClass("has-success");
//         divDoctorName.addClass("has-error");
//         $('#doctorName').focus();
//         return false;
//     }else{
//         divDoctorName.removeClass("has-error");
//         divDoctorName.addClass("has-success");
//     }
//
//     //의사면허
//     if($('#doctorNumber').val()==""){
//         modalContents.text("의사면허 번호를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divDoctorNumber.removeClass("has-success");
//         divDoctorNumber.addClass("has-error");
//         $('#doctorNumber').focus();
//         return false;
//     }else{
//         divDoctorNumber.removeClass("has-error");
//         divDoctorNumber.addClass("has-success");
//     }
//
//     //프로필
//     if($('#doctorProfile').val()==""){
//         modalContents.text("프로필사진을 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divDoctorProfile.removeClass("has-success");
//         divDoctorProfile.addClass("has-error");
//         $('#doctorProfile').focus();
//         return false;
//     }else{
//         divDoctorProfile.removeClass("has-error");
//         divDoctorProfile.addClass("has-success");
//     }
//
//     //사업자번호
//     if($('#businessNumber').val()==""){
//         modalContents.text("사업자 번호를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divBusinessNumber.removeClass("has-success");
//         divBusinessNumber.addClass("has-error");
//         $('#businessNumber').focus();
//         return false;
//     }else{
//         divBusinessNumber.removeClass("has-error");
//         divBusinessNumber.addClass("has-success");
//     }
//
//     //우편 번호
//     if($('#zipNo').val()==""){
//         modalContents.text("우편 번호를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divZipNo.removeClass("has-success");
//         divZipNo.addClass("has-error");
//         $('#zipNo').focus();
//         return false;
//     }else{
//         divZipNo.removeClass("has-error");
//         divZipNo.addClass("has-success");
//     }
//
//     //휴대폰 번호
//     if($('#addrDetail').val()==""){
//         modalContents.text("상세주소를 입력하여 주시기 바랍니다.");
//         modal.modal('show');
//
//         divAddrDetail.removeClass("has-success");
//         divAddrDetail.addClass("has-error");
//         $('#addrDetail').focus();
//         return false;
//     }else{
//         divAddrDetail.removeClass("has-error");
//         divAddrDetail.addClass("has-success");
//     }
//
// });
//
// // 약관동의 체크박스 전체 선택
// $(".checkbox_group").on("click", "#check_all", function () {
//     var checked = $(this).is(":checked");
//
//     if (checked) {
//         $(this).parents(".checkbox_group").find('input').prop("checked", true);
//     } else {
//         $(this).parents(".checkbox_group").find('input').prop("checked", false);
//     }
// });
//
// // 약관동의 체크박스 개별 선택
// $(".checkbox_group").on("click", ".normal", function () {
//     var is_checked = true;
//
//     $(".checkbox_group .normal").each(function () {
//         is_checked = is_checked && $(this).is(":checked");
//     });
//
//     $("#check_all").prop("checked", is_checked);
// });
// // $(function () {
// //     $("#docEmailOverlap").click(function() {
// //         $.ajax({
// //             type:"post",
// //             dataType:"text",
// //             async:false,
// //             url:"/admin/DoctorEmailoverlap",
// //             data:{email:$('#email').val()},
// //             success: function(data, textStatus) {
// //                 if(data=='true') {
// //                     alert('사용 불가능합니다.');
// //                 }else {
// //                     alert('사용 가능합니다.');
// //                 }
// //             }
// //         });
// //     });
// // })
//
//
//
// //이메일 중복검사
// // const isValidEmail = email => {
// //     const reg = /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
// //     return reg.test(String(email).toLowerCase());
// // }
// $(document).ready(function() {
//     $("#doctorEmailoverlap").click(function () {
//         console.log($("#email").val());
//
//         // const emailValue = email.value.trim();
//         //
//         // if (emailValue === "") {
//         //     setError(email, "필수 정보입니다.", e);
//         //     return false;
//         // } else if (!isValidEmail(emailValue)) {
//         //     setError(email, "올바른 형식으로 입력해주세요.", e);
//         //     return false;
//         // } else {
//         $.ajax({
//             type: "POST",
//             url: "/doctor/DoctorEmailoverlap",
//             data: {
//                 "email": $("#email").val()
//             },
//             async: false,
//             success: function (data, textStatus) {
//                 if (data == true) {
//                     alert('사용 불가능합니다.');
//                 } else {
//                     alert('사용 가능합니다.');
//                 }
//             }
//         });
//
//     })
// });
// //
// //     $("#doctorEmailoverlap").click(function () {
// //         $.ajax({
// //             type: "post",
// //             datatype:"text",
// //             async: false,
// //             url:"/admin/DoctorEmailoverlap",
// //             data: {
// //                 "email": emailValue
// //             },
// //             success: function (data) {
// //                 var isOK = data
// //                 if (isOK) {
// //                     console.log(typeof isOK);
// //                     console.log(!isOK);
// //                     setError(email, "이미있는 이메일 입니다.");
// //                 } else {
// //                     setSuccess(email);
// //                 }
// //             }
// //         })
// //
// //     })
// // });
//
//
//
//     //
//     //
//     // if (emailValue === "") {
//     //     setError(email, "필수 정보입니다.", e);
//     //     return false;
//     // } else if (!isValidEmail(emailValue)) {
//     //     setError(email, "올바른 형식으로 입력해주세요.", e);
//     //     return false;
//     // } else {
//     //     $.ajax({
//     //         type: "POST",
//     //         url: "/admin/DoctorEmailoverlap",
//     //         data: {
//     //             "email": emailValue
//     //         },
//     //         async: false,
//     //         success: function (data) {
//     //             var isOK = data
//     //             if (isOK) {
//     //                 console.log(typeof isOK);
//     //                 console.log(!isOK);
//     //                 setError(email, "이미있는 이메일 입니다.");
//     //             } else {
//     //                 setSuccess(email);
//     //             }
//     //         }
//     //     });
//     // }
//
//
//
//
//
//
//
