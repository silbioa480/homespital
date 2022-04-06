package mna.homespital.controller;

import mna.homespital.dto.AllMedical;
import mna.homespital.dto.Diagnosis;
import mna.homespital.service.AllMedicalListService;
import mna.homespital.service.MedicalListService;
import mna.homespital.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class MedicalListController {

  @Autowired
  HttpSession session;

  @Autowired
  private ServletContext servletContext;

  @Autowired
  AllMedicalListService allmedListService;

  @Autowired
  private MemberService memberService;

  @Autowired
  private MedicalListService medicalListService;

  @Autowired(required = false) // 매개변수 없어도 OK. 나중에 고쳐야?
  Diagnosis diagnosis;


  //모든 진료항목 출력 (태영)

  @GetMapping("/list")
  public ModelAndView allmedicalList() {
    ModelAndView mv = new ModelAndView();
    try {
      List<AllMedical> amd = allmedListService.allMedList();

      mv.addObject("list", amd);
      mv.setViewName("user/userside/medicalList");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return mv;
  }

    //원하는 진료항목출력 태영
    @PostMapping("/medicalSearch")
    public ModelAndView medicalSearch(@RequestParam(value="mediSearch") String mediSearch){
            ModelAndView mv = new ModelAndView();
            try{
                List<AllMedical> searchmd=allmedListService.searchMed(mediSearch);

                mv.addObject("list",searchmd);
                mv.setViewName("user/userside/medicalList");
            }catch(Exception e){
                e.printStackTrace();
            }
            return mv;
    }


}
