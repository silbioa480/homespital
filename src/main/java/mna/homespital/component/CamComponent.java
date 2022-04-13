package mna.homespital.component;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

@Component
@ServerEndpoint("/WebSocketCam/{id}")
public class CamComponent {
	
	ArrayList<Session> list;
	
	@OnOpen
	public void open(Session session) {
		list=SessionList.getInstance().list;
		System.out.println(list.size());
		System.out.println("화상 접속 ok");
	}
	
	@OnMessage
	public void receiveBinary(ByteBuffer bb, boolean last,Session session) {
		try {
			for (Session peer:list) {
				if(!session.getId().equals(peer.getId())) {
					session.getBasicRemote().sendBinary(bb,last);
				}
			}
		} catch (IOException e) {
			try {
				session.close();
			} catch (IOException e1) {
				
			}
		}
	}
}