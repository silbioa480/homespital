package mna.homespital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class HomespitalApplication {

    public static void main(String[] args) {
        SpringApplication.run(HomespitalApplication.class, args);
    }

}
