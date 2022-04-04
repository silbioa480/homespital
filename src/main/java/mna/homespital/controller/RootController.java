package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import mna.homespital.service.DiagnosisService;
import mna.homespital.service.DoctorService;
import mna.homespital.service.MedicalListService;
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
        return new ModelAndView("user/userside/modifyForm");
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
        // 훈 : 의사 목업코드
//        List<Doctor> doctorList = new ArrayList<Doctor>();
        PageInfo pageInfo = new PageInfo();
        List<Doctor> doctorList = doctorService.getDocList(page, pageInfo);

//    doctorList.add(new Doctor(
//      1, "doctor@aaa.com", "", "김닥터",
//      "서울특별시 서울의료원", "서울 중랑구 신내로 156", "www.doctor.com",
//      null, "내과", "나는김닥터",
//      "중졸", "논문없음", "11", "12", "수",
//      new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2021-01-01 00:00:00"),
//      new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2022-02-02 00:00:00")
//    ));
//    doctorList.add(new Doctor(
//      2, "doctor2@aaa.com", "", "이닥터",
//      "세브란스병원", "서울 서대문구 연세로 50-1", "www.doctor2.com",
//      null, "정형외과", "나는이닥터",
//      "고졸", "논문없음", "11", "12", "수",
//      new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2021-01-01 00:00:00"),
//      new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2022-02-02 00:00:00")
//    ));
        // 여기까지
        mv.addObject("doctorList", doctorList);
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    //진료차트 쓰기
//  @GetMapping("/appointmentForm/{doc}")
//  public ModelAndView appointmentForm(@PathVariable int doc) {

  @GetMapping("/appointmentForm")
  public ModelAndView appointmentForm() {
    ModelAndView mv = new ModelAndView("user/userside/appointmentForm");

        // page
//    Doctor doctor = docService.searchdoctorInfoByNumber(doc);

        // session
//    User user = new User();
//    user.setUser_number(1);
//    HttpSession session = request.getSession();
//    User user = (User) session.getAttribute("user");


//    mv.addObject("doctor", doctor);
//    mv.addObject("user", user);
        return mv;
    }

    //진료예약   ( 인성 )
    @PostMapping("/appointmentForm")
    public String appointment(Diagnosis diagnosis, MultipartFile diagnosisImgName,
                              Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 사진 업로드
            String diagnosisImg = diagnosisImgName.getOriginalFilename();

//            if (!diagnosisImg.equals("")) {
//                String path = servletContext.getRealPath("/resources/img/");
//                String filename = UUID.randomUUID().toString() + "." + diagnosisImgName.getOriginalFilename().substring(diagnosisImgName.getOriginalFilename().lastIndexOf('.') + 1);
//                File destFile = new File(path + filename);
//                diagnosisImgName.transferTo(destFile);
//                diagnosisImg = filename;
//            } else if (diagnosisImg.equals("")) {
//                diagnosisImg = "QR.png";
//            }
            // DB insert
            System.out.println(diagnosis.getDiagnosis_image_name());
            diagnosis.setDiagnosis_image_name(diagnosisImg);

            System.out.println(diagnosis.getDiagnosis_time());
            System.out.println(diagnosis.getDiagnosis_content());
            System.out.println(diagnosis.getDiagnosis_image_name());

            diagnosisService.insertDiagnosis(diagnosis);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/appointmentSuccess";
    }

    // 관리자 메인 페이지 임시로 만들어놈 ( 인성 )
    @GetMapping("/welcome")
    public ModelAndView welcome() {
        return new ModelAndView("admin/main/welcome");
  }
}
