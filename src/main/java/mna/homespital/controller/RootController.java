package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import mna.homespital.dto.User;
import mna.homespital.service.*;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

//import static jdk.internal.logger.DefaultLoggerFinder.SharedLoggers.system;

@RestController
@RequestMapping("/")
public class RootController {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;

    @Autowired
    MedicalListService medicalListService;

    @Autowired
    DiagnosisService diagnosisService;

    @Autowired
    DoctorService doctorService;

    @Autowired
    MemberService memberService;

    @Autowired
    UserService userService;

    @Autowired
    PaymentService paymentService;

    public RootController() {
    }

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("user/main/index");
    }

    //환자로그인
    @GetMapping("/loginForm")
    public ModelAndView loginForm() {
        return new ModelAndView("user/main/loginForm");
    }


    //환자회원가입
    @GetMapping("/joinForm")
    public ModelAndView joinForm() {
        return new ModelAndView("user/userside/joinForm");
    }

    //약국회원가입
    @GetMapping("/pharmacyJoinForm")
    public ModelAndView phamacyJoinForm() {
        return new ModelAndView("admin/pharside/joinForm");
    }

    //환자회원정보수정
    @GetMapping("/modifyForm")
    public ModelAndView modifyForm() {
        ModelAndView mav = new ModelAndView("user/userside/modifyForm");
        String email = (String) session.getAttribute("email");
        try {
            User user = memberService.queryMember(email);
            String juminNum = user.getUser_registration_number();
            user.setUser_registration_number(juminNum.replaceAll(".{6}$", "******"));

            if (user == null) {
                mav.setViewName("user/main/loginForm");
            } else {
                mav.addObject("user", user);
                System.out.println(user.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    //환자비밀번호확인(정보수정 전)
    @GetMapping("/pwCheck")
    public ModelAndView pwCheck() {
        String email = (String) session.getAttribute("email");

        if (email == null) {
            return new ModelAndView("user/main/index");
        }
        return new ModelAndView("user/userside/pwCheck");
    }

    //환자회원탈퇴
    @GetMapping("/delete")
    public ModelAndView deleteForm() {
        String email = (String) session.getAttribute("email");

        if (email == null) {
            return new ModelAndView("user/main/index");
        }
        return new ModelAndView("user/userside/deleteForm");
    }

    //환자비밀번호 찾기
    @GetMapping("/findpwForm")
    public ModelAndView findpwForm() {
        return new ModelAndView("user/main/findpwForm");
    }

    //원하는 의사명 및 병원명 찾기 태영
    @PostMapping("/dohSearch")
    public ModelAndView dohSearch(@RequestParam(value = "dhSearch") String dhSearch) {
        ModelAndView mv = new ModelAndView();
        try {
            List<Doctor> doc = doctorService.getSearchDoh(dhSearch);
//            List<Doctor> docList = doctorService.getDocList(page, pageInfo);
            mv.addObject("doctorList", doc);
            mv.setViewName("user/userside/doctorList");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    //의료진 찾기(의사 리스트)
    //    @SuppressWarnings("deprecation") // 의사 목업코드를 넣을때 쓴 코드. DAO로 실제 DB를 받아올 수 있다면 떼도 됨
    @GetMapping("/doctorList")
    public ModelAndView doctorList(@RequestParam(required = false, defaultValue = "1") int page) throws Exception {
        ModelAndView mv = new ModelAndView("user/userside/doctorList");
        PageInfo pageInfo = new PageInfo();
        List<Doctor> doctorList = doctorService.getDocList(page, pageInfo);

        mv.addObject("doctorList", doctorList);
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    //소연 : 의료진 상세보기(의사 디테일)
    @GetMapping("/doctorDetail/{doctor_number}")
    public ModelAndView doctorDetail(@PathVariable int doctor_number) {
        System.out.println("doctor_number = " + doctor_number);
        ModelAndView mav = new ModelAndView();

        return mav;
    }







    //진료차트 쓰기
//  @GetMapping("/appointmentForm/{doc}")
//  public ModelAndView appointmentForm(@PathVariable int doc) {

    @GetMapping("/appointmentForm/{doctor_number}")
    public ModelAndView appointmentForm(@PathVariable int doctor_number) throws Exception {
        ModelAndView mv = new ModelAndView("user/userside/appointmentForm");
//        int doctor_number = 1;
        // page
        try {
            Doctor doctor = doctorService.getDocInfo(doctor_number);
            doctor.setDoctor_password("");

            System.out.println(doctor.getDoctor_name());
            mv.addObject("doctor", doctor);


        } catch (Exception e) {
            e.printStackTrace();
        }
        String email = (String) session.getAttribute("email");

        try {
            User user = memberService.findByEmail(email);

            if (user == null) mv.setViewName("redirect:/loginForm");
            else {
                String birth = user.getUser_registration_number().substring(0, 6);
                String gender = user.getUser_registration_number().substring(7, 8);
                mv.addObject("user", user);

                //모델에 view 넣기
                //의사 객체
                Doctor doctor = doctorService.getDocInfo(doctor_number);
                doctor.setDoctor_password("");
                mv.addObject("doctor", doctor);
                //의사 실제 진료시간(근무시간 - 점심시간)을 계산
                String work_time = doctor.getWorking_time();
                String[] work_timeArr = work_time.split(",");
                String lunch_time = doctor.getLunch_time();

                List<String> real_work_timeList = new ArrayList<>();
                for (String workTime : work_timeArr) {
                    if (!workTime.equals(lunch_time)) {
                        real_work_timeList.add(workTime);
                    }
                }
                mv.addObject("real_work_timeList", real_work_timeList);

                if (Integer.parseInt(gender) < 3) birth = "19" + birth;
                else birth = "20" + birth;
                LocalDate birth_date = LocalDate.parse(birth, DateTimeFormatter.ofPattern("yyyyMMdd"));
                LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul"));
                int age = now.minusYears(birth_date.getYear()).getYear();
                mv.addObject("age", age);

                //의사 스케쥴 객체
//                ArrayList<HashMap<String, Object>> ds = doctorService.getDocScheduleInfo(doctor_number);
//                mv.addObject("ds", ds);
//                for (int i = 0; i < ds.size(); i++) {
//                    System.out.println("ds[" + i + "] = " + ds.get(i));
//                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    //진료예약   ( 인성 )
    @PostMapping("/appointmentForm")
    public ModelAndView appointment(Diagnosis diagnosis, MultipartFile[] diagnosisImgNames,
                              Model model, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        try {
            // 사진 업로드
            String fileNameArr = "";

            for (int i = 0; i < diagnosisImgNames.length; i++) {
                String diagnosisImg = diagnosisImgNames[i].getOriginalFilename();
                String path = servletContext.getRealPath("/resources/img/uploadImg/");
                String filename = UUID.randomUUID().toString() + "." + diagnosisImg.substring(diagnosisImg.lastIndexOf('.') + 1);
                File destFile = new File(path + filename);
                diagnosisImgNames[i].transferTo(destFile);
                diagnosisImg = filename;
                fileNameArr += (diagnosisImg + ", ");
            }

            // DB insert
            diagnosis.setDiagnosis_image_name(fileNameArr.toString());
            diagnosisService.insertDiagnosis(diagnosis);
            mv.setViewName("redirect:/myMedicalList");
        } catch (Exception e) {
            e.printStackTrace();
            //mv.setViewName();
        }
        return mv;
    }

    // 관리자 메인 페이지 임시로 만들어놈 ( 인성 )
    @GetMapping("/adminIndex")
    public ModelAndView adminIndex() {
        return new ModelAndView("admin/main/adminIndex");
    }

    //약국 메인페이지 태영
    @GetMapping("/pharmacyIndex")
    public ModelAndView pharmacyIndex() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/pharside/pharmacyIndex");
        return mv;
    }
}