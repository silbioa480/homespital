<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
</head>
<body>
<!-- 훈 : 아임포트 빌링키 테스트 -->
<form action="/test-billingkey", method="post">
  <!--예: https://www.myservice.com/subscription/issue-billing-->
  <div>
    <label for="card_number">카드 번호 XXXX-XXXX-XXXX-XXXX</label>
    <input id="card_number" type="text" name="card_number">
  </div>
  <div>
    <label for="expiry">카드 유효기간 YYYY-MM</label>
    <input id="expiry" type="text" name="expiry">
  </div>
  <div>
    <label for="birth">생년월일 YYMMDD</label>
    <input id="birth" type="text" name="birth">
  </div>
  <div>
    <label for="pwd_2digit">카드 비밀번호 앞 두자리 XX</label>
    <input id="pwd_2digit" type="text" name="pwd_2digit">
  </div>
  <input hidden type="text" value="gildong_0001_1234" name="customer_uid">
  <input type="submit" value="결제하기">
</form>
</body>
</html>