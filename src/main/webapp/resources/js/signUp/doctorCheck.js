// //가영: 의사 유효성검사(진행중 - 완료되면 완료라고 바꿀예정)

//약사 회원가입 정규성 검사

const form = document.getElementById('form');
const email = document.getElementById("email");
const password = document.getElementById("password");
const password2 = document.getElementById('password2');
const phone = document.getElementById("phone").parentElement;
const phone2 = document.getElementById("phone2").parentElement;
const doctorName = document.getElementById("doctorName").parentElement;
const doctorNumber = document.getElementById("doctorNumber").parentElement;
const doctorProfile = document.getElementById("doctorProfile").parentElement;
const businessNumber = document.getElementById("businessNumber").parentElement;
const address = document.getElementById("zipNo").parentElement.parentElement.parentElement.parentElement.parentElement;
//확인필요
const diagnosisType = document.getElementById("diagnosis_type").parentElement;
const diagnosisType2 = document.getElementById("diagnosis_type2").parentElement;
const open = document.getElementById("open").parentElement;
const end = document.getElementById("end").parentElement;
const lunchSt = document.getElementById("lunch-st").parentElement;
const lunchCl = document.getElementById("lunch-cl").parentElement;

const agree = document.getElementById("agree_all").parentElement;


email.addEventListener("change", checkEmail);
password.addEventListener("change", checkPassword);
password2.addEventListener("change", checkPassword2);
phone.addEventListener("change", checkPhone);
phone2.addEventListener("change", checkPhone2);
doctorName.addEventListener("change", checkDoctorName);
doctorNumber.addEventListener("change", checkDoctorNumber);
doctorProfile.addEventListener("change", checkProfile);
businessNumber.addEventListener("change", checkBusinessNumber);
address.addEventListener("change", checkAddress);
diagnosisType.addEventListener("change", checkDiagnosisType);
diagnosisType2.addEventListener("change", checkDiagnosisType2);
open.addEventListener("change", checkOpen);
end.addEventListener("change", checkEnd);
lunchSt.addEventListener("change", checkLunchSt);
lunchCl.addEventListener("change", checkLunchCl);

address.addEventListener("change", checkAddress);

function checkAll() {
    checkEmail();
    checkPassword();
    checkPassword2();
    checkPhone();
    checkPhone2();
    checkDoctorName();
    checkDoctorNumber();
    checkProfile();

    checkAddress();
    // checkDiagnosisType();
    checkDiagnosisType2();
    checkOpen();
    checkEnd();
    checkLunchSt();
    checkLunchCl();
    checkBusinessNumber();
    checkAddress();
    checkRadio();

    console.log(checkEmail());
    if (confirm("회원가입을하시겠습니까?")) {
        if (checkEmail() === true && checkPassword() === true && checkPassword2() === true
            && checkPhone() === true && checkPhone2() === true && checkBusinessNumber() === true
            && checkAddress() === true && checkRadio() === true && checkDoctorName() ===true
            && checkDoctorNumber () === true && checkProfile() === true
        && checkDiagnosisType() === true && checkDiagnosisType2() === true && checkOpen() === true
        && checkEnd() === true && checkLunchSt() === true && checkLunchCl() === true  ) {
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
            url: "/DoctorEmailoverlap",
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

function checkPhone() {
    var phonePattern = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    const phoneValue = document.getElementById("phone").value.trim();
    if (phoneValue === "") {
        setError(phone, "휴대폰 번호를 입력해주세요.");
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
        setError(phone2, "인증번호를 입력해주세요.");
        return false;
    } else if (phone2Value !== code2) {
        setError(phone2, "인증번호가 일치하지 않습니다.")
        return false;
    } else {
        setSuccess(phone2);
    }
    return true;
}

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
    const doctorNumberValue = document.getElementById("doctorNumber").value.trim();
    if (doctorNumberValue === "") {
        setError(doctorNumber, "의사면허번호를 입력해주세요.");
        return false;
    } else {
        setSuccess(doctorNumber);
    }
    return true;
}

function checkProfile() {
    const doctorProfileValue = document.getElementById("doctorProfile").value.trim();
    if (doctorProfileValue === "") {
        setError(doctorProfile, "프로필사진은 업로드해주세요.");
        return false;
    } else {
        setSuccess(doctorProfile);
    }
    return true;
}



function checkBusinessNumber() {
    const businessNumberValue = document.getElementById("businessNumber").value.trim();
    if (businessNumberValue === "") {
        setError(businessNumber, "사업자번호를 입력해주세요.");
        return false;
    } else {
        setSuccess(businessNumber);
    }
    return true;
}

function checkDiagnosisType2() {
    const diagnosisType2Value = document.getElementById("diagnosisType2").value.trim();
    if (diagnosisType2Value === "") {
        setError(diagnosisType2, "진료과를 1개 이상 선택해주세요.");
        return false;
    } else {
        setSuccess(diagnosisType2);
    }
    return true;
}

function checkOpen() {
    const open = document.getElementById("open").value.trim();
    if (open === "") {
        setError(open, "진료시작 시간을 선택해주세요.");
        return false;
    } else {
        setSuccess(open);
    }
    return true;
}

function checkEnd() {
    const endValue = document.getElementById("end").value.trim();
    if (endValue === "") {
        setError(end, "진료마감 시간을 선택해주세요.");
        return false;
    } else {
        setSuccess(end);
    }
    return true;
}

function checkLunchSt() {
    const lunchStValue = document.getElementById("lunchSt").value.trim();
    if (lunchStValue === "") {
        setError(lunchSt, "점심시간을 선택해주세요.");
        return false;
    } else {
        setSuccess(lunchSt);
    }
    return true;
}

function checkLunchCl() {
    const lunchClValue = document.getElementById("lunchCl").value.trim();
    if (lunchClValue === "") {
        setError(lunchCl, "점심시간을 선택해주세요.");
        return false;
    } else {
        setSuccess(lunchCl);
    }
    return true;
}


function checkAddress() {
    const zipNoValue = document.getElementById("zipNo").value.trim();
    const roadFullAddrValue = document.getElementById("roadFullAddr").value.trim();
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
        return false
    } else {
        setSuccess(agree);
    }
    return true;
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
