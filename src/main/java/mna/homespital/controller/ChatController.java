package mna.homespital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/chat")
@Controller
public class ChatController {
    @GetMapping({"","/"})
    public String main() {
        return "chat/main";
    }

    @GetMapping("treatment")
    public ModelAndView treatment() {
        ModelAndView mav = new ModelAndView("chat/treatment");
        mav.addObject("roomNum", 1);

        return mav;
    }
}
