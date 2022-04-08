package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Pharmacy;
import mna.homespital.service.PharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class PharmacyController {

    @Autowired
    HttpSession session;

    @Autowired
    PharService pharService;

    @GetMapping("/pharmacyMainForm")
    public ModelAndView pharmacyMain() {
        return new ModelAndView("admin/pharside/pharmacyIndex");
    }

    @GetMapping("/pharmacyLoginForm")
    public ModelAndView pharmacyLogin() {
        return new ModelAndView("admin/phar/pharmacyLoginForm");
    }

    //용식:약사 로그인
    @PostMapping("PharmacyLogin.do")
    public String pharmacyLogin(@RequestParam("email") String email, @RequestParam("password") String password) {
        try {
            pharService.pharmacyLogin(email, password);
            session.setAttribute("email", email);
            return "redirect:/pharmacyMainForm";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/pharmacyLoginForm";
        }
    }

    //용식:약사 회원가입
    @PostMapping("pharmacyJoin.do")
    public ModelAndView pharmacyJoin(HttpServletRequest request) {
        Pharmacy pharmacy = new Pharmacy();
        pharmacy.setPharmacy_email(request.getParameter("pharmacy_email"));
        pharmacy.setPharmacy_password(request.getParameter("pharmacy_password"));
        pharmacy.setPharmacy_mobile(request.getParameter("pharmacy_mobile"));
        pharmacy.setPharmacy_business(request.getParameter("pharmacy_business"));
        pharmacy.setPharmacy_name(request.getParameter("pharmacy_name"));
        pharmacy.setPharmacy_institution(request.getParameter("pharmacy_institution"));
        pharmacy.setPharmacy_phone(request.getParameter("pharmacy_phone"));
        pharmacy.setZip_code(request.getParameter("zipNo"));
        pharmacy.setStreet_address(request.getParameter("roadFullAddr"));
        pharmacy.setDetail_address(request.getParameter("addrDetail"));
        ModelAndView mv = new ModelAndView();
        try {
            System.out.println("여기들어오라ㅏ ㅇㅇㅇㅇㅇ");
            pharService.join(pharmacy);
            mv.setViewName("redirect:/loginForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/joinForm");
        }

        return mv;
    }

    //나의진료내역 (인성)
    @GetMapping("/customerList")
    public String customerList(HttpSession session, Model m) throws Exception {
        try {
            String email = (String) session.getAttribute("email");
            String name = (String) session.getAttribute("name");
            int searchNumber = pharService.getNumberByEmail(email);
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
