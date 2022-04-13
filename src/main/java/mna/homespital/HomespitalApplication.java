package mna.homespital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@ServletComponentScan
@SpringBootApplication
public class HomespitalApplication {

    public static void main(String[] args) {
        SpringApplication.run(HomespitalApplication.class, args);
    }

    // 소연 : ㅎㅅ ServerEndpointExporter 추가
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
