<%--
  Created by IntelliJ IDEA.
  User: Ko
  Date: 2022-04-03
  Time: 오후 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form style="margin-top: 100px; " action="/user/delete" method="post" id="deleteForm" name="deleteForm">
    <input type="hidden" id="user_id" name="user_id" value="${user.user_email}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">회원탈퇴</p>
                <div class="form-group" style="margin-bottom: 20px">

                    <input  type="password" id = "password" name="password" class="form-control form-control-inline text-center" placeholder="비밀번호를 입력해 주세요." />
                </div>

<%--                <div class="form-group">--%>

<%--                    <input type="password" id="password2" name="password2"  class="form-control form-control-inline text-center" placeholder="비밀번호를 다시 입력해 주세요." onkeyup="check_pw()" value="" maxlength="12" size="15" required/>--%>
<%--                </div>--%>
<%--                <span id="pw_check_msg" style="color: #1abc9c"></span>--%>
                <hr>
                <br>
                <button type="button" id="delete" name="delete" class="btn btn-primary">탈퇴</button> <a href="/index" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">


    function check_pw(){  //비밀번호 확인
        var password = document.getElementById('password').value;
        var password2 = document.getElementById('password2').value;

        if (password!==password2) {
            document.getElementById('pw_check_msg').innerHTML = "비밀번호가 다릅니다. 다시 확인해 주세요.";
        }
        else {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
        if (password2==="") {
            document.getElementById('pw_check_msg').innerHTML = "";
        }
    }

    $(document).ready(function(){

        $("#delete").on("click", function(){

            if($("#password").val()==""){
                alert("비밀번호를 입력해주세요");
                $("#password").focus();
                return false
            }

            // if($("#password2").val()==""){
            //     alert("비밀번호 확인을 입력해주세요");
            //     $("#password2").focus();
            //     return false
            // }
            //
            // if ($("#password").val() != $("#password2").val()) {
            //     alert("비밀번호가 일치하지 않습니다.");
            //     $("#password").focus();
            //
            //     return false;
            // }

            $.ajax({
                url : "/user/pwCheck",
                type : "POST",
                dataType : "json",
                data : $("#deleteForm").serializeArray(),
                success: function(data){

                    if(data==0){
                        alert("비밀번호를 확인해주세요.");
                        return;
                    }else{
                        if(confirm("탈퇴하시겠습니까?")){
                            $("#deleteForm").submit();
                        }

                    }
                }
            })
        });
    })
</script>
</body>
</html>
