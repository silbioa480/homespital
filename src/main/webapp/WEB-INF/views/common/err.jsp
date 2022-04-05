<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #main {
            height: 100vh;
        }
    </style>

</head>
<body>
<p>${err}</p>
<div class="d-flex justify-content-center align-items-center" id="main">
    <h1 class="mr-3 pr-3 align-top border-right inline-block align-content-center">404</h1>
    <div class="inline-block align-middle">
        <h2 class="font-weight-normal lead" id="desc">The page you requested was not found.</h2>
        <button type="button" class="btn btn-primary" onclick="location.href='/';">돌아가기</button>
    </div>
</div>
</body>
</html>
