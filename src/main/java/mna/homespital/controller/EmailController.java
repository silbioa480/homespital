package mna.homespital.controller;

import lombok.RequiredArgsConstructor;
import mna.homespital.dto.Mail;
import mna.homespital.service.MailService;
import org.apache.jasper.tagplugins.jstl.core.Url;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MailCotroller {
    private final MailService mailService;

    @PostMapping(Url.AUTH.SEND_EMAIL)
    piblic Map<String, Object> sendEmail(@RequestBody java.util.Map<String, Object> params){
        log.info("email params={}", params);

        return emailUtil.sendEmail((String))
    }

}
