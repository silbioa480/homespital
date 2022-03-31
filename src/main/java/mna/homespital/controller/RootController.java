package mna.homespital.controller;

import mna.homespital.service.MedicalListService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
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

  public RootController() {
  }

  @GetMapping("/")
  public ModelAndView main() {
    return new ModelAndView("main/main");
  }

  //로그인
  @GetMapping("/login")
  public ModelAndView login() {
    return new ModelAndView("login");
  }

  //회원가입
  @GetMapping("/signUp")
  public ModelAndView signUp() {
    return new ModelAndView("signUp");
  }

  //비밀번호 찾기
  @GetMapping("/pwsearch")
  public ModelAndView pwsearch() {
    return new ModelAndView("pwsearch");
  }

  //의료진 찾기
  @GetMapping("/doctorList")
  public ModelAndView doctorList() {
    return new ModelAndView("doctorList");
  }

  //진료차트 쓰기
  @GetMapping("/writeChart")
  public ModelAndView writeChart() {
    ModelAndView mv = new ModelAndView("/user/writeMediChartForm");
    return mv;
  }
  //진료예약
  @PostMapping("/writeChart")
  public List<String> appointment(int diagnosis_time, String diagnosis_content, String diagnosis_image_name, MultipartFile diagnosisImgName,
                                  Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

//    사진 업로드
    String diagnosisImg = diagnosisImgName.getOriginalFilename();
    //프로필 이미지 첨부가 있다면
    if(!diagnosisImg.equals("")){
      String path = servletContext.getRealPath("/resources/img/");
      String filename = UUID.randomUUID().toString() + "." + diagnosisImgName.getOriginalFilename().substring(diagnosisImgName.getOriginalFilename().lastIndexOf('.')+1);
      File destFile = new File(path + filename);
      PrintWriter writer = null;
      JSONObject json = new JSONObject();

      diagnosisImgName.transferTo(destFile);
      diagnosisImg = filename;
      writer = response.getWriter();
      response.setContentType("text/html;charset=utf-8");
      response.setCharacterEncoding("utf-8");
      json.append("uploaded", 1);
      json.append("filename", filename);
      json.append("url", "/resources/img/" + filename);
      writer.println(json);
    } else if(diagnosisImg.equals("")) {
      diagnosisImg = "QR.png";
    }
    medicalListService.makeAppointment(diagnosis_time,diagnosis_content,diagnosis_image_name,diagnosisImg);
    return "redirect:/myMedicalRecords";
  }
}
