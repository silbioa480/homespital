package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.MedicalListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    MedicalListService mls;

    //나의진료내역
    @GetMapping("/myMedicalRecords")
    public String myMedicalRecords(Model m) {
        Diagnosis diagnosis = new Diagnosis();
        diagnosis.setUser_number(1);
        m.addAttribute("diagnosis", diagnosis);
        return "user/myMedicalRecords";

    }

//    //진료내역 리스트 출력
//    @ResponseBody
//    @PostMapping("/medicalRecordsList")
//    public List<Diagnosis> medicalRecordsList(@RequestParam int user_number) throws Exception {
//        List<Diagnosis> myMedicalRecordsList = null;
//        try {
//            myMedicalRecordsList = mls.medicalRecordsList(user_number);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return myMedicalRecordsList;
//    }

    //진료내역 리스트 출력
    @ResponseBody
    @PostMapping("/medicalRecordsList")
    public ArrayList<HashMap<String, Object>> medicalRecordsList(@RequestParam int user_number) throws Exception {
        System.out.println(user_number);
        ArrayList<HashMap<String, Object>> myMedicalRecordsList = new ArrayList<>();

        try {
            myMedicalRecordsList = mls.medicalRecordsList(user_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMedicalRecordsList;
    }


    //나의 진료내역 -> 대기/예약 취소하기
    @PostMapping("/cancelReservation")
    public String cancelReservation() {
        return "redirect:/myMedicalRecords";
    }
}
