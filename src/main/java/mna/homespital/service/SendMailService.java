package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendMailService {
    @Autowired
    private JavaMailSender sender;

    public void sendMail(String toEamil, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("dlsdydtlr@gmail.com");
        message.setTo(toEamil);
        message.setSubject(subject);
        message.setText(body);

        sender.send(message);

        System.out.println("메일 보내기성공!!");
    }

//    public void sendMail(String toAddress, String subject, String body) {
//
//        MimeMessage message = sender.createMimeMessage();
//        MimeMessageHelper helper = new MimeMessageHelper(message);
//        try {
//            helper.setTo(toAddress);
//            helper.setSubject(subject);
//            helper.setText(body);
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//        sender.send(message);
//    }
}
