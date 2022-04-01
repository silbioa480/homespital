package mna.homespital.controller;

import mna.homespital.dto.Diagnosis;
import mna.homespital.service.MedicalListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    MedicalListService mls;

    //나의진료내역 (준근)
    @GetMapping("/myMedicalRecords")
    public String myMedicalRecords(Model m) {
        Diagnosis diagnosis = new Diagnosis();
        diagnosis.setUser_number(1);
        m.addAttribute("diagnosis", diagnosis);
        System.out.println("myMedicalRecords");
        return "user/myMedicalList";
    }

    //진료내역 리스트 출력 (준근)
    @ResponseBody
    @GetMapping("/medicalRecordsList")
    public ArrayList<HashMap<String, Object>> medicalRecordsList(@RequestParam int user_number) throws Exception {
        ArrayList<HashMap<String, Object>> myMedicalRecordsList = new ArrayList<>();
        try {
            myMedicalRecordsList = mls.medicalRecordsList(user_number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myMedicalRecordsList;
    }

    //나의 진료내역 -> 대기/예약 취소하기 (준근)
    @ResponseBody
    @PostMapping("/deleteMedicalRecord")
    public String deleteReservation(int diagnosis_number) throws Exception {
        System.out.println("delete : " + diagnosis_number);
        mls.deleteMedicalRecord(diagnosis_number);
        return "success";
    }

    //진료영수증 다운로드
    @GetMapping("/diagnosisDownload")
    public void diagnosisDownload(HttpServletResponse response) throws Exception {
        // DB에서 파일명 불러오기
        String fileName;

        String saveFileName = "경로 설정?";
        String contentType = "image/jpg";

        File file = new File(saveFileName);
        long fileLength = file.length();

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");

        try (
                FileInputStream fis = new FileInputStream(saveFileName);
                OutputStream out = response.getOutputStream();
        ) {
            int readCount = 0;
            byte[] buffer = new byte[1024];
            while ((readCount = fis.read(buffer)) != -1) {
                out.write(buffer, 0, readCount);
            }
        } catch (Exception ex) {
            throw new RuntimeException("file Save Error");
        }
    }


}
