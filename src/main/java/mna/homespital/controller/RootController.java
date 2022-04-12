package mna.homespital.controller;

import mna.homespital.dto.Card_Information;
import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.service.*;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

//import static jdk.internal.logger.DefaultLoggerFinder.SharedLoggers.system;

@RestController
@RequestMapping("/")
public class RootController {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;

    @Autowired
    MedicalListService medicalListService;

    @Autowired
    DiagnosisService diagnosisService;

    @Autowired
    DoctorService doctorService;

    @Autowired
    MemberService memberService;

    @Autowired
    UserService userService;

    @Autowired
    PaymentService paymentService;

    public RootController() {
    }

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("user/main/index");
    }

    //환자로그인
    @GetMapping("/loginForm")
    public ModelAndView loginForm() {
        return new ModelAndView("user/main/loginForm");
    }


    //환자회원가입
    @GetMapping("/joinForm")
    public ModelAndView joinForm() {
        return new ModelAndView("user/userside/joinForm");
    }


    //환자회원정보수정
    @GetMapping("/modifyForm")
    public ModelAndView modifyForm() {
        ModelAndView mav = new ModelAndView("user/userside/modifyForm");
        String email = (String) session.getAttribute("email");
        try {
            User user = memberService.queryMember(email);
            String juminNum = user.getUser_registration_number();
            user.setUser_registration_number(juminNum.replaceAll(".{6}$", "******"));

            if (user == null) {
                mav.setViewName("user/main/loginForm");
            } else {
                mav.addObject("user", user);
                System.out.println(user.toString());
                Card_Information cardInfoObj = paymentService.getPayment(user.getUser_number(), user.getBilling_key());
                String cardInfo = cardInfoObj.getCard_nickname() + " (" + cardInfoObj.getCard_number().substring(cardInfoObj.getCard_number().length() - 4, cardInfoObj.getCard_number().length()) + ")";
                mav.addObject("cardInfo", cardInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    //환자비밀번호확인(정보수정 전)
    @GetMapping("/pwCheck")
    public ModelAndView pwCheck() {
        String email = (String) session.getAttribute("email");

        if (email == null) {
            return new ModelAndView("user/main/index");
        }
        return new ModelAndView("user/main/pwCheck");
    }

    //환자회원탈퇴
    @GetMapping("/delete")
    public ModelAndView deleteForm() {
        String email = (String) session.getAttribute("email");

        if (email == null) {
            return new ModelAndView("user/main/index");
        }
        return new ModelAndView("user/userside/deleteForm");
    }

    //환자비밀번호 찾기
    @GetMapping("/findpwForm")
    public ModelAndView findpwForm() {
        return new ModelAndView("user/main/findpwForm");
    }

    //진료차트 쓰기, 예약하기(인성 , 준근)
    @GetMapping("/appointmentForm/{doctor_number}")
    public ModelAndView appointmentForm(@PathVariable int doctor_number) throws Exception {
        ModelAndView mv = new ModelAndView("user/userside/appointmentForm");
        String email = (String) session.getAttribute("email");
        try {
            //모델에 view 넣기
            //의사 객체
            Doctor doctor = doctorService.getDocInfo(doctor_number);
            doctor.setDoctor_password("");
            mv.addObject("doctor", doctor);

            //의사 실제 진료시간(근무시간 - 점심시간)을 계산
            String work_time = doctor.getWorking_time();
            String[] work_timeArr = work_time.split(",");
            String lunch_time = doctor.getLunch_time();

            List<String> real_work_timeList = new ArrayList<>();
            for (String workTime : work_timeArr) {
                if (!workTime.equals(lunch_time)) {
                    real_work_timeList.add(workTime);
                }
            }
            mv.addObject("real_work_timeList", real_work_timeList);

            //유저 객체
            System.out.println("email = " + email);
            User user = memberService.findByEmail(email);
            mv.addObject("user", user);
            System.out.println("user = " + user);

            String cardInfo = "";
            Card_Information cardInfoObj = paymentService.getPayment(user.getUser_number(), user.getBilling_key());
            cardInfo = cardInfoObj.getCard_nickname();
            cardInfo += " (";
            cardInfo += cardInfoObj.getCard_number().substring(cardInfoObj.getCard_number().length() - 4, cardInfoObj.getCard_number().length());
            cardInfo += ")";
            mv.addObject("cardInfo", cardInfo);

            //의사 스케쥴 객체
            ArrayList<HashMap<String, Object>> ds = doctorService.getDocScheduleInfo(doctor_number);
            mv.addObject("ds", ds);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    //진료예약   ( 훈, 인성 )
    @PostMapping("/appointmentForm")
    public ModelAndView appointment(Diagnosis diagnosis, MultipartFile[] diagnosisImgNames,
                                    Model model, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            String fileNameArr = "";
            // 사진 업로드

            for (int i = 0; i < diagnosisImgNames.length; i++) {
                String diagnosisImg = diagnosisImgNames[i].getOriginalFilename();
                String path = servletContext.getRealPath("/resources/img/uploadImg/");
                String filename = UUID.randomUUID().toString() + "." + diagnosisImg.substring(diagnosisImg.lastIndexOf('.') + 1);
                File destFile = new File(path + filename);
                diagnosisImgNames[i].transferTo(destFile);
                // 이 두대땜시 자동업로드댐
//                diagnosisImg = filename;
//                fileNameArr += (diagnosisImg + ", ");
            }
            User user = memberService.findByEmail((String) session.getAttribute("email"));
            System.out.println(user.getUser_name() + " : " + user.getUser_number() + " :: " + user.getUser_registration_number());
            String billkey = diagnosis.getBilling_key();
            if (billkey == null || billkey.equals(""))
                diagnosis.setBilling_key(user.getBilling_key());
            System.out.println(diagnosis.getBilling_key());
            // DB insert
            diagnosis.setDiagnosis_image_name(fileNameArr.toString());
            diagnosisService.insertDiagnosis(diagnosis);
            mv.setViewName("redirect:/myMedicalList");

            //예약이 성공적으로 되었다는 알림 태영
            Doctor dtc =doctorService.getDocInfo(diagnosis.getDoctor_number());
            User user123=userService.getUserInfo(diagnosis.getUser_number());
            String dtcPhone = dtc.getDoctor_phone();
            String usePhone=user123.getUser_phone();
            System.out.println("예약되었습니다.");
            System.out.println("발신전화번호 : "+dtcPhone);
            System.out.println("수신전화번호 : "+usePhone);
            System.out.println("담당의사명 : "+dtc.getDoctor_name());
            System.out.println("진료날짜 : "+dtc.getWorking_time());
        } catch (Exception e) {
            e.printStackTrace();
            //mv.setViewName();
        }
        return mv;
    }

    // 관리자 메인 페이지 임시로 만들어놈 ( 인성 )
    @GetMapping("/adminIndex")
    public ModelAndView adminIndex() {
        return new ModelAndView("admin/main/adminIndex");
    }

    //가영: 의사 비밀번호 확인
//    @GetMapping("/docPwCheck")
//    public ModelAndView docPwCheck() {
//        String email = (String) session.getAttribute("email");
//
//        if (email == null) {
//            return new ModelAndView("user/main/index");
//        }
//        return new ModelAndView("admin/doctorside/docPwCheck");
//    }

    //소연 : 서비스 이용약관
    @GetMapping("/termsOfService")
    public ModelAndView termsOfService() {
        return new ModelAndView("common/terms/termsOfService");
    }



    //소연 : 개인정보 처리방침
    @GetMapping("/privacyPolicy")
    public ModelAndView privacyPolicy() {
        return new ModelAndView("common/terms/privacyPolicy");
    }

}