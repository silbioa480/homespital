package mna.homespital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {
    @GetMapping("/writeChart")
    public ModelAndView writeChart() {
        ModelAndView mv = new ModelAndView("/user/writeMediChartForm");
        return mv;
    }
}

