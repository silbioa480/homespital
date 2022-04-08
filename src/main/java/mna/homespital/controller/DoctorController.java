package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.DiagnosisService;
import mna.homespital.service.DoctorService;
import mna.homespital.service.PharService;
import mna.homespital.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;


@Controller
@RequestMapping("/")
public class DoctorController {
  @Autowired
  DoctorService doctorService;
  @Autowired
  HttpSession session;
  @Autowired
  UserService userService;
  @Autowired
  DiagnosisService diagnosisService;

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

  //의사의 진료내역 (준근)
  @GetMapping("/docMedicalList")
  public String docMedicalList(HttpSession session, Model m) throws Exception {
    System.out.println("docMedicalList() Join");
    try {
      session.setAttribute("email", "doctor1@aaa.com");
//            String email = (String) session.getAttribute("email");
//            int serarchDocNum = doctorService.searchDocId(email);
      Diagnosis diagnosis = new Diagnosis();
//            diagnosis.setDoctor_number(serarchDocNum);
      diagnosis.setDoctor_number(1);
      m.addAttribute("diagnosis", diagnosis);
    } catch (Exception e) {
      e.printStackTrace();
      return "common/err";
    }
    return "admin/doctor/customerList";
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

  //의사에게 들어온 진료내역 리스트 출력 (준근)
  @ResponseBody
  @GetMapping("/docMedicalRecords")
  public ArrayList<HashMap<String, Object>> docMedicalRecords(@RequestParam int doctor_number) {
    System.out.println("docMedicalRecords() Join");
    ArrayList<HashMap<String, Object>> docMedicalList = new ArrayList<>();
    try {
      docMedicalList = doctorService.docMedicalRecords(doctor_number);
      System.out.println("2");
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("3");
    }
    System.out.println("docMedicalList = " + docMedicalList);
    return docMedicalList;
  }

}