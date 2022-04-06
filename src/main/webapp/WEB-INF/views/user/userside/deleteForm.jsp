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
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>

<form style="margin-top: 100px; " action="/delete" method="post" id="deleteForm" name="deleteForm" autocomplete="off">
    <input type="hidden" id="user_id" name="user_id" value="${user.user_email}">
    <div class="container" style="margin-top: 150px">
        <h3>회원탈퇴</h3>
        <hr>


                <div class="input-control">

                    <input  type="password" id = "password" name="password" class="form-control form-control-inline text-center" style="width: 100%" placeholder="비밀번호를 입력해 주세요." />
                </div>

                <hr>

                <input type="submit" id="delete" name="delete" style="width: 100%" value="탈퇴"></input>
<%--        <a href="/user/mypage" style="width: 48%" class="btn btn-default">취소</a>--%>
            </div>
        </div>
    </div>
</form>

</body>
</html>

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
            if(confirm("정말 탈퇴 하시겠습니까?") == true)
            {

                // if($("#password").val()==""){
            //     alert("비밀번호를 입력해주세요");
            //     $("#password").focus();
            //     return false
            // }

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
                url : "/delete",
                type : "POST",

                data : {
                    "password" : $('#password').val()
                },
                beforeSend: function (xhr){
                xhr.setRequestHeader("AJAX", "true");
                },
                success: function(response){
                    if(response == '삭제성공')
                    {
                        alert("탈퇴가 완료되었습니다.");
                        location.href = "/";
                    }
                    else if(response == "사용자없음")
                    {
                        alert("회원 정보를 찾을 수 없습니다..");
                        location.href = "/";
                    }
                    else
                    {
                        alert("비밀번호를 확인해주세요.");
                        location.href = "/delete";
                    }
                },
                // complete:function(data)
                // {
                //     icia.common.log(data);
                // },
                // error:function(xhr, status, error)
                // {
                //     icia.common.error(error);
                // }
            });
            }
        });
    });

</script>
</body>
</html>
