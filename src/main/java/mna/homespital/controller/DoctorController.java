package mna.homespital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DoctorController {

    public String DoctorMain() {
        return "main/index";
    }
}
