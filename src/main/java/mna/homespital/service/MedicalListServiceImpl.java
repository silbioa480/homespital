package mna.homespital.service;

import mna.homespital.dao.MedicalListDAO;
import mna.homespital.dto.Diagnosis;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class MedicalListServiceImpl implements MedicalListService {

    @Autowired
    MedicalListDAO medicalListDAO;


    //    @Override
//    public List<Diagnosis> medicalRecordsList(int user_number) throws Exception {
//        return medicalListDAO.medicalRecordsList(user_number);
//    }
    //환자 진료내역 출력 (준근)
    @Override
    public ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception {
        return medicalListDAO.medicalRecordsList(user_number);
    }

    //진료 예약 취소(삭제) (준근)
    @Override
    public void deleteMedicalRecord(int diagnosis_number) throws Exception {
        System.out.println("ServiceImpl -> deleteMedicalRecord() init");
        medicalListDAO.deleteMedicalRecord(diagnosis_number);

    }


}
