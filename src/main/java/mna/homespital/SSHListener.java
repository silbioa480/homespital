package mna.homespital;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class SSHListener implements ServletContextListener {

    private SSHConnection sshConnection;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("init start!");
        try {
            sshConnection = new SSHConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("init destory!");
        sshConnection.closeSSH();
    }

    public class SSHConnection {
        private final static String HOST = "49.50.172.143";
        private final static int PORT = 22; //기본포트는 22
        private final static String SSH_USER = "root"; //ex) root
        private final static String SSH_PW = "G4N@Fn7$En"; //ex) 1234

        private Session session;

        public void closeSSH() {
            session.disconnect();
        }

        public SSHConnection() {
            try {
                JSch jsch = new JSch();
                session = jsch.getSession(SSH_USER, HOST, PORT);
                session.setPassword(SSH_PW);
                session.setConfig("StrictHostKeyChecking", "no");
                session.connect();
                session.setPortForwardingL(3316, "127.0.0.1", 3306); //127.0.0.1/3316으로 접근한 포트를 연결HOST/3306으로 포트포워딩
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}