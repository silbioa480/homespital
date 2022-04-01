package mna.homespital.controller;



import mna.homespital.dto.allMedical;
import mna.homespital.service.allMedicalListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
public class medicalListController {

    @Autowired
    allMedicalListService allmedListService;

    @GetMapping("/list")
    public ModelAndView medicalList(){
        ModelAndView mv=new ModelAndView();
        try{
            List<allMedical> amd=allmedListService.allMedList();
            mv.addObject("list",amd);
            mv.setViewName("medicalList");
        }catch(Exception e){
            e.printStackTrace();
        }

        return mv;
    }


}
