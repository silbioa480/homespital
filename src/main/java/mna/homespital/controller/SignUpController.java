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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
    public String login(@RequestParam("email") String user_email, @RequestParam("password") String user_password, Model model, HttpServletResponse response) {

        try {
//            User user = memberService.findByEmail(user_email);
//            session.setAttribute("user",user);
            memberService.login(user_email, user_password);
            session.setAttribute("email", user_email);
            session.setAttribute("name", memberService.findByEmail(user_email).getUser_name());
//            session.setAttribute("phone", memberService.findByEmail(user_email).getUser_phone());
            return "redirect:/";
        } catch (Exception e) {
            model.addAttribute("err", e.getMessage());
            try {
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 실패 : 아이디와 비밀번호를 다시 한 번 확인해주세요.');history.go(-1);</script>");
                out.flush();
            } catch (Exception ee) {
            }
            return "redirect:/login";
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

        //준근 : 도로명 주소 api에 맞게 수정
        String zip_code = params.get("zipNo");
        String street_address = params.get("roadFullAddr");
        String detail_address = params.get("addrDetail");

//        String address = "[" + params.get("zipNo") + "] " + params.get("roadFullAddr") + params.get("addrDetail");
//        User user = new User(email, password, name, SocialSecurityNumber, phone, address);

        User user = new User(email, password, name, SocialSecurityNumber, phone, zip_code, street_address, detail_address);

//        //소연 : 빌링키 일단 주석
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
    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String submitDeleteMember(@RequestParam(value = "password") String password, RedirectAttributes rttr, HttpSession session) {
        System.out.println("입력한 비밀번호 값 : " + password);
        try {
            String email = (String) session.getAttribute("email");
            User user = memberService.queryMember(email);
            if (user == null) {
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

    //가영: 비밀번호확인
    @ResponseBody
    @RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
    public String submitPasswordMember(@RequestParam(value = "password") String password, RedirectAttributes rttr, HttpSession session) {
        System.out.println("입력한 비밀번호 값 : " + password);
        try {
            String email = (String) session.getAttribute("email");
            User user = memberService.queryMember(email);
            if (user == null) {
                return "사용자없음";
            }
            String originPass = user.getUser_password();
            String inputPass = password;

            if (!(inputPass.equals(originPass))) {
                rttr.addFlashAttribute("msg", true);

                return "비밀번호틀림";
            } else {
                return "비밀번호일치";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "에러";
        }
    }

    //가영: 회원정보수정
    @PostMapping("modifyMember.do")
    public String modifyMember(@RequestParam Map<String, String> params) {
        String email = params.get("email");
        String password = params.get("password");
        String name = params.get("name");
        String phone = params.get("phone");
        //준근 : 도로명 주소 api에 맞게 수정
        String zip_code = params.get("zipNo");
        String street_address = params.get("roadFullAddr");
        String detail_address = params.get("addrDetail");

//        String address = "[" + params.get("zipNo") + "] " + params.get("roadFullAddr") + params.get("addrDetail");
        try {
            memberService.modifyMember(email, password, name, phone, zip_code, street_address, detail_address);

        } catch (Exception e) {
            System.out.println("회원정보수정에서 에러가발생했습니다.");
            e.printStackTrace();
        }
        return "redirect:/";
    }


//    private String zip_code;
//    private String street_address;
//    private String detail_address;


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
        return "redirect:/";
    }

}