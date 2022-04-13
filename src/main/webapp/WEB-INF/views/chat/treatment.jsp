<%--소연 : chat 진료실--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <video  src="" width="320" height="230" style="background-color: black"></video>
   <canvas width="320" height="230" style="background-color: blue" id="blueCanvas"></canvas>
   <input type="button" value="화상 종료" id="stopBtn">
   
   <hr>
   
   <input type="text" id="chatId" placeholder="채팅 아이디를 입력하세요"><br/>
   <input type="text" id="chatMsg">
   <input type="button" id="msgBtn" value="전송"><br>
   <textarea rows="10" cols="30"></textarea>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){	
		let localstream;
		let cam_loop;
		const video = document.querySelector('video');
		
		navigator.mediaDevices.getUserMedia({video: {width: 320, height: 230}})
	    .then((stream) => {
	    	video.srcObject = stream;
	    	localstream=stream;
	    	video.onloadedmetadata=function(e){
				video.play();
				let ws_cam=new WebSocket("ws://localhost:8080/WebSocketCam/${roomNum}");
				ws_cam.binaryType="arraybuffer";//중요!!!
				ws_cam.onopen=function(){
					console.log("cam con ok");
					cam_loop=setInterval(function(){
						ws_cam.send(getByteArray().buffer);//byteArray
					},1000/5);
				}
				ws_cam.onmessage=function(binary){
					//console.log(binary);
					//파란 도화지 위에 받은 바이너리 데이터를 그림
					let blueCanvas=document.getElementById('blueCanvas');
					let blueCtx=blueCanvas.getContext('2d');
					let imgData=blueCtx.createImageData(blueCanvas.width,blueCanvas.height);
					let pixels=imgData.data;
					let arrayBuffer=new Uint8Array(binary.data);
					for(let i=0;i<pixels.length;i++){
						pixels[i]=arrayBuffer[i];
					}
					blueCtx.putImageData(imgData,0,0);
				}
			}
	    });	
		const getByteArray=function(){
			const canvas=document.createElement("canvas");
			canvas.width=video.videoWidth;
			canvas.height=video.videoHeight;
			let ctx=canvas.getContext('2d');
			ctx.drawImage(video,0,0);
			let imgData=ctx.getImageData(0,0,canvas.width,canvas.height).data;
			let byteArray=new Uint8Array(imgData);
			return byteArray;			
		};
		
		$("#stopBtn").click(function(){
			localstream.getTracks()[0].stop();
			video.pause();
			video.src="";
			clearInterval(cam_loop);
		});
		

		let ws=new WebSocket("ws://localhost:8080/WebSocketChat/${roomNum}");
		ws.onopen=function(){
			console.log("con ok");
		}
		ws.onmessage=function(msg){
			console.log(msg.data);
			let oldMsg=$("textarea").val();
			let message=oldMsg+"\n"+msg.data;
			$("textarea").val(message);
		}
		
		$("#msgBtn").click(function(){
			let val=$("#chatMsg").val();
			ws.send("["+$("#chatId").val()+"]"+val);
		});
	});
</script>
</html>