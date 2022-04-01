package mna.homespital.controller;



import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class medicalListController {

    @GetMapping("/medicalList")
    public ModelAndView medicalList(){

        return new ModelAndView("user/userside/medicalList");
    }

}
