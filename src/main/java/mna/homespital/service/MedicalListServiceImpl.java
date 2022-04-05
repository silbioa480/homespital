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

    //유저이메일로 유저넘버 가져오기(세션에 이메일만 저장되어있어서 db를 통해 가져와야함)(준근)
    @Override
    public int searchId(String user_email) throws Exception {
        return medicalListDAO.searchId(user_email);
    }

    //환자 진료내역 출력 (준근)
    @Override
    public ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception {
        return medicalListDAO.medicalRecordsList(user_number);
    }

    //진료 예약 취소, 취소 시 diagnosis_status 2로 변경  (준근)
    @Override
    public void cancelMedicalRecord(int diagnosis_number) throws Exception {
        System.out.println("ServiceImpl -> deleteMedicalRecord() init");
        medicalListDAO.cancelMedicalRecord(diagnosis_number);
    }

    // 약 수령 확인, 확인 시 diagnosis_status 7로 변경(준근)
    @Override
    public void successMedicalRecord(int diagnosis_number) throws Exception {
        System.out.println("ServiceImpl -> successMedicalRecord() init");
        medicalListDAO.successMedicalRecord(diagnosis_number);
    }

    // 소연 : 나의진료내역(User) 볼때, 환자 진료 내역 diagnosis_number 가져오는 것.
    @Override
    public Diagnosis getDiagnosisNo(int diagnosis_number) throws Exception {
        Diagnosis myMedicalDetail = diagnosisDAO.getDiagnosisNo(diagnosis_number);
        return myMedicalDetail;
    }


}
