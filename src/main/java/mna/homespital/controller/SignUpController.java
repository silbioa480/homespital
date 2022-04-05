package mna.homespital.controller;

import mna.homespital.dto.User;
import mna.homespital.service.MemberService;
import mna.homespital.service.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.PhoneCheckService;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class SignUpController {
    @Autowired
    HttpSession session;

    @Autowired
    MemberService memberService;

    @Autowired
    SendMailService sendMailService;

    @ResponseBody
    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    //용식: 회원가입 문자전송API
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수 생성
        PhoneCheckService phoneCheckService = new PhoneCheckService();
        phoneCheckService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }

    //용식:비밀번호찾기 이메일보내기
    @ResponseBody
    @GetMapping("/sendMail")
    public String sendMail(@RequestParam("email") String email) {
        String result;
        try {
            User user = memberService.queryMember(email);
            if (user != null) {
                result = memberService.sendMailForFindPw(email);
            } else {
                result = "noUserErr";
            }
        } catch (Exception e) {
            result = "error";
            e.printStackTrace();
        }
        return result;
    }

    //용식:주소검색API 팝업창
    @RequestMapping(value = "/jusoPopup", method = {RequestMethod.GET, RequestMethod.POST})
    public String jusoPopup() {
        return "/jusoPopup";
    }

    //가영:유저로그인
    @PostMapping("/login.do")
    public String login(@RequestParam("email") String user_email, @RequestParam("password") String user_password, Model model) {
        try {
            memberService.login(user_email, user_password);
            session.setAttribute("email", user_email);

            return "redirect:/";
        } catch (Exception e) {
            model.addAttribute("err", e.getMessage());
            return "redirect:/loginForm";
        }
    }

    //용식: 로그아웃
    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
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

    //가영: 회원탈퇴
    @ResponseBody
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public String submitDeleteMember(@RequestParam(value="password") String password, RedirectAttributes rttr, HttpSession session) {
        System.out.println("입력한 비밀번호 값 : " + password);
        try {
            String email = (String) session.getAttribute("email");
            User user = memberService.queryMember(email);
            if (user==null) {
                return "사용자없음";
            }
            System.out.println(user.toString());
            String originPass = user.getUser_password();
            String inputPass = password;

            if (!(inputPass.equals(originPass))) {
                rttr.addFlashAttribute("msg", false);

                return "삭제실패";
            } else {
                memberService.deleteMember(email);
                session.invalidate();
                return "삭제성공";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "에러";
        }
    }

    //가영: 회원정보수정
    @PostMapping("modifyMember.do")
    public String modifyMember(@RequestParam("email") String password, @RequestParam String email, @RequestParam String name, @RequestParam String registration_number, @RequestParam String phone, @RequestParam String address) {
        try {
            memberService.modifyMember(email, password, name, registration_number, phone, address);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/main/index";
    }


    //비밀번호찾기: 비밀번호수정form
    @GetMapping("/modifyPasswordForm")
    public ModelAndView modifyPasswordForm(@RequestParam String email) {
        System.out.println(email);
        ModelAndView mav = new ModelAndView("user/main/modifyPasswordForm");
        mav.addObject("email", email);
        return mav;
    }

    //용식: 비밀번호찾기:새비밀번호로변경
    @PostMapping("modifyPassword.do")
    public String modifyPassword(@RequestParam("password3") String password, @RequestParam String email) {
        try {
            memberService.modifyPassword(email, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/main/index";
    }

}