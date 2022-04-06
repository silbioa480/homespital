package mna.homespital.controller;


import mna.homespital.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TimeController {

    @Autowired
    DoctorService doctorService;

    @ResponseBody
    @GetMapping("/appointmentTime")
    public String appointmentTime(int doctor_number) {
        System.out.println("appointmentTime() Join");
        try {
            doctorService.getDocInfo(doctor_number);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
}

