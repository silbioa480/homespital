package mna.homespital.controller;

import mna.homespital.service.MedicalListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/")
public class RootController {

  @Autowired
  private ServletContext servletContext;

  @Autowired
  HttpSession session;

  @Autowired
  MedicalListService medicalListService;

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

  //비밀번호 찾기
  @GetMapping("/findpwForm")
  public ModelAndView findpwForm() {
    return new ModelAndView("user/main/findpwForm");
  }

  //의료진 찾기
  //    @SuppressWarnings("deprecation") // 의사 목업코드를 넣을때 쓴 코드. DAO로 실제 DB를 받아올 수 있다면 떼도 됨
  @GetMapping("/doctorList")
  public ModelAndView doctorList() throws Exception {
      ModelAndView mv = new ModelAndView("user/userside/doctorList");
      // 훈 : 의사 목업코드
  //        List<Doctor> doctorList = new ArrayList<Doctor>();
  //
  //        doctorList.add(new Doctor(
  //                1, "doctor@aaa.com", "", "서울특별시 서울의료원",
  //                "서울 중랑구 신내로 156", "www.doctor.com", "김닥터",
  //                "김닥터.jpg", "내과", "나는김닥터",
  //                "중졸", "논문없음", "11", "12", "수",
  //                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2021-01-01 00:00:00"),
  //                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2022-02-02 00:00:00")
  //        ));
  //        // 여기까지
  //        mv.addObject("doctorList", doctorList);
      return mv;
  }

  //진료차트 쓰기
  @GetMapping("/appointmentForm")
  public ModelAndView appointmentForm() {
    ModelAndView mv = new ModelAndView("/user/userside/appointmentForm");
    return mv;
  }
  //진료예약   -인성
//  @PostMapping("/appointmentForm")
//  public List<String> appointment(int diagnosis_time, String diagnosis_content, String diagnosis_image_name, MultipartFile diagnosisImgName,
//                                  Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
//
////    사진 업로드
//    String diagnosisImg = diagnosisImgName.getOriginalFilename();
//    //프로필 이미지 첨부가 있다면
//    if(!diagnosisImg.equals("")){
//      String path = servletContext.getRealPath("/resources/img/");
//      String filename = UUID.randomUUID().toString() + "." + diagnosisImgName.getOriginalFilename().substring(diagnosisImgName.getOriginalFilename().lastIndexOf('.')+1);
//      File destFile = new File(path + filename);
//      PrintWriter writer = null;
//      JSONObject json = new JSONObject();
//
//      diagnosisImgName.transferTo(destFile);
//      diagnosisImg = filename;
//      writer = response.getWriter();
//      response.setContentType("text/html;charset=utf-8");
//      response.setCharacterEncoding("utf-8");
//      json.append("uploaded", 1);
//      json.append("filename", filename);
//      json.append("url", "/resources/img/" + filename);
//      writer.println(json);
//    } else if(diagnosisImg.equals("")) {
//      diagnosisImg = "QR.png";
//    }
//    medicalListService.makeAppointment(diagnosis_time,diagnosis_content,diagnosis_image_name,diagnosisImg);
//    return "redirect:/appointmentSuccess";
//  }
}
