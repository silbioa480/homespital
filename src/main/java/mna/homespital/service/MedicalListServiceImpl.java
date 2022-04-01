package mna.homespital.service;

import mna.homespital.dao.DiagnosisDAO;
import mna.homespital.dao.MedicalListDAO;
import mna.homespital.dto.Diagnosis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class MedicalListServiceImpl implements MedicalListService {

    @Autowired
    HttpSession ss;

    @Autowired
    MedicalListDAO medicalListDAO;

    @Autowired
    DiagnosisDAO diagnosisDAO;


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

    // 소연 : 나의진료내역(User) 볼때, 환자 진료 내역 diagnosis_number 가져오는 것.
    @Override
    public Diagnosis getDiagnosisNo(int diagnosis_number) throws Exception {
        Diagnosis myMedicalDetail = diagnosisDAO.getDiagnosisNo(diagnosis_number);
        return myMedicalDetail;
    }


}
