package mna.homespital.component;

import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;

@Component
@ServerEndpoint(value = "/WebSocketChat/")
public class ChatComponent {

    ArrayList<Session> list;

    @OnOpen
    public void open(Session session) {
        list = SessionList.getInstance().list;
        if (list.size() >= 2) {
            close(session);
        } else {
            synchronized (list) {
                System.out.println(list.size());
                list.add(session);
            }
            System.out.println(session.getId() + " 접속 ok :" + list.size());
        }
    }

    @OnMessage
    public void receiveMsg(String msg, Session mySession) {
        if (list.contains(mySession)) {
            System.out.println("받은 메세지:" + msg + " : " + list.size() + "명에게 전송합니다");
            //broadcast
            for (Session session : list) {
                try {
                    session.getBasicRemote().sendText(msg);
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    @OnClose
    public void close(Session session) {
        System.out.println(session.getId() + " 접속 end");
        synchronized (list) {
            list.remove(session);
        }

    }

}





