package mna.homespital.controller;

import mna.homespital.dto.*;
import mna.homespital.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;

@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    MedicalListService mls;
    @Autowired
    HttpSession session;
    @Autowired
    PharService pharService;
    @Autowired
    UserService userService;

    @Autowired
    PaymentService paymentService;

    @Autowired
    private MedicalListService medicalListService;
    @Autowired
    private DoctorService doctorService;

    //환자의 진료내역 (준근)
    @GetMapping("/myMedicalList")
    public String myMedicalList(HttpSession session, Model m) throws Exception {
        try {
            String email = (String) session.getAttribute("email");
            int searchNumber = mls.searchId(email);
            Diagnosis diagnosis = new Diagnosis();
            diagnosis.setUser_number(searchNumber);
            m.addAttribute("diagnosis", diagnosis);
        } catch (Exception e) {
            System.out.println("Catch() join");
            e.printStackTrace();
            return "common/err";
        }
        return "user/main/myMedicalList";
    }

    //진료내역 리스트 출력 (준근)
    @ResponseBody
    @GetMapping("/medicalRecordsList")
    public ArrayList<HashMap<String, Object>> medicalRecordsList(@RequestParam int user_number) {
        ArrayList<HashMap<String, Object>> myMedicalList = new ArrayList<>();
        try {
            myMedicalList = mls.medicalRecordsList(user_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMedicalList;
    }

    //진료 예약 취소하기 (준근)
    @ResponseBody
    @PostMapping("/cancelMedicalRecord")
    public String cancelReservation(int diagnosis_number) {
        try {
            mls.cancelMedicalRecord(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    //약제 배송 완료하기(준근)
    @ResponseBody
    @PostMapping("/successMedicalRecord")
    public String successMedicalRecord(int diagnosis_number) {
        try {
            mls.successMedicalRecord(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }


    //나의진료내역 보기 (소연, 준근)
    @GetMapping("/myMedicalDetail/{diagnosis_number}")
    public ModelAndView myMedicalDetail(@PathVariable int diagnosis_number) {
        System.out.println("myMedicalDetail() join");
        ModelAndView mav = new ModelAndView();
        try {
            //diagnosis_number(진료번호)에 해당되는 diagnosis(진료내역)을 가져와서 Diagnosis타입의 참조변수 diagnosis에 객체 저장
            Diagnosis diagnosis = mls.getDiagnosisNo(diagnosis_number);
            //diagnosis객체에 있는 의사번호로 의사정보 가져와서 Doctor타입의 참조변수 doctor에 객체 저장
            Doctor doctor = doctorService.getDocInfo(diagnosis.getDoctor_number());
            //diagnosis객체에 있는 환자번호로 환자정보 가져와서 User타입의 참조변수 user에 객체 저장
            User user = userService.getUserInfo(diagnosis.getUser_number());
            //diagnosis객체에 있는 약사번호로 약사정보 가져와서 Pharmacy타입의 참조변수 pharmacy에 객체 저장 - 04/06
            Pharmacy pharmacy = pharService.getPharInfo(diagnosis.getPharmacy_number());


            String emailCheck = (String) session.getAttribute("email");
            // emailCheck(세션에 이메일이 있는지(로그인 한 상태인지) 확인해서 NUll이 아니면,
            if (emailCheck != null) {
                //세션에 있는 이메일과 유저객체에 있는 이메일이 일치 하지 않는다면, 404 페이지
                if (!emailCheck.equals(user.getUser_email())) {
                    System.out.println("이프문 안에 들어왔네?ㅋㅋ");
                    mav.setViewName("/common/err");
                    return mav;
                }
            } else { //세션에 이메일이 없으면, 404페이지
                mav.setViewName("/common/err");
                return mav;
            }

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
            mav.addObject("year", year);
            mav.addObject("month", month);
            mav.addObject("date", date);
            mav.addObject("age", age);
            mav.addObject("gender", gender);

            //환자,의사의 중요한 정보를 빈문자열로 준다.
            user.setUser_registration_number("");
            user.setUser_password("");
            doctor.setDoctor_password("");

            //소연 : 진료 시간 출력
            String work_time = doctor.getWorking_time();
            String[] work_timeArr = work_time.split(",");

            int start_time = Integer.parseInt(work_timeArr[0]);
            int end_time = Integer.parseInt(work_timeArr[work_timeArr.length - 1]) + 1;

            if (end_time >= 13) {
                if (start_time >= 13) {
                    start_time -= 12;
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                } else if (start_time == 12) {
                    end_time -= 12;
                    work_time = "오후 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                } else if (start_time < 12) {
                    end_time -= 12;
                    work_time = "오전 " + start_time + "시 ~ 오후 " + end_time + "시";
                    doctor.setWorking_time(work_time);
                }

            } else if (end_time <= 12) {
                work_time = "오전 " + start_time + "시 ~ 오전 " + end_time + "시";
                doctor.setWorking_time(work_time);
            }

            //준근 : 점심 시간 출력
            int lunch_time = Integer.parseInt(doctor.getLunch_time());
            //13시 이후 일 때  =>  오후 1시 ~ 오후 2시, 오후 2시 ~ 오후 3시 ... 로 출력
            if (lunch_time >= 13) {
                lunch_time -= 12;
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time == 12) { // 12시 일 때, 오후 12시 ~ 오후 1시
                doctor.setLunch_time("오후 " + lunch_time + "시 ~ 오후 " + (lunch_time - 11) + "시");
            } else if (lunch_time == 11) { //11시 일 때, 오전 11시 ~ 오후 12시
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오후 " + (lunch_time + 1) + "시");
            } else if (lunch_time < 11) { // 10시 이전 일 때, 오전 10시 ~ 오전 11시, 오전 9시 ~ 오전 10시 ...로 출력
                doctor.setLunch_time("오전 " + lunch_time + "시 ~ 오전 " + (lunch_time + 1) + "시");
            }

            //소연 : 비대면 진료시간
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
            String strNowDate = simpleDateFormat.format(diagnosis.getCreate_date());

            String confirmTime = strNowDate + " " + diagnosis.getDiagnosis_time();

            mav.addObject("confirmTime", confirmTime);
            System.out.println("confirmTime = " + confirmTime);

            // 훈: 진단서 카드정보 불러오기
            String billingkey = diagnosis.getBilling_key();
            if (billingkey.substring(0, 2).equals("!!")) {
                if (billingkey.substring(0, 4).equals("!!!!"))
                    billingkey = billingkey.substring(4, billingkey.length());
                else billingkey = billingkey.substring(2, billingkey.length());
            }
            Card_Information cardInfoObj = paymentService.getPayment(diagnosis.getUser_number(), billingkey);

            HashMap<String, String> cardInfo = new HashMap<>();
            String card = cardInfoObj.getCard_number();
            cardInfo.put("card_number", card.substring(card.length() - 4));
            cardInfo.put("card_nickname", cardInfoObj.getCard_nickname());

            //저장된 각 객체들 model에 전부 저장(diagnosis -진료내역, doctor - 의사정보, user - 환자정보)
            mav.addObject("diagnosis", diagnosis);
            mav.addObject("doctor", doctor);
            mav.addObject("user", user);
            mav.addObject("pharmacy", pharmacy);
            mav.addObject("cardInfo", cardInfo);
            mav.setViewName("/user/main/myMedicalDetail");


        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", e.getMessage());
            mav.setViewName("/common/err");
        }
        return mav;
    }

}
