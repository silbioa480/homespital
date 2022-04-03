package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.MedicalListService;
import mna.homespital.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        String email = (String) session.getAttribute("email");
        int searchNumber = mls.searchId(email);

        System.out.println("이메일로 가져온 user_number 값//searchNumber = " + searchNumber);
        Diagnosis diagnosis = new Diagnosis();
        diagnosis.setUser_number(searchNumber);
        m.addAttribute("diagnosis", diagnosis);
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
}
