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

    //나의진료내역 (준근)
    @GetMapping("/myMedicalRecords")
    public String myMedicalRecords(Model m) {
        Diagnosis diagnosis = new Diagnosis();
        diagnosis.setUser_number(1);
        m.addAttribute("diagnosis", diagnosis);
        System.out.println("myMedicalRecords");
        return "user/myMedicalList";
    }

    //진료내역 리스트 출력 (준근)
    @ResponseBody
    @GetMapping("/medicalRecordsList")
    public ArrayList<HashMap<String, Object>> medicalRecordsList(@RequestParam int user_number) throws Exception {
        ArrayList<HashMap<String, Object>> myMedicalRecordsList = new ArrayList<>();
        try {
            myMedicalRecordsList = mls.medicalRecordsList(user_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMedicalRecordsList;
    }

    //나의 진료내역 -> 대기/예약 취소하기 (준근)
    @ResponseBody
    @PostMapping("/deleteMedicalRecord")
    public String deleteReservation(int diagnosis_number) throws Exception {
        System.out.println("delete : " + diagnosis_number);
        mls.deleteMedicalRecord(diagnosis_number);
        return "success";
    }

    //진료영수증 다운로드
//    @GetMapping("/diagnosisDownload")
//    public void diagnosisDownload(HttpservletResponse response) throws Exception {
//
//
//    }


}
