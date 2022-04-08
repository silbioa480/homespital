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
                $("#phone").attr("readonly", true);
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
const agreeChkAll = document.querySelector('input[name=agree_all]');
agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
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