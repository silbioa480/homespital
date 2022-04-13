package mna.homespital.component;

import java.io.IOException;
import java.nio.ByteBuffer;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;


@Component
@ServerEndpoint("/WebSocketCam/{roomNum}")
public class CamComponent {
	
	@OnOpen
	public void open() {
		System.out.println("화상 접속 ok");
	}
	
	@OnMessage
	public void receiveBinary(ByteBuffer bb, boolean last,Session session) {
		try {			
			session.getBasicRemote().sendBinary(bb,last);
		} catch (IOException e) {
			try {
				session.close();
			} catch (IOException e1) {
				
			}
		}
	}
}