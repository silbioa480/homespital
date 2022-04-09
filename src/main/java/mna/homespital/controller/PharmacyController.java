package mna.homespital.controller;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class PharmacyController {

  @Autowired
  HttpSession session;

  @Autowired
  PharService pharService;

  //약국메인
  @GetMapping("/pharmacyMainForm")
  public ModelAndView pharmacyMain() {
    return new ModelAndView("admin/pharside/pharmacyIndex");
  }

  //약국 로그인Form
  @GetMapping("/pharmacyLoginForm")
  public ModelAndView pharmacyLogin() {
    return new ModelAndView("admin/phar/pharmacyLoginForm");
  }

  //용식:약사 로그인
  @PostMapping("PharmacyLogin.do")
  public String pharmacyLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletResponse response) {
    try {
      pharService.pharmacyLogin(email, password);
      session.setAttribute("email", email);
      return "redirect:/pharmacyMainForm";
    } catch (Exception e) {
      e.printStackTrace();
      try {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인 실패 : 아이디와 비밀번호를 다시 한 번 확인해주세요.');history.go(-1);</script>");
        out.flush();
      } catch (Exception ee) {
      }
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
    pharmacy.setPharmacy_name(request.getParameter("pharmacy_name"));;
    pharmacy.setPharmacy_phone(request.getParameter("pharmacy_phone"));
    pharmacy.setZip_code(request.getParameter("zipNo"));
    pharmacy.setStreet_address(request.getParameter("roadFullAddr"));
    pharmacy.setDetail_address(request.getParameter("addrDetail"));
    ModelAndView mv = new ModelAndView();
    try {
      pharService.join(pharmacy);
      mv.setViewName("redirect:/pharmacyLoginForm");
    } catch (Exception e) {
      e.printStackTrace();
      mv.setViewName("redirect:/pharmacyJoinForm");
    }
    return mv;
  }
  //환자진료내역 (인성)
  @GetMapping("/customerList")
  public String customerList(HttpSession session, Model m) throws Exception {
    try {
//            String email = (String) session.getAttribute("email");
//            String name = (String) session.getAttribute("name");
      Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
//            int searchNumber = pharService.getNumberByEmail(email);
      int searchNumber = pharmacy.getPharmacy_number();
//            Diagnosis diagnosis = new Diagnosis();
      List<HashMap<String, Object>> diagnosis = pharService.pharCustomerRecordsList(searchNumber);
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