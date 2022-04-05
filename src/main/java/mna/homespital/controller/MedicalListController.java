package mna.homespital.controller;


import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.User;
import mna.homespital.service.MedicalListService;
import mna.homespital.dto.AllMedical;
import mna.homespital.service.AllMedicalListService;
import mna.homespital.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView allmedicalList(){
        ModelAndView mv = new ModelAndView();
        try{
            List<AllMedical> amd= allmedListService.allMedList();

            mv.addObject("list",amd);
            mv.setViewName("user/userside/medicalList");
        }catch(Exception e){
            e.printStackTrace();
        }
        return mv;
    }

    //원하는 진료항목출력 태영
    @ResponseBody
    @PostMapping("/medicalSearch")
    public String medicalSearch(@RequestParam String mediSearch, Model model){

        return "user/userside/medicalList";
    }

    //나의진료내역 보기 (소연)
    @GetMapping("/myMedicalDetail/{diagnosis_number}")
    public ModelAndView myMedicalDetail(@PathVariable String diagnosis_number, HttpServletRequest request) {
        System.out.println("gifjgfdigjfldgjfjgld");
        ModelAndView mav = new ModelAndView();
        try {
            int number = Integer.parseInt(diagnosis_number);
            diagnosis = medicalListService.getDiagnosisNo(number); //내진료 내역 가져오기
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            User userinfo = memberService.getUserDetail(user.getUser_number()); //환자(User)정보 가져오기
            System.out.println(userinfo);

            if (user != null) {
                System.out.println("유저 정보 인식");
            }

            mav.addObject("userInfo", userinfo);
//            mav.addObject("dia", diagnosis);
//            mav.addObject("doc", doctor);
//            mav.addObject("sicker", user);
//
//            //업로드 된 img 가져오기
//            //쿼리 아직 안씀 ㅎ
//            mav.addObject("imgSrc", src); //mav에 넣기
//            mav.setViewName("user/main/myMedicalDetail"); //경로이름 설정

        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("err", e.getMessage());
            mav.setViewName("/common/err");
        }
        return mav;
    }




}
