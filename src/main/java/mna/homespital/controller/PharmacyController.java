package mna.homespital.controller;

import mna.homespital.dto.Pharmacy;
import mna.homespital.service.DiagnosisService;
import mna.homespital.service.PharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.PhoneCheckService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/pharmacy")
public class PharmacyController {

    @Autowired
    HttpSession session;

    @Autowired
    PharService pharService;

    @Autowired
    DiagnosisService diagnosisService;

    //약국메인
    @GetMapping({"", "/"})
    public ModelAndView pharmacyMain() {
        return new ModelAndView("admin/phar/pharmacyIndex");
    }

    //약국 로그인Form
    @GetMapping("/loginForm")
    public ModelAndView pharmacyLogin() {
        return new ModelAndView("admin/phar/pharmacyLoginForm");
    }

    //약국회원가입
    @GetMapping("/joinForm")
    public ModelAndView phamacyJoinForm() {
        return new ModelAndView("admin/pharside/joinForm");
    }

    //용식:약사 로그인
    @PostMapping("login.do")
    public String pharmacyLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletResponse response) {
        try {

            pharService.pharmacyLogin(email, password);
            Pharmacy pharmacy = pharService.getPharInfo(email);
            pharmacy.setPharmacy_password("");
            session.setAttribute("pharmacy", pharmacy);
            return "redirect:/pharmacy/pharMedicalList";
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 실패 : 아이디와 비밀번호를 다시 한 번 확인해주세요.');history.go(-1);</script>");
                out.flush();
            } catch (Exception ee) {
            }
            return "redirect:/pharmacy/loginForm";
        }
    }

    //용식:약사 회원가입
    @PostMapping("join.do")
    public ModelAndView pharmacyJoin(HttpServletRequest request) {
        Pharmacy pharmacy = new Pharmacy();
        pharmacy.setPharmacy_email(request.getParameter("pharmacy_email"));
        pharmacy.setPharmacy_password(request.getParameter("pharmacy_password"));
        pharmacy.setPharmacy_mobile(request.getParameter("pharmacy_mobile"));
        pharmacy.setPharmacy_business(request.getParameter("pharmacy_business"));
        pharmacy.setPharmacy_name(request.getParameter("pharmacy_name"));
        ;
        pharmacy.setPharmacy_phone(request.getParameter("pharmacy_phone"));
        pharmacy.setZip_code(request.getParameter("zipNo"));
        pharmacy.setStreet_address(request.getParameter("roadFullAddr"));
        pharmacy.setDetail_address(request.getParameter("addrDetail"));
        ModelAndView mv = new ModelAndView();
        try {
            pharService.join(pharmacy);
            mv.setViewName("redirect:/pharmacy/loginForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/pharmacy/joinForm");
        }
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
    //용식: 회원가입 문자전송API
    public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
        int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);//난수 생성
        PhoneCheckService phoneCheckService = new PhoneCheckService();
        phoneCheckService.certifiedPhoneNumber(userPhoneNumber, randomNumber);
        System.out.println(randomNumber);
        return Integer.toString(randomNumber);
    }

    //용식:약사 회원가입 이메일중복체크
    @ResponseBody
    @PostMapping("/emailoverlap")
    public boolean emailOverLap(@RequestParam String email) {
        boolean result = false;
        try {
            result = pharService.emailCheck(email);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    //약사의 환자처방내역 (인성, 준근)
    @GetMapping("/pharMedicalList")
    public String pharMedicalList(HttpSession session, Model m) {
        try {
            Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
            int pharmacy_number = pharmacy.getPharmacy_number();
            m.addAttribute("pharmacy_number", pharmacy_number);
        } catch (Exception e) {
            e.printStackTrace();
            return "common/err";
        }
        return "admin/phar/pharmacyMedicalList";
    }

    //약사에게 들어온 처방 리스트 출력 (인성, 준근)
    @ResponseBody
    @GetMapping("/pharMedicalRecords")
    public ArrayList<HashMap<String, Object>> pharMedicalRecords(@RequestParam int pharmacy_number) {
        ArrayList<HashMap<String, Object>> pharMedicalList = new ArrayList<>();
        try {
            Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
            if (pharmacy == null) throw new Exception("로그인 되어있지않음.");
            pharMedicalList = pharService.pharMedicalRecords(pharmacy_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pharMedicalList;
    }

    // 인성 : 환자에 대한 진료내역과 의사의 데이터
    @GetMapping("/customerDetail/{diagnosis_number}")
    public ModelAndView customerDetail(@PathVariable int diagnosis_number) {
        ModelAndView mv = new ModelAndView("/admin/phar/customerDetail");
        try {
            if (session.getAttribute("pharmacy") == null) throw new Exception("로그인 되어있지 않음");
            Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
            HashMap<String, Object> diagnosis = diagnosisService.getDiagnosisDetail(diagnosis_number);
            if (diagnosis == null || !((Integer) diagnosis.get("pharmacy_number")).equals(pharmacy.getPharmacy_number()))
                throw new Exception("올바르지 않은 진단기록");
            LocalDateTime create_date = (LocalDateTime) diagnosis.get("create_date");
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String create_date_str = create_date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            diagnosis.replace("create_date", create_date_str);

            // 진료 시간 코드
            String work_time = (String) diagnosis.get("working_time");
            String[] work_timeArr = work_time.split(",");

            for (int i = 0; i < work_timeArr.length; i++) {
                System.out.println("work_timeArr = " + work_timeArr[i]); //9~17까지 콘솔에 뜸 [0], [work_timeArr.length-1]
            }

            int start_time = Integer.parseInt(work_timeArr[0]);
            int end_time = Integer.parseInt(work_timeArr[work_timeArr.length - 1]) + 1;

            if (end_time >= 13) {
                if (start_time >= 13) {
                    start_time -= 12;
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                } else if (start_time == 12) {
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                } else if (start_time < 12) {
                    end_time -= 12;
                    work_time = "오전 " + start_time + "시 ~ 오후 " + end_time + "시";
                }
            } else if (end_time <= 12) {
                work_time = "오전 " + start_time + "시 ~ 오전 " + end_time + "시";

            }
            diagnosis.replace("working_time", work_time);
            System.out.println("work_time else if() = " + work_time);

            String lunch_time_str = "";
            int lunch_time = Integer.parseInt((String) diagnosis.get("lunch_time"));
            //13시 이후 일 때  =>  오후 1시 ~ 오후 2시, 오후 2시 ~ 오후 3시 ... 로 출력
            if (lunch_time >= 13) {
                lunch_time -= 12;
                lunch_time_str = ("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time == 12) { // 12시 일 때, 오후 12시 ~ 오후 1시
                lunch_time_str = ("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time - 11) + "시");
            } else if (lunch_time == 11) { //11시 일 때, 오전 11시 ~ 오후 12시
                lunch_time_str = ("오전 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time < 11) { // 10시 이전 일 때, 오전 10시 ~ 오전 11시, 오전 9시 ~ 오전 10시 ...로 출력
                lunch_time_str = ("오전 " + lunch_time + "시 ~ 오전 " + (lunch_time + 1) + "시");
            }
            diagnosis.replace("lunch_time", lunch_time_str);

            mv.addObject("diagnosis", diagnosis);
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("/common/err");
        }
        return mv;
    }

    // 처방전 접수하기 및 조제 시작하기(diagnosis_status 3- > 4)(준근)
    @ResponseBody
    @PostMapping("/makeMedicine")
    public String makeMedicine(int diagnosis_number) {
        try {
            pharService.makeMedicine(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    // 조제완료하기(diagnosis_status 4- > 5)(준근)
    @ResponseBody
    @PostMapping("/successMadeMedicine")
    public String successMadeMedicine(int diagnosis_number) {
        try {
            pharService.successMadeMedicine(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
}