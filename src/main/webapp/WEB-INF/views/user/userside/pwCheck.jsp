<%--
  Created by IntelliJ IDEA.
  User: Ko
  Date: 2022-04-03
  Time: 오후 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form style="margin-top: 100px;" action="modifyForm" method="post" id="pwCheck" name="pwCheck">
    <input type="hidden" id="user_id" name="user_id" value="${user.user_email}">
<div class="container" style="margin-top: 150px">
    <h3>회원정보 수정</h3>
    <hr>

    <div class="input-control">
        <label for="password">비밀번호</label>
        <input type="password" style="width: 100%" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="" minlength="4" maxlength="12" size="15" pattern="[a-zA-Z0-9]{4,12}" title="4~12자의 영문 대소문자와 숫자로만 입력.">
        <div class="error"></div>
    </div>
    <div class="input-control">
        <label for="password2">비밀번호 확인</label>
        <input type="password" style="width: 100%" id="password2" name="password2" placeholder="비밀번호를 입력해주세요" onkeyup="check_pw()" value="" maxlength="12" size="15" >
        <span id="pw_check_msg" style="color: #1abc9c"></span>
        <div class="error"></div>
    </div>
</div>

    <input type="submit" id="pwChecked" name="pwChecked" value="수정" style="width: 100%;"></input>
</form>

<script type="text/javascript">

    $(document).ready(function (){
        $('#pwChecked').submit(function (){
            return pwCheck();
        });
    });

    pwCheck = function (){
        var pw = $("#password").val();
        var checkpw = $("#password2").val();

        var pwRegExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        if(pw ==""||pw==null){
            alert("비밀번호를 입력해 주세요");
            return false;
        }else if(checkpw ==""||checkpw ==null){
            alert("비밀번호 확인을 입력해 주세요");
            return false;
        }else if(pw !=checkpw){
            alert("비밀번호가 다릅니다.")
        }else {
            return true;
        }
    }

    // function check_pw(){  //비밀번호 확인
    //     var password = document.getElementById('password').value;
    //     var password2 = document.getElementById('password2').value;
    //
    //     if (password!==password2) {
    //         document.getElementById('pw_check_msg').innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요.";
    //     }
    //     else {
    //         document.getElementById('pw_check_msg').innerHTML = "";
    //     }
    //     if (password2==="") {
    //         document.getElementById('pw_check_msg').innerHTML = "";
    //     }
    // }
    //
    // $(document).ready(function(){
    //
    //     $("#pwChecked").on("click", function(){
    //
    //         if($("#password").val()==""){
    //             alert("비밀번호를 입력해주세요");
    //             $("#password").focus();
    //             return false
    //         }
    //
    //         if($("#password2").val()==""){
    //             alert("비밀번호 확인을 입력해주세요");
    //             $("#password2").focus();
    //             return false
    //         }
    //
    //         if ($("#password").val() != $("#password2").val()) {
    //             alert("비밀번호가 일치하지 않습니다.");
    //             $("#password").focus();
    //
    //             return false;
    //         }

            // if ($("#password").val() == $("#password2").val()) {
            //
            //
            //     return "modifyForm";
            // }

            // $.ajax({
            //     url : "/pwCheck",
            //     type : "POST",
            //     dataType : "json",
            //     data : $("#pwCheck").serializeArray(),
            //     success: function(data){
            //
            //         if(data==false){
            //             alert("비밀번호를 확인해주세요.");
            //             return;
            //         }else{
            //             if(confirm("수정하시겠습니까?")){
            //                 $("#pwCheck").submit();
            //                 // return "modifyForm";
            //             }
            //
            //         }
            //     }
    //         // })
    //     });
    // })
</script>


</body>
</html>
