package mna.homespital.service;

import mna.homespital.dao.DiagnosisDAO;
import mna.homespital.dto.Diagnosis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
