<%--소연 : chat main--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홈스피탈 | 화상 채팅방</title>
    <!-- Latest minified Bootstrap & JQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="/resources/css/main.css"/>--%>
    <%--    <link rel="stylesheet" href="/resources/css/main2.css"/>--%>

    <!-- Custom styles for this template -->
    <style>
        #roomlist {
            display: block;
            border: 1px solid black;
            min-height: 50px;
        }

        #footer {
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>
<!-- Begin page content -->
<div class="container mt-5 pt-5">
    <form method="post" action="/meeting/room" object="${id}" id="form">
        <input type="hidden" id="uuid" name="uuid" value="${uuid}"/>
        <div class="row justify-content-md-center">
            <div class="col-md-6 mb-3 justify-content-center">
                <div class="row mb-3">
                    <label for="rooms-list">현재 생성된 방 목록입니다. 들어가실 방을 선택해주세요.</label><br>
                    <div id="roomlist">
                        <span id="rooms-list">
                            <c:forEach items="${rooms}" var="r">
                            <a href="/meeting/room/${r.id}" id="button-link-${r.id}">
                                <button type="button" name="action" value="${r.id}"
                                        class="btn btn-primary badge badge-primary"
                                        onclick="addUuidToButtonLink(this);">${r.id}
                                </button>
                            </a>
                            </c:forEach>
                        </span>
                    </div>
                </div>
                <c:if test="${not empty doctor}">
                    <div class="row mb-3">
                        <label for="id">새로운 방을 만드시려면 아래에 원하는 숫자를 입력하시거나,
                            'Random #' 버튼을 눌러 랜덤 숫자를 정할 수 있습니다.</label>
                        <input class="form-control" name="id" id="id" type="number" placeholder="최소: 0, 최대: 99"
                               min="0" max="99" value="${id}" required>
                    </div>
                    <div>
                        <a href="/meeting/room/random">
                            <button class="btn btn-outline-success" type="button">Random #</button>
                        </a>
                        <button name="action" value="create" type="submit" class="btn btn-outline-primary">
                            입력한 번호로 방 만들기
                        </button>
                    </div>
                </c:if>
            </div>
        </div>
    </form>
</div>
<!--generates unique user identifier stored at 'uuid' input field to pass it to the back-side-->
<script src="/resources/js/meeting/main.js"></script>
<%--<script>$("#footer").addClass('fixed-bottom');</script>--%>
</body>
</html>