package mna.homespital.controller;

import mna.homespital.dto.User;
import mna.homespital.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.phoneCheckService;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class SignUpController {
    @Autowired
    HttpSession session;

    @Autowired
    MemberService memberService;


    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    @ResponseBody
    //용식: 회원가입 문자전송API
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수 생성
        phoneCheckService phoneCheckService = new phoneCheckService();
        phoneCheckService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }

    //용식:주수검색API 팝업창
    @RequestMapping(value = "/jusoPopup", method = {RequestMethod.GET, RequestMethod.POST})
    public String jusoPopup() {
        return "jusoPopup";
    }

    //용식:유저로그인
    @PostMapping("/login.do")
    public String login(@RequestParam("email") String user_email, @RequestParam("password") String user_password, Model model) {
        try {
            memberService.login(user_email, user_password);
            session.setAttribute("email", user_email);
            return "user/main/index";
        } catch (Exception e) {
            model.addAttribute("err", e.getMessage());
            return "redirect:user/main/loginForm";
        }

    }

    //용식:유저회원가입
    @PostMapping("/join.do")
    public ModelAndView join(@RequestParam Map<String, String> params) {
        ModelAndView mv = new ModelAndView();
        String email = params.get("email");
        String password = params.get("password");
        String name = params.get("name");
        String SocialSecurityNumber = params.get("SocialSecurityNumber1") + "-" + params.get("SocialSecurityNumber2");
        String phone = params.get("phone");
        String address = "[" + params.get("zipNo") + "] " + params.get("roadFullAddr") + params.get("addrDetail");
        User user = new User(email, password, name, SocialSecurityNumber, phone, address);

//        String billing_key = params.get("billing_key");
//
//        if (!billing_key.isEmpty()) {
//            user.setBilling_key(billing_key);
//        }

        try {
            memberService.join(user);
            mv.setViewName("user/main/loginForm");
        } catch (Exception e) {
            mv.setViewName("user/main/index");
        }
        return mv;
    }


}
