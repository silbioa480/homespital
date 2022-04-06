package mna.homespital.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TimeController {

    @ResponseBody
    @GetMapping("appointmentTime")
    public String appointmentTime() {
        System.out.println("appointmentTime() Join");


        return "success";
    }
}

