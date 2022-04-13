package mna.homespital.component;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;


@Component
@ServerEndpoint("/WebSocketCam/{roomNum}")
public class CamComponent {

	ArrayList<Session> list;

	@OnOpen
	public void open(Session session) {
		list=SessionList.getInstance().list;
		if (list.size()>=2) {
			close(session);
		} else {
			synchronized (list) {
				System.out.println(list.size());
				list.add(session);
			}
			System.out.println(session.getId()+"화상 접속 ok :"+list.size());
		}
	}

	@OnMessage
	public void receiveBinary(ByteBuffer bb, boolean last,Session session) {
		try {			
			session.getBasicRemote().sendBinary(bb,last);
		} catch (IOException e) {
			e.printStackTrace();
			try {
				session.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	@OnClose
	public void close(Session session) {
		System.out.println(session.getId()+" 접속 end");
		synchronized (list) {
			list.remove(session);
		}

	}

}