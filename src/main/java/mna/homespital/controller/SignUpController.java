package mna.homespital.controller;

import mna.homespital.dto.User;
import mna.homespital.service.MemberService;
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

    @ResponseBody
    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    //용식: 회원가입 문자전송API
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수 생성
        PhoneCheckService phoneCheckService = new PhoneCheckService();
        phoneCheckService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        return Integer.toString(randomNumber);
    }

    //용식:회원가입 이메일중복체크
    @ResponseBody
    @PostMapping("/emailoverlap")
    public boolean emailOverLap(@RequestParam String email) {
        boolean result = false;
        try {
            result = memberService.emailCheck(email);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
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
            mv.setViewName("redirect:/loginForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("user/main/index");
        }
        return mv;
    }

    //가영: 회원탈퇴
    @RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
    public String deleteView() throws Exception {
        return "/user/main";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(String user_email, RedirectAttributes rttr, HttpSession session) throws Exception {
        memberService.deleteMember(user_email);
        session.invalidate();
        rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
        return "redirect:/user/loginForm";
    }

//    @RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
//    @ResponseBody
//    public int pwCheck(User user) throws Exception{
//        String memberPw = memberService.pwCheck(User.getUser_email());
//
//        if(user == null || !memberService.pwCheck(User.getUser_password(), user_password)) {
//            return 0;
//        }
//
//        return 1;
//    }
//}


    //비밀번호 수정
//    @GetMapping("/modifyForm")
//    public ModelAndView pwModify(){
//        return new ModelAndView("user/main/modifyForm");
//    }
//
//    public String pwModify(@RequestBody MemberDAO user_number, HttpSession session) throws Exception {
//        logger.info("비밀번호 변경 요청");
//
//        //비밀번호 변경
//        MemberService.pwModify(user_number);
//
//        //비밀번호 변경 성공하면 로그인 세션 객체 다시 담기
//        MemberDAO pwModify = new
//
//
//    }

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
