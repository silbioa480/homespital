package mna.homespital.service;

import mna.homespital.dao.DiagnosisDAO;
import mna.homespital.dto.Diagnosis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class DiagnosisServiceImpl implements DiagnosisService {

    @Autowired
    DiagnosisDAO diagnosisDAO;

    //    ( 인성 )
    @Override
    public void insertDiagnosis(Diagnosis diagnosis) throws Exception {
        diagnosisDAO.insertDiagnosis(diagnosis);
    }

    //소연 : 진료차트(diagnosis)정보 가져오기
    @Override
    public Diagnosis getDiaInfo(int diagnosis_number) throws Exception {
        System.out.println("getDiaInfo() join");
        return diagnosisDAO.getDiagnosisNo(diagnosis_number);
    }

    //훈: 진료차트 상세내역 가져오기
    @Override
    public HashMap<String, Object> getDiagnosisDetail(int diagnosis_number) throws Exception {
        System.out.println("getDiagnosisDetail() join");
        return diagnosisDAO.diagnosisDetail(diagnosis_number);
    }

    //훈 : 진료차트 의사소견 작성하기
    @Override
    public void writeDoctorOpinion(int diagnosis_number, String doctor_opinion) throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("diagnosis_number", diagnosis_number);
        param.put("doctor_opinion", doctor_opinion);
        diagnosisDAO.writeDoctorOpinion(param);
    }
}
