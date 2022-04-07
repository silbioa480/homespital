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

    public RootController() {
    }

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("user/main/index");
    }

    //로그인
    @GetMapping("/loginForm")
    public ModelAndView loginForm() {
        return new ModelAndView("user/main/loginForm");
    }


    //회원가입
    @GetMapping("/joinForm")
    public ModelAndView joinForm() {
        return new ModelAndView("user/userside/joinForm");
    }

    //회원정보수정
    @GetMapping("/modifyForm")
    public ModelAndView modifyForm() {
        ModelAndView mav = new ModelAndView("user/userside/modifyForm");
        String email = (String) session.getAttribute("email");
        try {
            User user = memberService.queryMember(email);
            if (user == null) {
                mav.setViewName("user/main/loginForm");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

//  //비밀번호확인(정보수정 전)
//  @GetMapping("/pwCheck")
//  public ModelAndView pwCheck() {
//    return new ModelAndView("user/userside/pwCheck");
//  }

    //회원탈퇴
    @GetMapping("/delete")
    public ModelAndView deleteForm() {
        String email = (String) session.getAttribute("email");

        if (email == null) {
            return new ModelAndView("user/main/index");
        }
        return new ModelAndView("user/userside/deleteForm");
    }

    //비밀번호 찾기
    @GetMapping("/findpwForm")
    public ModelAndView findpwForm() {
        return new ModelAndView("user/main/findpwForm");
    }

    //의료진 찾기
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

    //원하는 의사명 및 병원명 찾기 태영
    @PostMapping("/dohSearch")
    public ModelAndView dohSearch(@RequestParam(value="dhSearch") String dhSearch){
        ModelAndView mv=new ModelAndView();
        try{
            List<Doctor> doc=doctorService.getSearchDoh(dhSearch);
//            List<Doctor> docList = doctorService.getDocList(page, pageInfo);
            mv.addObject("doctorList",doc);
            mv.setViewName("user/userside/doctorList");
        }catch(Exception e){
            e.printStackTrace();
        }
        return mv;
    }
    //진료차트 쓰기
//  @GetMapping("/appointmentForm/{doc}")
//  public ModelAndView appointmentForm(@PathVariable int doc) {

    @GetMapping("/appointmentForm")
    public ModelAndView appointmentForm() throws Exception {
        ModelAndView mv = new ModelAndView("user/userside/appointmentForm");
        int doctor_number = 1;


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

        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    //진료예약   ( 인성 )
    @PostMapping("/appointmentForm")
    public String appointment(Diagnosis diagnosis, MultipartFile[] diagnosisImgNames,
                              Model model, HttpServletRequest request, HttpServletResponse response) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/appointmentSuccess";
    }

    // 관리자 메인 페이지 임시로 만들어놈 ( 인성 )
    @GetMapping("/adminIndex")
    public ModelAndView adminIndex() {
        return new ModelAndView("admin/mian/adminIndex");
    }

    //약국 메인페이지 태영
    @GetMapping("/pharmacyIndex")
    public ModelAndView pharmacyIndex(){
        ModelAndView mv =new ModelAndView();
        mv.setViewName("admin/pharside/pharmacyIndex");
        return mv;
    }
}