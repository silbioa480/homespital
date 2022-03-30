package mna.homespital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class UserController {

    //나의진료내역
    @GetMapping("/myMedicalRecords")
    public String myMedicalRecords() {
        return "user/myMedicalRecords";
    }

    //나의 진료내역 -> 대기/예약 취소하기
    @PostMapping("/cancelReservation")
    public String cancelReservation() {
        return "redirect:/myMedicalRecords";
    }
}
