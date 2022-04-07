package mna.homespital.controller;

import mna.homespital.dto.AllMedical;
import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import mna.homespital.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class MedicalListController {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    HttpSession session;

    @Autowired
    AllMedicalListService allmedListService;

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

//    //autocomplete controller 태영
//    @ResponseBody
//    @PostMapping("/mediSearch")
//    public String mediSearch(Model model){
//      try{
//          List<AllMedical> schmd=allmedListService.allMedList();
//
//          String dataMd=String.valueOf(schmd);
//          JSONArray jsa=new JSONArray();
//          JSONObject jso=new JSONObject();
//          jso.put("data",dataMd);
//
//      }catch(Exception e){
//          e.printStackTrace();
//      }
//      return ;
//    }


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















}
