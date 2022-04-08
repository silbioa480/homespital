// $(function(){
//     //모달을 전역변수로 선언
//     var modalContents = $(".modal-contents");
//     var modal = $("#defaultModal");
//
//
//     //------- 검사하여 상태를 class에 적용
//     $('#email').keyup(function(event){
//
//         var divEmail = $('#divEmail');
//
//         if($('#email').val()==""){
//             divEmail.removeClass("has-success");
//             divEmail.addClass("has-error");
//         }else{
//             divEmail.removeClass("has-error");
//             divEmail.addClass("has-success");
//         }
//     });
//
//     $('#password').keyup(function(event){
//
//         var divPassword = $('#divPassword');
//
//         if($('#password').val()==""){
//             divPassword.removeClass("has-success");
//             divPassword.addClass("has-error");
//         }else{
//             divPassword.removeClass("has-error");
//             divPassword.addClass("has-success");
//         }
//     });
//
//     $('#passwordCheck').keyup(function(event){
//
//         var password2 = $('#password2').val();
//         var password = $('#password').val();
//         var divPassword2 = $('#divPassword2');
//
//         if((password2=="") || (password!=password2)){
//             divPassword2.removeClass("has-success");
//             divPassword2.addClass("has-error");
//         }else{
//             divPassword2.removeClass("has-error");
//             divPassword2.addClass("has-success");
//         }
//     });
//
//     $('#name').keyup(function(event){
//
//         var divName = $('#divName');
//
//         if($.trim($('#name').val())==""){
//             divName.removeClass("has-success");
//             divName.addClass("has-error");
//         }else{
//             divName.removeClass("has-error");
//             divName.addClass("has-success");
//         }
//     });
//
//     $('#nickname').keyup(function(event){
//
//         var divNickname = $('#divNickname');
//
//         if($.trim($('#nickname').val())==""){
//             divNickname.removeClass("has-success");
//             divNickname.addClass("has-error");
//         }else{
//             divNickname.removeClass("has-error");
//             divNickname.addClass("has-success");
//         }
//     });
//
//     $('#email').keyup(function(event){
//
//         var divEmail = $('#divEmail');
//
//         if($.trim($('#email').val())==""){
//             divEmail.removeClass("has-success");
//             divEmail.addClass("has-error");
//         }else{
//             divEmail.removeClass("has-error");
//             divEmail.addClass("has-success");
//         }
//     });
//
//     $('#phoneNumber').keyup(function(event){
//
//         var divPhoneNumber = $('#divPhoneNumber');
//
//         if($.trim($('#phoneNumber').val())==""){
//             divPhoneNumber.removeClass("has-success");
//             divPhoneNumber.addClass("has-error");
//         }else{
//             divPhoneNumber.removeClass("has-error");
//             divPhoneNumber.addClass("has-success");
//         }
//     });
//
//
//     //------- validation 검사
//     $( "form" ).submit(function( event ) {
//
//         var provision = $('#provision');
//         var memberInfo = $('#memberInfo');
//         var divId = $('#divId');
//         var divPassword = $('#divPassword');
//         var divPasswordCheck = $('#divPasswordCheck');
//         var divName = $('#divName');
//         var divNickname = $('#divNickname');
//         var divEmail = $('#divEmail');
//         var divPhoneNumber = $('#divPhoneNumber');
//
//         //회원가입약관
//         if($('#provisionYn:checked').val()=="N"){
//             modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
//             modal.modal('show'); //모달 띄우기
//
//             provision.removeClass("has-success");
//             provision.addClass("has-error");
//             $('#provisionYn').focus();
//             return false;
//         }else{
//             provision.removeClass("has-error");
//             provision.addClass("has-success");
//         }
//
//         //개인정보취급방침
//         if($('#memberInfoYn:checked').val()=="N"){
//             modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             memberInfo.removeClass("has-success");
//             memberInfo.addClass("has-error");
//             $('#memberInfoYn').focus();
//             return false;
//         }else{
//             memberInfo.removeClass("has-error");
//             memberInfo.addClass("has-success");
//         }
//
//         //아이디 검사
//         if($('#id').val()==""){
//             modalContents.text("아이디를 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divId.removeClass("has-success");
//             divId.addClass("has-error");
//             $('#id').focus();
//             return false;
//         }else{
//             divId.removeClass("has-error");
//             divId.addClass("has-success");
//         }
//
//         //패스워드 검사
//         if($('#password').val()==""){
//             modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divPassword.removeClass("has-success");
//             divPassword.addClass("has-error");
//             $('#password').focus();
//             return false;
//         }else{
//             divPassword.removeClass("has-error");
//             divPassword.addClass("has-success");
//         }
//
//         //패스워드 확인
//         if($('#passwordCheck').val()==""){
//             modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divPasswordCheck.removeClass("has-success");
//             divPasswordCheck.addClass("has-error");
//             $('#passwordCheck').focus();
//             return false;
//         }else{
//             divPasswordCheck.removeClass("has-error");
//             divPasswordCheck.addClass("has-success");
//         }
//
//         //패스워드 비교
//         if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
//             modalContents.text("패스워드가 일치하지 않습니다.");
//             modal.modal('show');
//
//             divPasswordCheck.removeClass("has-success");
//             divPasswordCheck.addClass("has-error");
//             $('#passwordCheck').focus();
//             return false;
//         }else{
//             divPasswordCheck.removeClass("has-error");
//             divPasswordCheck.addClass("has-success");
//         }
//
//         //이름
//         if($('#name').val()==""){
//             modalContents.text("이름을 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divName.removeClass("has-success");
//             divName.addClass("has-error");
//             $('#name').focus();
//             return false;
//         }else{
//             divName.removeClass("has-error");
//             divName.addClass("has-success");
//         }
//
//         //별명
//         if($('#nickname').val()==""){
//             modalContents.text("별명을 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divNickname.removeClass("has-success");
//             divNickname.addClass("has-error");
//             $('#nickname').focus();
//             return false;
//         }else{
//             divNickname.removeClass("has-error");
//             divNickname.addClass("has-success");
//         }
//
//         //이메일
//         if($('#email').val()==""){
//             modalContents.text("이메일을 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divEmail.removeClass("has-success");
//             divEmail.addClass("has-error");
//             $('#email').focus();
//             return false;
//         }else{
//             divEmail.removeClass("has-error");
//             divEmail.addClass("has-success");
//         }
//
//         //휴대폰 번호
//         if($('#phoneNumber').val()==""){
//             modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
//             modal.modal('show');
//
//             divPhoneNumber.removeClass("has-success");
//             divPhoneNumber.addClass("has-error");
//             $('#phoneNumber').focus();
//             return false;
//         }else{
//             divPhoneNumber.removeClass("has-error");
//             divPhoneNumber.addClass("has-success");
//         }
//
//
//     });
//
// });