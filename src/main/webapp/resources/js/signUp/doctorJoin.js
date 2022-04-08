//병원 진료시간 관련

$("select[name=open]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=open] option:selected").text()); //text값 가져오기
});

$("select[name=close]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=close] option:selected").text()); //text값 가져오기
});

//
//병원 점심시간관련

$("select[name=lunch-st]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=lunch-st] option:selected").text()); //text값 가져오기
});

$("select[name=lunch-cl]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=lunch-cl] option:selected").text()); //text값 가져오기
});

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

// const phone = document.getElementById('phone').parentElement;
// //회원가입 버튼 유효성
// function validateInput(e) {
//
//     const phoneValue = document.getElementById('phone').value.trim();
//
//     if (phoneValue === "") {
//         setError(phone, "필수 정보입니다.", e);
//         return false;
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


// //진료과선택관련
//
// function Init()
// {
//     document.form.allowList.options.add(new Option("마징가", "1"));
//     document.form.allowList.options.add(new Option("울트라", "2"));
//     document.form.allowList.options.add(new Option("베트맨", "3"));
//     document.form.allowList.options.add(new Option("슈퍼맨", "4"));
//     document.form.allowList.options.add(new Option("왕눈이", "5"));
//     document.form.allowList.options.add(new Option("아로미", "6"));
//     document.form.allowList.options.add(new Option("손오공", "7"));
//     document.form.allowList.options.add(new Option("오로라", "8"));
// }
//
//
//
// function Add(sel)
// {
//     //복사
//     var selectedItem = sel.options[sel.options.selectedIndex];
//     document.form.denyList.options.add(new Option(selectedItem.text, selectedItem.value));
//
//
//
//     //삭제
//     sel.options.remove(sel.options.selectedIndex);
// }
//
//
//
// function Remove(sel)
// {
//     var selectedItem = sel.options[sel.options.selectedIndex];
//     document.form.allowList.options.add(new Option(selectedItem.text, selectedItem.value));
//
//
//
//     //삭제
//     sel.options.remove(sel.options.selectedIndex);
// }