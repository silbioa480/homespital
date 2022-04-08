<%--
  Created by IntelliJ IDEA.
  User: InSung
  Date: 2022-04-01
  Time: 오전 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/css/signUp.css"/>
    <title>Title</title>
</head>
<body>


<h1>의사 회원가입이요</h1>

<%--   사업자번호 조회 태영 --%>
    <input type="text" placeholder="사업자 번호 입력" name="ceoNumber" id="ceoNumber" />
    <button type="submit" id="ceoNumberCheck">번호 조회</button>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

<%--    사업자 번호 api ajax 태영--%>
    $(function(){
        $('#ceoNumberCheck').click(function(){
            let ceodata=$("#ceoNumber").val();
            let arraydata={
                "b_no":[ceodata]
            };

            console.log(ceodata);
            console.log(arraydata);
            $.ajax({
                url:"/numberSearch",
                type:"POST",
                data:JSON.stringify(arraydata),
                dataType:"JSON",
                contentType:"application/json",
                accept:"application/json",
                success:function(result){
                    console.log(result);
                },
                error:function(result){
                    console.log(result.responseText);
                }
            });
        });
    })
</script>
</body>
</html>
