package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.User;
import mna.homespital.service.DoctorService;
import mna.homespital.service.MedicalListService;
import mna.homespital.service.MemberService;
import mna.homespital.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    MedicalListService mls;
    @Autowired
    HttpSession session;
    @Autowired
    MemberService memberService;
    @Autowired
    DoctorService doctorService;
    @Autowired
    UserService userService;


    //나의진료내역 (준근)
    @GetMapping("/myMedicalList")
    public String myMedicalList(HttpSession session, Model m) throws Exception {
        System.out.println("myMedicalList() join");
        System.out.println("현재 로그인 중인 이메일 : " + session.getAttribute("email"));
        try {
            String email = (String) session.getAttribute("email");
            int searchNumber = mls.searchId(email);
            System.out.println("이메일로 가져온 user_number 값//searchNumber = " + searchNumber);
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
    public ArrayList<HashMap<String, Object>> medicalRecordsList(@RequestParam int user_number) throws Exception {
        ArrayList<HashMap<String, Object>> myMedicalList = new ArrayList<>();
        try {
            myMedicalList = mls.medicalRecordsList(user_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMedicalList;
    }

    //나의 진료내역 -> 대기/예약 취소하기 (준근)
    @ResponseBody
    @PostMapping("/deleteMedicalRecord")
    public String deleteReservation(int diagnosis_number) throws Exception {
        System.out.println("delete : " + diagnosis_number);
        mls.deleteMedicalRecord(diagnosis_number);
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


            String emailCheck = (String) session.getAttribute("email");
            // emailCheck(세션에 이메일이 있는지(로그인 한 상태인지) 확인해서 NUll이 아니면,
            if (emailCheck != null) {
                //세션에 있는 이메일과 유저객체에 있는 이메일이 일치 하지 않는다면, 404 페이지
                if (!emailCheck.equals(user.getUser_email())) {
                    System.out.println("이프문 안에 들어왔네?");
                    mav.setViewName("/common/err");
                    return mav;
                }
            } else { //세션에 이메일이 없으면, 404페이지
                mav.setViewName("/common/err");
                return mav;
            }

            //저장된 각 객체들 model에 전부 저장(diagnosis -진료내역, doctor - 의사정보, user - 환자정보)
            mav.addObject("diagnosis", diagnosis);
            mav.addObject("doctor", doctor);
            mav.addObject("user", user);
            mav.setViewName("/user/main/myMedicalDetail");

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", e.getMessage());
            mav.setViewName("/common/err");
        }
        return mav;
    }


}
