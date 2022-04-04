package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.service.MedicalListService;
import mna.homespital.service.MemberService;
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
    private MemberService memberService;

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

    //나의진료내역 보기 (소연)
    @GetMapping("/myMedicalDetail/{diagnosis_number}")
    public ModelAndView myMedicalDetail(@PathVariable int diagnosis_number) {
        ModelAndView mav = new ModelAndView();
        try {
            Diagnosis diagnosis = medicalListService.getDiagnosisNo(diagnosis_number); //내진료 내역 가져오기
            Doctor doctor = doctorService.getDocInfo(diagnosis.getDoctor_number());
            mav.addObject("diagnosis", diagnosis);
            mav.addObject("doctor", doctor);
            mav.setViewName("/user/main/myMedicalDetail");
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", e.getMessage());
            mav.setViewName("/common/err");
        }
        return mav;
    }

}
