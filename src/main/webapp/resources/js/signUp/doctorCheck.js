//가영: 의사 유효성검사(진행중 - 완료되면 완료라고 바꿀예정)
// const form = document.getElementById('form');
// const email = document.getElementById('email');
//
// const setError = (element, message, e) => {
//     const inputControl = element.parentElement;
//     const errorDisplay = inputControl.querySelector('.error');
//     errorDisplay.innerText = message;
//     inputControl.classList.add('error');
//     inputControl.classList.remove('success');
// }
// //성공시 에러메시지 삭제
// const setSuccess = element => {
//     const inputControl = element.parentElement;
//     const errorDisplay = inputControl.querySelector('.error');
//
//     errorDisplay.innerText = '';
//     inputControl.classList.add('success');
//     inputControl.classList.remove('error');
// }

//정규성검사
// $(function () {
    //모달을 전역변수로 선언


    //------- 검사하여 상태를 class에 적용
    // $('#email').keyup(function (event) {
    //
    //     var divId = $('#divId');
    //
    //     if ($('#id').val() == "") {
    //         divId.removeClass("has-success");
    //         divId.addClass("has-error");
    //     } else {
    //         divId.removeClass("has-error");
    //         divId.addClass("has-success");
    //     }
    // });
    //
    // $('#password').keyup(function (event) {
    //
    //     var divPassword = $('#divPassword');
    //
    //     if ($('#password').val() == "") {
    //         divPassword.removeClass("has-success");
    //         divPassword.addClass("has-error");
    //     } else {
    //         divPassword.removeClass("has-error");
    //         divPassword.addClass("has-success");
    //     }
    // });
    //
    // $('#password2').keyup(function (event) {
    //
    //     var password2 = $('#password2').val();
    //     var password = $('#password').val();
    //     var divPassword2 = $('#divPasswordCheck');
    //
    //     if ((password2 == "") || (password != password2)) {
    //         divPassword2.removeClass("has-success");
    //         divPassword2.addClass("has-error");
    //     } else {
    //         divPassword2.removeClass("has-error");
    //         divPassword2.addClass("has-success");
    //     }
    // });
    //
    // $('#phone').keyup(function (event) {
    //
    //     var divPhone = $('#divPhone');
    //
    //     if (($('#phone').val()) == "") {
    //         divPhone.removeClass("has-success");
    //         divPhone.addClass("has-error");
    //     } else {
    //         divPhone.removeClass("has-error");
    //         divPhone.addClass("has-success");
    //     }
    // });
    //
    // $('#phone2').keyup(function (event) {
    //
    //     var divPhone2 = $('#divPhone2');
    //
    //     if (($('#phone2').val()) == "") {
    //         divPhone2.removeClass("has-success");
    //         divPhone2.addClass("has-error");
    //     } else {
    //         divPhone2.removeClass("has-error");
    //         divPhone2.addClass("has-success");
    //     }
    // });
    //
    // $('#doctorName').keyup(function (event) {
    //
    //     var divDoctorName = $('#divDoctorName');
    //
    //     if (($('#doctorName').val()) == "") {
    //         divDoctorName.removeClass("has-success");
    //         divDoctorName.addClass("has-error");
    //     } else {
    //         divDoctorName.removeClass("has-error");
    //         divDoctorName.addClass("has-success");
    //     }
    // });
    //
    // $('#doctorNumber').keyup(function (event) {
    //
    //     var divDoctorNumber = $('#divDoctorNumber');
    //
    //     if (($('#doctorNumber').val()) == "") {
    //         divDoctorNumber.removeClass("has-success");
    //         divDoctorNumber.addClass("has-error");
    //     } else {
    //         divDoctorNumber.removeClass("has-error");
    //         divDoctorNumber.addClass("has-success");
    //     }
    // });
    //
    // $('#doctorProfile').keyup(function (event) {
    //
    //     var divDoctorProfile = $('#divDoctorProfile');
    //
    //     if (($('#doctorProfile').val()) == "") {
    //         divDoctorProfile.removeClass("has-success");
    //         divDoctorProfile.addClass("has-error");
    //     } else {
    //         divDoctorProfile.removeClass("has-error");
    //         divDoctorProfile.addClass("has-success");
    //     }
    // });
    //
    // $('#businessNumber').keyup(function (event) {
    //
    //     var divBusinessNumber = $('#divBusinessNumber');
    //
    //     if (($('#businessNumber').val()) == "") {
    //         divBusinessNumber.removeClass("has-success");
    //         divBusinessNumber.addClass("has-error");
    //     } else {
    //         divBusinessNumber.removeClass("has-error");
    //         divBusinessNumber.addClass("has-success");
    //     }
    // });
    //
    // $('#zipNo').keyup(function (event) {
    //
    //     var divZipNo = $('#divZipNor');
    //
    //     if (($('#zipNo').val()) == "") {
    //         divZipNo.removeClass("has-success");
    //         divZipNo.addClass("has-error");
    //     } else {
    //         divZipNo.removeClass("has-error");
    //         divZipNo.addClass("has-success");
    //     }
    // });
    //
    // $('#roadFullAddr').keyup(function (event) {
    //
    //     var divRoadFullAddr = $('#divRoadFullAddr');
    //
    //     if (($('#roadFullAddr').val()) == "") {
    //         divRoadFullAddr.removeClass("has-success");
    //         divRoadFullAddr.addClass("has-error");
    //     } else {
    //         divRoadFullAddr.removeClass("has-error");
    //         divRoadFullAddr.addClass("has-success");
    //     }
    // });
    // $('#addrDetail').keyup(function (event) {
    //
    //     var divAddrDetail = $('#divAddrDetail');
    //
    //     if (($('#addrDetail').val()) == "") {
    //         divAddrDetail.removeClass("has-success");
    //         divAddrDetail.addClass("has-error");
    //     } else {
    //         divAddrDetail.removeClass("has-error");
    //         divAddrDetail.addClass("has-success");
    //     }
    // });
// });

$( "form" ).submit(function( event ) {
    var modalContents = $(".modal-contents");
    var modal = $("#defaultModal");


    var divEmail = $('#divEmail');
    var divPassword = $('#divPassword');
    var divPassword2 = $('#divPassword2');
    var divPhone = $('#divPhone');
    var divPhone2 = $('#divPhone2');
    var divDoctorName = $('#divDoctorName');
    var divDoctorNumber = $('#divDoctorNumber');
    var divDoctorProfile = $('#divDoctorProfile');
    var divBusinessNumber = $('#divBusinessNumber');
    var divZipNo = $('#divZipNo');
    var divAddrDetail = $('#divAddrDetail');
    var divOpen = $('#divOpen');


    //이메일 검사
    if($('#email').val()==""){
        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divEmail.removeClass("has-success");
        divEmail.addClass("has-error");
        $('#email').focus();
        return false;
    }else{
        divEmail.removeClass("has-error");
        divEmail.addClass("has-success");
    }

    //패스워드 검사
    if($('#password').val()==""){
        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divPassword.removeClass("has-success");
        divPassword.addClass("has-error");
        $('#password').focus();
        return false;
    }else{
        divPassword.removeClass("has-error");
        divPassword.addClass("has-success");
    }

    //패스워드 확인
    if($('#password2').val()==""){
        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divPassword2.removeClass("has-success");
        divPassword2.addClass("has-error");
        $('#password2').focus();
        return false;
    }else{
        divPassword2.removeClass("has-error");
        divPassword2.addClass("has-success");
    }

    //패스워드 비교
    if($('#password').val()!=$('#password2').val() || $('#password2').val()==""){
        modalContents.text("패스워드가 일치하지 않습니다.");
        modal.modal('show');

        divPassword2.removeClass("has-success");
        divPassword2.addClass("has-error");
        $('#password2').focus();
        return false;
    }else{
        divPassword2.removeClass("has-error");
        divPassword2.addClass("has-success");
    }

    // 휴대폰
    // if($('#phone').val()==""){
    //     modalContents.text("휴대폰번호를 입력하여 주시기 바랍니다.");
    //     modal.modal('show');
    //
    //     divPhone.removeClass("has-success");
    //     divPhone.addClass("has-error");
    //     $('#phone').focus();
    //     return false;
    // }else{
    //     divPhone.removeClass("has-error");
    //     divPhone.addClass("has-success");
    // }
    if(($('#open').val() == "")) {
        console.log(($('#open').val()));
        modalContents.text("오픈시간을 선택해주세.");
        modal.modal('show');

        divOpen.removeClass("has-success");
        divOpen.addClass("has-error");
        $('#open').focus();
        return false;
    }else{
        divOpen.removeClass("has-error");
        divOpen.addClass("has-success");
    }

    //인증번호
    if($('#phone2').val()==""){
        modalContents.text("인증번호를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divPhone2.removeClass("has-success");
        divPhone2.addClass("has-error");
        $('#phone2').focus();
        return false;
    }else{
        divPhone2.removeClass("has-error");
        divPhone2.addClass("has-success");
    }

    //의사이름
    if($('#doctorName').val()==""){
        modalContents.text("이름을 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divDoctorName.removeClass("has-success");
        divDoctorName.addClass("has-error");
        $('#doctorName').focus();
        return false;
    }else{
        divDoctorName.removeClass("has-error");
        divDoctorName.addClass("has-success");
    }

    //의사면허
    if($('#doctorNumber').val()==""){
        modalContents.text("의사면허 번호를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divDoctorNumber.removeClass("has-success");
        divDoctorNumber.addClass("has-error");
        $('#doctorNumber').focus();
        return false;
    }else{
        divDoctorNumber.removeClass("has-error");
        divDoctorNumber.addClass("has-success");
    }

    //프로필
    if($('#doctorProfile').val()==""){
        modalContents.text("프로필사진을 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divDoctorProfile.removeClass("has-success");
        divDoctorProfile.addClass("has-error");
        $('#doctorProfile').focus();
        return false;
    }else{
        divDoctorProfile.removeClass("has-error");
        divDoctorProfile.addClass("has-success");
    }

    //사업자번호
    if($('#businessNumber').val()==""){
        modalContents.text("사업자 번호를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divBusinessNumber.removeClass("has-success");
        divBusinessNumber.addClass("has-error");
        $('#businessNumber').focus();
        return false;
    }else{
        divBusinessNumber.removeClass("has-error");
        divBusinessNumber.addClass("has-success");
    }

    //우편 번호
    if($('#zipNo').val()==""){
        modalContents.text("우편 번호를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divZipNo.removeClass("has-success");
        divZipNo.addClass("has-error");
        $('#zipNo').focus();
        return false;
    }else{
        divZipNo.removeClass("has-error");
        divZipNo.addClass("has-success");
    }

    //휴대폰 번호
    if($('#addrDetail').val()==""){
        modalContents.text("상세주소를 입력하여 주시기 바랍니다.");
        modal.modal('show');

        divAddrDetail.removeClass("has-success");
        divAddrDetail.addClass("has-error");
        $('#addrDetail').focus();
        return false;
    }else{
        divAddrDetail.removeClass("has-error");
        divAddrDetail.addClass("has-success");
    }

});

// $(function () {
//     $("#docEmailOverlap").click(function() {
//         $.ajax({
//             type:"post",
//             dataType:"text",
//             async:false,
//             url:"/admin/DoctorEmailoverlap",
//             data:{email:$('#email').val()},
//             success: function(data, textStatus) {
//                 if(data=='true') {
//                     alert('사용 불가능합니다.');
//                 }else {
//                     alert('사용 가능합니다.');
//                 }
//             }
//         });
//     });
// })



//이메일 중복검사
// const isValidEmail = email => {
//     const reg = /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
//     return reg.test(String(email).toLowerCase());
// }
$(document).ready(function() {
    $("#doctorEmailoverlap").click(function () {
        console.log($("#email").val());

        // const emailValue = email.value.trim();
        //
        // if (emailValue === "") {
        //     setError(email, "필수 정보입니다.", e);
        //     return false;
        // } else if (!isValidEmail(emailValue)) {
        //     setError(email, "올바른 형식으로 입력해주세요.", e);
        //     return false;
        // } else {
        $.ajax({
            type: "POST",
            url: "/doctor/Emailoverlap",
            data: {
                "email": $("#email").val()
            },
            async: false,
            success: function (data, textStatus) {
                if (data == true) {
                    alert('사용 불가능합니다.');
                } else {
                    alert('사용 가능합니다.');
                }
            }
        });

    })
});
//
//     $("#doctorEmailoverlap").click(function () {
//         $.ajax({
//             type: "post",
//             datatype:"text",
//             async: false,
//             url:"/admin/DoctorEmailoverlap",
//             data: {
//                 "email": emailValue
//             },
//             success: function (data) {
//                 var isOK = data
//                 if (isOK) {
//                     console.log(typeof isOK);
//                     console.log(!isOK);
//                     setError(email, "이미있는 이메일 입니다.");
//                 } else {
//                     setSuccess(email);
//                 }
//             }
//         })
//
//     })
// });



    //
    //
    // if (emailValue === "") {
    //     setError(email, "필수 정보입니다.", e);
    //     return false;
    // } else if (!isValidEmail(emailValue)) {
    //     setError(email, "올바른 형식으로 입력해주세요.", e);
    //     return false;
    // } else {
    //     $.ajax({
    //         type: "POST",
    //         url: "/admin/DoctorEmailoverlap",
    //         data: {
    //             "email": emailValue
    //         },
    //         async: false,
    //         success: function (data) {
    //             var isOK = data
    //             if (isOK) {
    //                 console.log(typeof isOK);
    //                 console.log(!isOK);
    //                 setError(email, "이미있는 이메일 입니다.");
    //             } else {
    //                 setSuccess(email);
    //             }
    //         }
    //     });
    // }







