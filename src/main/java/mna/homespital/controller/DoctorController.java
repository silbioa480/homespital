package mna.homespital.controller;

import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class DoctorController {
    @Autowired
    DoctorService doctorService;

    @GetMapping("/")
    public String DoctorMain() {
        return "admin/main/index";
    }

    //가영:의사 회원가입
    @PostMapping("/doctorJoin.do")
    public ModelAndView doctorJoin(HttpServletRequest request) {
        Doctor doctor = new Doctor();
        doctor.setDoctor_email(request.getParameter("doctor_email"));
        doctor.setDoctor_password(request.getParameter("doctor_password"));
        doctor.setDoctor_phone(request.getParameter("doctor_phone"));
        doctor.setDoctor_name(request.getParameter("doctor_name"));
        doctor.setDoctor_valid_number(request.getParameter("doctor_valid_number"));
        doctor.setDoctor_profile_image_name(request.getParameter("doctor_profile_image_name"));
        doctor.setHospital_business_number(request.getParameter("hospital_business_number"));
        doctor.setZip_code(request.getParameter("zipNo"));
        doctor.setStreet_address(request.getParameter("roadFullAddr"));
        doctor.setDetail_address(request.getParameter("addrDetail"));
        String[] diag_types = request.getParameterValues("doctor_diagnosis_type");
        List<String> sortedDiag_types = new ArrayList<String>();
        for(String diag : diag_types){
            if(!diag.equals("")) sortedDiag_types.add(diag);
        }
        String diag_type = sortedDiag_types.toString();
        System.out.println(diag_type);
        diag_type = diag_type.substring( 1, diag_type.length()-1).trim();
        doctor.setDoctor_diagnosis_type(diag_type);

        //오픈-마감시간 코드
        Integer openTime = Integer.parseInt(request.getParameter("open"));
        Integer closeTime = Integer.parseInt(request.getParameter("close"));
        List<Integer> openClose = new ArrayList<>();
        for (int i = openTime; i<closeTime; i++){
            openClose.add(i);
        }
        String openCloseString = openClose.toString();
        doctor.setWorking_time(openCloseString.substring(1,openCloseString.length()-1));

        // 점심시간 코드
        openTime = Integer.parseInt(request.getParameter("lunch-st"));
        closeTime = Integer.parseInt(request.getParameter("lunch-cl"));
        openClose = new ArrayList<>();
        for (int i = openTime; i<closeTime; i++){
            openClose.add(i);
        }
        openCloseString = openClose.toString();
        doctor.setLunch_time(openCloseString.substring(1,openCloseString.length()-1));

        String holiday = Arrays.toString(request.getParameterValues("holiday"));
        holiday = holiday.substring(1, holiday.length()-1).trim();
        doctor.setHoliday(holiday);
        doctor.setHospital_fax(request.getParameter("hospital_fax"));
        doctor.setHospital_url(request.getParameter("hospital_url"));
        doctor.setDoctor_introduction(request.getParameter("doctor_introduction"));

         ModelAndView mv = new ModelAndView();
        try {
            System.out.println("여기들어오라ㅏ ㅇㅇㅇㅇㅇ");
            doctorService.join(doctor);
            mv.setViewName("redirect:/loginForm");
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("redirect:/doctorJoin");
        }

        return mv;
    }


}