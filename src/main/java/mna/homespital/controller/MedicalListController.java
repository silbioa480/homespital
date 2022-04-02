package mna.homespital.controller;



import mna.homespital.dto.AllMedical;
import mna.homespital.service.AllMedicalListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.logging.Logger;


@RestController
public class MedicalListController {

    @Autowired
    AllMedicalListService allmedListService;

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




}
