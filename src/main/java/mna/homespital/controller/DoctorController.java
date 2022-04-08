package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.MedicalListService;
import mna.homespital.service.PharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class DoctorController {

    @Autowired
    HttpSession session;

    @Autowired
    PharService pharService;

    //나의진료내역 (인성)
    @GetMapping("/customerList")
    public String customerList(HttpSession session, Model m) throws Exception {
        try {
//            String email = (String) session.getAttribute("email");
//            String name = (String) session.getAttribute("name");
//            int searchNumber = pharService.getNumberByEmail(email);
            Diagnosis diagnosis = new Diagnosis();
//            diagnosis.setUser_number(searchNumber);
            m.addAttribute("diagnosis", diagnosis);
        } catch (Exception e) {
            System.out.println("Catch() join");
            e.printStackTrace();
            return "common/err";
        }
        return "admin/phar/customerList";
    }

    //진료내역 리스트 출력 (인성)
    @ResponseBody
    @GetMapping("/pharCustomerRecordsList")
    public ArrayList<HashMap<String, Object>> pharCustomerRecordsList(@RequestParam int phar_number) {
        ArrayList<HashMap<String, Object>> customerList = new ArrayList<>();
        try {
            customerList = pharService.pharCustomerRecordsList(phar_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerList;
    }

}



