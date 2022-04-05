<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!-- 훈 : 아임포트 결제 테스트 -->
<form action="/test-pay" , method="post">
    <div>
        <label for="merchant_uid">주문번호</label>
        <input id="merchant_uid" type="text" name="merchant_uid">
    </div>
    <div>
        <label for="name">결제내역</label>
        <input id="name" type="text" name="name">
    </div>
    <div>
        <label for="amount">결제금액</label>
        <input id="amount" type="text" name="amount">
    </div>
    <input hidden type="text" value="9" name="customer_uid">
    <input type="submit" value="결제하기">
</form>
</body>
</html>