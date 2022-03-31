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
//        String userType;
//        switch (userType) {
//            case "환자":
//                return new ModelAndView("a/main");
//            case "의사":
//                return new ModelAndView("b/main");
//        }
        return new ModelAndView("login");
    }

    //회원가입
    @GetMapping("/signUp")
    public ModelAndView signUp() {
        return new ModelAndView("signup");
    }

    //비밀번호 찾기
    @GetMapping("/pwsearch")
    public ModelAndView pwsearch() {
        return new ModelAndView("pwsearch");
    }

    //의료진 찾기
//    @SuppressWarnings("deprecation") // 의사 목업코드를 넣을때 쓴 코드. DAO로 실제 DB를 받아올 수 있다면 떼도 됨
    @GetMapping("/doctorList")
    public ModelAndView doctorList() throws Exception {
        ModelAndView mv = new ModelAndView("/user/doctorList");
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
    @GetMapping("/writeChart")
    public ModelAndView writeChart() {
        ModelAndView mv = new ModelAndView("/user/writeMediChartForm");
        return mv;
    }
}
