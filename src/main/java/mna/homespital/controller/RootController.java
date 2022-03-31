package mna.homespital.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/")
public class RootController {


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
}
