<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <!-- Latest minified Bootstrap & JQuery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>--%>
    <!-- Custom styles for this template -->
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        .notosanskr * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .btn.active {
            display: none;
        }

        .btn span:nth-of-type(1) {
            display: none;
        }

        .btn span:last-child {
            display: block;
        }

        .btn.active span:nth-of-type(1) {
            display: block;
        }

        .btn.active span:last-child {
            display: none;
        }

        #chatBox {
            width: 100%;
            height: 300px;
            border: 1px solid rgb(222, 226, 230);
            border-radius: 5px;
            padding: 10px;
            overflow-y: auto;
        }

        #local_video, #remote_video {
            max-width: 100%;
            width: 100%;
        }

    </style>
    <%--    <link rel="stylesheet" type="text/css" href="/css/main.css"/>--%>
</head>
<body class="text-center">

<!-- Begin page content -->
<div class="d-flex flex-column justify-content-start"
     style="width: 100%; background-color: #33CC99; color: #2A2D42;">
    <%--    <div class="d-flex align-items-end">--%>
    <img src="/resources/img/design/chat_white_logo.png" width="120px" class="p-2 d-block">
    <h5 class="px-3 text-start" style="color: #2A2D42; font-family: 'Noto Sans KR';"><strong>화상 진료실</strong></h5>


    <%--    </div>--%>
</div>
<main role="main" class="container-fluid">

    <input type="hidden" id="id" name="id" value="${id}"/>
    <div class="col-lg-12 mb-3">
        <div class="mb-3">
            <%--            ${uuid != null ? '유저: '+ uuid : ''}--%>
            <%--            ${id != null ? '@ 채팅방 #'+ id  : ''}--%>
        </div>
        <div class="col-lg-12 mb-3">
            <div class="d-flex justify-content-around mb-3">
                <div id="buttons" class="row">
                    <a href="/meeting/room/${id}/user/${uuid}/exit">
                        <button type="button" class="btn btn-outline-dark" id="exit" name="exit">
                            진료실 퇴장
                        </button>
                    </a>
                </div>
            </div>
        </div>

        <div class="row justify-content-around mb-3 mx-2 border">
            <div class="col-md-6 bg-light border-end">
                <h1>나</h1>
                <video id="local_video" autoplay playsinline muted></video>
            </div>
            <div class="col-md-6 bg-light">
                <h1>상대방</h1>
                <video id="remote_video" autoplay playsinline></video>
            </div>
        </div>
        <div class="row justify-content-around mb-3 mx-2">
            <div id="chatBox" class="text-start">
            </div>
            <div class="input-group">
                <input type="text" id="chatMsg" class="form-control"
                       onkeyup="if(window.event.keyCode==13){sendChat('${not empty username ? username : '익명'}')}"/>
                <button id="sendBtn" class="btn border border-dark"
                        onclick="sendChat('${not empty username ? username : '익명'}')">전송
                </button>
            </div>
        </div>

    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/meeting/webrtc_client.js"></script>

<%--<input type="text" id="chatId" placeholder="채팅 아이디를 입력하세요"><br/>--%>
<%--<input type="text" id="chatMsg">--%>
<%--<input type="button" id="msgBtn" value="전송"><br>--%>
<%--<textarea rows="10" cols="30"></textarea>--%>
</body>


<script>
    /*
    * 채팅 박스 만들기
    * 그리고 대화명 앞으로 가져오기
    * ws 로 s 떼고 로컬에서 작업 가능한지 확인 되면 진짜 로또
    *
    * */
</script>
<script>
    // function sendChat(currentusername) {
    //     const chatBox = document.querySelector('#chatBox');
    //     var chat = null;
    //     chat = "[" + currentusername + "] : " + $('#chatMsg').val();
    //     // dataChannel.send(chat);
    //     chatBox.innerHTML += (chat + "</br>");
    //     $('#chatMsg').val("");
    //     $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);
    // }
</script>
</html>