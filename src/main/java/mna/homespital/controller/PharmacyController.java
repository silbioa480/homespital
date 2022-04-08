package mna.homespital.controller;

import mna.homespital.dto.Pharmacy;
import mna.homespital.service.PharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PharmacyController {

    @Autowired
    HttpSession session;

    @Autowired
    PharService pharSerivce;

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
            pharSerivce.login(email, password);
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
            pharSerivce.join(pharmacy);
            mv.setViewName("redirect:/pharmacyLoginForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/pharmacyJoinForm");
        }

        return mv;
    }
}