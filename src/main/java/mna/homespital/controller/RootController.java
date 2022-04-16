package mna.homespital.controller;

import mna.homespital.dto.Card_Information;
import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.service.*;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.apache.maven.model.Model;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

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
    PharService pharService;

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
                if (cardInfoObj != null) {
                    String cardInfo = cardInfoObj.getCard_nickname() + " (" + cardInfoObj.getCard_number().substring(cardInfoObj.getCard_number().length() - 4, cardInfoObj.getCard_number().length()) + ")";
                    mav.addObject("cardInfo", cardInfo);
                }
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
            if (user == null) throw new Exception("로그인 되어있지 않음");
            mv.addObject("user", user);
            System.out.println("user = " + user);


            //환자의 주민번호를 가공해서 모델로 넘긴다.(view에서 생년월일, 만 나이를 나타내기 위함)
            String JuminNo = user.getUser_registration_number();
            JuminNo = JuminNo.replaceAll("-", ""); //주민번호 - 빼고 숫자만 나오게
            int year = 0;

            // 주민번호 뒷자리가 1이나 2면 1900년대생, 아니면 2000년대생
            if (Integer.parseInt(JuminNo.substring(6, 7)) <= 2) {
                year = Integer.parseInt(JuminNo.substring(0, 2)) + 1900;
            } else {
                year = Integer.parseInt(JuminNo.substring(0, 2)) + 2000;
            }

            int month = Integer.parseInt(JuminNo.substring(2, 4));  //월
            int date = Integer.parseInt(JuminNo.substring(4, 6));   //일
            String gender = JuminNo.substring(6, 7);                //성별

            //주민번호 뒷자리로 성별 지정
            if (gender.equals("1") || gender.equals("3")) {
                gender = "남";
            } else if (gender.equals("2") || gender.equals("4")) {
                gender = "여";
            }
            //만 나이
            GregorianCalendar Gc = new GregorianCalendar();
            int age = Gc.get(Calendar.YEAR) - year;

            //모델에 각 계산결과 넣기
            mv.addObject("year", year);
            mv.addObject("month", month);
            mv.addObject("date", date);
            mv.addObject("age", age);
            mv.addObject("gender", gender);


            String cardInfo = "";
            Card_Information cardInfoObj = paymentService.getPayment(user.getUser_number(), user.getBilling_key());
            if (cardInfoObj != null) {
                cardInfo = cardInfoObj.getCard_nickname();
                cardInfo += " (";
                cardInfo += cardInfoObj.getCard_number().substring(cardInfoObj.getCard_number().length() - 4, cardInfoObj.getCard_number().length());
                cardInfo += ")";
                mv.addObject("cardInfo", cardInfo);
            }
            //의사 스케쥴 객체
            ArrayList<HashMap<String, Object>> ds = doctorService.getDocScheduleInfo(doctor_number);
            mv.addObject("ds", ds);

            // 카운트(준근)
            // 예약한 시간에 사람이 없을 때 0/10 으로 나와야함. 해결
            // 예약한 사람이 10명이 되면 해당 시간 disabled, 툴팁에 예약완료, 해결
            // 예약을 취소하면 해당시간 카운트-1
            // 현재시간(실제시간)이 예약할 시간과 같거나 초과되면 카운트 상관없이 무조건 disabled 처리, 해결
            // 
            ArrayList<HashMap<String, Object>> timeCountArr = memberService.getCount(doctor_number);
            JSONArray tcArr = new JSONArray();
            for (HashMap<String, Object> timeCount : timeCountArr) {
                JSONObject time = new JSONObject(timeCount);
                tcArr.put(time);
            }
            System.out.println("tcArr = " + tcArr);
            mv.addObject("timeCount", tcArr);

        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/loginForm");
        }

        return mv;
    }

    //진료예약   ( 훈, 인성 )
    //예약하기 누를시 문자전송 태영
    @PostMapping("/appointmentForm")
    public ModelAndView appointment(Diagnosis diagnosis, MultipartFile[] diagnosisImgNames,
                                    Model model, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        String api_key = "NCSK1Q8DMWF4EQYK";
        String api_secret = "9KEMFM30PPC8NTBR62L9WECLHIRXQJTO";
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> params = new HashMap<String, String>();
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


            Integer n = pharService.getPharmacyNumberByName(diagnosis.getPharmacy_name(), diagnosis.getPharmacy_address(), diagnosis.getPharmacy_phone());
            if (n == null) throw new Exception("약국 매칭 불가");
            diagnosis.setPharmacy_number(n);
            // DB insert
            diagnosis.setDiagnosis_image_name(fileNameArr.toString());
            diagnosisService.insertDiagnosis(diagnosis);
            mv.setViewName("redirect:/myMedicalList");

            //예약이 성공적으로 되었다는 알림 태영
            Doctor dtc = doctorService.getDocInfo(diagnosis.getDoctor_number());
            User user123 = userService.getUserInfo(diagnosis.getUser_number());
            String dtcName=dtc.getDoctor_name();
            String userName=user123.getUser_name();
            int diaTime=diagnosis.getDiagnosis_time();
            int waitNumber=diagnosis.getDiagnosis_wait_number();
            params.put("to","01051757554");
            params.put("from","01089303955");
            params.put("type","LMS");
            params.put("text","예약이 정상적으로 완료되었습니다.\n"+ "담당의사명 : "+  dtcName+"\n" + "환자명: "+userName + "\n"+ "진료예약시간: "+diaTime + "\n"+ "대기순번: "+waitNumber);
            org.json.simple.JSONObject obj = coolsms.send(params);
            System.out.println(obj.toString());
        }catch (CoolsmsException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
            System.out.println("params = " + params);
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