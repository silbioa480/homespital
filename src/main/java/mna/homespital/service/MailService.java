package mna.homespital.service;

import lombok.AllArgsConstructor;
import mna.homespital.dto.Mail;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public interface MailService {

    private JavaMailSender javaMailSender;
    private static final String FROM_ADDRESS = "homespital77@gmail.com";

    public void mailSend(Mail mail){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mail.getAddress());
        message.setSubject(mail.getTitle());
        message.setText(mail.getMessage());
        javaMailSender.send(message);
    }
}
