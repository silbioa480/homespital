package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.DiagnosisService;
import mna.homespital.service.DoctorService;
import mna.homespital.service.PharService;
import mna.homespital.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;


@Controller
@RequestMapping("/doctor")
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

    //의사 index(준근)
    @GetMapping("/")
    public String DoctorMain() {
        return "admin/doctor/doctorIndex";
    }

    //의사 로그인 폼(준근)
    @GetMapping("/docLogin")
    public String docLoginForm() {
        return "admin/doctor/loginForm";
    }

    //의사 로그인(준근)
    @PostMapping("/docLogin")
    public String docLogin(@RequestParam("email") String doctor_email, @RequestParam("password") String doctor_password, HttpServletResponse response, Model model) throws Exception {

        try {
            doctorService.docLogin(doctor_email, doctor_password);
            session.setAttribute("email", doctor_email);
            return "redirect:/doctor/";
        } catch (Exception e) {
            model.addAttribute("err", e.getMessage());
            try {
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인 실패 : 아이디와 비밀번호를 다시 한 번 확인해주세요.');history.go(-1);</script>");
                out.flush();
            } catch (Exception ee) {
            }
            return "redirect:/doctor/docLogin";
        }
    }


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
            String email = (String) session.getAttribute("email");
            int serarchDocNum = doctorService.searchDocId(email);
            Diagnosis diagnosis = new Diagnosis();
            diagnosis.setDoctor_number(serarchDocNum);
            m.addAttribute("diagnosis", diagnosis);
        } catch (Exception e) {
            e.printStackTrace();
            return "common/err";
        }
        return "admin/doctor/doctorMedicalList";
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

        } catch (Exception e) {
            e.printStackTrace();
        }
        return docMedicalList;
    }

    // 진료 시작하기 diagnoisis_status (0 -> 1)(준근)
    @ResponseBody
    @PostMapping("/startDiagnosis")
    public String startDiagnosis(int diagnosis_number) {
        try {
            doctorService.startDiagnosis(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    // 진료 완료하기 diagnoisis_status (1 -> 3)(준근)
    @ResponseBody
    @PostMapping("/finishDiagnosis")
    public String finishDiagnosis(int diagnosis_number) {
        try {
            doctorService.finishDiagnosis(diagnosis_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }
}
