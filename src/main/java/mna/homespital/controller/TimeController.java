//package mna.homespital.controller;
//
//
//import mna.homespital.dto.Doctor;
//import mna.homespital.service.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.http.HttpSession;
//import java.util.HashMap;
//import java.util.Map;
//
//@Controller
//public class TimeController {
//    @Autowired
//    MedicalListService mls;
//    @Autowired
//    HttpSession session;
//    @Autowired
//    PharService pharService;
//    @Autowired
//    UserService userService;
//    @Autowired
//    DoctorService doctorService;
//    @Autowired
//    MedicalListService medicalListService;
//    @Autowired
//    DiagnosisService diagnosisService;
//
//    //준근/소연 예약 시간 선택 위한 컨트롤러
//    @ResponseBody
//    @GetMapping("/appointmentTime")
//    public Map<String, Object> appointmentTime(int doctor_number, Model model) {
//        System.out.println("appointmentTime() Join");
//        Map<String, Object> map = new HashMap<String, Object>();
//        Doctor doctor = null;
//        try {
//
//            // 닥터, 유저, 닥터 스케쥴을 불러와서 객체
//            doctor = doctorService.getDocInfo(doctor_number);
//            // List<Doctor_schedule> ds_list = doctorService.getDocS_Info(doctor_number);
//
//            //  user , payment, pharmacy
//
//            map.put("doctor", doctor);
//
//            String wt = doctor.getWorking_time();
//            String[] a = wt.split(",");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return map;
//    }
//
//
//}
//
////docrot.work_timeArr[] - doctor.lunch_time[]  하나씩 출력
////11 12 13 14 15 16 17 18 -[12] = []