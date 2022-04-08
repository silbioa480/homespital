package mna.homespital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class DoctorController {

    @GetMapping("/")
    public String DoctorMain() {
        return "admin/main/index";
    }

//    @ResponseBody
//    @PostMapping("/numberCheck")
//    public String  numberCheck(){
//
//    }


    //의사측 진료내역리스트 태영
    @GetMapping("/doctor/customerList")
    public ModelAndView doccustomerList(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/doctor/customerList");
        return mv;
    }

}