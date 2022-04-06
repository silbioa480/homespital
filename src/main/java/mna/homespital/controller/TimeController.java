package mna.homespital.controller;


import mna.homespital.dto.Doctor;
import mna.homespital.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class TimeController {
    @Autowired
    MedicalListService mls;
    @Autowired
    HttpSession session;
    @Autowired
    PharService pharService;
    @Autowired
    UserService userService;
    @Autowired
    DoctorService doctorService;
    @Autowired
    MedicalListService medicalListService;
    @Autowired
    DiagnosisService diagnosisService;


    @ResponseBody
    @GetMapping("/appointmentTime")
    public Doctor appointmentTime(int doctor_number, Model model) {
        System.out.println("appointmentTime() Join");
        Doctor doctor = null;
        try {
            doctor = doctorService.getDocInfo(doctor_number);
            model.addAttribute("doctor", doctor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doctor;
    }
}

//docrot.work_timeArr[] - doctor.lunch_time[]  하나씩 출력
//11 12 13 14 15 16 17 18 -[12] = []