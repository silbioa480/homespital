package mna.homespital.component;

import java.util.ArrayList;

import javax.websocket.Session;

public class SessionList {
	
	public ArrayList<Session> list=new ArrayList<Session>();
	
	static private SessionList instance;
	
	private SessionList() {}
	
	public static SessionList getInstance() {
		if(instance==null) {
			instance=new SessionList();
		}
		return instance;
	}
}
